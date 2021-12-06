# Difference Graph to CityGML v3.0 Versioning

This script can take a difference or change detection graph as JSON and convert it into CityGML 3.0 Versioning Ontology individuals

The difference graph is created by the stage 4 output of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles/tree/master/PythonCallingDocker#manual-step-by-step-run-of-the-temporal-tiler) temporal data pipeline. These JSON graphs contain the geometric and geographical changes between objects of two or more CityGML 2.0 vintages of a city.