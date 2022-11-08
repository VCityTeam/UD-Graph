# Readme

This folder contains ShapeChange configuration files for effectuating UML to OWL transformations

ShapeChange documentation and installation instructions can be found [here](https://shapechange.net/get-started/)

Currently there are two configuration files:
1. CityGML 3.0 to OWL
2. CityGML 2.0 to OWL

And two test graphs for ontology patching/modification using the _../utilites/add_triples.py_ script
1. citygml2_core_links.ttl
2. citygml2_app_links.ttl

## To run
ShapeChange 2.10 requires at least Java 11 or later.

Use the following command to run ShapeChange with the configuration files. Be sure to update the variables in '[]' brackets with their desired values.
```
java -jar [path to ShapeChange jar] -Dfile.encoding=UTF-8 -c [CONFIGURATION FILE] -x '$input$' '[UML FILE]' -x '$output$' '[OUTPUT FOLDER]'
```

Example:
```
java -jar [path to ShapeChange jar] -Dfile.encoding=UTF-8 -c CityGML3.0_config.xml \
  -x '$input$' '../test-data/UML/CityGML_3.0_Conceptual_Model.xml' \
  -x '$output$' '../test-data/OWL/CityGML_3.0_Conceptual_Model_Ontology'
```
