# UD-Graph Transformations
This folder contains various transformation tools that can be used in conjunction with each other and other components of the UD-Graph to create data transformation pipelines.

These transformations are a product of the following works:
> [1] D. Vinasco-Alvarez, “Leveraging Standards in Model-Centric Geospatial Knowledge Graph Creation,” in ESWC 2022 Ph.D. Symposium, Hersonissos, Greece, May 2022. [Online]. Available: https://hal.archives-ouvertes.fr/hal-03693607

> [2] D. Vinasco-Alvarez, J. S. Samuel, S. Servigne, and G. Gesquière, “Towards Limiting Semantic Data Loss In 4D Urban Data Semantic Graph Generation,” ISPRS Annals of the Photogrammetry, Remote Sensing and Spatial Information Sciences, vol. VIII-4/W2-2021, pp. 37–44, Oct. 2021, doi: 10.5194/isprs-annals-VIII-4-W2-2021-37-2021.

> [3] D. Vinasco-Alvarez, J. S. Samuel, S. Servigne, and G. Gesquière, “Towards a semantic web representation from a 3D geospatial urban data model,” in SAGEO 2021, 16ème Conférence Internationale de la Géomatique, de l’Analyse Spatiale et des Sciences de l’Information Géographique., La Rochelle [Online Event], France, May 2021, pp. 227–238. [Online]. Available: https://hal.archives-ouvertes.fr/hal-03240567

> [4] D. Vinasco-Alvarez, J. S. Samuel, S. Servigne, and G. Gesquière, “From CityGML to OWL,” LIRIS UMR 5205, Technical Report, Sep. 2020. [Online]. Available: https://hal.archives-ouvertes.fr/hal-02948955

- [UD-Graph Transformations](#ud-graph-transformations)
  - [Transformations](#transformations)
    - [Utility Scripts](#utility-scripts)
  - [Transformation Workflows](#transformation-workflows)
    - [ShapeChange -\> XML2RDF (with validation)](#shapechange---xml2rdf-with-validation)
    - [XSD2OWL + Generate\_XToRDF -\> XToRDF (Illustrated with CityGML XML Schemas)](#xsd2owl--generate_xtordf---xtordf-illustrated-with-citygml-xml-schemas)
      - [Convert CityGML Instances to RDF Activity](#convert-citygml-instances-to-rdf-activity)

## Transformations
For more information on each proposed transformation tool or transformation tool configuration can be found in each transformation sub-directory:
1. [ShapeChange (UML-to-OWL)](./ShapeChange/): Contains example ShapeChange configurations for converting UML Models based on the CityGML standard to OWL ontologies. In addition, a small script is provided for ensuring that the provided ontologies are compliant to the OWL-DL OWL sublanguage (to enable reasoning over these ontologies). These configurations are a product of the work [2]
2. [XSD-to-OWL](./XSD-to-OWL/): Contains an XSLT-based transformation tool for converting XML Schema to OWL ontologies. This transformation is a product of the works [3, 4]
1. [XML-to-RDF](./XML-to-RDF/): Contains two transformation tools
   1. [XML2RDF.py](./XML-to-RDF/XML2RDF.py) for executing syntactic transformations between XML files and OWL/RDF graphs using OWL ontologies and namespace mappings. This transformation is also a product of [2].
   2. A similar [XSLT-based transformation script](./XML-to-RDF/XSLT-based-transformations/) for creating a XML to RDF XSLT stylesheet with an XML Schema for XML data conform to that schema. This transformation is also a product of the works [3, 4].

### Utility Scripts
1. These pipelines use utility scripts located in the [utility](./utilities/) directory.
2. [DifferenceGraph-to-CityGML3](./DifferenceGraph-to-CityGML3/): Contains a script to convert a `DifferencesAsGraph.json` file (produced by the Change Detection stage of the [cityGMLto3DTiles](https://github.com/VCityTeam/cityGMLto3DTiles) transformation pipeline) to conform to a Version Transition conformant to the CityGML 3.0 Version Module in OWL/RDF.

## Transformation Workflows
Reproducible examples of these workflows are *in development* on [UD-Reproducibility](https://github.com/VCityTeam/UD-Reproducibility) 

These workflows are illustrated below using the CityGML standard with Workspace and Document ADEs using their models, schemas, and data stored in the [test-data](./test-data/) directory. Note that the produced data is experimental and may not be fully compliant with the CityGML standard.

### ShapeChange -> XML2RDF (with validation)
![ShapeChange and XML2RDF transformation workflow](./UD-Graph%20UML%20Pipeline_Component%20Diagram.svg)

This proposed workflow is composed of 3 activities:
- Transform a UML model to OWL/RDF
- Transform XML data (conformant to the UML model) to OWL/RDF
- Combine the results into an Ontology (TBox+ABox)

### XSD2OWL + Generate_XToRDF -> XToRDF (Illustrated with CityGML XML Schemas)
![XML/XSD transformation workflow](./UD-Graph%20XSD%20Pipeline.svg)

#### Convert CityGML Instances to RDF Activity
![XML to OWL transformation activity](./XML%20to%20RDF%20Pipeline.svg)