import os
import json
import logging
import argparse
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import XSD, RDF, RDFS, OWL, Namespace

def main():
    # initialize command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file',
                         help='specify the input CityGML datafile')
    parser.add_argument('time_stamp',
                         nargs=2,
                         help='specify the input timestamps')
    parser.add_argument('--output_dir',
                         default='.',
                         help='specify the output directory')
    parser.add_argument('--base-uri',
                         default='https://github.com/VCityTeam/UD-Graph/data#',
                         help='specify the base URI for output individuals')
    parser.add_argument('--prefix',
                         default='data',
                         help='specify the base URI prefix for output individuals')
    parser.add_argument('--versioning-uri',
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/CityGML/3.0/versioning#',
                         help='specify the URI for the CityGML 3.0 versioning module')
    parser.add_argument('-f', '--format',
                         default='ttl',
                         choices=['ttl', 'xml'],
                         help='specify the output RDF format')
    parser.add_argument('-l', '--log',
                         default='output.log',
                         help='specify the logging file')
    parser.add_argument('-d', '--debug',
                         action='store_true',
                         help='enable debug level logging')
    args = parser.parse_args()

    # initialize logging
    if args.debug:
        logging.basicConfig(filename=args.log,
                            level=logging.DEBUG,
                            format='%(asctime)s %(levelname)-8s %(message)s')
    else:
        logging.basicConfig(filename=args.log,
                            level=logging.WARNING,
                            format='%(asctime)s %(levelname)-8s %(message)s')

    logging.debug(f'received arguments: {args}')

    # read input file
    logging.info(f'loading input file: {args.input_file}...')
    with open(args.input_file, "r") as file:
        input_graph = json.load(file)

    # create output version graph and set namespaces
    output_graph = Graph()
    VERS = Namespace(args.versioning_uri)
    output_graph.namespace_manager.bind( 'owl', OWL )
    output_graph.namespace_manager.bind( 'vers', VERS )
    output_graph.namespace_manager.bind( args.prefix, URIRef(args.base_uri) )


    # add VersionTransition and Version
    source_version_uri = URIRef( f'{args.base_uri}version_{args.time_stamp[0]}' )
    target_version_uri = URIRef( f'{args.base_uri}version_{args.time_stamp[1]}' )
    versiontransaction_uri = URIRef( f'{args.base_uri}versiontransition_{args.time_stamp[0]}_{args.time_stamp[1]}' )

    output_graph.add( (source_version_uri, RDF.type, VERS.Version) )
    output_graph.add( (source_version_uri, RDF.type, OWL.NamedIndividual) )
    output_graph.add( (target_version_uri, RDF.type, VERS.Version) )
    output_graph.add( (target_version_uri, RDF.type, OWL.NamedIndividual) )
    output_graph.add( (versiontransaction_uri, RDF.type, VERS.VersionTransition) )
    output_graph.add( (versiontransaction_uri, RDF.type, OWL.NamedIndividual) )
    # VERS.from causes a syntax error
    # output_graph.add( (versiontransaction_uri, VERS.from, source_version_uri) )
    from_uri = URIRef( VERS + 'from' )
    output_graph.add( (versiontransaction_uri, from_uri, source_version_uri) )
    output_graph.add( (versiontransaction_uri, VERS.to, target_version_uri) )

    # populate versions' versionMembers
    for node in input_graph.get('nodes'):
        node_gid = node.get("globalid")
        node_uri = URIRef( args.base_uri + node_gid )
        if node_gid.startswith(args.time_stamp[0]):
            output_graph.add( (source_version_uri, VERS.versionMember, node_uri) )
        elif node_gid.startswith(args.time_stamp[1]):
            output_graph.add( (target_version_uri, VERS.versionMember, node_uri) )
        else:
            logging.error(f'could not determine parent version of node: {node_gid}')
    
    # populate versionTransition's Transactions
    for edge in input_graph.get('edges'):
        transaction_uri = URIRef( f'{args.base_uri}transaction_{edge.get("id")}' )
        transaction_type = Literal( edge.get('type'), datatype=XSD.string )
        transaction_tags = Literal( edge.get('tags'), datatype=XSD.string )
        source_node = getNodeById(edge.get('source'), input_graph.get('nodes'))
        source_node_uri = URIRef( args.base_uri + source_node.get('globalid') )
        target_node = getNodeById(edge.get('target'), input_graph.get('nodes'))
        target_node_uri = URIRef( args.base_uri + target_node.get('globalid') )

        output_graph.add( (transaction_uri, RDF.type, VERS.Transaction) )
        output_graph.add( (transaction_uri, RDF.type, OWL.NamedIndividual) )
        output_graph.add( (transaction_uri, VERS.type, transaction_type) )
        output_graph.add( (transaction_uri, RDFS.comment, transaction_tags) )
        output_graph.add( (transaction_uri, VERS.oldFeature, source_node_uri) )
        output_graph.add( (transaction_uri, VERS.newFeature, target_node_uri) )

    # write version graph to file
    input_filename_base = ".".join( os.path.basename( args.input_file ).split(".")[:-1] )
    if args.format == 'xml':
        output_file = f'{args.output_dir}/{input_filename_base}.rdf'
        logging.info(f'conversion complete, writing output to {output_file}')
        with open(output_file, 'wb') as file:
            file.write(output_graph.serialize(format='xml'))
    else:
        output_file = f'{args.output_dir}/{input_filename_base}.ttl'
        logging.info(f'conversion complete, writing output to {output_file}')
        with open(output_file, 'wb') as file:
            file.write(output_graph.serialize(format='turtle'))
    logging.info('Done!')

## utility functions ###
def getNodeById(id, nodes):
    '''Return a node in a list of nodes based on its id. Thus function expects
    that a node of id 'x' will be found at index 'x' in the list. if this is not
    the case, search to see if it exists at all and return it if found.'''
    node = nodes[ int(id) ]
    if node.get('id') == id:
        return node
    else:
        logging.warning(f'node {id} not at expected index')
        for node in nodes:
            if node.get('id') == id:
                return node
    logging.error(f'node {node.get("id")} not found!')


if __name__ == "__main__":
    main()
