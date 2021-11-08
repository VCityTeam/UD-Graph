import os
import json
import logging
from Uri import URI 
from rdflib import Graph


class OntologyManager:
    """The base class of a tripler to be extended for reading different file
    formats and converting them to RDF based on an ontological model(s)."""
    def __init__(self, input_model=None, config=None, log=None):
        if log is not None:
            logging.basicConfig(filename=log, level=logging.DEBUG)

        self.definition_cache = {
            'class_definitions': {},
            'datatype_definitions': {},
            'objectproperty_definitions': {},
            'datatypeproperty_definitions': {},
            'annotationproperty_definitions': {}
        }
        self.GML_ONT_NAMESPACE = Namespace('http://www.opengis.net/ont/gml#')
        self.GeoSPARQL_NAMESPACE = Namespace('http://www.opengis.net/ont/geosparql#')

        print('Loading configuration...')
        with open(config, 'r') as file:
            self.config = json.loads(file.read())
            logging.debug(f'configuration {config} loaded')

        print('Loading ontological model...')
        self.ontology_network = Graph()
        for path in input_model.split(','):
            if path.startswith('http://') or path.startswith('https://'):
                self.ontology_network.parse(path)
                logging.debug(f'ontology {path} added to ontology network')
                continue
            for root, dirs, files in os.walk(path):
                for file in files:
                    filepath = os.path.join(root, file)
                    if file.endswith('.ttl'):
                        self.ontology_network.parse(filepath, format='turtle')
                    if file.endswith('.rdf'):
                        self.ontology_network.parse(filepath, format='xml')
                    logging.debug(f'ontology {filepath} added to ontology network')


    #########################
    ### Utility Functions ###
    #########################

    def mapNamespace(self, uri):
        '''map a uri namespace based based on the configuration file. If an RDF
        mapping or namespace mapping exists return that mapping. If a namespace is
        mapped to multiple namespaces, the ontology model is queried to determine which
        namespace is appropriate. The first namespace+localname to appear in
        the ontological model, is selected as the target namespace to map. Always
        returns uri as a URI()'''
        if uri in self.config.rdf_mappings:
            return URI(self.config.rdf_mappings[uri])
        uri = URI(uri)

        if uri.namespace in self.config.namespace_mappings.keys():
            if len(self.config.namespace_mappings[uri.namespace]) == 1:
                uri.namespace = self.config.namespace_mappings[uri.namespace][0]
                return uri
            else:
                # WARNING: When namespace mappings are 1 to n, it is best to use an RDF
                # mapping to ensure the datum is mapped correctly
                for namespace in self.config.namespace_mappings[uri.namespace]:
                    if self.ontology_network.query('''
                            ASK { <%s%s> ?predicate ?object }''' % (namespace, uri.localname)):
                        uri.namespace = namespace
                        return uri
                logging.error(f'Unable to map uri, {uri}, to a namespace')
                return uri
        else:
            return uri


    #############################
    ### Class Query Functions ###
    #############################

    def isClass(self, uri):
        """return whether class definition exists in the ontological model"""
        uri = URI(uri)
        if uri in self.definition_cache.class_definitions.keys():
            return len(self.definition_cache.class_definitions.get(uri)) > 0
        # TODO: optimize query
        query = []
        uri_namespace_mappings = self.config.namespace_mappings.get(uri.namespace)
        if uri_namespace_mappings is None:
            for line in self.ontology_network.query('''
                            SELECT DISTINCT ?class
                            WHERE {
                                ?class rdf:type owl:Class .
                                FILTER ( STR(?class) = "%s%s" )
                            }''' % (uri.namespace, uri.localname)):
                query.append(line)
        else:
            for namespace in self.config.namespace_mappings.get(uri.namespace, [uri.namespace]):
                for line in self.ontology_network.query('''
                        SELECT DISTINCT ?class
                        WHERE {
                            ?class rdf:type owl:Class .
                            FILTER ( STR(?class) = "%s%s" )
                        }''' % (namespace, uri.localname) ):
                    query.append(line)
        self.definition_cache.class_definitions[uri] = query
        return len(self.definition_cache.class_definitions.get(uri)) > 0


    def getClasses(self, uri):
        """check if uri corresponds to a class and return the possible classes"""
        if self.isClass(uri):
            return self.definition_cache.class_definitions.get( str(uri) )
        else:
            logging.warning(f'Unable to get Class: {uri}')


    ######################################
    ### ObjectProperty Query Functions ###
    ######################################

    def isObjectProperty(self, uri, class_uri=None):
        """return whether a object property definition exists in ontology from a uri.
        The a class uri may be provided to verify if it is within the domain of the
        property."""
        uri = URI(uri)
        if uri in self.definition_cache.objectproperty_definitions.keys():
            if class_uri is None:
                return len(self.definition_cache.objectproperty_definitions.get(uri)) > 0
            else:
                parent_qname = self.mapNamespace(class_uri)
                for objectproperty in self.definition_cache.objectproperty_definitions.get(uri):
                    if self.ontology_network.query('''
                        ASK {
                            <%s> rdf:type owl:ObjectProperty ;
                                rdfs:domain ?domain .
                             <%s> rdfs:subClassOf* ?domain .
                        }''' % (objectproperty[0], parent_qname) ):
                        return True
                return False
        query = []
        uri_namespace_mappings = self.config.namespace_mappings.get(uri.namespace)
        if uri_namespace_mappings is None:
            for line in self.ontology_network.query('''
                    SELECT DISTINCT ?objectproperty
                    WHERE {
                        ?objectproperty rdf:type owl:ObjectProperty .
                        FILTER regex(STR(?objectproperty), "^%s.*.%s$")
                    }''' % (uri.namespace, uri.localname) ):
                query.append(line)
        else:
            for namespace in self.config.namespace_mappings[uri.namespace]:
                # TODO: optimize queries
                for line in self.ontology_network.query('''
                        SELECT DISTINCT ?objectproperty
                        WHERE {
                            ?objectproperty rdf:type owl:ObjectProperty .
                            FILTER regex(STR(?objectproperty), "^%s.*.%s$")
                        }''' % (namespace, uri.localname) ):
                    query.append(line)
        self.definition_cache.objectproperty_definitions[uri] = query
        if class_uri is None:
            return len(self.definition_cache.objectproperty_definitions.get(uri)) > 0
        else:
            class_uri = self.mapNamespace(class_uri)
            for objectproperty in self.definition_cache.objectproperty_definitions.get(uri):
                if self.ontology_network.query('''
                    ASK {
                        <%s> rdf:type owl:ObjectProperty ;
                            rdfs:domain ?domain .
                         <%s> rdfs:subClassOf* ?domain .
                    }''' % (objectproperty[0], class_uri)):
                    return True
        return False


    def getObjectProperties(self, uri):
        """check if uri corresponds to an object property and return the possible properties"""
        if self.isObjectProperty(uri):
            return self.definition_cache.objectproperty_definitions.get( uri )
        else:
            logging.warning(f'Unable to get Object Property: {uri}')


    def getObjectPropertiesOfClass(self, class_uri, property_uri=None):
        """Find an object property of a given class based on the domain and range
        of the property. A property uri may also be supplied to speed up the search."""
        if self.isClass(class_uri):
            if property_uri is None:
                query = self.ontology_network.query('''
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
                    }''' % (self.mapNamespace(class_uri),
                            self.mapNamespace(class_uri)))
                if len(query) > 0:
                    return query
            else:
                for property in self.getObjectProperties(property_uri):
                    query = self.ontology_network.query('''
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
                                self.mapNamespace(class_uri),
                                self.mapNamespace(class_uri),
                                property[0]) )
                    if bool(query):
                        return property[0]
        logging.warning(f'No matching object property found for class: {class_uri}')
        return None


    def getObjectPropertyBetweenClasses(self, class1_uri, class2_uri, property_uri=None):
        """Find an object property which links (intersects) two given classes based on the
        domain and range of the property. A property uri may also be supplied."""
        if not self.isClass(class1_uri) or not self.isClass(class1_uri):
            logging.warning(f'Cannot find object property between {class1_uri} or {class2_uri} '
                f'with property {property_uri}. One or both are not classes')
            return None

        if property_uri is None:
            query = self.ontology_network.query('''
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
                }''' % (self.mapNamespace(class1_uri),
                        self.mapNamespace(class2_uri),
                        self.mapNamespace(class1_uri),
                        self.mapNamespace(class2_uri)))
            if len(query) > 0:
                return query
        else:
            for property in self.getObjectProperties(property_uri):
                query = self.ontology_network.query('''
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
                            self.mapNamespace(class1_uri),
                            self.mapNamespace(class2_uri),
                            self.mapNamespace(class1_uri),
                            self.mapNamespace(class2_uri),
                            property[0]) )
                if bool(query):
                    return property[0]
        logging.warning(f'No matching object property found between: {class1_uri}, {class2_uri}')
        return None


    ########################################
    ### DatatypeProperty Query Functions ###
    ########################################

    def isDatatypeProperty(self, property_uri, parent_uri=None):
        """return whether datatype property definition exists in ontology. A class
        uri may be provided to verify if it is within the domain of the property."""
        property_uri = URI(property_uri)
        if property_uri in self.definition_cache.datatypeproperty_definitions.keys():
            if parent_uri is None:
                return len(self.definition_cache.datatypeproperty_definitions.get(property_uri)) > 0
            else:
                parent_qname = self.mapNamespace(parent_uri)
                for datatypeproperty in self.definition_cache.datatypeproperty_definitions.get(property_uri):
                    if self.ontology_network.query('''
                            ASK {
                                <%s> rdf:type owl:DatatypeProperty ;
                                    rdfs:domain ?domain .
                                 <%s> rdfs:subClassOf* ?domain .
                            }''' % (datatypeproperty[0], parent_qname) ):
                        return True
                return False
        query = []
        property_uri_namespace_mappings = self.config.namespace_mappings.get(property_uri.namespace)
        if property_uri_namespace_mappings is None:
            for line in self.ontology_network.query('''
                        SELECT DISTINCT ?datatypeproperty
                        WHERE {
                            ?datatypeproperty rdf:type owl:DatatypeProperty .
                            FILTER regex(STR(?datatypeproperty), "^%s.*.%s$")
                        }''' % (property_uri.namespace, property_uri.localname) ):
                    query.append(line)
        else:
            for namespace in property_uri_namespace_mappings:
                # TODO: optimize query
                for line in self.ontology_network.query('''
                        SELECT DISTINCT ?datatypeproperty
                        WHERE {
                            ?datatypeproperty rdf:type owl:DatatypeProperty .
                            FILTER regex(STR(?datatypeproperty), "^%s.*.%s$")
                        }''' % (namespace, property_uri.localname) ):
                    query.append(line)
        self.definition_cache.datatypeproperty_definitions[property_uri] = query
        if parent_uri is None:
            return len(self.definition_cache.datatypeproperty_definitions.get(property_uri)) > 0
        else:
            parent_property_uri = self.mapNamespace(parent_uri)
            for datatypeproperty in self.definition_cache.datatypeproperty_definitions.get(property_uri):
                if self.ontology_network.query('''
                    ASK {
                        <%s> rdf:type owl:DatatypeProperty ;
                            rdfs:domain ?domain .
                         <%s> rdfs:subClassOf* ?domain .
                    }''' % (datatypeproperty[0], parent_property_uri)):
                    return True
        return False


    def getDatatypePropertyRange(self, property_uri):
        """Get the rdfs:range of a datatype property uri"""
        return self.ontology_network.query('''
            SELECT DISTINCT ?range
            WHERE {
                <%s> rdfs:range ?range .
            }''' % property_uri)


    def getDatatypeProperties(self, uri):
        """check if uri corresponds to an datatype property and return the possible properties"""
        if self.isDatatypeProperty(uri):
            return self.definition_cache.datatypeproperty_definitions.get(uri)
        else:
            logging.warning(f'Unable to get Datatype Property: {uri}')


    def getDatatypePropertyOfClass(self, class_uri, property_uri=None):
        """Find a datatype property which links (intersects) a given class and a datatype
        based on the domain and range of the property or which the given class contains
        a universal restriction of the property."""
        if self.isClass(class_uri):
            if property_uri is None:
                query = self.ontology_network.query('''
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
                    }''' % (self.mapNamespace(class_uri),
                            self.mapNamespace(class_uri)) )
                if len(query) > 0:
                    return query
            else:
                for property in self.getDatatypeProperties(property_uri):
                    query = self.ontology_network.query('''
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
                                self.mapNamespace(class_uri),
                                self.mapNamespace(class_uri),
                                property[0]) )
                    if bool(query):
                        return property[0]
        logging.warning(f'No matching datatype property found between: {class_uri}, {property_uri}')
        return None


    ################################
    ### Datatype Query Functions ###
    ################################

    def isDatatype(self, uri):
        """return whether datatype definition exists in ontological model"""
        uri = URI(uri)
        if uri.namespace == 'http://www.w3.org/2001/XMLSchema#':
            return True
        if uri in self.definition_cache.datatype_definitions.keys():
            return len(self.definition_cache.datatype_definitions.get(uri)) > 0
        # TODO: optimize query
        query = []
        uri_namespace_mappings = self.config.namespace_mappings.get(uri.namespace)
        if uri_namespace_mappings is None:
            for line in self.ontology_network.query('''
                    SELECT DISTINCT ?datatype
                    WHERE {
                        ?datatype rdf:type rdfs:Datatype .
                        FILTER ( STR(?datatype) = "%s%s" )
                    }''' % (uri.namespace, uri.localname) ):
                query.append(line)
        else:
            for namespace in self.config.namespace_mappings[uri.namespace]:
                for line in self.ontology_network.query('''
                        SELECT DISTINCT ?datatype
                        WHERE {
                            ?datatype rdf:type rdfs:Datatype .
                            FILTER ( STR(?datatype) = "%s%s" )
                        }''' % (namespace, uri.localname) ):
                    query.append(line)
        self.definition_cache.datatype_definitions[uri] = query
        return len(self.definition_cache.datatype_definitions.get(uri)) > 0


    def getDatatype(self, uri):
        """check if uri corresponds to a datatype and return the possible datatypes"""
        if self.isDatatype(uri):
            return self.definition_cache.datatype_definitions.get(uri)
        else:
            logging.warning(f'Unable to get Datatype: {uri}')


    ##########################################
    ### AnnotationProperty Query Functions ###
    ##########################################

    def isAnnotationProperty(self, uri):
        """return whether an annotation property definition exists in the ontology.
        Local naming conventions are not used for this query. Several common annotation
        properties are included."""
        uri = URI(uri)
        if uri in ['http://www.w3.org/2000/01/rdf-schema#comment',
                'http://www.w3.org/2000/01/rdf-schema#isDefinedBy',
                'http://www.w3.org/2000/01/rdf-schema#label',
                'http://www.w3.org/2000/01/rdf-schema#seeAlso',
                'http://www.w3.org/2002/07/owl#backwardCompatibleWith',
                'http://www.w3.org/2002/07/owl#deprecated',
                'http://www.w3.org/2002/07/owl#incompatibleWith',
                'http://www.w3.org/2002/07/owl#priorVersion',
                'http://www.w3.org/2002/07/owl#versionInfo']:
            return True
        if uri in self.definition_cache.annotationproperty_definitions.keys():
            return len(self.definition_cache.annotationproperty_definitions.get(uri)) > 0
        query = []
        uri_namespace_mappings = self.config.namespace_mappings.get(uri.namespace)
        if uri_namespace_mappings is None:
            for line in self.ontology_network.query('''
                        SELECT DISTINCT ?annotationproperty
                        WHERE {
                            ?annotationproperty rdf:type owl:AnnotationProperty .
                            FILTER regex(STR(?annotationproperty), "^%s%s")
                        }''' % (uri.namespace, uri.localname) ):
                query.append(line)
        else:
            for namespace in uri_namespace_mappings:
                # TODO: optimize query
                for line in self.ontology_network.query('''
                        SELECT DISTINCT ?annotationproperty
                        WHERE {
                            ?annotationproperty rdf:type owl:AnnotationProperty .
                            FILTER regex(STR(?annotationproperty), "^%s%s")
                        }''' % (namespace, uri.localname) ):
                    query.append(line)
        self.definition_cache.annotationproperty_definitions[uri] = query
        return len(self.definition_cache.annotationproperty_definitions.get(uri)) > 0

    ###########################
    ### GeoSPARQL Functions ###
    ###########################

    def isGeometry(self, uri):
        """return whether a uri is mapped to a valid GeoSPARQL geometry class using the
        GeoSPARQL ontology."""
        uri = mapNamespace(uri)
        if uri.namespace == str(GeoSPARQL_NAMESPACE) and isClass(uri):
            return ontology.query(
                'ASK {'
                    f'<{uri}> rdfs:subClassOf* <{str(GeoSPARQL_NAMESPACE)}AbstractGeometry> .'
                '}')

    def isGML(self, uri):
        """return whether a uri is mapped to a valid GML geometry class using the
        GML OWL ontology."""
        uri = mapNamespace(uri)
        if uri.namespace == str(GML_ONT_NAMESPACE) and isClass(uri):
            return ontology.query(
                'ASK {'
                    f'<{uri}> rdfs:subClassOf* <{str(GML_ONT_NAMESPACE)}AbstractGeometry> .'
                '}')