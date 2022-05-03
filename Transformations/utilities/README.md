# Utility scripts

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
