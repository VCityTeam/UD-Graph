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