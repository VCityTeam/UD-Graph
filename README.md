# UD-Graph
Repository on graph models for Urban Data. Analysis on the content stored in this repository can be found on the Vcity wiki:
* Understanding limitations of [XML to RDF conversion](https://github.com/VCityTeam/VCity/wiki/UD-Graph_XML-to-RDF)
  * [GML to RDF Analysis](https://github.com/VCityTeam/VCity/wiki/UD-Graph_GML-to-RDF_Analysis)
* Understanding limitations of [XML Schema to OWL conversion](https://github.com/VCityTeam/VCity/wiki/UD-Graph_XSD-to-OWL)
  * [CityGML 2.0 ontology](https://github.com/VCityTeam/VCity/wiki/UD-Graph_CityGML-2.0-OWL)
  * [GeoSPARQL's GML ontology](https://github.com/VCityTeam/VCity/wiki/UD-Graph_GeoSPARQL-Analysis)

## CityGML 2.0 Ontology
CityGML 2.0 is an open, GML 3.1.1 based, OCG standard for representing city geometry, topology, and appearance. As CityGML is an XML based format, it's hierarchy can be represented ontologically by RDF and OWL schemas. This project creates a CityGML ontology based on the work already created by the Université de Genève. See notes for further details.

The ontology also imports the GeoSPARQL ontology which provides a vocabulary for querying Features with associated GML geometry or topology. 

CityGML 2.0 Ontology is edited using the [Protégé](https://protege.stanford.edu/) resource, which is supported by grant GM10331601 from the National Institute of General Medical Sciences of the United States National Institutes of Health.
