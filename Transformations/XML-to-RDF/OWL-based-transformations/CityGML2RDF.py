import os, sys
from rdflib import Graph, URIRef
from rdflib.namespace import RDF, RDFS, OWL
from lxml import etree


def main():
    if len(sys.argv) != 3:
        sys.exit(
            'Incorrect number of arguments: {}\nUsage: python CityGML2RDF.py [input ontology path] [input datafile]'.format(
                len(sys.argv)))

    ############################
    ##  Initialize variables  ##
    ############################

    shapechange_input = True
    global input_tree
    global ontology
    global output_graph
    global output_uri
    global id_count
    global class_definition_cache
    global datatype_definition_cache
    global objectproperty_definition_cache
    global datatypeproperty_definition_cache
    global namespace_mappings
    global parsed_nodes

    filename = os.path.split(sys.argv[2])[-1].split('.')[0]
    input_tree = etree.parse(sys.argv[2])
    output_graph = Graph()
    output_uri = 'https://github.com/VCityTeam/UD-Graph/{}'.format(filename)

    # input_node_count  = 0
    # output_node_count = 0
    # current_node      = 0
    id_count = {}
    class_definition_cache = {}
    datatype_definition_cache = {}
    objectproperty_definition_cache = {}
    datatypeproperty_definition_cache = {}
    parsed_nodes = []
    namespace_mappings = {
        'http://www.opengis.net/citygml/2.0': 'https://github.com/VCityTeam/UD-Graph/core#',
        'http://www.opengis.net/citygml/appearance/2.0': 'https://github.com/VCityTeam/UD-Graph/appearance#',
        'http://www.opengis.net/citygml/building/2.0': 'https://github.com/VCityTeam/UD-Graph/building#',
        'http://www.opengis.net/citygml/bridge/2.0': 'https://github.com/VCityTeam/UD-Graph/bridge#',
        'http://www.opengis.net/citygml/generics/2.0': 'https://github.com/VCityTeam/UD-Graph/generics#',
        'http://www.opengis.net/citygml/relief/2.0': 'https://github.com/VCityTeam/UD-Graph/relief#',
        'http://www.opengis.net/citygml/transportation/2.0': 'https://github.com/VCityTeam/UD-Graph/transportation#',
        'http://www.opengis.net/citygml/cityobjectgroup/2.0': 'https://github.com/VCityTeam/UD-Graph/cityobjectgroup#',
        'http://www.opengis.net/citygml/landuse/2.0': 'https://github.com/VCityTeam/UD-Graph/landuse#',
        'http://www.opengis.net/citygml/tunnel/2.0': 'https://github.com/VCityTeam/UD-Graph/tunnel#',
        'http://www.opengis.net/citygml/cityfurniture/2.0': 'https://github.com/VCityTeam/UD-Graph/cityfurniture#',
        'http://www.opengis.net/citygml/vegetation/2.0': 'https://github.com/VCityTeam/UD-Graph/vegetation#',
        'http://www.opengis.net/citygml/waterbody/2.0': 'https://github.com/VCityTeam/UD-Graph/waterbody#'
    }

    # compile ontology
    print('Compiling Ontology...')
    ontology = Graph()
    for root, dirs, files in os.walk(sys.argv[1]):
        for file in files:
            if file.endswith('.rdf') or file.endswith('.owl') or file.endswith('.ttl'):
                print(file)
                ontology.parse(os.path.join(root, file), format='turtle')

    ###################################
    ##  Convert input file into rdf  ##
    ###################################

    print('Converting XML tree...')
    for input_node in input_tree.getroot().iter():
        # skip comment nodes
        if not isinstance(input_node.tag, str): continue
        # skip already parsed nodes
        if input_tree.getelementpath(input_node) in parsed_nodes: continue

        input_node_tag = normalizeXmlTag(input_node)
        # if the node is a class, generate an id and individual for it.
        if getClassDefinition(input_node_tag) != None:
            output_node_id = URIRef(generateID(input_node_tag))
            generateIndividual(input_node, output_node_id)

    print('Writing graph to disk...')
    print('Results/{}.rdf'.format(filename))
    with open('Results/{}.rdf'.format(filename), 'wb') as file:
        file.write(output_graph.serialize(format='xml'))


######################################
##  Graph transformation functions  ##
######################################

