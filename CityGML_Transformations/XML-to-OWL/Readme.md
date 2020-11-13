## XML to OWL Conversion
This folder contains sample data used to test XML to owl conversions via python and XSLT. XSLT transformations are done using [Saxon-HE](http://saxon.sourceforge.net/) which is dependent on Java.

### Input Data
GML files used for testing are located in the _input-data_ folder. They consist of CityGML data from the metropole of Lyon. Generic and Appearance nodes have been removed from their XML trees. **Note that input files must use the exact same namespaces and namespace prefixes as the XML Schema they conform to.**

##### Generate_CityGMLToRDF.xsl
This stylesheet is used to create an XML to RDF XSL stylesheet from an XML Schema document. By default, the composite CityGML 2.0 schema from _../XMLSchema/compositeCityGML.xsd_ is taken as default to create the transformation stylesheet.

##### To run
The conversion pipeline for transforming CityGML 2.0 data files to RDF first uses the _Generate_CityGMLToRDF.xsl_ XSLT to create a CityGML to RDF stylesheet. Afterwards this generated stylesheet is used to transform an CityGML data file into RDF. This is all managed by the run.py script. Configuration variable can be found inside the script to select which composite schema and input data file are used in the process.

Requires Java 8+
Python script is dependent on _lxml_ library to parse XML.

To convert a CityGML 2.0 or GML 3.1 datafile:
```
python run.py
```

Output will be written to the Results folder