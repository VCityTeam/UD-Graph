import os
import logging
import argparse
from Uri import URI
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import RDF, OWL, XSD, NamespaceManager, Namespace
from OntologyManager import OntologyManager

class AbstractTripler:

    def __init__(self, input_file, input_model, config_file, output_dir, output_uri, output_format, log, debug):
        logging.basicConfig(filename=log, level=logging.DEBUG if debug else logging.WARNING)
        self.input_file = input_file
        self.input_model = input_model
        self.config_file = config_file
        self.output_dir = output_dir
        self.output_uri = output_uri
        self.format = output_format
        self.id_count = {}
        self.parsed_nodes = []
        self.filename = '.'.join(os.path.split(self.input_file)[-1].split('.')[:-1])
        self.input_data = None
        self.output_graph = Graph()
        self.output_uri = f'{self.output_uri}{self.filename}'
        self.ontology_manager = OntologyManager(input_model=self.input_model, config=self.config_file, log=log, debug=debug)
        self.output_graph.namespace_manager = NamespaceManager(self.ontology_manager.ontology_network)
        self.output_graph.namespace_manager.bind('data', f'{self.output_uri}{self.filename}#')

        self.output_graph.add( (URIRef(self.output_uri), RDF.type, OWL.Ontology) )
        for ontology_uri in self.ontology_manager.ontology_network.query('''
                SELECT DISTINCT ?ontology
                WHERE { ?ontology a owl:Ontology . }'''):
            self.output_graph.add( (URIRef(self.output_uri), OWL.imports, ontology_uri[0]) )

    ##########################
    ##  File I/O Functions  ##
    ##########################

    def readInput(self, input_file):
        """Parse input file into self.input_data"""
        pass

    def writeOutput(self, output_file):
        """Write the output graph to a file"""
        logging.debug(f'Writing graph to {output_file}')
        if self.output_format == 'xml':
            with open(self.output_file, 'wb') as file:
                file.write(self.output_graph.serialize(format='xml'))
        else:
            with open(self.output_file, 'wb') as file:
                file.write(self.output_graph.serialize(format='turtle'))

    ###################################
    ###  Graph Generation Functions  ##
    ###################################

    def generateTriplesFromDataset(self):
        """Triplify an input file"""
        pass


    def generateIndividual(self):
        """Generate a new individual from a datum, then add it to the
        output graph."""
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
