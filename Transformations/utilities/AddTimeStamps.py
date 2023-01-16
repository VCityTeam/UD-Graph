import logging
import argparse
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import XSD, RDF, TIME, Namespace, split_uri

def main():
    # initialize command line arguments
    parser = argparse.ArgumentParser(description="Add timestamp values to CityGML RDF graphs. Useful when CityGML versions and features do not have temporal data. Can optionally add timestamps as OWL-Time temporal entities")
    parser.add_argument('input_file',
                         help='specify the input CityGML RDF graph')
    parser.add_argument('output_file',
                         help='specify the output filename')
    parser.add_argument('time_stamps',
                         nargs=2,
                         help='specify the "from" and "to" timestamps')
    parser.add_argument('--input-format',
                         default='turtle',
                         help='specify the input CityGML RDFlib format.')
    parser.add_argument('--output-format',
                         default='turtle',
                         help='specify the output CityGML RDFlib format.')
    parser.add_argument('--core-uri',
                         default='https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/core#',
                         help='specify the URI for the CityGML core module used in the dataset')
    parser.add_argument('--feature-member-property',
                         default='CityModel.cityModelMember_cityObjectMember',
                         help='specify the CityGML feature member property URI (without namespace) e.g. "CityModel.cityModelMember_cityObjectMember" or "CityModel.cityObjectMember". This property will be used to find CityModel feature members in the given dataset')
    parser.add_argument('--from-property',
                         default='AbstractFeatureWithLifespan.validFrom',
                         help='specify the "from" timestamp property URI (without namespace) e.g. validFrom or creationDate')
    parser.add_argument('--to-property',
                         default='AbstractFeatureWithLifespan.validTo',
                         help='specify the "to" timestamp property URI (without namespace) e.g. validTo or terminationDate')
    parser.add_argument('--t-entity-property',
                         help='specify the URI for the property relating a CityGML feature to its OWL-Time temporal entity in addition to the the #hasTime property from OWL-Time. If the --ignore-owl-time flag is enabled, this field will be ignored.')
    parser.add_argument('-l', '--log',
                         default='output.log',
                         help='specify the logging file')
    parser.add_argument('--ignore-owl-time',
                         default=False,
                         action='store_false',
                         help='skip the creation of OWL-Time TemporalEntities')
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
    # print(args)
    # initialize timestamper
    time_stamper = timeStamper(args.core_uri, args.t_entity_property)
    time_stamper.readFile(args.input_file, args.input_format)
    
    # add timestamps
    time_stamper.addTimeStamps(args.time_stamps[0],
                args.time_stamps[1],
                args.feature_member_property,
                args.from_property,
                args.to_property,
                args.ignore_owl_time)

    # write file
    time_stamper.writeFile(args.output_file, args.output_format)


class timeStamper():

    def __init__(self, core_namespace, custom_has_time_uri=None):
        self.graph = Graph()
        self.CORE = Namespace(core_namespace)
        self.graph.bind('time', TIME)
        self.custom_has_time_uri = custom_has_time_uri
        # bind custom has time uri to the time_ext prefix
        if self.custom_has_time_uri is not None:
            self.graph.bind('time_ext', self.custom_has_time_uri.split('#')[0] + '#')

    def readFile(self, input_file, input_format):
        """
        It reads the input file and loads it into the graph
        
        :param input_file: the path to the input file
        :param input_format: the format of the input file
        """
        logging.info(f'loading input file: {input_file}...')
        self.graph.parse(input_file, format=input_format)

    def writeFile(self, output_file, output_format):
        """
        This function takes a file path and a format, and writes the graph to that file in that format
        
        :param output_file: the file to write the output to
        :param output_format: The format of the output file
        """
        logging.info(f'conversion complete, writing output to {output_file}')
        self.graph.serialize(destination=output_file, format=output_format)
        logging.info('Done!')

    def addTimeStamps(self, from_timestamp, to_timestamp, feature_member_property, from_timestamp_property, to_timestamp_property, ignore_owl_time=False):
        """
        It adds CityGML timestamps to all CityGML feature members in an RDF graph
        
        :param from_timestamp: the timestamp to be used for the from_timestamp_property
        :param to_timestamp: the end date of the time interval
        :param from_timestamp_property: the property that will be used to store the from timestamp
        :param to_timestamp_property: the property that will be used to store the end timestamp
        :param use_owl_time: if True, additional timestamps will be added using the OWL Time ontology entities (optional)
        """
        from_timestamp = Literal(from_timestamp, datatype=XSD.dateTime)
        to_timestamp = Literal(to_timestamp, datatype=XSD.dateTime)
        for city_model, city_model_member, feature_member in self.graph.triples(
                (None, URIRef(self.CORE + feature_member_property), None)
            ):
            self.graph.add( (feature_member, URIRef(self.CORE + from_timestamp_property), from_timestamp) )
            self.graph.add( (feature_member, URIRef(self.CORE + to_timestamp_property), to_timestamp) )
            if not ignore_owl_time:
                feature_namespace, feature_name = split_uri(feature_member)
                feature_namespace = Namespace(feature_namespace)
                temporal_entity_uri = URIRef( feature_namespace.temporalEntity_ + feature_name )
                beginning_uri = URIRef( feature_namespace.begin_ + feature_name )
                end_uri = URIRef( feature_namespace.end_ + feature_name )
                self.graph.add( (temporal_entity_uri, RDF.type, TIME.TemporalEntity) )
                self.graph.add( (temporal_entity_uri, TIME.hasBeginning, beginning_uri) )
                self.graph.add( (beginning_uri, RDF.type, TIME.Instant) )
                self.graph.add( (beginning_uri, TIME.inXSDDateTimeStamp, from_timestamp) )
                self.graph.add( (temporal_entity_uri, TIME.hasEnd, end_uri) )
                self.graph.add( (end_uri, RDF.type, TIME.Instant) )
                self.graph.add( (end_uri, TIME.inXSDDateTimeStamp, to_timestamp) )
                self.graph.add( (feature_member, TIME.hasTime, temporal_entity_uri))
                if self.custom_has_time_uri is not None:
                    self.graph.add( (feature_member, URIRef(self.custom_has_time_uri), temporal_entity_uri))
            logging.debug(f'added timestamps to {feature_member}')


if __name__ == "__main__":
    main()
