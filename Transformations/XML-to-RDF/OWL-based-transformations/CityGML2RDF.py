import os
import sys
import json
import logging
from copy import deepcopy
from rdflib import Graph, URIRef, Literal
from rdflib.namespace import RDF, OWL, NamespaceManager, Namespace
from lxml import etree

def main():
    if len(sys.argv) != 5:
        sys.exit(f'Incorrect number of arguments: {len(sys.argv)}\n'
                 'Usage: python CityGML2RDF.py [input ontology paths] [input datafile] [output folder] [namespace mappings]\n'
                 'ontology input paths are separated by a ","')

    ############################
    ##  Initialize variables  ##
    ############################

    logging.basicConfig(filename='output.log', level=logging.DEBUG)

    global input_tree
    global input_root
    global ontology
    global output_graph
    global output_uri
    global id_count
    global class_definition_cache
    global datatype_definition_cache
    global objectproperty_definition_cache
    global datatypeproperty_definition_cache
    global input_node_count
    global input_node_total
    global namespace_mappings
    global gml_namespaces
    global parsed_nodes
    global GML_NAMESPACE
    global GML_ONT_NAMESPACE
    global GeoSPARQL_NAMESPACE

    filename = '.'.join(os.path.split(sys.argv[2])[-1].split('.')[:-1])
    input_tree = etree.parse(sys.argv[2])
    input_root = input_tree.getroot()
    output_graph = Graph()
    output_uri = f'https://github.com/VCityTeam/UD-Graph/{filename}'


    input_node_count = 0
    input_node_total = 0
    for _ in input_root.iter(): # get input node total
        input_node_total += 1
    id_count = {}
    class_definition_cache = {}
    datatype_definition_cache = {}
    objectproperty_definition_cache = {}
    datatypeproperty_definition_cache = {}
    parsed_nodes = []

    with open(sys.argv[4], 'r') as file:
        namespace_mappings = json.loads(file.read())

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

    GML_NAMESPACE = Namespace(input_root.nsmap.get('gml'))
    GML_ONT_NAMESPACE = Namespace('http://www.opengis.net/ont/gml#')
    GeoSPARQL_NAMESPACE = Namespace('http://www.opengis.net/ont/geosparql#')



    ###################################
    ##  Convert input file into rdf  ##
    ###################################

    print('Declaring ontology imports...')
    output_graph.add( (URIRef(output_uri), RDF.type, OWL.Ontology) )
    for ontology_uri in ontology.query('''
            SELECT DISTINCT ?ontology
            WHERE { ?ontology a owl:Ontology . }'''):
        output_graph.add( (URIRef(output_uri), OWL.imports, ontology_uri[0]) )

    print('Converting XML tree...')
    updateProgressBar(input_node_count, input_node_total)
    if input_root.attrib.get('{http://www.w3.org/2001/XMLSchema-instance}schemaLocation') is not None:
        input_root.attrib.pop('{http://www.w3.org/2001/XMLSchema-instance}schemaLocation')
    for input_node in input_root.iter():
        # skip comment nodes
        if not isinstance(input_node.tag, str):
            continue
        # skip already parsed nodes
        if input_tree.getelementpath(input_node) in parsed_nodes:
            continue

        # if the node is a class, generate an id and individual for it.
        if isClass( input_node.tag ):
            generateIndividual(input_node)

    print('\nWriting graph to disk...')
    print(f'{sys.argv[3]}/{filename}.ttl')
    with open(f'{sys.argv[3]}/{filename}.ttl', 'wb') as file:
        file.write(output_graph.serialize(format='turtle'))



######################################
##  Graph transformation functions  ##
######################################

