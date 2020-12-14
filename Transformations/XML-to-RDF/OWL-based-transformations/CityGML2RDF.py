import os, sys
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import RDF, OWL, NamespaceManager, Namespace
from lxml import etree
from copy import deepcopy

def main():
    if len(sys.argv) != 3:
        sys.exit(
            'Incorrect number of arguments: {}\nUsage: python CityGML2RDF.py [input ontology paths] [input datafile]\nontology input paths are separated by a ","'.format(
                len(sys.argv)))

    ############################
    ##  Initialize variables  ##
    ############################

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
    global GML
    global GeoSPARQL
    global CRS
    global log

    filename = os.path.split(sys.argv[2])[-1].split('.')[0]
    input_tree = etree.parse(sys.argv[2])
    output_graph = Graph()
    output_uri = 'https://github.com/VCityTeam/UD-Graph/{}'.format(filename)
    log = ''

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
        'http://www.opengis.net/citygml/2.0': 'http://www.opengis.net/citygml/2.0/core#',
        'http://www.opengis.net/citygml/appearance/2.0': 'http://www.opengis.net/citygml/2.0/appearance#',
        'http://www.opengis.net/citygml/building/2.0': 'http://www.opengis.net/citygml/2.0/building#',
        'http://www.opengis.net/citygml/bridge/2.0': 'http://www.opengis.net/citygml/2.0/bridge#',
        'http://www.opengis.net/citygml/generics/2.0': 'http://www.opengis.net/citygml/2.0/generics#',
        'http://www.opengis.net/citygml/relief/2.0': 'http://www.opengis.net/citygml/2.0/relief#',
        'http://www.opengis.net/citygml/transportation/2.0': 'http://www.opengis.net/citygml/2.0/transportation#',
        'http://www.opengis.net/citygml/cityobjectgroup/2.0': 'http://www.opengis.net/citygml/2.0/cityobjectgroup#',
        'http://www.opengis.net/citygml/landuse/2.0': 'http://www.opengis.net/citygml/2.0/landuse#',
        'http://www.opengis.net/citygml/tunnel/2.0': 'http://www.opengis.net/citygml/2.0/tunnel#',
        'http://www.opengis.net/citygml/cityfurniture/2.0': 'http://www.opengis.net/citygml/2.0/cityfurniture#',
        'http://www.opengis.net/citygml/vegetation/2.0': 'http://www.opengis.net/citygml/2.0/vegetation#',
        'http://www.opengis.net/citygml/waterbody/2.0': 'http://www.opengis.net/citygml/2.0/waterbody#',
        'http://www.opengis.net/gml': 'http://www.opengis.net/ont/gml#'
    }

    # compile ontology
    print('Compiling Ontology...')
    ontology = Graph()
    for path in sys.argv[1].split(','):
        if path.startswith('http://'):
            print('  ' + path)
            ontology.parse(path, format='xml')
            continue
        for root, dirs, files in os.walk(path):
            for file in files:
                if file.endswith('.ttl'):
                    print('  ' + file)
                    ontology.parse(os.path.join(root, file), format='turtle')
                if file.endswith('.rdf'):
                    print('  ' + file)
                    ontology.parse(os.path.join(root, file), format='xml')
    # copy ontology namespace bindings to output graph namespace manager, add
    # default output namespace binding, and set geospatial namespaces
    output_graph.namespace_manager = NamespaceManager(ontology)
    output_graph.namespace_manager.bind('data', output_uri + '#')
    GML = Namespace('http://www.opengis.net/ont/gml#')
    GeoSPARQL = Namespace('http://www.opengis.net/ont/geosparql#')

    ###################################
    ##  Convert input file into rdf  ##
    ###################################

    print('Converting XML tree...')
    if input_tree.getroot().attrib.get('{http://www.w3.org/2001/XMLSchema-instance}schemaLocation') is not None:
        input_tree.getroot()[0].attrib.pop('{http://www.w3.org/2001/XMLSchema-instance}schemaLocation')
    for input_node in input_tree.getroot().iter():
        # skip comment nodes
        if not isinstance(input_node.tag, str):
            continue
        # skip already parsed nodes
        if input_tree.getelementpath(input_node) in parsed_nodes:
            continue

        # if the node is a class, generate an id and individual for it.
        if isClass( normalizeXmlTag(input_node) ):
            generateIndividual(input_node)

    print('Writing graph to disk...')
    # print('../../Data-IO/RDF/{}.rdf'.format(filename))
    # with open('../../Data-IO/RDF/{}.rdf'.format(filename), 'wb') as file:
    #     file.write(output_graph.serialize(format='xml'))
    print('../../Data-IO/RDF/{}.ttl'.format(filename))
    with open('../../Data-IO/RDF/{}.ttl'.format(filename), 'wb') as file:
        file.write(output_graph.serialize(format='turtle'))
    print('Writing log to ./log.txt ...')
    with open('log.txt', 'w') as file:
        file.write(log)



