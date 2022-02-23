# UD-Graph
Repository on graph models for Urban Data.

This work is part of the larger [Virtual City Project](https://projet.liris.cnrs.fr/vcity/) of LIRIS, Université de Lyon, France

## Related Articles
- [Towards Limiting Semantic Data Loss In 4D Urban Data Semantic Graph Generation](https://hal.archives-ouvertes.fr/hal-03375084v1) - Diego Vinasco-Alvarez, John Samuel, Sylvie Servigne, Gilles Gesquière, 3D GeoInfo 2021
- [Towards a semantic web representation from a 3D geospatial urban data model](https://hal.archives-ouvertes.fr/hal-03240567v1) - Diego Vinasco-Alvarez, John Samuel, Sylvie Servigne, Gilles Gesquière, SAGEO 2021
- [From CityGML to OWL](https://hal.archives-ouvertes.fr/hal-02948955) (Technical report on HAL)
- [Geospatial urban data and the semantic web: From representation to proof of concept](https://github.com/VCityTeam/UD-Graph/blob/master/Internship/Masters%20report.md) (Internship report in markdown)

## Transformations
The `./Transformations` folder contains the following implementations:
1. ShapeChange (UML-to-OWL)
   * ShapeChange configuration files for CityGML 2.0 and 3.0 UML models to RDF/OWL ontologies
2. XML-to-OWL
   * Scripts for converting XML files into RDF/OWL individuals based in Python
   * Scripts for converting XML files into RDF/OWL individuals based in XSLT
3. XSD-to-OWL
   * Scripts for converting XML Schema into RDF/OWL ontologies
4. test-data
   * Stores for test GML, RDF, OWL, ShapeFile, UML, and XML Schema data

## Ontologies
Contains the most up to date versions of several ontologies, including ontologies in the [Transformations/test-data/OWL](./Transformations/test-data/OWL) folder.

CityGML Ontology is edited using the [Protégé](https://protege.stanford.edu/) resource, which is supported by grant GM10331601 from the National Institute of General Medical Sciences of the United States National Institutes of Health.

## SPARQL Queries
Contains basic queries to be used on the RDF generated from XML to OWL scripts and their results.

