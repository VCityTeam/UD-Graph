## Gratte Ciel 2009-2018 Workspace

These RDF datasets were produced using the following methodology:

![UD-Graph+Workspace Methodology](./methodology.png)

Supplementary methodology activity notes:
- This approach was implemented twice, once using CityGML 2.0 and again with CityGML 3.0.
- PSM to PM transformation was executed using the ShapeChange and the ShapeChange configuration files located [here](../../Transformations/ShapeChange/) to transform CityGML and the Workspace ADE to OWL/RDF
- The produced OWL ontologies are located [here](../../Ontologies/) including proposed alignements between CityGML and GeoSPARQL and ISO 19136 (GML)
- The [XML2RDF](../../Transformations/XML-to-RDF/) Transformation tool was used to instantiate the network of ontologies with the proposed ontology network and [versions of the Gratte Ciel neighborhood in CityGML](https://partage.liris.cnrs.fr/index.php/s/jArrjsJxzsC5YAg).
  - VersionTransitions were calculated using [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles) and the [DifferenceGraph2RDF](../../Transformations/DifferenceGraph-to-CityGML3/) script.
  - Bitemporal timestamps were added to the city features, and Versions using the [AddTimeStamps.py](../../Transformations/utilities/AddTimeStamps.py) utility script.
  - The Workspace was instantiated manually
- Data was validated for consistency using the SWRL rules test suite proposed [here](../../rules/) with [these rules](../../rules/rules.json)

This approach is currently being dockerized in [UD-Reproducibility](https://github.com/VCityTeam/UD-Reproducibility) as a transformation pipeline using the [UD-Graph-docker](https://github.com/VCityTeam/UD-Graph-docker) container