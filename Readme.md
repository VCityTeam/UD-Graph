# UD-Graph
Repository on graph models for Urban Data.

Analysis on the content stored in this repository is covered in detail in the internship [report](https://github.com/VCityTeam/UD-Graph/blob/master/Internship/Masters%20report.md).
This work is part of the larger [Virtual City Project](https://projet.liris.cnrs.fr/vcity/wiki/doku.php) of LIRIS

## CityGML Transformations
Contains two implementations:
1. XSD-to-OWL
   * Scripts for converting XML Schema into RDF/OWL ontologies
   * Stores GML 3.1 and CityGML Schema
2. XML-to-OWL
   * Scripts for converting XML files into RDF/OWL individuals defined by ontologies
   * Stores CityGML Lyon Metropole data from 2009, 2012, and 2015

## Ontologies
Contains the most up to date versions of several ontologies, including ontologies generated by XSLT transformations in the _CityGML_Transformations_ folder.

CityGML Ontology is edited using the [Protégé](https://protege.stanford.edu/) resource, which is supported by grant GM10331601 from the National Institute of General Medical Sciences of the United States National Institutes of Health.

## SPARQL Queries
Contains basic queries to be used on the RDF generated from XML to OWL scripts and their results.
_Coming soon: GeoSPARQL queries!_
