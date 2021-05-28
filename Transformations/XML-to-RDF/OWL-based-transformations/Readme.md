## XML to RDF Transformation
This approach requires an ontology to determine how to convert CityGML documents into RDF triples. Example ontologies can be found in the UD-Graph/Ontologies and UD-Graph/Transformations/test-data/OWL folders. Valid GML geometry is converted into GeoSPARQL's `gmlLiteral` values.

### Input Data
GML files used for testing are located in the _../../test-data/GML_ folder. They consist of cityGML data from the [Metropole of Lyon](https://data.grandlyon.com/accueil), the [Open Geospatial Consortium Github CityGML 3.0 Encoding Github](https://github.com/opengeospatial/CityGML-3.0Encodings/tree/master/CityGML/Examples), and other sources.

Required libraries: _RDFLib, lxml, copy_

Usage (note that ontology input paths are separated by a ','):
```
python CityGML2RDF.py [input ontology paths] [input datafile] [output folder] [namespace mappings]
```

Example 
```
python ./CityGML2RDF.py ../../test-data/OWL/CityGML_3.0_Conceptual_Model,../../test-data/OWL/compositeCityGML3.0.rdf,../../test-data/OWL/TC_211,../../test-data/OWL/GeoSPARQL ../../test-data/GML/citygml3_versioning_patched.gml . ./citygml_3_namespace_mappings.json
```