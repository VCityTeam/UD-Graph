# Difference Graph to CityGML v3.0 Versioning
Data treatment scripts for transforming difference or change detection graphs from GraphML (JSON) to CityGML 3.0 Versioning Ontology individuals (in RDF formats)


## [DifferenceGraph2RDF.py](DifferenceGraph2RDF.py) documentation

The difference graph is created by the stage 4 output of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles/tree/master/PythonCallingDocker#manual-step-by-step-run-of-the-temporal-tiler) temporal data pipeline. These JSON graphs contain the geometric and geographical changes between objects of two or more CityGML 2.0 vintages of a city.

### To run
```
usage: DifferenceGraph2RDF.py [-h] [--existence_time_stamps EXISTENCE_TIME_STAMPS EXISTENCE_TIME_STAMPS] [--transaction_time_stamps TRANSACTION_TIME_STAMPS TRANSACTION_TIME_STAMPS] [--base-uri BASE_URI]     
                              [--v1-uri V1_URI] [--v2-uri V2_URI] [--workspace-prefix WORKSPACE_PREFIX] [--v1-prefix V1_PREFIX] [--v2-prefix V2_PREFIX] [--core-uri CORE_URI] [--versioning-uri VERSIONING_URI]
                              [--transaction-type-uri TRANSACTION_TYPE_URI] [-f FORMAT] [--strip-time-stamp] [-l LOG] [-d]
                              input_file version_prefix version_prefix output_file

positional arguments:
  input_file            Specify the input CityGML datafile
  version_prefix        Specify the prefixes for each version
  output_file           Specify the output filename

optional arguments:
  -h, --help            show this help message and exit
  --existence_time_stamps EXISTENCE_TIME_STAMPS EXISTENCE_TIME_STAMPS
                        Specify the existence timestamps. Timestamps should be in the xsd:datatime format
  --transaction_time_stamps TRANSACTION_TIME_STAMPS TRANSACTION_TIME_STAMPS
                        Specify the transaction timestamps. Timestamps should be in the xsd:datatime format
  --base-uri BASE_URI   Specify the base URI for workspace output individuals
  --v1-uri V1_URI       Specify the base URI for source version output individuals
  --v2-uri V2_URI       Specify the base URI for target version output individuals
  --workspace-prefix WORKSPACE_PREFIX
                        Specify the base URI prefix for workspace output individuals
  --v1-prefix V1_PREFIX
                        Specify the base URI prefix for source version output individuals
  --v2-prefix V2_PREFIX
                        Specify the base URI prefix for target version output individuals
  --core-uri CORE_URI   Specify the URI for the CityGML 3.0 core module
  --versioning-uri VERSIONING_URI
                        Specify the URI for the CityGML 3.0 versioning module
  --transaction-type-uri TRANSACTION_TYPE_URI
                        Specify the URI for the transaction type code-list
  -f FORMAT, --format FORMAT
                        Specify the output RDFlib format
  --strip-time-stamp    strip the time stamp from version individuals
  -l LOG, --log LOG     Specify the logging file
  -d, --debug           enable debug level logging
```

See [testDifference.sh](testDifference.sh) for example usages
