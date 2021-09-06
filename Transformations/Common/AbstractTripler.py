import os
import logging
import argparse
from Uri import URI
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import RDF, OWL, XSD, NamespaceManager, Namespace
from OntologyManager import OntologyManager

class AbstractTripler:

    def __init__(self, args):
        logging.basicConfig(filename=args.log, level=logging.DEBUG)

        self.args = args
        self.id_count = {}
        self.parsed_nodes = []
        self.filename = '.'.join(os.path.split(args.input_file)[-1].split('.')[:-1])
        self.output_graph = Graph()
        self.output_uri = f'{args.output_uri}{self.filename}'
        self.ontology_manager = OntologyManager(args.input_model, args.config_file, args.log)
        self.output_graph.namespace_manager = NamespaceManager(self.ontology_manager.ontology_network)
        self.output_graph.namespace_manager.bind('data', f'{args.output_uri}{self.filename}#')

        self.output_graph.add( (URIRef(args.output_uri), RDF.type, OWL.Ontology) )
        for ontology_uri in self.ontology_manager.ontology_network.query('''
                SELECT DISTINCT ?ontology
                WHERE { ?ontology a owl:Ontology . }'''):
            self.output_graph.add( (URIRef(args.output_uri), OWL.imports, ontology_uri[0]) )


    ##########################
    ##  File I/O Functions  ##
    ##########################

    def parseInput(self):
        """Parse input file"""
        pass

    def generateRDFTree(self):
        """Generate an RDF graph from input file"""
        pass

    def writeOutput(self):
        """Write the output graph to a file"""


    ###################################
    ###  Graph Generation Functions  ##
    ###################################

    def generateIndividual(self):
        """Generate a new individual from a datum, then add it to the
        output graph. An id is returned for recursive calls."""
        pass


    def generateObjectProperty(self, subject_id, property_uri, object_id):
        """Generate an ObjectProperty between two individuals, then add it to the output
        graph."""
        triple = ( URIRef(subject_id), property_uri, URIRef(object_id) )
        self.output_graph.add(triple)


    def generateDatatypeProperty(self, subject_id, property_uri, object_value, object_datatype=None):
        """Generate a datatype between an individual and a datatype, then add it
        to the output graph. If the object datatype is known, it may be added to
        the triple."""
        datatype = None
        if object_datatype is None:
            datatype = Literal(object_value)
        else:
            datatype = Literal(object_value, datatype=object_datatype)

        triple = ( URIRef(subject_id), property_uri, datatype )
        self.output_graph.add(triple)


    def generateID(self, uri):
        """create a new, unique id from a uri (likely a class uri)."""
        id = URI(uri).localname
        if id in self.id_count:
            self.id_count[id] += 1
            return f'{self.output_uri}#{id}_{self.id_count[id]}'
        else:
            self.id_count[id] = 0
            return f'{self.output_uri}#{id}_0'


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file', help='specify the input CityGML datafile')
    parser.add_argument('input_model', help='specify the ontology input path; for multiple ontologies, input paths are separated by a ","')
    parser.add_argument('config_file', help='specify the configuration file')
    parser.add_argument('--output', default='.', help='specify the output directory')
    parser.add_argument('--output_uri', default='https://github.com/VCityTeam/UD-Graph/', help='specify the output uri')
    parser.add_argument('--format', default='ttl', choices=['ttl', 'rdf'], help='specify the output data format [rdf, ttl]')
    parser.add_argument('--log', default='output.log', help='specify the logging file')
    parser.add_argument('-v', '--verbose', action='store_true', help='enable verbose console logging')
    args = parser.parse_args()

    tripler = AbstractTripler(args)
    tripler.generateRDFGraph()