<?xml version="1.0"?>
<rdf:RDF xmlns="http://www.semanticweb.org/diego/ontologies/CityGML#"
     xml:base="http://www.semanticweb.org/diego/ontologies/CityGML"
     xmlns:owl="http://www.w3.org/2002/07/owl#"
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:www="http://www.w3.org/2001/"
     xmlns:xml="http://www.w3.org/XML/1998/namespace"
     xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
     xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
     xmlns:gml="http://www.opengis.net/gml"
     xmlns:core="http://www.opengis.net/citygml/2.0"
     xmlns:app=""
     xmlns:bldg=""
     xmlns:gen="">
    <owl:Ontology rdf:about="http://www.semanticweb.org/diego/ontologies/CityGML">
        <rdfs:comment>This is a mock ontology. The structure of this data is subject to change.</rdfs:comment>
    </owl:Ontology>

    <owl:NamedIndividual rdf:about="http://www.semanticweb.org/diego/ontologies/CityGML#TestModel">
        <rdf:type rdf:resource="http://www.opengis.net/citygml/2.0#CityModel"/>
        <rdfs:comment>Exported by Rhinocity</rdfs:comment>
        <rdfs:label>LYON_1ER_2015</rdfs:label>
        <gml:hasfeatureMember rdf:resource="http://www.opengis.net/citygml/2.0#ojm1"/>
    </owl:NamedIndividual>

    <owl:NamedIndividual rdf:about="http://www.opengis.net/citygml/2.0#ojm1">
        <rdf:type rdf:resource="http://www.opengis.net/gml#featureMembers"/>
        <gml:has_Feature rdf:resource="http://www.semanticweb.org/diego/ontologies/CityGML#building_1">
    </owl:NamedIndividual>

    <owl:NamedIndividual rdf:about="http://www.semanticweb.org/diego/ontologies/CityGML#building_1">
    </owl:NamedIndividual>



</rdf:RDF>