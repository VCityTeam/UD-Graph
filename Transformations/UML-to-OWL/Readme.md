# Readme

This folder contains ShapeChange configuration files for effectuating UML to OWL transformations

Currently there are two configuration files:
1. CityGML 3.0 to OWL
2. CityGML 2.0 to OWL

## To run
Use the following command to run ShapeChange with the configuration files. Be sure to update the variables in '[]' brackets with their desired values.
```
java -jar ../lib/ShapeChange-2.10.0.jar -Dfile.encoding=UTF-8 -c [CONFIGURATION FILE] -x '$input$' '[UML FILE]' -x '$output$' '[OUTPUT FOLDER]'
```

Example:
```
java -jar ../lib/ShapeChange-2.10.0.jar -Dfile.encoding=UTF-8 -c CityGML3.0_config.xml \
  -x '$input$' '../Data-IO/UML/CityGML_3.0_Conceptual_Model.xml' \
  -x '$output$' '../Data-IO/OWL/CityGML_3.0_Conceptual_Model_Ontology'
```