######################################
##  Graph transformation functions  ##
######################################

# generate a new individual from an XML node and its children, then add the
# node to the output graph. An id is returned for recursive calls
def generateIndividual(node):
    # skip node if already parsed
    if input_tree.getelementpath(node) in parsed_nodes:
        return
    global log
    node_tag = normalizeXmlTag(node)
    node_id = URIRef('{}#{}'.format(output_uri, node.attrib['{http://www.opengis.net/gml}id'])) if\
        '{http://www.opengis.net/gml}id' in node.attrib else URIRef(generateID(node_tag))
    output_graph.add( (node_id, RDF.type, OWL.NamedIndividual) )
    output_graph.add( (node_id, RDF.type, node_tag) )

    # if the node is a geometry node, create a gml serialization and add
    # descendant nodes to the parsed_nodes list
    if isGeometry(node_tag):
        generateGeometrySerialization(node, node_id)
        parsed_nodes.append(input_tree.getelementpath(node))
        return node_id

    for child in node:
        child_tag = normalizeXmlTag(child)

        # check if child node is a class. If so, generate a new individual for the
        # child and create an object property linking the two individuals.
        if isClass(child_tag):
            child_id = generateIndividual(child)
            objectproperty = findObjectProperty(node_tag, child_tag)
            output_graph.add( (node_id, objectproperty, child_id) )
            if isGeometry(child_tag):
                output_graph.add( (node_id, GeoSPARQL.hasGeometry, child_id) )
        # check if child node is a datatype. If so, generate a datatype for the
        # child and create a datatype property linking the individual and datatype.
        elif isDatatype(child_tag):
            child_text = Literal(child.text)
            datatypeproperty = findDatatypeProperty(node_tag, child_tag)
            output_graph.add( (node_id, datatypeproperty, child_text) )
        # check if child node is an object property. If so, generate the object
        # property nodes and their corresponding individuals by calling
        # generateObjectProperties().
        elif isObjectProperty(child_tag):
            generateObjectProperties(child, node_id)
        # check if child node is an datatype property. If so, generate the datatype
        # property nodes and their corresponding individuals by calling
        # generateDatatypeProperty().
        elif isDatatypeProperty(child_tag):
            generateDatatypeProperty(child, node_id)
        else:
            log += 'Error! Unknown XML element: {}\n'.format( input_tree.getelementpath(child) )

    for attribute in node.attrib:
        attribute_tag = normalizeXmlTag(attribute)
        attribute_text = Literal(node.attrib[attribute])
        output_graph.add( (node_id, attribute_tag, attribute_text) )

    # when complete, add node to parsed nodes list
    parsed_nodes.append(input_tree.getelementpath(node))
    return node_id


# Generate an individual for each child (which should all be classes if input
# tree is well formed) and create an object property linking the parent
# individual with each child individual.
def generateObjectProperties(node, parent_id):
    global log
    node_tag = normalizeXmlTag(node)

    for child in node:
        child_tag = normalizeXmlTag(child)

        # check if child node is a class. If so, generate a new individual for the
        # child and create an object property linking the two individuals. In the
        # case the child is geometry, generate a geometry serialization.
        if isClass(child_tag):
            child_id = generateIndividual(child)
            output_graph.add( (parent_id, node_tag, child_id) )
            # check if child is a gml geometry node. If so, generate the geometry
            # property gsp:hasGeometry.
            if isGeometry(child_tag):
                output_graph.add( (parent_id, GeoSPARQL.hasGeometry, child_id) )
        else:
            log += 'Error! Class element for object property not found: {}\n'.format(
                input_tree.getelementpath(child) )


# Generate a datatype for each child (which should all contain datatype literals
# if well formed) and create a datatype property linking the parent individual
# with each child datatype literal.
def generateDatatypeProperty(node, parent_id):
    global log
    node_tag = normalizeXmlTag(node)
    # check if child node is a datatype. If so, generate a new datatype literal
    # for the child and create a datatype property linking the class with the
    # datatype literal.
    if node.text is not None:
        output_graph.add( (parent_id, node_tag, Literal(node.text)) )
    else:
        log += 'Error! Datatype text for datatype property not found: {}\n'.format(
            input_tree.getelementpath(node) )


# Generate the gsp:gmlLiteral serialization of a geometry node
def generateGeometrySerialization(node, node_id):
    geometry = str(etree.tostring(node, pretty_print=False))[2:-1].replace(
        '\\n', '').replace('  ', '').strip()
    # xlinks are not yet supported by parliament for gsp:gmlLiterals
    if 'xlink:href' in geometry:
        return

    serialization = Literal(geometry, datatype=GeoSPARQL.gmlLiteral)
    output_graph.add( (node_id, GeoSPARQL.asGML, serialization) )



