# UD-Graph Transformations
This folder contains various transformations pipeline which can be effectuated by UD-Graph.

## Test data
Test transformation data is stored in the [test-data](./test-data/) directory. Note that this data is experimental and may not be compliant with current standards.

## Transformations
For more information on each proposed transformation tool or transformation tool configuration can be found in each transformation sub-directory:
1. [ShapeChange (UML-to-OWL)](./ShapeChange/): Contains example ShapeChange configurations for converting UML Models based on the CityGML standard to OWL ontologies. In addition, a small script is provided for ensuring that the provided ontologies are compliant to the OWL-DL OWL sublanguage (to enable reasoning over these ontologies)
2. [XSD-to-OWL](./XSD-to-OWL/): Contains an XSLT-based transformation tool for converting XML Schema to OWL ontologies
3. [XML-to-RDF](./XML-to-RDF/): Contains two transformation tools
   1. [XML2RDF.py](./XML-to-RDF/XML2RDF.py) for executing syntactic transformations between XML files and OWL/RDF graphs using OWL ontologies and namespace mappings
   2. A similar [XSLT-based transformation script](./XML-to-RDF/XSLT-based-transformations/) for creating a XML to RDF XSLT stylesheet with an XML Schema for XML data conform to that schema.
4. [DifferenceGraph-to-CityGML3](./DifferenceGraph-to-CityGML3/): Contains a transformation script to convert a `DifferencesAsGraph.json` file (produced by the Change Detection stage of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles) transformation pipeline) to conform to a Version Transition conformant to the CityGML 3.0 Version Module in OWL/RDF.

These pipelines use utility scripts located in the [utility](./utilities/) directory.

## Transformation Workflows
These workflows can be executed using the dockerized version of [UD-Graph](https://github.com/VCityTeam/UD-Graph-docker)

### ShapeChange -> XML2RDF (with validation)
![ShapeChange and XML2RDF transformation workflow](./UD-Graph%20UML%20Pipeline_Component%20Diagram.svg)

### XSD2OWL + Generate_XToRDF -> XToRDF (Illustrated with CityGML XML Schemas)
![XML/XSD transformation workflow](./UD-Graph%20XSD%20Pipeline.svg)

#### Convert CityGML Instances to RDF Activity
![XML to OWL transformation activity](./XML%20to%20RDF%20Pipeline.svg)