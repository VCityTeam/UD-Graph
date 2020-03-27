# UD-Graph
Repository on graph models for Urban Data

## CityGML 2.0 Ontology
CityGML 2.0 is an open, GML 3.1.1 based, OCG standard for representing city geometry, topology, and appearance. As CityGML is an XML based format, it's hierarchy can be represented ontologically by RDF and OWL schemas. This project creates a CityGML ontology based on the work already created by the Université de Genève. See notes for further details.

The ontology also imports GeoSPARQL's GML 3.2 ontology. These classes are declared as equivalent to GML 3.1.1 classes.

CityGML 2.0 Ontology is edited using the [Protégé](https://protege.stanford.edu/) resource, which is supported by grant GM10331601 from the National Institute of General Medical Sciences of the United States National Institutes of Health.

## CityGML2RDF
CityGML2RDF is an XSLT stylesheet to transform CityGML 2.0 files into RDF/XML format. This stylesheet is based on the GML > RDF stylesheet proposed by Linda van den Brink, Paul Janssen, and Wilko Quak in their article _"From Geo-data to Linked Data: Automated Transformation from GML to RDF"_. 