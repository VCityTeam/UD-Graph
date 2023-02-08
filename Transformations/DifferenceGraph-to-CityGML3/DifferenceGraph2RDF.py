import json
import logging
import argparse
import os.path
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import XSD, RDF, OWL, TIME, Namespace

def main():
    # initialize command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file',
                         help='Specify the difference JSON file')   
    parser.add_argument('-o', '--output_file',
                         default=None,
                         help='Specify the output filename base. "vt_", "v1_", and "v2_" will be prefixed to the output filenames.')
    parser.add_argument('version_prefix',
                         nargs=2,
                         help='Specify the "globalid" prefix that corresponds to each version in the JSON file. Typically the globalid is formed as "[prefix]::[localid]"')
    parser.add_argument('--existence_time_stamps',
                         nargs=2,
                         help='''Specify the existence timestamps. If provided, bitemporal
                         timestamps (confomant to CityGML 3.0) will be added to the
                         generated versions and version transitions. Timestamps should be
                         in the xsd:datetime format''')
    parser.add_argument('--transaction_time_stamps',
                         nargs=2,
                         help='''Specify the transaction timestamps. If provided, bitemporal
                         timestamps (confomant to CityGML 3.0) will be added to the
                         generated versions and version transitions. Timestamps should be
                         in the xsd:datetime format''')
    parser.add_argument('--base-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Datasets/workspace_1#',
                         help='Specify the base URI for workspace output individuals')
    parser.add_argument('--v1-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Datasets/dataset_1#',
                         help='Specify the base URI for source version output individuals')
    parser.add_argument('--v2-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Datasets/dataset_2#',
                         help='Specify the base URI for target version output individuals')
    parser.add_argument('--workspace-prefix',
                         default='data',
                         help='Specify the base URI prefix for workspace output individuals')
    parser.add_argument('--v1-prefix',
                         default='v1',
                         help='Specify the base URI prefix for source version output individuals')
    parser.add_argument('--v2-prefix',
                         default='v2',
                         help='Specify the base URI prefix for target version output individuals')
    parser.add_argument('--core-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/core#',
                         help='Specify the URI for the CityGML 3.0 core module')
    parser.add_argument('--versioning-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/versioning#',
                         help='Specify the URI for the CityGML 3.0 versioning module')
    parser.add_argument('--transaction-type-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/Workspace/3.0/transactiontype#',
                         help='Specify the URI for the transaction type code-list')
    parser.add_argument('-f', '--format',
                         default='ttl',
                         help='Specify the output RDFlib format')
    parser.add_argument('--strip-time-stamp',
                         action='store_true',
                         help='strip the prefix from the difference file node ids')
    parser.add_argument('-l', '--log',
                         default='output.log',
                         help='Specify the logging file')
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
    output_vt   = Graph()
    output_v1   = Graph()
    output_v2   = Graph()
    TIME_EXT    = uriToNamespace('https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/Time/time-extension#')
    CORE        = uriToNamespace(args.core_uri)
    VERS        = uriToNamespace(args.versioning_uri)
    TYPE        = uriToNamespace(args.transaction_type_uri)
    VT        = uriToNamespace(args.base_uri)
    V1          = uriToNamespace(args.v1_uri)
    V2          = uriToNamespace(args.v2_uri)

    prefixes = {
        'owl': OWL,
        'time': TIME,
        'time_ext': TIME_EXT,
        'core': CORE,
        'vers': VERS,
        'type': TYPE,
        args.workspace_prefix: VT,
        args.v1_prefix: V1,
        args.v2_prefix: V2
    }
    bindPrefixes(output_vt, prefixes)
    bindPrefixes(output_v1, prefixes)
    bindPrefixes(output_v2, prefixes)

    # add VersionTransition and Version
    source_version_uri = URIRef( V1.version_ + args.version_prefix[0] )
    target_version_uri = URIRef( V2.version_ + args.version_prefix[1] )
    versionTransition_uri = URIRef( VT.versionTransition_ + f'{args.version_prefix[0]}_{args.version_prefix[1]}' )

    output_v1.add( (source_version_uri, RDF.type, VERS.Version) )
    output_v1.add( (source_version_uri, RDF.type, OWL.NamedIndividual) )
    output_v2.add( (target_version_uri, RDF.type, VERS.Version) )
    output_v2.add( (target_version_uri, RDF.type, OWL.NamedIndividual) )
    output_vt.add( (versionTransition_uri, RDF.type, VERS.VersionTransition) )
    output_vt.add( (versionTransition_uri, RDF.type, OWL.NamedIndividual) )
    transaction_member_uri = URIRef( VERS.VersionTransition + '.transaction' )
    from_uri = URIRef( VERS.VersionTransition + '.from' )
    to_uri = URIRef( VERS.VersionTransition + '.to' )
    output_vt.add( (versionTransition_uri, from_uri, source_version_uri) )
    output_vt.add( (versionTransition_uri, to_uri, target_version_uri) )

    # add version and versionTransition existence and transaction timestamps if provided
    if args.existence_time_stamps is not None:
        validfrom_uri = URIRef(CORE.AbstractFeatureWithLifespan + '.validFrom')
        validto_uri = URIRef(CORE.AbstractFeatureWithLifespan + '.validTo')
        start_timestamp = Literal(args.existence_time_stamps[0], datatype=XSD.dateTime)
        end_timestamp = Literal(args.existence_time_stamps[1], datatype=XSD.dateTime)
        # add cityGML timestamps to versions and versionTransition
        output_v1.add( (source_version_uri, validfrom_uri, start_timestamp) )
        output_v1.add( (source_version_uri, validto_uri, start_timestamp) )
        output_v2.add( (target_version_uri, validfrom_uri, end_timestamp) )
        output_v2.add( (target_version_uri, validto_uri, end_timestamp) )
        output_vt.add( (versionTransition_uri, validfrom_uri, start_timestamp) )
        output_vt.add( (versionTransition_uri, validto_uri, end_timestamp) )
        # add OWL-Time entities to versions and versionTransition
        temporal_entity_uri = createTemporalEntity(output_v1, start_timestamp, start_timestamp, args.version_prefix[0], V1)
        output_v1.add( (source_version_uri, TIME.hasTime, temporal_entity_uri))
        output_v1.add( (source_version_uri, TIME_EXT.hasExistenceTime, temporal_entity_uri))
        temporal_entity_uri = createTemporalEntity(output_v2, end_timestamp, end_timestamp, args.version_prefix[1], V2)
        output_v2.add( (target_version_uri, TIME.hasTime, temporal_entity_uri))
        output_v2.add( (target_version_uri, TIME_EXT.hasExistenceTime, temporal_entity_uri))
        temporal_entity_uri = createTemporalEntity(output_vt, start_timestamp, end_timestamp, f'{args.version_prefix[0]}_{args.version_prefix[1]}', VT)
        output_vt.add( (versionTransition_uri, TIME.hasTime, temporal_entity_uri))
        output_vt.add( (versionTransition_uri, TIME_EXT.hasExistenceTime, temporal_entity_uri))
    if args.transaction_time_stamps is not None:
        creationDate_uri = URIRef(CORE.AbstractFeatureWithLifespan + '.creationDate')
        terminationDate_uri = URIRef(CORE.AbstractFeatureWithLifespan + '.terminationDate')
        start_timestamp = Literal(args.transaction_time_stamps[0], datatype=XSD.dateTime)
        end_timestamp = Literal(args.transaction_time_stamps[1], datatype=XSD.dateTime)
        # add cityGML timestamps to versions and versionTransition
        output_v1.add( (source_version_uri, creationDate_uri, start_timestamp) )
        output_v1.add( (source_version_uri, terminationDate_uri, start_timestamp) )
        output_v2.add( (target_version_uri, creationDate_uri, end_timestamp) )
        output_v2.add( (target_version_uri, terminationDate_uri, end_timestamp) )
        output_vt.add( (versionTransition_uri, creationDate_uri, start_timestamp) )
        output_vt.add( (versionTransition_uri, terminationDate_uri, end_timestamp) )
        # add OWL-Time entities to versions and versionTransition
        temporal_entity_uri = createTemporalEntity(output_v1, start_timestamp, start_timestamp, args.version_prefix[0], args.version_prefix[1], VT)
        output_v1.add( (source_version_uri, TIME.hasTime, temporal_entity_uri))
        output_v1.add( (source_version_uri, TIME_EXT.hasTransactionTime, temporal_entity_uri))
        temporal_entity_uri = createTemporalEntity(output_v2, end_timestamp, end_timestamp, args.version_prefix[0], args.version_prefix[1], VT)
        output_v2.add( (target_version_uri, TIME.hasTime, temporal_entity_uri))
        output_v2.add( (target_version_uri, TIME_EXT.hasTransactionTime, temporal_entity_uri))
        temporal_entity_uri = createTemporalEntity(output_vt, start_timestamp, end_timestamp, args.version_prefix[0], args.version_prefix[1], VT)
        output_vt.add( (versionTransition_uri, TIME.hasTime, temporal_entity_uri))
        output_vt.add( (versionTransition_uri, TIME_EXT.hasTransactionTime, temporal_entity_uri))



    # populate versions' versionMembers
    for node in input_graph.get('nodes'):
        node_gid = node.get("globalid")
        version_member_uri = URIRef( VERS.Version + '.versionMember' )
        if node_gid.startswith(args.version_prefix[0]):
            node_uri = URIRef( V1 + stripTimeStamp(node_gid, args) )
            output_v1.add( (source_version_uri, version_member_uri, node_uri) )
        elif node_gid.startswith(args.version_prefix[1]):
            node_uri = URIRef( V2 + stripTimeStamp(node_gid, args) )
            output_v2.add( (target_version_uri, version_member_uri, node_uri) )
        else:
            logging.error(f'could not determine parent version of node: {node_gid}')

    # populate versionTransition's Transactions
    for edge in input_graph.get('edges'):
        transaction_uri = URIRef( VT.transaction_ + f'{args.version_prefix[0]}_{args.version_prefix[1]}_' + edge.get("id") )
        transaction_type_uri = URIRef( VERS.Transaction + '.type' )
        old_feature_uri = URIRef( VERS.Transaction + '.oldFeature' )
        new_feature_uri = URIRef( VERS.Transaction + '.newFeature' )
        source_node = getNodeById(edge.get('source'), input_graph.get('nodes'))
        if source_node is not None:
            source_node_uri = URIRef( V1 + stripTimeStamp( source_node.get('globalid'), args ) )
            output_vt.add( (transaction_uri, old_feature_uri, source_node_uri) )
        target_node = getNodeById(edge.get('target'), input_graph.get('nodes'))
        if target_node is not None:
            target_node_uri = URIRef( V2 + stripTimeStamp( target_node.get('globalid'), args ) )
            output_vt.add( (transaction_uri, new_feature_uri, target_node_uri) )
        
        output_vt.add( (transaction_uri, RDF.type, VERS.Transaction) )
        output_vt.add( (transaction_uri, RDF.type, OWL.NamedIndividual) )
        output_vt.add( (versionTransition_uri, transaction_member_uri, transaction_uri) )

        # determine transaction type based on code list.
        type_uri = URIRef(TYPE + edge.get('type'))
        tag_uri = URIRef(TYPE + edge.get('tags'))
        if edge.get('type') in ['insert', 'delete']:
            output_vt.add( (transaction_uri, transaction_type_uri, type_uri) )
        elif edge.get('type') in ['replace']:
            if edge.get('tags') in ['unchanged', 're-ided', 'modified', 'fused', 'subdivided']:
                output_vt.add( (transaction_uri, transaction_type_uri, tag_uri) )
            else:
                output_vt.add( (transaction_uri, transaction_type_uri, type_uri) )
        else:
            logging.error(f'could not determine transaction type for edge: {edge}')

    # populate ontology declarations (by default don't use the fragment identifiers '#' or '/')
    version_transition_ontology_uri = URIRef( str(VT)[:-1] )
    versioning_ontology_uri = URIRef( str(VERS)[:-1] + '.ttl' )
    transactiontype_ontology_uri = URIRef( str(TYPE)[:-1] + '.ttl' )
    source_version_ontology_uri = URIRef( str(V1)[:-1] + '.ttl' )
    target_version_ontology_uri = URIRef( str(V2)[:-1] + '.ttl' )
    output_vt.add( ( version_transition_ontology_uri, RDF.type, OWL.Ontology ) )
    output_vt.add( ( version_transition_ontology_uri, OWL.imports, versioning_ontology_uri ) )
    output_vt.add( ( version_transition_ontology_uri, OWL.imports, transactiontype_ontology_uri ) )
    output_vt.add( ( version_transition_ontology_uri, OWL.imports, source_version_ontology_uri ) )
    output_vt.add( ( version_transition_ontology_uri, OWL.imports, target_version_ontology_uri ) )
    output_v1.add( ( source_version_ontology_uri, RDF.type, OWL.Ontology ) )
    output_v1.add( ( source_version_ontology_uri, OWL.imports, versioning_ontology_uri ) )
    output_v2.add( ( target_version_ontology_uri, RDF.type, OWL.Ontology ) )
    output_v2.add( ( target_version_ontology_uri, OWL.imports, versioning_ontology_uri ) )

    if args.output_file is None:
        # strip input_file of path and file extension and update output_file
        args.output_file = '.'.join(
            os.path.basename(args.input_file).split('.')[:-1]
        ) + '.rdf'

    # write graphs to files
    serializeGraph(output_vt, f'vt_{args.output_file}', args.format)
    serializeGraph(output_v1, f'v1_{args.output_file}', args.format)
    serializeGraph(output_v2, f'v2_{args.output_file}', args.format)

