# Readme

This folder contains ShapeChange configuration files for effectuating UML to OWL transformations

ShapeChange documentation and installation instructions can be found [here](https://shapechange.net/get-started/)

Currently there are two configuration files:
1. CityGML 3.0 to OWL
2. CityGML 2.0 to OWL

A tool for patching ontologies created using ShapeChange and these configurations is provided: `ontologyPatcher.py`
Currently 3 types of patches are targeted:
1. Class restrictions that use the property owl:onClass with the object of an rdfs:Datatype are converted to owl:onDataRange.
2. Datatype definitions created from enumerations that use owl:oneOf are redefined to use a Protégé friendly owl:equvalentClass axiom 
containing the owl:oneOf property.
3. ObjectProperty definitions which contain an rdfs:Datatype within their range are redefined as DatatypeProperties.

## To run shapechange
ShapeChange 2.10 requires at least Java 11 or later.

Use the following command to run ShapeChange with the configuration files. Be sure to update the variables in '[]' brackets with their desired values.
```bash
java -jar [path to ShapeChange jar] -Dfile.encoding=UTF-8 -c [CONFIGURATION FILE] -x '$input$' '[UML FILE]' -x '$output$' '[OUTPUT FOLDER]'
```

Example:
```bash
java -jar [path to ShapeChange jar] -Dfile.encoding=UTF-8 -c CityGML3.0_config.xml \
  -x '$input$' '../test-data/UML/CityGML_3.0_Conceptual_Model.xml' \
  -x '$output$' '../test-data/OWL/CityGML_3.0_Conceptual_Model_Ontology'
```

## To run the ontology patcher
```
usage: ontologyPatcher.py [-h] [--input_format INPUT_FORMAT] [--output_format OUTPUT_FORMAT] [--log LOG] input_file output_file

positional arguments:
  input_file            Specify the input file
  output_file           Specify the output file

optional arguments:
  -h, --help            show this help message and exit
  --input_format INPUT_FORMAT
                        Specify the RDFLib compliant input file format
  --output_format OUTPUT_FORMAT
                        Specify the RDFLib compliant output file format
  --log LOG, -l LOG     Specify the logging file
```