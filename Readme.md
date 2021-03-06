# UD-Graph
Repository on graph models for Urban Data.

This work is part of the larger [Virtual City Project](https://projet.liris.cnrs.fr/vcity/) of LIRIS, Université de Lyon, France

## Related Articles
- [From CityGML to OWL](https://hal.archives-ouvertes.fr/hal-02948955) (Technical report on HAL)
- [Geospatial urban data and the semantic web: From representation to proof of concept](https://github.com/VCityTeam/UD-Graph/blob/master/Internship/Masters%20report.md) (Internship report in markdown)
- [Towards a semantic web representation from a 3D geospatial urban data model](https://apps.univ-lr.fr/actes/ged/colloques/docWeb/2105041945.0/SAGEO2021_Actes_de_la_conference_vff.pdf) - Diego Vinasco-Alvarez, John Samuel, Sylvie Servigne, Gilles Gesquière, SAGEO 2021

## Transformations
Contains the following implementations:
1. ShapeChange (UML-to-OWL)
   * ShapeChange configuration files for CityGML 2.0 and 3.0 UML models to RDF/OWL ontologies
2. XML-to-OWL
   * Scripts for converting XML files into RDF/OWL individuals based in Python
   * Scripts for converting XML files into RDF/OWL individuals based in XSLT
3. XSD-to-OWL
   * Scripts for converting XML Schema into RDF/OWL ontologies
4. test-data
   * Stores for test GML, RDF, OWL, ShapeFile, and XML Schema data

## Ontologies
Contains the most up to date versions of several ontologies, including ontologies in the [Transformations/test-data/OWL](./Transformations/test-data/OWL) folder.

CityGML Ontology is edited using the [Protégé](https://protege.stanford.edu/) resource, which is supported by grant GM10331601 from the National Institute of General Medical Sciences of the United States National Institutes of Health.

## SPARQL Queries
Contains basic queries to be used on the RDF generated from XML to OWL scripts and their results.

