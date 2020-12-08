## XML to RDF Transformation
This folder contains scripts for transforming CityGML schema to RDF graphs and several resulting transformations of sample data. This process is specialized for GML based application schema. Any recognized GML geometry or coordinates will be converted into the GeoSPARQL _geo:gmlLiteral_ datatypes.

XSL transformations are done using [Saxon-HE](http://saxon.sourceforge.net/) which is dependent on Java

### Input Data
GML files used for testing are located in the _../input-data_ folder. They consist of cityGML data from the [Metropole of Lyon](https://data.grandlyon.com/accueil) and the [Open Geospatial Consortium Github CityGML 3.0 Encoding Github](https://github.com/opengeospatial/CityGML-3.0Encodings/tree/master/CityGML/Examples).

##### Generate_xToRDF.xsl
This stylesheet is used to create an XML to RDF XSL stylesheet from an XML Schema document. Two stylesheets exist, each with the required namespaces for CityGML 3.0 and 2.0.


## To run
To run the conversion pipeline an XML Schema and a XML file constrained by the schema is required. First the pipeline will transform the XML schema into a XML-to-RDF XSLT stylesheet, then the XML datafile will be transformed into RDF using this new stylesheet. The input files, output filenames, and coordinate referenes systems (for _geo:gmlLiteral_ transformations) can be set by modifying the following variables in _run.py_:
```     
  CRS                  = 'http://www.opengis.net/def/crs/EPSG/0/4326'
  schema_file          = '../XMLSchema/compositeCityGML2.0.xsd'
  generator_file       = 'Generate_CityGML2ToRDF.xsl'
  transformation_file  = 'CityGML2ToRDF.xsl'
  input_file           = 'LYON_1ER_BATI_2015-1_bldg.gml'
  output_file          = 'LYON_1ER_BATI_2015-1_bldg.rdf'
```

In addition the variable `convert3Dto2D` can be set to false to disable GeoSPARQL transformations

Afterwards the script can be run using:
```
python run.py
```

Output will be written to the Results folder