#########################
##  Utility functions  ##
#########################

# find an object property which links (intersects) two given classes based on the
# domain and range of the property.
def findObjectProperty(uri_reference1, uri_reference2):
    global log
    if isClass(uri_reference1) and isClass(uri_reference2):
        return ontology.query('''
        SELECT DISTINCT ?objectproperty
        WHERE {
            ?objectproperty a owl:ObjectProperty ;
                rdfs:domain ?domain ;
                rdfs:range  ?range .
            <%s> rdfs:subClassOf* ?domain .
            <%s> rdfs:subClassOf* ?range .
        }''' % uri_reference1, uri_reference2)
    else:
        log += 'Error! No matching object property found between: {}, {}\n'.format(
            uri_reference1, uri_reference2)
        return None


# find a datatype property which links (intersects) a given class and a datatype
# based on the domain and range of the property.
def findDatatypeProperty(uri_reference1, uri_reference2):
    global log
    if isClass(uri_reference1) and isDatatype(uri_reference2):
        return ontology.query('''
        SELECT DISTINCT ?datatypeproperty
        WHERE {
            ?datatypeproperty a owl:DatatypeProperty ;
                rdfs:domain ?domain ;
                rdfs:range  ?range .
            <%s> rdfs:subClassOf* ?domain .
            <%s> rdfs:subClassOf* ?range .
        }''' % uri_reference1, uri_reference2)
    else:
        log += 'Error! No matching datatype property found between: {}, {}\n'.format(
            uri_reference1, uri_reference2)
        return None


# normalize an XML tag namespace for OWL. If input tag namespace is in namespace mappings,
# return the target mapping namespace. Tags are returned as rdflib.URIRef objects.
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
    # TODO: add gml:id
    name = str(tag).split('#')[-1]
    if name in id_count:
        id_count[name] += 1
        return '{}#{}_{}'.format(output_uri, name, id_count[name])
    else:
        id_count[name] = 0
        return '{}#{}_0'.format(output_uri, name)


# return whether class definition exists in ontology
def isClass(uri_reference):
    uri = str(uri_reference)
    if uri in class_definition_cache.keys():
        return class_definition_cache[uri]

    query = ontology.query('''
        SELECT DISTINCT ?class
        WHERE {
            ?class rdf:type owl:Class .
            FILTER ( STR(?class) = "%s" )
        }''' % uri_reference)
    class_definition_cache[uri] = len(query) > 0
    return len(query) > 0


# return whether object property definition exists in ontology. Local property
# names may require searching through the shapechange [[name]] descriptor target
# (rdfs:label by default) depending on shapechange property encoding
# configurations.
def isObjectProperty(uri_reference):
    uri = str(uri_reference)
    if uri in objectproperty_definition_cache.keys():
        return objectproperty_definition_cache[uri]

    query = ontology.query('''
        SELECT DISTINCT ?objectproperty
        WHERE {
            ?objectproperty rdf:type owl:ObjectProperty ;
                rdfs:label "%s"@en .
        }''' % uri.split('#')[-1] )
    objectproperty_definition_cache[uri] = len(query) > 0
    return len(query) > 0


# return whether datatype property definition exists in ontology. Local property
# names may require searching through the shapechange [[name]] descriptor target
# (rdfs:label by default) depending on shapechange property encoding
# configurations.
def isDatatypeProperty(uri_reference):
    uri = str(uri_reference)
    if uri in datatypeproperty_definition_cache.keys():
        return datatypeproperty_definition_cache[uri]

    query = ontology.query('''
        SELECT DISTINCT ?datatypeproperty
        WHERE {
            ?datatypeproperty rdf:type owl:DatatypeProperty ;
                rdfs:label "%s"@en .
        }''' % uri.split('#')[-1] )
    datatypeproperty_definition_cache[uri] = len(query) > 0
    return len(query) > 0


# return whether datatype definition exists in ontology
def isDatatype(uri_reference):
    uri = str(uri_reference)
    if uri in datatype_definition_cache.keys():
        return datatype_definition_cache[uri]

    query = ontology.query('''
        SELECT DISTINCT ?datatype
        WHERE {
            ?datatype rdf:type rdfs:Datatype .
            FILTER ( STR(?datatype) = "%s" )
        }''' % uri_reference)
    datatype_definition_cache[uri] = len(query) > 0
    return len(query) > 0


# return whether node-tree is gml. Convert the uri into a qname
# tuple of (prefix, namespace, localname) to extract the namespace
def isGeometry(uri_reference):
    qname = output_graph.namespace_manager.compute_qname(uri_reference)
    return str(qname[1]) == str(GML) and isClass(uri_reference)


if __name__ == "__main__":
    main()
