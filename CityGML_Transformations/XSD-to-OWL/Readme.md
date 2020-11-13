## XSL Transformation results
This folder contains sample data used to test the XSD2RDF.xsl stylesheet and its resulting transformation.

Testing is done using the [Saxon-HE](http://saxon.sourceforge.net/) XSLT processor

### XSD2RDF
XSD2RDF is an XSLT stylesheet to transform XML Schema files into OWL/RDF format. This stylesheet is based on the transformation patterns proposed by Ivan Bedini, Christopher Matheus, Peter F. Patel-Schneider, Aidan Boran, and Benjamin Nguyen in their article _Transforming XML Schema to OWL Using Patterns_. 

### To Run
Saxon HE is dependent on Java. Before running the following code, Java 8 or later must be installed. Input schema are located in the _../XMLSchema_ folder
Python scripts are dependent on the _lxml_ library to parse XML.

To transform all known schema to owl
```
./run.sh
```
To transform a specific schema to owl
```
python run.sh [xsd to convert]
```
Transformation outputs are written to the Results folder. Note that when transforming all known schema, files to be preprocessed are listed manually in run.py. To include/exclude a file from preprocessing, modify the preprocess_list variable. Only schema that rely on `include` statements should be included in this list.

### postXSLT
Takes a transformed OWL ontology and updates the ontology name to match proposed ontology naming conventions, which is 'http://liris.cnrs.fr/ontologies/' + filename. Also any empty subclass declarations and incorrectly generated comments are removed from the tree.

Usage:
```
python postXSLT.py [owl file to correct]
```
