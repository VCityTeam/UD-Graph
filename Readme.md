# UD-Graph
Repository for transforming and manipulating urban data models and data with knowledge graphs.

This work is part of the larger [Virtual City Project](https://projet.liris.cnrs.fr/vcity/) of LIRIS, Université de Lyon, France

## Related Articles
- [Leveraging Standards in Model-Centric Geospatial Knowledge Graph Creation](https://hal.archives-ouvertes.fr/hal-03693607) - Diego Vinasco-Alvarez
- [Towards Limiting Semantic Data Loss In 4D Urban Data Semantic Graph Generation](https://hal.archives-ouvertes.fr/hal-03375084v1) - Diego Vinasco-Alvarez, John Samuel, Sylvie Servigne, Gilles Gesquière, 3D GeoInfo 2021
- [Towards a semantic web representation from a 3D geospatial urban data model](https://hal.archives-ouvertes.fr/hal-03240567v1) - Diego Vinasco-Alvarez, John Samuel, Sylvie Servigne, Gilles Gesquière, SAGEO 2021
- [From CityGML to OWL](https://hal.archives-ouvertes.fr/hal-02948955) (Technical report on HAL)
- [Geospatial urban data and the semantic web: From representation to proof of concept](https://github.com/VCityTeam/UD-Graph/blob/master/Internship/Masters%20report.md) (Internship report in markdown)

## Directories
### Transformations
The [Transformations](./Transformations) directory contains the following implementations:
1. ShapeChange (UML-to-OWL)
   * ShapeChange configuration files for CityGML 2.0 and 3.0 UML models to RDF/OWL ontologies
2. XML-to-OWL
   * Scripts for converting XML files into RDF/OWL individuals based in Python
   * Scripts for converting XML files into RDF/OWL individuals based in XSLT
3. XSD-to-OWL
   * Scripts for converting XML Schema into RDF/OWL ontologies
4. test-data
   * Stores for test GML, RDF, OWL, ShapeFile, UML, and XML Schema data
See [here](./Transformations/Readme.md) for more information.

### Datasets
Contains datasets generated using model driven transformations and scripts in the [Transformations](./Transformations) directory.
See [here](./Datasets/Readme.md) for more information.

### Ontologies
Contains the most up to date versions of several proposed ontologies, notably several ontologies based on the CityGML model.
See [here](./Ontologies/Readme.md) for more information.

These ontologies are created using model driven transformations and scripts in the [Transformations](./Transformations) directory. Minor ontology editing is done using the [Protégé](https://protege.stanford.edu/) resource, which is supported by grant GM10331601 from the National Institute of General Medical Sciences of the United States National Institutes of Health.

### SPARQL Queries
Contains basic queries to be used on the RDF generated from XML to OWL scripts and their results.
See [here](./SPARQL_Queries/Readme.md) for more information.

### Rules
The Rules directory contains a proof of concept test suite for executing SWRL rules over Semantic Web knowledge graphs. Through reasoning, these rules can be used either to intuite new information about data or when data is inconsistent.
See [here](./rules/Readme.md) for more information.