# generate a new individual from an XML node and its children, then add the
# node to the output graph. An id is returned for recursive calls
def generateIndividual(node):
    # skip comment nodes
    if not isinstance(node.tag, str):
        return
    global input_node_count
    global input_node_total

    # skip node if already parsed
    if input_tree.getelementpath(node) in parsed_nodes:
        return
    node_tag = mapNamespace(node)
    node_id = ''
    if '{%s}id' % GML_NAMESPACE in node.attrib:
        node_id = URIRef(f'{output_uri}#' + node.attrib.get('{%s}id' % GML_NAMESPACE))
    else:
        node_id = URIRef(generateID(node_tag))
    output_graph.add( (node_id, RDF.type, OWL.NamedIndividual) )
    output_graph.add( (node_id, RDF.type, node_tag) )

    # if the node is a geometry node, create a gml serialization and add
    # it as a triple to the node
    if isGeometry(node.tag):
        geometry_blob = generateGeometrySerialization(node)
        geometry_node = Literal(geometry_blob, datatype=GeoSPARQL_NAMESPACE.gmlLiteral)
        output_graph.add( (node_id, GeoSPARQL_NAMESPACE.asGML, geometry_node) )
        

    for child in node:
        # skip comment nodes
        if not isinstance(child.tag, str):
            continue
        # check if child node is a class. If so, generate a new individual for the
        # child and create an object property linking the two individuals.
        if isClass(child.tag):
            child_id = generateIndividual(child)
            objectproperties = findObjectProperty(node.tag, child.tag)
            for objectproperty in objectproperties:
                output_graph.add( (node_id, objectproperty, child_id) )
            if isGeometry(child.tag):
                output_graph.add( (node_id, GeoSPARQL_NAMESPACE.hasGeometry, child_id) )
        # check if child node is a datatype. If so, generate a datatype for the
        # child and create a datatype property linking the individual and datatype.
        elif isDatatype(child.tag):
            child_text = Literal(child.text)
            datatypeproperty = findDatatypeProperty(node.tag, child.tag)
            for property in datatypeproperty:
                output_graph.add( (node_id, property, child_text) )
        # check if child node is an object property. If so, generate the object
        # property nodes and their corresponding individuals by calling
        # generateObjectProperties().
        elif isObjectProperty(child.tag, node.tag):
            generateObjectProperties(node, node_id, child)
        # check if child node is an datatype property. If so, generate the datatype
        # property nodes and their corresponding individuals by calling
        # generateDatatypeProperty().
        elif isDatatypeProperty(child.tag, node.tag):
            # print('node:', node.tag)
            # print('child:', child.tag)
            generateDatatypeProperty(node, node_id, child)
        else:
            logging.warning(f'Unknown XML element, {child.tag}, at: {input_tree.getelementpath(child)}')

    for attribute in node.attrib:
        attribute_tag = mapNamespace(attribute)
        attribute_text = Literal(node.attrib[attribute])
        output_graph.add( (node_id, attribute_tag, attribute_text) )

    # when complete, add node to parsed nodes list
    parsed_nodes.append(input_tree.getelementpath(node))
    updateProgressBar(input_node_count, input_node_total, node.tag)
    input_node_count += 1
    return node_id


# Generate an individual for each child (which should all be classes if input
# tree is well formed) and create an object property linking the parent
# individual with each child individual. Also check for xlinks.
def generateObjectProperties(parent, parent_id, node):
    if node.attrib.get('{http://www.w3.org/1999/xlink}href') is not None:
        # Check if an xlink is present. If so create a triple referencing the resource
        property = findObjectProperty(parent.tag, None, node.tag)
        if property is not None:
            reference = URIRef(f'{output_uri}#' +
                node.attrib['{http://www.w3.org/1999/xlink}href'].split('#')[-1])
            output_graph.add( (parent_id, property, reference) )
    for child in node:
        # check if child node is a class. If so, generate a new individual for the
        # child and create an object property linking the two individuals. In the
        # case the child is geometry, generate a geometry serialization.
        if isClass(child.tag):
            child_id = generateIndividual(child)
            property = findObjectProperty(parent.tag, child.tag, node.tag)
            if property is not None:
                output_graph.add((parent_id, property, child_id))
            else:
                logging.warning(f'Object property, {node.tag}, not found for child, {child.tag}, '
                    f'at: {input_tree.getelementpath(node)}')
            # check if child is a gml geometry node. If so, generate the geometry
            # property gsp:hasGeometry.
            if isGeometry(child.tag):
                output_graph.add( (parent_id, GeoSPARQL_NAMESPACE.hasGeometry, child_id) )
        else:
            logging.warning(f'Child class element, {child.tag}, for object property, {node.tag}, '
                f'generation not found at: {input_tree.getelementpath(child)}')


