# SWRL Rule Test Suite
A proof of concept test suite for reasoning over RDF/OWL knowledge graphs with SWRL rules

## Transformation UML Activity Diagram
![Validate Transformed Models and Data Using Rules UML Diagram](./Rules%20Testing%20Activity.svg)

## Helpful documentation
- [SWRL](https://www.w3.org/Submission/SWRL/)
- [OWLReady2 Rules](https://owlready2.readthedocs.io/en/latest/rule.html)

## Dependencies
- [Python 3](https://www.python.org/downloads/)
- Python Libraries:
  - [owlready2](https://pypi.org/project/Owlready2/)
  - [rdflib](https://pypi.org/project/rdflib/)

## How to run
First clone this repository and move into the created directory
```bash
git clone git://github.com/VCityTeam/UD-Graph
cd UD-Graph
```

### To Run
Usage:
```
usage: swrl_rules.py [-h] rule_file test_file

positional arguments:
  rule_file   Declare the rule JSON file.
  test_file   Declare the test JSON file.

options:
  -h, --help  show this help message and exit
```
To execute the basic tests defined in this directory use the following command:
```
python swrl_rules.py rules.json tests.json
```

### Rule and Test configuration
First two JSON files must be declared to configure:
1. What rules will be used to inference new information? Which OWL ontologies (the data model or Tbox of a knowledge graph) define the classes and properties used to define these rules?
2. What data instances or individuals in the knowledge graph should be tested in a given test? What should each test return (true or false) ? Where should newly inferenced data be output?

The 1st JSON file for defining rules should be structured as follows:
```
{
    "ontologies": [], # a list of ontology location strings in the forms "file://..." or "http://..." containing the classes and properties used in the subsequent rules
    "prefixes": {               # prefixes used in the defined rules
        "string": "string",     # where the prefix and uri could be for example: "owl": "http://www.w3.org/2002/07/owl#"
    },
    "rules": [  # a list of objects for configuring rules formed as:
        {
            "ignore": "boolean",        # if set to true this rule will be ignored during testing
            "rule": "atom1(?a), atom2(?b) -> atom3(?a, ?b)"     # a SWRL rule; prefixes declared in the "prefixes" object will be replaced with their uri values
        },
    ]
}
```
For example: [./rules.json](./rules.json)

The 2nd JSON file for defining tests should be structured as follows:
```
[       # a list of objects for configuring tests where each test is an object formed as:
    {
        "ignore": "boolean",            # if set to true this test will be ignored during testing
        "ontologies": [], # a list of ontology location strings in the forms "file://..." or "http://..." containing the individuals to be reasoned upon in this test
        "output": {
            "namespace": "string",          # individuals starting with this  uri will be exported after a test; this should be the same uri as the individuals to be reasoned upon
            "filename": "string",           # the name of the output file to be exported to
            "expected-result": "boolean"    # the expected result of the test, true meaning passed and false meaning failed (or that an inconsitency was inferred)
        }
    },
]
```
For example: [./tests.json](./tests.json)

### Data Preparation
OWLReady2 (v0.39) can only import RDF data in RDF/XML, OWL/XML or NTriples format. To convert Turtle RDF files to XML/RDF we recommend the convenient [rdf-xmlify.py](../Transformations/utilities/rdf-xmlify.py) script.