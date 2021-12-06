# Difference Graph to CityGML v3.0 Versioning

This script can take a difference or change detection graph as JSON and convert it into CityGML 3.0 Versioning Ontology individuals

The difference graph is created by the stage 4 output of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles/tree/master/PythonCallingDocker#manual-step-by-step-run-of-the-temporal-tiler) temporal data pipeline. These JSON graphs contain the geometric and geographical changes between objects of two or more CityGML 2.0 vintages of a city.

## To run
```
usage: DifferenceGraph2RDF.py [-h] [--output_dir OUTPUT_DIR] [--uri URI] [--prefix PREFIX] [-f {ttl,xml}] [-l LOG] [-d] input_file time_stamps time_stamps

positional arguments:
  input_file            specify the input CityGML datafile
  time_stamps           specify the input timestamps

optional arguments:
  -h, --help            show this help message and exit
  --output_dir OUTPUT_DIR
                        specify the output directory
  --uri URI             specify the base URI for output individuals
  --prefix PREFIX       specify the base URI prefix for output individuals
  -f {ttl,xml}, --format {ttl,xml}
                        specify the output RDF format [xml, ttl]
  -l LOG, --log LOG     specify the logging file
  -d, --debug           enable debug level logging
```