## XML to RDF Transformation
This folder contains scripts for transforming CityGML schema to RDF graphs and several resulting transformations of sample data. This process is specialized for GML based application schema. Any recognized GML geometry or coordinates will be converted into the GeoSPARQL _geo:gmlLiteral_ datatypes.

XSL transformations are done using [Saxon-HE](http://saxon.sourceforge.net/) which is dependent on Java

### Input Data
GML files used for testing are located in the _../input-data_ folder. They consist of cityGML data from the [Metropole of Lyon](https://data.grandlyon.com/accueil) and the [Open Geospatial Consortium Github CityGML 3.0 Encoding Github](https://github.com/opengeospatial/CityGML-3.0Encodings/tree/master/CityGML/Examples).

## To run the UML model based approach
A pythonic approach to transformation. This approach requires an ontology (located in the UD-Graph/Ontologies folder) to determine how to convert nodes into RDF triples. If gml leaf nodes are found they are also converted into GeoSPARQL's gmlLiteral datatype

Required libraries: _lxml, copy_

To convert all gml files in input-data folder:
```
CityGML2RDF.py
```
To convert a specific gml file:
```
CityGML2RDF.py [gml file to convert]
```

Output will be written to the Results folder