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
