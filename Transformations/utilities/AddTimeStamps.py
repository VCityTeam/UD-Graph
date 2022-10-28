import logging
import argparse
from tokenize import Name
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import XSD, RDF, TIME, Namespace, split_uri

def main():
    # initialize command line arguments
    parser = argparse.ArgumentParser()
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
                         default='https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/CityGML/3.0/core#',
                         help='specify the URI for the CityGML core module')
    parser.add_argument('--from-property',
                         default='AbstractFeatureWithLifespan.validFrom',
                         help='specify the "from" timestamp property URI (without namespace) e.g. validFrom or creationDate')
    parser.add_argument('--to-property',
                         default='AbstractFeatureWithLifespan.validTo',
                         help='specify the "to" timestamp property URI (without namespace) e.g. validTo or terminationDate')
    parser.add_argument('-l', '--log',
                         default='output.log',
                         help='specify the logging file')
    parser.add_argument('--ignore-owl-time',
                         default=True,
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

    # initialize timestamper
    time_stamper = timeStamper(args.core_uri)
    time_stamper.readFile(args.input_file, args.input_format)
    
    # add timestamps
    time_stamper.addTimeStamps(args.time_stamps[0], args.time_stamps[1], args.from_property, args.to_property, args.ignore_owl_time)

    # write file
    time_stamper.writeFile(args.output_file, args.output_format)


class timeStamper():

    def __init__(self, core_namespace):
        self.graph = Graph()
        self.CORE = Namespace(core_namespace)
        self.graph.bind('time', TIME)

    def readFile(self, input_file, input_format):
        # read input file
        logging.info(f'loading input file: {input_file}...')
        self.graph.parse(input_file, format=input_format)

    def writeFile(self, output_file, output_format):
        # write version graph to file
        logging.info(f'conversion complete, writing output to {output_file}')
        self.graph.serialize(destination=output_file, format=output_format)
        logging.info('Done!')

    def addTimeStamps(self, from_timestamp, to_timestamp, from_timestamp_property, to_timestamp_property, use_owl_time=True):
        from_timestamp = Literal(from_timestamp, datatype=XSD.dateTime)
        to_timestamp = Literal(to_timestamp, datatype=XSD.dateTime)
        # add timestamps to CityGML features
        for city_model, city_model_member, feature_member in self.graph.triples(
                (None, URIRef(self.CORE.CityModel + '.cityModelMember_cityObjectMember'), None)
            ):
            self.graph.add( (feature_member, URIRef(self.CORE + from_timestamp_property), from_timestamp) )
            self.graph.add( (feature_member, URIRef(self.CORE + to_timestamp_property), to_timestamp) )
            if use_owl_time:
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
                self.graph.add( (feature_member, TIME.hasTime, temporal_entity_uri) )
            logging.debug(f'added timestamps to {feature_member}')


if __name__ == "__main__":
    main()
