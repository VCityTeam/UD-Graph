# Difference Graph to CityGML v3.0 Versioning
Data treatment scripts for transforming difference or change detection graphs from GraphML (JSON) to CityGML 3.0 Versioning Ontology individuals (in RDF formats)


## [DifferenceGraph2RDF.py](DifferenceGraph2RDF.py) documentation

The difference graph is created by the stage 4 output of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles/tree/master/PythonCallingDocker#manual-step-by-step-run-of-the-temporal-tiler) temporal data pipeline. These JSON graphs contain the geometric and geographical changes between objects of two or more CityGML 2.0 vintages of a city.

### To run
```
usage: DifferenceGraph2RDF.py [-h] [--existence_time_stamps EXISTENCE_TIME_STAMPS EXISTENCE_TIME_STAMPS] [--transaction_time_stamps TRANSACTION_TIME_STAMPS TRANSACTION_TIME_STAMPS] [--base-uri BASE_URI]
                              [--v1-uri V1_URI] [--v2-uri V2_URI] [--workspace-prefix WORKSPACE_PREFIX] [--v1-prefix V1_PREFIX] [--v2-prefix V2_PREFIX] [--core-uri CORE_URI] [--versioning-uri VERSIONING_URI]        
                              [--transaction-type-uri TRANSACTION_TYPE_URI] [-f FORMAT] [--strip-time-stamp] [-l LOG] [-d]
                              input_file version_prefix version_prefix

positional arguments:
  input_file            Specify the difference JSON file
  version_prefix        Specify the "globalid" prefix that corresponds to each version in the JSON file. Typically the globalid is formed as "[prefix]::[localid]"

options:
  -h, --help            show this help message and exit
  --existence_time_stamps EXISTENCE_TIME_STAMPS EXISTENCE_TIME_STAMPS
                        Specify the existence timestamps. If provided, bitemporal timestamps (confomant to CityGML 3.0) will be added to the generated versions and version transitions. Timestamps should be in the   
                        xsd:datetime format
  --transaction_time_stamps TRANSACTION_TIME_STAMPS TRANSACTION_TIME_STAMPS
                        Specify the transaction timestamps. If provided, bitemporal timestamps (confomant to CityGML 3.0) will be added to the generated versions and version transitions. Timestamps should be in     
                        the xsd:datetime format
  --base-uri BASE_URI   Specify the base URI for workspace output individuals. Also used to name output file
  --v1-uri V1_URI       Specify the base URI for source version output individuals. Also used to name output file
  --v2-uri V2_URI       Specify the base URI for target version output individuals. Also used to name output file
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
  --strip-time-stamp    strip the prefix from the difference file node ids
  -l LOG, --log LOG     Specify the logging file
  -d, --debug           enable debug level logging
```

For example:
```bash
python DifferenceGraph2RDF.py \
    --existence_time_stamps \
        2000-01-01T00:00:00 \
        2001-01-01T00:00:00 \
    differences_test.json \
    2000 2001
```
URIs can also be specified for referencing existing CityGML datasets and Workspaces.
```bash
python DifferenceGraph2RDF.py \
    --base-uri https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Datasets/GratteCiel_Workspace_2009_2018/3.0/Transition_2009_2012 \
    --v1-uri https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Datasets/GratteCiel_Workspace_2009_2018/3.0/GratteCiel_2009_split \
    --v1-prefix v2009 \
    --v2-uri https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Datasets/GratteCiel_Workspace_2009_2018/3.0/GratteCiel_2012_split \
    --v2-prefix v2012 \
    -d \
    -f ttl \
    --strip-time-stamp \
    --existence_time_stamps \
        2009-01-01T00:00:00 \
        2012-01-01T00:00:00 \
    './testGratteCiel/2009-2012-diff/DifferencesAsGraph.json' \
    2009 2012
```