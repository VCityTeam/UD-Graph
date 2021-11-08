import os
import logging
import argparse
import deepcopy
import URI
from rdflib import Namespace
from AbstractTripler import AbstractTripler
from lxml import etree

class XMLTripler(AbstractTripler):

    def __init__(self, args):
        super().__init__(
            input_file=args.input_file,
            input_model=args.input_model,
            config_file=args.config_file,
            output_dir=args.output_dir,
            output_uri=args.output_uri,
            output_format=args.format,
            log=args.log,
            debug=args.debug
        )
        self.ignore_gmlid = args.ignore_gmlid
        self.silent = args.silent
        self.parsed_nodes = []
        self.GML_NAMESPACE = None
        self.GML_ID_URI = None


    ##########################
    ##  File I/O Functions  ##
    ##########################

    def readInput(self, input_file):
        """Parse input file into self.input_data"""
        self.input_data = etree.parse(args.input_file)

    ###################################
    ###  Graph Generation Functions  ##
    ###################################

    def generateTriplesFromDataset(self):
        """Triplify an input file"""
        super().readInput(self.input_file)
        self.input_root = input_tree.getroot()
        self.GML_NAMESPACE = Namespace(self.input_root.nsmap.get('gml'))
        self.GML_ID_URI = '{%s}id' % self.GML_NAMESPACE

        #TODO: generate individual for root

        for input_node in self.input_root:
            # skip comment nodes
            if not isinstance(input_node.tag, str):
                parsed_nodes.append(input_tree.getelementpath(node))
                # input_node_count += 1
                continue
            # if the node is a class, generate an id and individual for it.
            if self.ontology_manager.isClass( input_node.tag ):
                generateIndividual(input_node)

        if self.output_format == 'xml':
            super.writeOutput(f'{self.config.output_dir}/{self.filename}.rdf')
        else:
            super.writeOutput(f'{self.config.output_dir}/{self.filename}.ttl')
        

    def generateIndividual(self, node):
        """Generate a new individual from an XML node, then add it to the output graph.
        The node id should be returned returned for recursive calls."""
        # TODO: implement rdf mappings for individual and children
        
        # skip comment nodes
        if not isinstance(node.tag, str):
            parsed_nodes.append(input_tree.getelementpath(node))
            input_node_count += 1
            return
        # skip node if already parsed
        if input_tree.getelementpath(node) in parsed_nodes:
            return

        node_tag = URI(node.tag)
        individual_id = ''
        individual_class = self.ontology_manager.mapNamespace( node_tag )
        # if a gml:id is detected, use it in the URI of the individual, otherwise map
        # the XML tag to its equivalent class in the ontology network and use its mapping
        # to create a generic id
        if node.attrib.get(self.GML_ID_URI) is not None:
            individual_id = f'{self.output_uri}#{ node.attrib.get(self.GML_ID_URI) }' 
        else:
            individual_id = generateID(individual_class)
        # create individual triple in output graph
        self.output_graph.add( (individual_id, RDF.type, OWL.NamedIndividual) )
        self.output_graph.add( (individual_id, RDF.type, individual_class) )

        # if the node is a GML node, create a gml serialization of it and add it as a
        # triple to the output graph. All descendant nodes are assumed to be part of
        # the same geometry and therefore are not necessary to parse beyond this step
        # (as GeoSPARQL does not yet support geometry aggregation).
        if self.ontology_manager.isGML(node_tag):
            geometry_blob = generateGeometrySerialization(node)
            geometry_node = Literal(geometry_blob, datatype=self.ontology_manager.GeoSPARQL_NAMESPACE.gmlLiteral)
            output_graph.add( (individual_id, self.ontology_manager.GeoSPARQL_NAMESPACE.asGML, geometry_node) )

        # parse node attributes
        # TODO: check this code 
        for attribute in node.attrib:
            if attribute in rdf_mappings:
                attribute_tag = URIRef(rdf_mappings[attribute])
                attribute_text = Literal(node.attrib[attribute])
                output_graph.add( (individual_id, attribute_tag, attribute_text) )
            elif isDatatypeProperty(attribute, node.tag):
                for property in getDatatypeProperties(attribute):
                    for datatype in getDatatypePropertyRange(property):
                        attribute_text = Literal(node.attrib[attribute],
                                                 datatype=datatype[0])
                    output_graph.add((individual_id, property, attribute_text))
            elif isDatatype(attribute):
                for property in findDatatypeProperty(attribute, node.tag):
                    for datatype in getDatatypePropertyRange(property):
                        attribute_text = Literal(node.attrib[attribute],
                                                 datatype=datatype[0])
                    output_graph.add((individual_id, property, attribute_text))
            else:
                # TODO: add dynamic datatype detection
                attribute_tag = mapNamespace(attribute)
                attribute_text = Literal(node.attrib[attribute])
                output_graph.add( (individual_id, attribute_tag, attribute_text) )
                logging.warning(f'No datatype or datatype property found for attribute {attribute}, at {input_tree.getelementpath(node)}')

        for child in node:
            # skip comment nodes
            if not isinstance(child.tag, str):
                parsed_nodes.append(input_tree.getelementpath(node))
                input_node_count += 1
                continue
            # if child.tag has an rdf mapping, replace the tag with the mapping.
            mapped_child_tag = child.tag
            if child.tag in rdf_mappings:
                mapped_child_tag = etree.QName( uriToLXML(rdf_mappings[child.tag]) )
            # check if child node is a class. If so, generate a new individual for the
            # child and create an object property linking the two individuals.
            if isClass(mapped_child_tag):
                child_id = generateIndividual(child)
                objectproperties = findObjectProperty(node.tag, mapped_child_tag)
                for objectproperty in objectproperties:
                    output_graph.add( (individual_id, objectproperty, child_id) )
                if isGeometry(mapped_child_tag):
                    output_graph.add( (individual_id, GeoSPARQL_NAMESPACE.hasGeometry, child_id) )
            # check if child node is a datatype. If so, generate a datatype for the
            # child and create a datatype property linking the individual and datatype.
            elif isDatatype(mapped_child_tag):
                for property in findDatatypeProperty(node.tag, mapped_child_tag):
                    for datatype in getDatatypePropertyRange(property):
                        child_text = Literal(child.text, datatype=datatype[0])
                        output_graph.add( (individual_id, property, child_text) )
            # check if child node is an object property. If so, generate the object
            # property nodes and their corresponding individuals by calling
            # generateObjectProperties().
            elif isObjectProperty(mapped_child_tag, node.tag):
                generateObjectProperties(node, individual_id, child)
            # check if child node is an datatype property. If so, generate the datatype
            # property nodes and their corresponding individuals by calling
            # generateDatatypeProperty().
            elif isDatatypeProperty(mapped_child_tag, node.tag):
                generateDatatypeProperty(node, individual_id, child)
            elif isAnnotationProperty(mapped_child_tag):
                annotation_tag = URIRef(mapped_child_tag.namespace + mapped_child_tag.localname)
                annotation_text = Literal(child.text, datatype=XSD.string)
                output_graph.add( (individual_id, annotation_tag, annotation_text) )
            else:
                logging.warning(f'Unknown XML element, {mapped_child_tag}, at: {input_tree.getelementpath(child)}')

        # when complete, add node to parsed nodes list
        parsed_nodes.append(input_tree.getelementpath(node))
        if verbose:
            updateProgressBar(input_node_count, input_node_total, node.tag)
        input_node_count += 1
        return individual_id


    def generateGMLSerialization(node):
        """Generate a GeoSPARQL gmlLiteral serialization of GML geometry"""
        node_copy = deepcopy(node)
        # gather geometry referenced though xlinks 
        for xlink in node_copy.findall('.//*[@{http://www.w3.org/1999/xlink}href]'):
            reference = xlink.attrib.get('{http://www.w3.org/1999/xlink}href').split('#')[-1]
            reference_node = self.input_root.find('.//*[@{%s}id = "%s"]' % (self.GML_NAMESPACE, reference))
            if reference_node is not None:
                # logging.info(f'Compiling geometry for xlink reference to: {reference}')
                new_element = etree.Element(xlink.tag)
                new_element.append(deepcopy(reference_node))
                parent = xlink.getparent()
                parent.append(new_element)
                parent.remove(xlink)

        geometry = str(etree.tostring(node_copy, pretty_print=False)).split(' ')
        isGMLTag = lambda tag : not tag.startswith('xmlns') or tag.startswith('xmlns:gml')
        geometry = ' '.join(filter( isGMLTag, geometry ))
        geometry = str(geometry)[2:-1].replace('\\n', '').replace('  ', '').replace('"', "'").strip().replace(
            "xmlns:gml='http://www.opengis.net/gml/3.2'", "xmlns:gml='http://www.opengis.net/gml'")

        for descendant in node.iter():
            if not isinstance(descendant.tag, str):
                continue
            self.parsed_nodes.append(self.input_tree.getelementpath(descendant))

        return geometry


    #########################
    ### Utility Functions ###
    #########################

    def XmlTagToURI(tag):
        qname = etree.QName(tag)
        return qname.namespace + qname.localname


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file', help='specify the input XML file')
    parser.add_argument('input_model', help='specify the ontology input path; for multiple ontologies, input paths are comma separated (no spaces)')
    parser.add_argument('config_file', help='specify the configuration file')
    parser.add_argument('--output_dir', default='.', help='specify the output directory')
    parser.add_argument('--output_uri', default='https://github.com/VCityTeam/UD-Graph/', help='specify the output uri')
    parser.add_argument('--format', default='ttl', choices=['ttl', 'xml'], help='specify the output data format [rdf, xml]')
    parser.add_argument('--log', default='output.log', help='specify the logging file')
    parser.add_argument('-d', '--debug', action='store_true', help='enable debug level logging')
    parser.add_argument('-s', '--silent', action='store_true', help='disable progress bar')
    parser.add_argument('--ignore_gmlid', action='store_false', help='don\'t use gml:id attributes in individual URIs')
    args = parser.parse_args()

    tripler = XMLTripler(args)
    tripler.generateTriplesFromDataset()