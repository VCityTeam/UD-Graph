## XSD to OWL Transformations
This folder contains the XSD2RDF.xsl stylesheet for transforming XML Schema to OWL ontologies and the resulting transformations of the CityGML and its related Schema.

Testing is done using the [Saxon-HE](http://saxon.sourceforge.net/) XSLT processor

### XSD2RDF
XSD2RDF is an XSLT stylesheet to transform XML Schema files into OWL/RDF format. This stylesheet is based on the transformation patterns proposed by Ivan Bedini, Christopher Matheus, Peter F. Patel-Schneider , Aidan Boran, and Benjamin Nguyen in their article _Transforming XML Schema to OWL Using Patterns_.

### postXSLT
Takes a transformed RDF/OWL ontology and sets the ontology name to 'http://liris.cnrs.fr/ontologies/' + filename. Also any empty subclass declarations and erroneous comment declarations are removed from the tree.

## To install
Clone this repository and install saxon and cleanup directory
```bash
git clone https://github.com/VCityTeam/UD-Graph.git
cd UD-Graph/Transformations/XSD-to-OWL
wget https://sourceforge.net/projects/saxon/files/Saxon-HE/9.9/SaxonHE9-9-1-8J.zip/download
unzip SaxonHE9-9-1-8J.zip
mkdir ../../lib/
mv SaxonHE9-9-1-8J/saxon9he.jar ../../lib/saxon9he.jar
rm -rf SaxonHE9-9-1-8J*
```

## To Run
Saxon HE is dependent on Java. Before running the following code, Java 8 or later must be installed.

python scripts are dependent on the _lxml_ and _copy_ libraries.

To transform a specific schema or 'composite' schema to owl
```
python run.py [path to XML Schema] [output folder]
```
Transformation outputs are written to the _Results_ folder.