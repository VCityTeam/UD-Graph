## XML to OWL Conversion
This folder contains sample data used to test XML to owl conversions via python and XSLT.

### Input Data
GML files used for testing are located in the _input-data_ folder. They consist of cityGML data from the metropole of Lyon. Generic and Appearance nodes have been removed from their XML trees.

### XSLT

XSL transformations are done using [Saxon-HE](http://saxon.sourceforge.net/) which is dependent on Java

##### CityGML2RDF.xsl
CityGML2RDF is an XSLT stylesheet to transform CityGML 2.0 files into RDF/XML format. This stylesheet is based on the GML2RDF.xsl stylesheet (which is included in this folder) proposed by Linda van den Brink, Paul Janssen, and Wilko Quak in their article "From Geo-data to Linked Data: Automated Transformation from GML to RDF".

##### GML2RDF.xsl
The original XSLT stylesheet propsed by Linda Van den Brink

### CityGML2RDF.py
A pythonic approach to transformation. This approach requires an ontology (located in the UD-Graph/Ontologies folder) to determine how to convert nodes into RDF triples. If gml leaf nodes are found they are also converted into GeoSPARQL's gmlLiteral datatype

Required libraries: _lxml, copy_

To convert all gml files in input-data folder:
```
GML2RDF.py
```
To convert a specific gml file:
```
GML2RDF.py [gml file to convert]
```

Output will be written to the Results folder