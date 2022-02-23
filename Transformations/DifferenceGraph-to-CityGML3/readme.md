# Difference Graph to CityGML v3.0 Versioning

This script can take a difference or change detection graph as JSON and convert it into CityGML 3.0 Versioning Ontology individuals

The difference graph is created by the stage 4 output of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles/tree/master/PythonCallingDocker#manual-step-by-step-run-of-the-temporal-tiler) temporal data pipeline. These JSON graphs contain the geometric and geographical changes between objects of two or more CityGML 2.0 vintages of a city.

## To run
```
usage: DifferenceGraph2RDF.py [-h] [--output_dir OUTPUT_DIR] [--base-uri BASE_URI] [--prefix PREFIX] [--versioning-uri VERSIONING_URI] [-f {ttl,xml}] [-l LOG] [-d]
                              input_file time_stamp time_stamp

positional arguments:
  input_file            specify the input CityGML datafile
  time_stamp            specify the input timestamps

optional arguments:
  -h, --help            show this help message and exit
  --output_dir OUTPUT_DIR
                        specify the output directory
  --base-uri BASE_URI   specify the base URI for output individuals
  --prefix PREFIX       specify the base URI prefix for output individuals
  --versioning-uri VERSIONING_URI
                        specify the URI for the CityGML 3.0 versioning module
  -f {ttl,xml}, --format {ttl,xml}
                        specify the output RDF format
  -l LOG, --log LOG     specify the logging file
  -d, --debug           enable debug level logging
```