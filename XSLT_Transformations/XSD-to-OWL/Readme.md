## XSL Transformation results
This folder contains sample data used to test the XSD2OWL.xsl stylesheet and its resulting transformation.

Testing is done using [Saxon-HE](http://saxon.sourceforge.net/)

### XSD2OWL
XSD2OWL is an XSLT stylesheet to transform XML Schema files into OWL/RDF format. This stylesheet is based on the transformation patterns proposed by Ivan Bedini, Christopher Matheus, Peter F. Patel-Schneider , Aidan Boran, and Benjamin Nguyen in their article _Transforming XML Schema to OWL Using Patterns_.

### preXSLT
This is an optional process in the current pipeline. If given an xml schema with `include` statements, a composite xsd will be created with included schema. The output will have the original filename appended to 'composite' and the file will be written to the Schema folder.

Usage:
```
preXSLT.py [path to xsd]
```

### postXSLT
Takes a transformed schema and fully qualifies all namespaces mentioned in `rdf:type`, `rdf:about`, `rdf:resource`, and `rdf:datatype` attributes. Import statements and the ontology name are formated to match ontology naming conventions, which is 'http://liris.cnrs.fr/ontologies/' + filename. Finally any empty subclass declarations are removed from the tree.

Usage:
```
postXSLT.py [original xsd file]
```

### To Run
Saxon HE is dependent on Java. Before running the following code, Java 8 or later must be installed.

python scripts are dependent on the _lxml_ and _copy_

To transform all known schema to owl
```
./run.sh
```
To transform a specific schema to owl
```
./run.sh [path to XSL] [output filename].rdf
```
Transformation outputs are written to the Results folder 