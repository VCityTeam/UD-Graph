## XML to RDF Transformation
This approach requires an ontology to determine how to convert CityGML documents into RDF triples. Valid GML geometry is converted into GeoSPARQL's `gmlLiteral` values.

### Input Data
GML files used for testing are located in the `UD-Graph/Transformations/test-data/GML` folder. They consist of cityGML data from the [Metropole of Lyon](https://data.grandlyon.com/accueil), the [Open Geospatial Consortium Github CityGML 3.0 Encoding Github](https://github.com/opengeospatial/CityGML-3.0Encodings/tree/master/CityGML/Examples), and other sources.

Example ontologies generated using the `UD-Graph/Transformations/UML-to-OWL` (ShapeChange) and `UD-Graph/Transformations/XSD-to-OWL` transformation pipelines can be found in the folders:
* `UD-Graph/Ontologies`
* `UD-Graph/Transformations/test-data/OWL`

Note that a namespace mapping file required to map namespaces from the XML document to namespaces in the ontologies. Two example namespace files are available for CityGML 2.0 and 3.0:
* `citygml_2_namespace_mappings.json`
* `citygml_3_namespace_mappings.json`

Required Python libraries:
* [RDFLib](https://rdflib.readthedocs.io/)
* [lxml](https://lxml.de/)

Usage _(note that ontology input paths are separated by a ',' when declaring multiple ontologies)_:
```
python CityGML2RDF.py [input ontology paths] [input datafile] [output folder] [namespace mapping file]
```

Example 
```
python CityGML2RDF.py ../../test-data/OWL/CityGML_3.0_Conceptual_Model,../../test-data/OWL/TC_211,../../test-data/OWL/GeoSPARQL ../../test-data/GML/citygml3_versioning_patched.gml ./ ./citygml_3_namespace_mappings.json
```