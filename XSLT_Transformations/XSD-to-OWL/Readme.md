## XSL Transformation results
This folder contains sample data used to test the XSD2OWL.xsl stylesheet and its resulting transformation.

Testing is done using [Saxon-HE](http://saxon.sourceforge.net/)

### XSD2OWL
XSD2OWL is an XSLT stylesheet to transform XML Schema files into OWL/RDF format. This stylesheet is based on the transformation patterns proposed by Ivan Bedini, Christopher Matheus, Peter F. Patel-Schneider , Aidan Boran, and Benjamin Nguyen in their article _Transforming XML Schema to OWL Using Patterns_.

### To Run
Before running the following code, saxon must be installed

Transform xsd to owl
```
saxon -s:[xsd to transform] -xsl:XSD2OWL.xsl > [output file]
```
Clean namespaces
```
python qualify-ns.py [xsd to transform] [output file]
```
