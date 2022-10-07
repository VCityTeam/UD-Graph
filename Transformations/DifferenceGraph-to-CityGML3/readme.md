# Difference Graph to CityGML v3.0 Versioning
Data treatment scripts for:
- transforming difference or change detection graphs from GraphML (JSON) to CityGML 3.0 Versioning Ontology individuals (in RDF formats)
- adding timestamp values to CityGML datasets in RDF


## [DifferenceGraph2RDF.py](DifferenceGraph2RDF.py) documentation

The difference graph is created by the stage 4 output of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles/tree/master/PythonCallingDocker#manual-step-by-step-run-of-the-temporal-tiler) temporal data pipeline. These JSON graphs contain the geometric and geographical changes between objects of two or more CityGML 2.0 vintages of a city.

### To run
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

See [testDifference.sh](testDifference.sh) for example usages


## [AddTimeStamps.py](AddTimeStamps.py) documentation

Add timestamps to the features of a CityGML dataset

### To run
```
usage: AddTimeStamps.py [-h] [--input-format INPUT_FORMAT] [--output-format OUTPUT_FORMAT] [--core-uri CORE_URI] [--from-property FROM_PROPERTY] [--to-property TO_PROPERTY] [-l LOG] [-d]
                        input_file output_file time_stamps time_stamps

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
  -l LOG, --log LOG     specify the logging file
  -d, --debug           enable debug level logging
```

See [testTimestamp.sh](testTimestamp.sh) for example usages