# Generate a datatype for each child (which should all contain datatype literals
# if well formed) and create a datatype property linking the parent individual
# with each child datatype literal.
def generateDatatypeProperty(parent, parent_id, node):
    # check if child node is a datatype. If so, generate a new datatype literal
    # for the child and create a datatype property linking the class with the
    # datatype literal.
    if node.text is not None:
        property = findDatatypeProperty(parent.tag, node.tag)
        if property is not None:
            output_graph.add((parent_id, property, Literal(node.text)))
        else:
            logging.warning(f'Datatype property not found: {input_tree.getelementpath(node)}')
    else:
        logging.warning(f'Datatype text for datatype property not found: {input_tree.getelementpath(node)}')

# helper function for filtering unwanted geometry namespaces
def isGMLTag( string ):
    return not string.startswith('xmlns') or string.startswith('xmlns:gml')

# Generate the gsp:gmlLiteral serialization of a geometry node
def generateGeometrySerialization(node):
    node_copy = deepcopy(node)
    # gather geometry referenced though xlinks 
    for xlink in node_copy.findall('.//*[@{http://www.w3.org/1999/xlink}href]'):
        reference = xlink.attrib.get('{http://www.w3.org/1999/xlink}href').split('#')[-1]
        reference_node = input_root.find('.//*[@{%s}id = "%s"]' % (GML_NAMESPACE, reference))
        if reference_node is not None:
            logging.info(f'Compiling geometry for xlink reference to: {reference}')
            new_element = etree.Element(xlink.tag)
            new_element.append(deepcopy(reference_node))
            parent = xlink.getparent()
            parent.append(new_element)
            parent.remove(xlink)

    geometry = str(etree.tostring(node_copy, pretty_print=False)).split(' ')
    geometry = ' '.join(filter( isGMLTag, geometry ))
    geometry = str(geometry)[2:-1].replace('\\n', '').replace('  ', '').replace('"', "'").strip()

    return geometry



#########################
##  Utility functions  ##
#########################

# find an object property which links (intersects) two given classes based on the
# domain and range of the property. The second class can be omitted in the case of
# an xlink object property. A property tag hint may also be supplied.
def findObjectProperty(tag1, tag2=None, property_tag=None):
    #TODO: Break this function into multiple functions
    qname1 = etree.QName(tag1)
    if tag2 is None and isClass(qname1):
        if property_tag is None:
            query = ontology.query('''
                SELECT DISTINCT ?objectproperty
                WHERE {
                    {   ?objectproperty a owl:ObjectProperty ;
                            rdfs:domain ?domain .
                        <%s> rdfs:subClassOf* ?domain .
                    }
                    UNION
                    {   <%s> a owl:Class ;
                            rdfs:subClassOf [ a owl:Restriction ;
                                              owl:allValuesFrom ?someClass ;
                                              owl:onProperty    ?objectproperty 
                                            ] .
                    }
                }''' % (mapNamespace(qname1),
                        mapNamespace(qname1)))
            if len(query) > 0:
                return query
        else:
            for property in getObjectProperties(property_tag):
                query = ontology.query('''
                    ASK   {
                        { <%s> a owl:ObjectProperty ;
                                rdfs:domain ?domain .
                            <%s> rdfs:subClassOf* ?domain .
                        }
                        UNION
                        { <%s> a owl:Class ;
                            rdfs:subClassOf [ a owl:Restriction ;
                                              owl:allValuesFrom ?someClass ;
                                              owl:onProperty    <%s> 
                                            ] .
                        }
                    }''' % (property[0],
                            mapNamespace(qname1),
                            mapNamespace(qname1),
                            property[0]) )
                if bool(query):
                    return property[0]

    qname2 = etree.QName(tag2)
    if not isClass(qname1) or not isClass(qname2):
        logging.warning(f'Cannot find object property between {tag1} or {tag2} '
            f'for property {property_tag}. One or both are not classes')
        return None

    if property_tag is None:
        query = ontology.query('''
            SELECT DISTINCT ?objectproperty
            WHERE {
                {   ?objectproperty a owl:ObjectProperty ;
                        rdfs:domain ?domain ;
                        rdfs:range  ?range .
                    <%s> rdfs:subClassOf* ?domain .
                    <%s> rdfs:subClassOf* ?range .
                }
                UNION
                {   <%s> a owl:Class ;
                        rdfs:subClassOf [ a owl:Restriction ;
                                          owl:allValuesFrom <%s> ;
                                          owl:onProperty    ?objectproperty 
                                        ] .
                }
            }''' % (mapNamespace(qname1),
                    mapNamespace(qname2),
                    mapNamespace(qname1),
                    mapNamespace(qname2)))
        if len(query) > 0:
            return query
    else:
        for property in getObjectProperties(property_tag):
            query = ontology.query('''
                ASK   {
                    { <%s> a owl:ObjectProperty ;
                            rdfs:domain ?domain ;
                            rdfs:range  ?range .
                        <%s> rdfs:subClassOf* ?domain .
                        <%s> rdfs:subClassOf* ?range .
                    }
                    UNION
                    { <%s> a owl:Class ;
                        rdfs:subClassOf [ a owl:Restriction ;
                                          owl:allValuesFrom <%s> ;
                                          owl:onProperty    <%s> 
                                        ] .
                    }
                }''' % (property[0],
                        mapNamespace(qname1),
                        mapNamespace(qname2),
                        mapNamespace(qname1),
                        mapNamespace(qname2),
                        property[0]) )
            if bool(query):
                return property[0]
    logging.warning(f'No matching object property found between: {tag1}, {tag2}')
    return None


