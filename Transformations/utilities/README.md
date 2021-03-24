# Utility scripts

## add_crs.py
Add a coordinate reference system to a gml file.

### To use
```
python add_crs.py [input datafile] [CRS] [output datafile]
```

## add_triples.py
Add triples from secondary graph to primary graph.

### To use
```
python add_triples.py [primary graph] [secondary graph]
```

## citygml_3.0_validator.jar
Made using [CityGML4j](https://github.com/citygml4j/citygml4j) library and sample code.

### To use
General usage with logging
```
java -jar citygml_validator.jar [file to validate] > output.log
```
## getBoundingBox.py
Get the bounding box of building geometry in a CityGML 3.0 file

### To use
General usage
```
python getBoundingBox.py [CityGML document]
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

### To use
```
python [input file]
```
User will be asked to provide unknown namespace prefixes
