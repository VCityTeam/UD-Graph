# Utility scripts

## addTimeStamps
Add timestamp values to CityGML RDF graphs. Useful when CityGML versions and features do not have temporal data. Can optionally add timestamps in the of OWL-Time temporal entities

### To run
```
usage: addTimeStamps.py [-h] [--input-format INPUT_FORMAT] [--output-format OUTPUT_FORMAT] [--core-uri CORE_URI] [--from-property FROM_PROPERTY] [--to-property TO_PROPERTY]
                        [--t-entity-property T_ENTITY_PROPERTY] [-l LOG] [--ignore-owl-time] [-d]
                        input_file output_file time_stamps time_stamps

Add timestamp values to CityGML RDF graphs. Useful when CityGML versions and features do not have temporal data. Can optionally add timestamps as OWL-Time temporal entities

positional arguments:
  input_file            specify the input CityGML RDF graph
  output_file           specify the output filename
  time_stamps           specify the "from" and "to" timestamps

optional arguments:
  -h, --help            show this help message and exit
  --input-format INPUT_FORMAT
                        specify the input CityGML RDFlib format.
  --output-format OUTPUT_FORMAT
                        specify the output CityGML RDFlib format.
  --core-uri CORE_URI   specify the URI for the CityGML core module
  --from-property FROM_PROPERTY
                        specify the "from" timestamp property URI (without namespace) e.g. validFrom or creationDate
  --to-property TO_PROPERTY
                        specify the "to" timestamp property URI (without namespace) e.g. validTo or terminationDate
  --t-entity-property T_ENTITY_PROPERTY
                        specify the URI for the property relating a CityGML feature to its OWL-Time temporal entity. If unspecified, the #hasTime property from OWL-Time is used. If the --ignore-owl-time flag is enabled, this field will be ignored.
  -l LOG, --log LOG     specify the logging file
  --ignore-owl-time     skip the creation of OWL-Time TemporalEntities
  -d, --debug           enable debug level logging
```

For example:
```bash
python addTimeStamps.py \
    --t-entity-property 'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/Time/time-extension#' \
    ../test-data/RDF/historicalSuccession_CityGML_3.0_v1.ttl \
    ./historicalSuccession_v1.ttl \
    2000-01-01T00:00:00 2000-01-01T00:00:00 \
    -d
```
Default URI values correspond to the CityGML 3.0 ontologies proposed [here](https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/), for the CityGML 2.0 ontologies proposed [here](https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/2.0/) the following may be used:
```bash
python addTimeStamps.py \
    --core-uri 'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/CityGML/2.0/core#' \
    --feature-member-property 'CityModel.cityObjectMember' \
    --from-property 'AbstractCityObject.creationDate' \
    --to-property 'AbstractCityObject.terminationDate' \
    --t-entity-property 'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/Time/time-extension#hasExistenceTime' \
    ../../Datasets/GratteCiel_Workspace_2009_2018/2.0/GratteCiel_2012_split.ttl \
    ./GratteCiel_2012_split.ttl \
    2012-01-01T00:00:00 2012-01-01T00:00:00 \
    -d
```

## add_crs.py
Add a coordinate reference system to a gml file.

To run
```
python add_crs.py [input datafile] [CRS] [output datafile]
```

## add_triples.py
Add triples from secondary graph to primary graph.

To run
```
python add_triples.py [primary graph] [secondary graph]
```

## reformat_graph.py
usage: reformat_graph.py [-h] input_file {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix} output_file {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}

Convert RDF graph formats

positional arguments:
  input_file            Specify the input datafile, folder, or URL
  {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}
                        Specify the input data format (only RDFLib supported formats)
  output_file           Specify the output datafile
  {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}
                        Specify the output data format (only RDFLib supported formats)

options:
  -h, --help            show this help message and exit

## citygml_3.0_validator.jar
Made using [CityGML4j](https://github.com/citygml4j/citygml4j) library and sample code.

To run with logging
```
java -jar citygml_validator.jar [file to validate] > output.log
```
## getBoundingBox.py
Get the bounding box of building geometry in a CityGML 3.0 file

To run
```
python getBoundingBox.py [CityGML document]
```

## replace_FME_thematic_surface_geometry.py
Replace CityGML buiding thematic surface geometry from a GML file. The intended usage of this script is as follows:
1. Use the [Force2D FME template](../test-data/GML/citygml2gml_Force2D.fmw) with FME on a CityGML file to produce a GML file 
2. Run the script providing the original CityGML file as the "base datafile" and the generated GML file as the "replacement file":
```
python replace_FME_thematic_surface_geometry.py [base CityGML datafile] [replacement GML datafile] [output file]
```

## show_ns.py
Add prefixes to local predetermined XML element tags with no prefix and rdf identifiers.

Tags supported:
* gml:srsDimensions
* gml:srsName
* gml:uom
* rdf:ID
* rdf:about
* rdf:resource

To run
```
python show_ns.py [input file]
```
User will be prompted to provide unknown namespace prefixes

### compileXMLSchema,py
This is a utility script used to combine xml schema into a single file. The script also enforces all names to use their respective namespace prefixes and normalizes these prefixes according to predetermined naming conventions. To modify these naming conventions, the variable `target_namespaces` must be set to a dictionary containing the desired namespace prefixes. _The CityGML 3.0 namespaces are used by default._

There are two ways to implement this script.

The first method is by specifying an input folder, containing the desired XML Schema to compose. This script will recursively search through the folder and all subfolders for the file extension '.xsd'.
```
python compileXMLSchema.py [path to XML Schema]
```
Optionally, a "manifest.txt" file can be used to list specific schema files to be used by the script. In the manifest file, each desired schema can be listed line by line or a specific folder can be listed by appending a '\*' to the folder path. In addition, lines can be commented using the '#' character. See the _manifest.txt_ file for examples.

To use this functionality, simply run the script without any arguments
```
python compileXMLSchema.py
```


Outputs are written to the file _"compositeSchemaOutput.xsd"_.

### rdf-xmlify.py
A simple script for converting Turtle RDF files to the XML/RDF format

```
usage: rdf-xmlify.py [-h] [files ...]

A simple script for converting Turtle RDF files to the XML/RDF format

positional arguments:
  files       A space separated list of files, directories, or URLs to convert. Files found in specified directories will be converted, however subdirectories will be ignored.

options:
  -h, --help  show this help message and exit
```

For example, to transform all of the Turtle RDF files in this directory:
```bash
python rdf-xmlify.py .
```