# find a datatype property which links (intersects) a given class and a datatype
# based on the domain and range of the property or which a given class contains
# a universal restriction of the property.
def findDatatypeProperty(tag1, property_tag=None):
    qname1 = etree.QName(tag1)
    if isClass(tag1):
        if property_tag is None:
            query = ontology.query('''
                SELECT DISTINCT ?datatypeproperty
                WHERE {
                    { ?datatypeproperty a owl:DatatypeProperty ;
                            rdfs:domain ?domain .
                        <%s> rdfs:subClassOf* ?domain .
                    }
                    UNION
                    { <%s> a owl:Class ;
                        rdfs:subClassOf [ a owl:Restriction ;
                                          owl:onProperty    ?datatypeproperty 
                                        ] .
                    }
                }''' % (mapNamespace(qname1),
                        mapNamespace(qname1)) )
            if len(query) > 0:
                return query
        else:
            for property in getDatatypeProperties(property_tag):
                query = ontology.query('''
                    ASK   {
                        { <%s> a owl:DatatypeProperty ;
                                rdfs:domain ?domain .
                            <%s> rdfs:subClassOf* ?domain .
                        }
                        UNION
                        { <%s> a owl:Class ;
                            rdfs:subClassOf [ a owl:Restriction ;
                                              owl:onProperty <%s> 
                                            ] .
                        }
                    }''' % (property[0],
                            mapNamespace(qname1),
                            mapNamespace(qname1),
                            property[0]) )
                if bool(query):
                    return property[0]
    logging.warning(f'No matching datatype property found between: {tag1}, {property_tag}')
    return None

# normalize an namespace for OWL
def normalizeNamespace(namespace):
    namespace = str(namespace)
    if namespace[-1] == '#':
        return namespace
    elif namespace[-1] == '/':
        return namespace[:-1] + '#'
    else:
        return namespace + '#'