# generate a new individual from an XML node and its children, then add the
# node to the output graph. An id is passed 
def generateIndividual(node, node_id=None):
    node_tag = normalizeXmlTag(node)
    if node_id is None:
        node_id = URIRef(generateID(node_tag))
    output_graph.add((node_id, RDF.type, OWL.NamedIndividual))

    for child in node:

        # check if child node is a class. If so generate a new individual for the
        # child and create an objectProperty linking the two individuals.
        child_tag = normalizeXmlTag(child)
        if getClassDefinition(child_tag) is not None:
            child_id = URIRef(generateID(child_tag))
            objectproperty = findObjectProperty(node_tag, child_tag)
            output_graph.add((node_id, objectproperty, child_id))
            generateIndividual(child, child_id)
    # when complete, add node to parsed nodes list
    parsed_nodes.append(input_tree.getelementpath(node))


# find an object property which links (intersects) two given classes based its
# domain and range.
def findObjectProperty(uri_reference1, uri_reference2):
    if getClassDefinition(uri_reference1) is not None and getClassDefinition(uri_reference2) is not None:
        return ontology.query('''
        SELECT DISTINCT ?objectproperty
        WHERE {
        ?objectproperty a owl:ObjectProperty ;
            rdfs:domain <%s> ;
            rdfs:range  <%s> .
        }''' % uri_reference1, uri_reference2)

    else:
        print('Error! No matching object property found between: {}, {}'.format(
            uri_reference1, uri_reference2))
        return None


#########################
##  Utility functions  ##
#########################

# normalize input tag. If input tag namespace is in namespace mappings, return
# the target mapping namespace. Tags are returned as rdflib.URIRef objects.
def normalizeXmlTag(node):
    qname = etree.QName(node)

    if qname.namespace in namespace_mappings.keys():
        return URIRef(namespace_mappings[qname.namespace] + qname.localname)
    elif qname.namespace[-1:] == '#':
        return URIRef(qname.namespace + qname.localname)
    elif qname.namespace[-1:] == '/':
        return URIRef(qname.namespace[:-1] + '#' + qname.localname)
    else:
        return URIRef(qname.namespace + '#' + qname.localname)


# create a new, unique id from a normalized XML node tag
def generateID(tag):
    name = str(tag).split('#')[-1]
    if name in id_count:
        id_count[name] += 1
        return '{}#{}_{}'.format(output_uri, name, id_count[name])
    else:
        id_count[name] = 0
        return '{}#{}_0'.format(output_uri, name)


# get class definition from ontology return it as an rdf graph
def getClassDefinition(uri_reference):
    URI = str(uri_reference)
    if URI in class_definition_cache.keys():
        return class_definition_cache[URI]

    if (uri_reference, RDF.type, OWL.Class) not in ontology:
        print('Error! No class definition found: {}'.format(URI))
        return None

    definition = ontology.query('''
      SELECT DISTINCT ?predicate ?object
      WHERE {
         <%s> ?predicate ?object .
      }''' % uri_reference)

    class_definition_cache[URI] = definition
    return definition


# get objectProperty definition from ontology return it as an rdf graph
def getObjectPropertyDefinition(uri_reference):
    URI = str(uri_reference)
    if URI in objectproperty_definition_cache.keys():
        return objectproperty_definition_cache[URI]

    if (uri_reference, RDF.type, OWL.ObjectProperty) not in ontology:
        print('Error! No objectProperty definition found: {}'.format(URI))
        return None

    definition = ontology.query('''
      SELECT DISTINCT ?predicate ?object
      WHERE {
         <%s> ?predicate ?object .
      }''' % uri_reference)

    objectproperty_definition_cache[URI] = definition
    return definition


# get datatypeProperty definition from ontology return it as an rdf graph
def getDatatypePropertyDefinition(uri_reference):
    URI = str(uri_reference)
    if URI in datatypeproperty_definition_cache.keys():
        return datatypeproperty_definition_cache[URI]

    if (uri_reference, RDF.type, OWL.DatatypeProperty) not in ontology:
        print('Error! No datatypeProperty definition found: {}'.format(URI))
        return None

    definition = ontology.query('''
      SELECT DISTINCT ?predicate ?object
      WHERE {
         <%s> ?predicate ?object .
      }''' % uri_reference)

    datatypeproperty_definition_cache[URI] = definition
    return definition


# get datatype definition from ontology return it as an rdf graph
def getDatatypeDefinition(uri_reference):
    URI = str(uri_reference)
    if URI in datatype_definition_cache.keys():
        return datatype_definition_cache[URI]

    if (uri_reference, RDF.type, RDFS.Datatype) not in ontology:
        print('Error! No datatype definition found: {}'.format(URI))
        return None

    definition = ontology.query('''
      SELECT DISTINCT ?predicate ?object
      WHERE {
         <%s> ?predicate ?object .
      }''' % uri_reference)

    datatype_definition_cache[URI] = definition
    return definition


if __name__ == "__main__":
    main()
