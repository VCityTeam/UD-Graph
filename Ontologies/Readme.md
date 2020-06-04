### Ontologies

1. CityGML 2.0_OWL.rdf
  - Original CityGML Ontology created by Gilles Falquet
2. CityGML 2.0_OWL_modified.rdf
  - Ontology created by Falquet with attempted modifications
3. workspace.owl
  - versioning/workspace ontology from UrbanCo2fab project
4. cityGMLBase.rdf
  - results from XSD2OWL transformations of CityGML/cityGMLBase.xsd
5. building.rdf
  - results from XSD2OWL transformations of CityGML/building.xsd
  - dependant on cityGMLBase.rdf
6. gml.rdf
  - results from XSD2OWL transformations of GML/gml.xsd
  - dependant on dynamicFeature.rdf
7. dynamicFeature.rdf
  - results from XSD2OWL transformations of GML/dynamicFeature.xsd
  - dependant on gml.rdf
8. feature.rdf
  - results from XSD2OWL transformations of GML/feature.xsd
  - dependant on gml.rdf