# map an XML tag namespace for based on the ontology. If input tag namespace is
# in namespace mappings, return the target mapping namespace. Tags are returned
# as rdflib.URIRef objects.
def mapNamespace(node_or_tag):
    if str(node_or_tag) in ('srsName', 'srsDimension' , 'uom'):
        node_or_tag = '{%s}%s' % (GML_NAMESPACE, node_or_tag)
    qname = etree.QName(node_or_tag)

    if qname.namespace in namespace_mappings.keys():
        if len(namespace_mappings[qname.namespace]) == 1:
            return URIRef(namespace_mappings[qname.namespace][0] + qname.localname)
        else:
            # TODO: implement dynamic namespace resolution for multiple mappings
            for namespace in namespace_mappings[qname.namespace]:
                if ontology.query('''
                        ASK { <%s%s> ?predicate ?object }''' % (namespace, qname.localname)):
                    return URIRef(namespace + qname.localname)
            logging.warning(f'Unable to map qname, {qname}, to a namespace')
            return URIRef(normalizeNamespace(qname.namespace) + qname.localname)
    else:
        return URIRef(normalizeNamespace(qname.namespace) + qname.localname)


# create a new, unique id from a normalized XML node tag
def generateID(tag):
    name = str(tag).split('#')[-1]
    if name in id_count:
        id_count[name] += 1
        return f'{output_uri}#{name}_{id_count[name]}'
    else:
        id_count[name] = 0
        return f'{output_uri}#{name}_0'


# return all definitions of a tag in the ontology
def getDefinitions(tag):
    definitions = []
    for class_definition in getClasses(tag):
        definitions.append(class_definition)


# return whether class definition exists in ontology
def isClass(tag):
    qname = etree.QName(tag)
    if tag in class_definition_cache.keys():
        return len(class_definition_cache.get(tag)) > 0
    # TODO: optimize query
    query = []
    for namespace in namespace_mappings.get(qname.namespace, [qname.namespace]):
        for line in ontology.query('''
                SELECT DISTINCT ?class
                WHERE {
                    ?class rdf:type owl:Class .
                    FILTER ( STR(?class) = "%s%s" )
                }''' % (namespace, qname.localname) ):
            query.append(line)
    class_definition_cache[tag] = query
    return len(class_definition_cache.get(tag)) > 0


# check if uri corresponds to a class and return the possible classes
def getClasses(tag):
    if isClass(tag):
        return class_definition_cache.get( str(tag) )


# return whether object property definition exists in ontology. Local property
# names may require searching through the shapechange [[name]] descriptor target
# (rdfs:label by default) depending on shapechange property encoding
# configurations. The node's parent tag may be provided to verify if the parent
# class is within the domain of the property.
def isObjectProperty(tag, parent_tag=None):
    qname = etree.QName(tag)
    if tag in objectproperty_definition_cache.keys():
        if parent_tag is None:
            return len(objectproperty_definition_cache.get(tag)) > 0
        else:
            parent_qname = mapNamespace(etree.QName(parent_tag))
            for objectproperty in objectproperty_definition_cache.get(tag):
                if ontology.query('''
                    ASK {
                        <%s> rdf:type owl:ObjectProperty ;
                            rdfs:domain ?domain .
                         <%s> rdfs:subClassOf* ?domain .
                    }''' % (objectproperty[0], parent_qname) ):
                    return True
            return False
    query = []
    for namespace in namespace_mappings[qname.namespace]:
        # TODO: optimize queries
        for line in ontology.query('''
                SELECT DISTINCT ?objectproperty
                WHERE {
                    ?objectproperty rdf:type owl:ObjectProperty .
                    FILTER regex(STR(?objectproperty), "^%s.*.%s$")
                }''' % (namespace, qname.localname) ):
            query.append(line)
    objectproperty_definition_cache[tag] = query
    if parent_tag is None:
        return len(objectproperty_definition_cache.get(tag)) > 0
    else:
        parent_qname = mapNamespace(etree.QName(parent_tag))
        for objectproperty in objectproperty_definition_cache.get(tag):
            if ontology.query('''
                ASK {
                    <%s> rdf:type owl:ObjectProperty ;
                        rdfs:domain ?domain .
                     <%s> rdfs:subClassOf* ?domain .
                }''' % (objectproperty[0], parent_qname)):
                return True
    return False



# check if uri corresponds to an object property and return the possible properties
def getObjectProperties(tag):
    if isObjectProperty(tag):
        return objectproperty_definition_cache.get( str(tag) )


