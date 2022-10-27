# XML to RDF transformer
Model driven transformation tools for creating RDF/OWL knowledge graphs from XML files. There are currently 3 tools:
- A [python based tool](#XML-to-RDF-Transformation) for creating RDF/OWL graphs from XML data and a network of OWL 2 DL ontologies
- An [XSLT based tool](#XSLT-based-transformations) for creating RDF/OWL graphs and ontologies from XML data, and an XSD schema, following the work of [[Metral et al. 2010]](https://orbi.uliege.be/handle/2268/26716)

Both of these tools support GML instances.


## XML to RDF Transformation
This approach requires an ontology to determine how to convert CityGML documents into RDF triples. Valid GML geometry is converted into GeoSPARQL's `gmlLiteral` values.

### Input Data
GML files used for testing are located in the `UD-Graph/Transformations/test-data/GML` folder. They consist of cityGML data from the [Metropole of Lyon](https://data.grandlyon.com/accueil), the [Open Geospatial Consortium Github CityGML 3.0 Encoding Github](https://github.com/opengeospatial/CityGML-3.0Encodings/tree/master/CityGML/Examples), and other sources.

Example ontologies are generated using the `UD-Graph/Transformations/ShapeChange` and `UD-Graph/Transformations/XSD-to-OWL` transformation pipelines. Example data created with these pipelines can be found in the following folders:
* `UD-Graph/Ontologies`
* `UD-Graph/Transformations/test-data/OWL`

Note that a namespace mapping file required to map namespaces from the XML document to namespaces in the ontologies and XML tags to RDF URIs. Two example namespace files are available for CityGML 2.0 and 3.0. Note that the RDF mapping URIs are written with LXML syntax:
* `citygml_2_mappings.json`
* `citygml_3_mappings.json`

Required Python libraries:
* [RDFLib](https://rdflib.readthedocs.io/)
* [lxml](https://lxml.de/)

Usage information  
```bash
usage: XML2RDF.py [-h] [--output OUTPUT] [--format {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}] [--log LOG]
                  [--atomic-geometry] [--deep-geometry] [-v]
                  input_file input_model mapping_file

Transform Geospatial XML data to RDF formats

positional arguments:
  input_file            Specify the input XML datafile
  input_model           Specify the ontology input path; for multiple ontologies, input paths are separated by a ","
  mapping_file          Specify the namespace mapping file

optional arguments:
  -h, --help            show this help message and exit
  --output OUTPUT       Specify the output directory
  --format {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}
                        Specify the output data format (only RDFLib supported formats)
  --log LOG             Specify the logging file
  --atomic-geometry     Iterate into GML geometry to create individuals for each atomic GML element
  --deep-geometry       Iterate into GML geometry xlinks to and copy the destination GML into the geosparql:asGML property object
  -v, --verbose         Enable verbose console logging
```

## XSLT-based-transformations
This is a similar approach based on XSLT to transform XML to RDF according to a given XML Schema file (as .xsd)