def serializeGraph(graph, output_filename, format):
    logging.info(f'writing output to {output_filename}')
    graph.serialize(destination=f'{output_filename}.ttl', format=format)   
    logging.info('Done!')

def bindPrefixes(graph, prefixes):
    """
    It takes a graph and a dictionary of prefixes and binds them to the graph
    
    :param graph: the graph to bind the prefixes to
    :param prefixes: a dict, each entry containing a prefix and a URI
    """
    for prefix, uri in prefixes.items():
        graph.namespace_manager.bind( prefix, uri )

def createTemporalEntity(graph, start_time, end_time, suffix, namespace):
    """
    It creates a temporal entity with a beginning and an end, and returns the URI of the temporal entity
    
    :param graph: the graph object that we're adding the temporal entity to
    :param start_time: the start time of the event
    :param end_time: the end time of the event
    :param suffix: the suffix for the temporal entity
    :param namespace: the namespace object that contains the prefixes for the URIs
    :return: A URI for the temporal entity.
    """
    temporal_entity_uri = URIRef( namespace.temporalEntity_ + suffix )
    beginning_uri = URIRef( namespace.begin_ + suffix )
    end_uri = URIRef( namespace.end_ + suffix )
    graph.add( (temporal_entity_uri, RDF.type, TIME.TemporalEntity) )
    graph.add( (temporal_entity_uri, TIME.hasBeginning, beginning_uri) )
    graph.add( (beginning_uri, RDF.type, TIME.Instant) )
    graph.add( (beginning_uri, TIME.inXSDDateTimeStamp, start_time) )
    graph.add( (temporal_entity_uri, TIME.hasEnd, end_uri) )
    graph.add( (end_uri, RDF.type, TIME.Instant) )
    graph.add( (end_uri, TIME.inXSDDateTimeStamp, end_time) )
    return temporal_entity_uri

## utility functions ##
def getNodeById(id, nodes):
    '''Return a node in a list of nodes based on its id. Thus function expects
    that a node of id 'x' will be found at index 'x' in the list. if this is not
    the case, search to see if it exists at all and return it if found.'''
    if id is None:
        return None
    node = nodes[ int(id) ]
    if node.get('id') == id:
        return node
    else:
        logging.warning(f'node {id} not at expected index')
        for node in nodes:
            if node.get('id') == id:
                return node
    logging.error(f'node {node.get("id")} not found!')
    return None



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