# return whether datatype property definition exists in ontology. Local property
# names may require searching through the shapechange [[name]] descriptor target
# (rdfs:label by default) depending on shapechange property encoding
# configurations. The node's parent tag may be provided to verify if the parent
# class is within the domain of the property.
def isDatatypeProperty(tag, parent_tag=None):
    qname = etree.QName(tag)
    if tag in datatypeproperty_definition_cache.keys():
        if parent_tag is None:
            return len(datatypeproperty_definition_cache.get(tag)) > 0
        else:
            parent_qname = mapNamespace(etree.QName(parent_tag))
            for datatypeproperty in datatypeproperty_definition_cache.get(tag):
                if ontology.query('''
                    ASK {
                        <%s> rdf:type owl:DatatypeProperty ;
                            rdfs:domain ?domain .
                         <%s> rdfs:subClassOf* ?domain .
                    }''' % (datatypeproperty[0], parent_qname) ):
                    return True
            return False
    query = []
    for namespace in namespace_mappings[qname.namespace]:
        # TODO: optimize query
        for line in ontology.query('''
                SELECT DISTINCT ?datatypeproperty
                WHERE {
                    ?datatypeproperty rdf:type owl:DatatypeProperty .
                    FILTER regex(STR(?datatypeproperty), "^%s.*.%s$")
                }''' % (namespace, qname.localname) ):
            query.append(line)
    datatypeproperty_definition_cache[tag] = query
    if parent_tag is None:
        return len(datatypeproperty_definition_cache.get(tag)) > 0
    else:
        parent_qname = mapNamespace(etree.QName(parent_tag))
        for datatypeproperty in datatypeproperty_definition_cache.get(tag):
            if ontology.query('''
                ASK {
                    <%s> rdf:type owl:DatatypeProperty ;
                        rdfs:domain ?domain .
                     <%s> rdfs:subClassOf* ?domain .
                }''' % (datatypeproperty[0], parent_qname)):
                return True
    return False


# check if uri corresponds to an datatype property and return the possible properties
def getDatatypeProperties(tag):
    if isDatatypeProperty(tag):
        return datatypeproperty_definition_cache.get( str(tag) )


# return whether datatype definition exists in ontology
def isDatatype(tag):
    qname = etree.QName(tag)
    if tag in datatype_definition_cache.keys():
        return len(datatype_definition_cache.get(tag)) > 0
    # TODO: optimize query
    query = []
    for namespace in namespace_mappings[qname.namespace]:
        for line in ontology.query('''
                SELECT DISTINCT ?datatype
                WHERE {
                    ?datatype rdf:type rdfs:Datatype .
                    FILTER ( STR(?datatype) = "%s%s" )
                }''' % (namespace, qname.localname) ):
            query.append(line)
    datatype_definition_cache[tag] = query
    return len(datatype_definition_cache.get(tag)) > 0


# check if uri corresponds to a datatype and return the possible datatypes
def getDatatype(tag):
    if isDatatype(tag):
        return datatype_definition_cache.get( str(tag) )


# return whether tag is a valid gml element. Convert the uri into a qname
# tuple of (prefix, namespace, localname) to extract the namespace
def isGeometry(tag):
    qname = mapNamespace(tag).split('#')
    if qname[0] + '#' == str(GML_ONT_NAMESPACE) and isClass(tag):
        return ontology.query(
                'ASK {'
                    f'<{str(GML_ONT_NAMESPACE)}{qname[1]}> rdfs:subClassOf* <{str(GML_ONT_NAMESPACE)}AbstractGeometry> .'
                '}')

def updateProgressBar( count, total, status='' ):
    bar_length    = 20
    buffer_size   = 127
    filled_length = int(round(bar_length * count / float(total)))

    percent = round(100.0 * count / float(total), 1)
    bar = '#' * filled_length + '-' * (bar_length - filled_length)
    output = f'[{bar}] {percent}%, {count}/{total} ...{status}'

    print(' ' * buffer_size + '\r', end='')
    print(output[0:buffer_size] + '\r', end='')



if __name__ == "__main__":
    main()