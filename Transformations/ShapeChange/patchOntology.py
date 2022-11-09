import logging
import argparse
from rdflib import Graph
from rdflib.plugins.sparql import prepareQuery

def main():
    # initialize command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file',
                         help='Specify the input file')
    parser.add_argument('output_file',
                         help='Specify the output file')
    parser.add_argument('--input_format',
                         default='ttl',
                         help='Specify the RDFLib compliant input file format')
    parser.add_argument('--output_format',
                         default='ttl',
                         help='Specify the RDFLib compliant output file format')
    parser.add_argument('--log', '-l',
                         default='output.log',
                         help='Specify the logging file')
    args = parser.parse_args()
    
    patcher = ontologyPatcher(args.input_file, args.input_format, args.log)
    patcher.patchOnClass()
    patcher.patchDatatypeEnumeration()
    patcher.patchObjectProperties()
    patcher.outputGraph(args.output_file, args.output_format)


class ontologyPatcher():
    """A tool for patching ontologies created using ShapeChange.
    Currently 3 types of patches are targeted:
    1. Class restrictions that use the property owl:onClass
    with the object of an rdfs:Datatype are converted to owl:onDataRange.
    2. Datatype definitions created from enumerations that use owl:oneOf
    are redefined to use a Protégé friendly owl:equvalentClass axiom 
    containing the owl:oneOf property.
    3. ObjectProperty definitions which contain an rdfs:Datatype within
    their range are redefined as DatatypeProperties."""

    def __init__(self, input_file, input_format, log_file) -> None:
        logging.basicConfig(filename=log_file,
                            level=logging.DEBUG,
                            format='%(asctime)s %(levelname)-8s %(message)s')
        self.graph = Graph().parse(input_file, format=input_format)

    def patchOnClass(self) -> None:
        logging.info('=== Patching onClass restrictions ===')
        query_where_onClass = '''
            WHERE {
                {
                    ?_class a owl:Class ;
                        rdfs:subClassOf|owl:equivalentClass ?restriction .
                    ?restriction a owl:Restriction ;
                        owl:onClass ?object .
                    ?object a rdfs:Datatype .
                } UNION {
                    ?_class a owl:Class;
                        rdfs:subClassOf|owl:equivalentClass ?restriction .
                    ?restriction a owl:Restriction ;
                        owl:onClass ?object .
                    FILTER( ?object = <http://www.w3.org/2002/07/owl#real> ||
                            ?object = <http://www.w3.org/2002/07/owl#rational>
                    )
                } UNION {
                    ?_class a owl:Class;
                        rdfs:subClassOf|owl:equivalentClass ?restriction .
                    ?restriction a owl:Restriction ;
                        owl:onClass ?object .
                    FILTER( STRSTARTS( STR(?object),
                                       "http://www.w3.org/2001/XMLSchema#")
                    )
                }
            }
            '''
        query_select_onClass = '''
            SELECT ?_class ?object
            %s
            ''' % query_where_onClass
        for row in self.graph.query(query_select_onClass):
            logging.info(f'correcting class: {row._class} owl:onClass {row.object}')

        query_update_onClass = '''
            DELETE {
                ?restriction owl:onClass ?object
            } INSERT {
                ?restriction owl:onDataRange ?object
            } %s
            ''' % query_where_onClass
        self.graph.update(query_update_onClass)

    def patchDatatypeEnumeration(self) -> None:
        logging.info('=== Patching Datatype Enumerations ===')
        query_where_enumeration = '''
            WHERE {
                ?datatype a rdfs:Datatype ;
                    owl:oneOf ?list .
            }
            '''
        query_select_enumeration = '''
            SELECT ?datatype ?list
            %s
            ''' % query_where_enumeration
        for row in self.graph.query(query_select_enumeration):
            logging.info(f'correcting datatype: {row.datatype} owl:oneOf {row.list}')
        query_update_enumeration = '''
            DELETE {
                ?datatype owl:oneOf ?list
            } INSERT {
                ?datatype owl:equivalentClass [
                    a rdfs:Datatype ;
                    owl:oneOf ?list
                ] .
            } %s
            ''' % query_where_enumeration
        self.graph.update(query_update_enumeration)
    
    
    def patchObjectProperties(self) -> None:
        logging.info('=== Patching ObjectProperties Enumerations ===')
        query_where_objectproperty = '''
            WHERE {
                {
                    ?property a owl:ObjectProperty ;
                        rdfs:range ?object .
                    ?object a rdfs:Datatype .
                } UNION {
                    ?property a owl:ObjectProperty ;
                        rdfs:range ?object .
                    FILTER( ?object = <http://www.w3.org/2002/07/owl#real> ||
                            ?object = <http://www.w3.org/2002/07/owl#rational>
                    )
                } UNION {
                    ?property a owl:ObjectProperty ;
                        rdfs:range ?object .
                    FILTER( STRSTARTS( STR(?object),
                                       "http://www.w3.org/2001/XMLSchema#")
                    )
                }
            }
            '''
        query_select_objectproperty = '''
            SELECT ?property ?object
            %s
            ''' % query_where_objectproperty
        for row in self.graph.query(query_select_objectproperty):
            logging.info(f'correcting property: {row.property} rdfs:range {row.object}')
        query_update_objectproperty = '''
            DELETE {
                ?property a owl:ObjectProperty
            } INSERT {
                ?property a owl:DatatypeProperty
            } %s
            ''' % query_where_objectproperty
        self.graph.update(query_update_objectproperty)

    def outputGraph(self, output_file, output_format) -> None:
        self.graph.serialize(destination=output_file, format=output_format)


if __name__ == "__main__":
    main()

# owl:equivalentClass     [ a             rdfs:Datatype ;
#                           owl:oneOf       ( "entirelyAboveTerrain" "substantiallyAboveTerrain" "substantiallyAboveAndBelowTerrain" "substantiallyBelowTerrain" "entirelyBelowTerrain" ) ;
#                         ] ;

# core:RelativeToTerrain
#         a               rdfs:Datatype ;
#         rdfs:label      "RelativeToTerrain"@en ;
#         owl:oneOf       ( "entirelyAboveTerrain" "substantiallyAboveTerrain" "substantiallyAboveAndBelowTerrain" "substantiallyBelowTerrain" "entirelyBelowTerrain" ) ;
#         skos:prefLabel  "RelativeToTerrain"@en .


# core:Address  a          owl:Class ;
#         rdfs:label       "Address"@en ;
#         rdfs:subClassOf  [ a                  owl:Restriction ;
#                            owl:allValuesFrom  gmlowl:MultiPoint ;
#                            owl:onProperty     core:Address.multiPoint
#                          ] ;
#         rdfs:subClassOf  [ a                            owl:Restriction ;
#                            owl:maxQualifiedCardinality  "1"^^xsd:nonNegativeInteger ;
#                            owl:onClass                  gmlowl:MultiPoint ;
#                            owl:onProperty               core:Address.multiPoint
#                          ] ;
#         rdfs:subClassOf  [ a                  owl:Restriction ;
#                            owl:allValuesFrom  core:XALAddressDetails ;
#                            owl:onProperty     core:Address.xalAddress
#                          ] ;
#         rdfs:subClassOf  [ a                         owl:Restriction ;
#                            owl:onClass               core:XALAddressDetails ;
#                            owl:onProperty            core:Address.xalAddress ;
#                            owl:qualifiedCardinality  "1"^^xsd:nonNegativeInteger
#                          ] ;
#         skos:definition  "SIG3D: Proxy for the OASIS address schema"@en ;
#         skos:prefLabel   "Address"@en .