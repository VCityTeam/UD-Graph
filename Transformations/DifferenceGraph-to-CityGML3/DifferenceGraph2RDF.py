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
    parser.add_argument('time_stamps',
                         nargs=2,
                         help='specify the input timestamps')
    parser.add_argument('output_file',
                         help='specify the output filename')
    parser.add_argument('--base-uri',
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/workspace_1#',
                         help='specify the base URI for workspace output individuals')
    parser.add_argument('--v1-uri',
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/dataset_1#',
                         help='specify the base URI for source version output individuals')
    parser.add_argument('--v2-uri',
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/dataset_2#',
                         help='specify the base URI for target version output individuals')
    parser.add_argument('--workspace-prefix',
                         default='data',
                         help='specify the base URI prefix for workspace output individuals')
    parser.add_argument('--v1-prefix',
                         default='v1',
                         help='specify the base URI prefix for source version output individuals')
    parser.add_argument('--v2-prefix',
                         default='v2',
                         help='specify the base URI prefix for target version output individuals')
    parser.add_argument('--versioning-uri',
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/CityGML/3.0/versioning#',
                         help='specify the URI for the CityGML 3.0 versioning module')
    parser.add_argument('--transaction-type-uri',
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/Workspace/3.0/transactiontype#',
                         help='specify the URI for the transaction type code-list')
    parser.add_argument('-f', '--format',
                         default='ttl',
                         choices=['ttl', 'xml'],
                         help='specify the output RDF format')
    parser.add_argument('--strip-time-stamp',
                         action='store_true',
                         help='strip the time stamp from version individuals')
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
    VERS = uriToNamespace(args.versioning_uri)
    TYPE = uriToNamespace(args.transaction_type_uri)
    DATA = uriToNamespace(args.base_uri)
    V1   = uriToNamespace(args.v1_uri)
    V2   = uriToNamespace(args.v2_uri)

    output_graph.namespace_manager.bind( 'owl', OWL )
    output_graph.namespace_manager.bind( 'vers', VERS )
    output_graph.namespace_manager.bind( 'type', TYPE )
    output_graph.namespace_manager.bind( args.workspace_prefix, DATA )
    output_graph.namespace_manager.bind( args.v1_prefix, V1 )
    output_graph.namespace_manager.bind( args.v2_prefix, V2 )


    # add VersionTransition and Version
    source_version_uri = URIRef( DATA.version_ + args.time_stamps[0] )
    target_version_uri = URIRef( DATA.version_ + args.time_stamps[1] )
    versiontransition_uri = URIRef( DATA.versiontransition_ + f'{args.time_stamps[0]}_{args.time_stamps[1]}' )

    output_graph.add( (source_version_uri, RDF.type, VERS.Version) )
    output_graph.add( (source_version_uri, RDF.type, OWL.NamedIndividual) )
    output_graph.add( (target_version_uri, RDF.type, VERS.Version) )
    output_graph.add( (target_version_uri, RDF.type, OWL.NamedIndividual) )
    output_graph.add( (versiontransition_uri, RDF.type, VERS.VersionTransition) )
    output_graph.add( (versiontransition_uri, RDF.type, OWL.NamedIndividual) )
    transaction_member_uri = URIRef( VERS.VersionTransition + '.transaction' )
    from_uri = URIRef( VERS.VersionTransition + '.from' )
    to_uri = URIRef( VERS.VersionTransition + '.to' )
    output_graph.add( (versiontransition_uri, from_uri, source_version_uri) )
    output_graph.add( (versiontransition_uri, to_uri, target_version_uri) )

    # populate versions' versionMembers
    for node in input_graph.get('nodes'):
        node_gid = node.get("globalid")
        version_member_uri = URIRef( VERS.Version + '.versionMember' )
        if node_gid.startswith(args.time_stamps[0]):
            node_uri = URIRef( V1 + stripTimeStamp(node_gid, args) )
            output_graph.add( (source_version_uri, version_member_uri, node_uri) )
        elif node_gid.startswith(args.time_stamps[1]):
            node_uri = URIRef( V2 + stripTimeStamp(node_gid, args) )
            output_graph.add( (target_version_uri, version_member_uri, node_uri) )
        else:
            logging.error(f'could not determine parent version of node: {node_gid}')

    # populate versionTransition's Transactions
    for edge in input_graph.get('edges'):
        transaction_uri = URIRef( DATA.transaction_ + f'{args.time_stamps[0]}_{args.time_stamps[1]}_' + edge.get("id") )
        transaction_type_uri = URIRef( VERS.Transaction + '.type' )
        source_node = getNodeById(edge.get('source'), input_graph.get('nodes'))
        source_node_uri = URIRef( V1 + stripTimeStamp( source_node.get('globalid'), args ) )
        target_node = getNodeById(edge.get('target'), input_graph.get('nodes'))
        target_node_uri = URIRef( V2 + stripTimeStamp( target_node.get('globalid'), args ) )
        old_feature_uri = URIRef( VERS.Transaction + '.oldFeature' )
        new_feature_uri = URIRef( VERS.Transaction + '.newFeature' )
        
        output_graph.add( (transaction_uri, RDF.type, VERS.Transaction) )
        output_graph.add( (transaction_uri, RDF.type, OWL.NamedIndividual) )
        output_graph.add( (transaction_uri, old_feature_uri, source_node_uri) )
        output_graph.add( (transaction_uri, new_feature_uri, target_node_uri) )
        output_graph.add( (versiontransition_uri, transaction_member_uri, transaction_uri) )

        # determine transaction type based on code list.
        type_uri = URIRef(TYPE + edge.get('type'))
        tag_uri = URIRef(TYPE + edge.get('tags'))
        if edge.get('type') in ['insert', 'delete']:
            output_graph.add( (transaction_uri, transaction_type_uri, type_uri) )
        elif edge.get('type') in ['replace'] and edge.get('tags') in ['unchanged', 're-ided', 'modified', 'fused', 'subdivided']:
            output_graph.add( (transaction_uri, transaction_type_uri, tag_uri) )
        else:
            logging.error(f'could not determine transaction type for edge: {edge}')

    # populate ontology declarations (by default don't use the fragment identifiers '#' or '/')
    ontology_uri = URIRef( str(DATA)[:-1] )
    versioning_ontology_uri = URIRef( str(VERS)[:-1] + '.ttl' )
    transactiontype_ontology_uri = URIRef( str(TYPE)[:-1] + '.ttl' )
    source_version_ontology_uri = URIRef( str(V1)[:-1] + '.ttl' )
    target_version_ontology_uri = URIRef( str(V2)[:-1] + '.ttl' )
    output_graph.add( ( ontology_uri, RDF.type, OWL.Ontology ) )
    output_graph.add( ( ontology_uri, OWL.imports, versioning_ontology_uri ) )
    output_graph.add( ( ontology_uri, OWL.imports, transactiontype_ontology_uri ) )
    output_graph.add( ( ontology_uri, OWL.imports, source_version_ontology_uri ) )
    output_graph.add( ( ontology_uri, OWL.imports, target_version_ontology_uri ) )

    # write version graph to file
    if args.format == 'xml':
        logging.info(f'conversion complete, writing output to {args.output_file}')
        output_graph.serialize(destination=args.output_file, format='xml')
    else:
        logging.info(f'conversion complete, writing output to {args.output_file}')
        output_graph.serialize(destination=args.output_file, format='turtle')
    logging.info('Done!')

## utility functions ##
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

def uriToNamespace(uri):
    """
    It takes a URI and returns a formatted namespace object
    
    :param uri: The URI of the ontology
    :return: A namespace object.
    """
    if uri.endswith('#') or uri.endswith('/'):
        return Namespace(uri)
    else:
        return Namespace(uri + '#')

def stripTimeStamp(gid, args):
    '''Strip the time stamp from the globalid if --strip-time-stamp is enabled.
    '''
    return gid.split('::')[-1] if args.strip_time_stamp else gid

if __name__ == "__main__":
    main()
