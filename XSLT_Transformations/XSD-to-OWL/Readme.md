### To Run

Before running the following code, saxon must be installed
```
saxon -s:[xsd to transform] -xsl:XSD2OWL.xsl > output.rdf
python qualify-ns.py [xsd to transform] output.rdf
```
