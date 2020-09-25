### Ontologies

1. CityGML 2.0_OWL (Geneve-Falquet)
   - Original CityGML Ontology created by Gilles Falquet
   - Copy of ontology with attempted modifications
2. workspace.owl
   - versioning/workspace ontology from UrbanCo2fab project
3. cityGMLBase.rdf
   - results from XSD2OWL transformations of CityGML/cityGMLBase.xsd
   - dependant on GML/gml.rdf
4. building.rdf
   - results from XSD2OWL transformations of CityGML/building.xsd
   - dependant on cityGMLBase.rdf
5. compositegml.rdf
   - an ontology created from the transformation of all gml schema at the same time 
6. GML
   - results from XSD2OWL transformations
     - gml.xsd
     - dynamicFeature.xsd
     - feature.xsd
     - basicTypes.xsd
     - measures.xsd
     - geometryAggregates.xsd
     - geometryComplexes.xsd
     - geometryBasic2d.xsd
     - geometryBasic0d1d.xsd
