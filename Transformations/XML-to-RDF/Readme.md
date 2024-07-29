# XML to RDF transformer
Model driven transformation tools for creating RDF/OWL knowledge graphs from XML files. There are currently 3 tools:
- A [python based tool](#XML-to-RDF-Transformation) for creating RDF/OWL graphs from XML data and a network of OWL 2 DL ontologies
- An [XSLT based tool](#XSLT-based-transformations) for creating RDF/OWL graphs and ontologies from XML data, and an XSD schema, following the work of [[Metral et al. 2010]](https://orbi.uliege.be/handle/2268/26716) and [[Bedini et al. 2011]](https://ieeexplore.ieee.org/document/6061418)

Both of these tools support GML instances.

## XML to RDF Transformation
This approach requires an ontology to determine how to convert CityGML documents into RDF triples. Valid GML geometry is converted into GeoSPARQL's `gmlLiteral` values.

This transformation tool is a product of the following works:
> [1] D. Vinasco-Alvarez, “Leveraging Standards in Model-Centric Geospatial Knowledge Graph Creation,” in ESWC 2022 Ph.D. Symposium, Hersonissos, Greece, May 2022. [Online]. Available: https://hal.archives-ouvertes.fr/hal-03693607

> [2] D. Vinasco-Alvarez, J. S. Samuel, S. Servigne, and G. Gesquière, “Towards Limiting Semantic Data Loss In 4D Urban Data Semantic Graph Generation,” ISPRS Annals of the Photogrammetry, Remote Sensing and Spatial Information Sciences, vol. VIII-4/W2-2021, pp. 37–44, Oct. 2021, doi: 10.5194/isprs-annals-VIII-4-W2-2021-37-2021.

### Input Data
GML files used for testing are located in the `UD-Graph/Transformations/test-data/GML` folder. They consist of cityGML data from the [Metropole of Lyon](https://data.grandlyon.com/accueil), the [Open Geospatial Consortium GitHub CityGML 3.0 Encoding GitHub](https://github.com/opengeospatial/CityGML-3.0Encodings/tree/master/CityGML/Examples), and other sources.

Example ontologies are generated using the `UD-Graph/Transformations/ShapeChange` and `UD-Graph/Transformations/XSD-to-OWL` transformation pipelines. Example data created with these pipelines can be found in the following folders:
* `UD-Graph/Ontologies`
* `UD-Graph/Transformations/test-data/OWL`

#### Namespace/RDF Mappings
Note that a namespace mapping file required to map namespaces from the XML document to namespaces in the ontologies and XML tags to RDF URIs. Two example namespace files are available for CityGML 2.0 and 3.0. Note that the RDF mapping URIs are written with LXML syntax:
* `citygml_2_mappings.json`
* `citygml_2_xslt_mappings.json`
* `citygml_3_mappings.json`

`namespace-mappings` are used by XML2RDF.py to determine what an XML element or attribute corresponds to as an instance (or individual) of a Class, ObjectProperty, DatatypeProperty, AnnotationProperty, or Datatype in an OWL ontology (or ontology network in the case of multiple, aligned ontologies) 
The `namespace-mappings` dictionary should be declared as follows:
- Keys should be defragmented XML namespaces (meaning no trailing `/` or `#` character in the URI/URL) corresponding to namespaces in the input XML document. 
  - For example, a namespace declaration `xmlns="http://www.opengis.net/citygml/2.0/"` should be written as `"http://www.opengis.net/citygml/2.0"`
- Values should be corresponding URIs in the input_model (ontology or ontology network) and can have a trailing `/` or `#` character

`rdf-mappings` can be used to manually declare a mapping between an XML element or attribute and a URI in the ontology (or ontology network)
`rdf-mappings` must be declared as follows:
- Keys must be LXML friendly strings.
  - For example, an XML element `<gml:description>` with a namespace declaration `xmlns:gml="http://www.opengis.net/gml"` should be declared as `{http://www.opengis.net/gml}description` with the namespace between `{}` brackets.
  - For example, an XML attribute `<gml:id="someID">` with a namespace declaration `xmlns:gml="http://www.opengis.net/gml"` should be declared as `{http://www.opengis.net/gml}id` with the namespace between `{}` brackets.
- Similar to the `namespace-mappings` dictionary, values in the `namespace-mappings` dictionary can have complete fragments
  - For example `"http://www.w3.org/2004/02/skos/core#note"` is valid (here the URI fragment is `#note`)

Required Python libraries:
* [RDFLib](https://rdflib.readthedocs.io/)
* [lxml](https://lxml.de/)

Usage information  
```
usage: XML2RDF.py [-h] [--output OUTPUT] [--format {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}] [--log LOG]
                  [--atomic-geometry] [--deep-geometry] [-v]
                  input_file input_model mapping_file

Transform Geospatial XML data to RDF formats

positional arguments:
  input_file            Specify the input XML datafile
  input_model           Specify the ontology input path; for multiple ontologies, input paths are separated by a ","
  mapping_file          Specify the namespace mapping file

optional arguments:
  -h, --help            show this help message and exit
  --output OUTPUT       Specify the output directory
  --format {turtle,ttl,turtle2,xml,pretty-xml,json-ld,ntriples,nt,nt11,n3,trig,trix}
                        Specify the output data format (only RDFLib supported formats)
  --log LOG             Specify the logging file
  --atomic-geometry     Iterate into GML geometry to create individuals for each atomic GML element
  --deep-geometry       Iterate into GML geometry xlinks to and copy the destination GML into the geosparql:asGML property object
  -v, --verbose         Enable verbose console logging
```

Namespace Mapping files should have the following structure:
```json
{
    "namespace-mappings" : {
        "string" : "string"
    },
    "rdf-mappings" : {
        "string":  "string"
    }
}
```

For example, for transforming CityGML 2.0 XML data using the proposed CityGML 2.0 ontology in the [Ontology directory](../../Ontologies/):
```bash
python ./XML2RDF.py \
  -v \
  --format ttl \
  ../test-data/GML/Lyon_1er_arrondisement/LYON_1ER_BATI_2015-1_bldg-patched.gml \
  ./citygml_2_mappings.json \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/2.0/appearance \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/2.0/bridge \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/2.0/building \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/2.0/core \
  https://www.w3.org/2009/08/skos-reference/skos.rdf \
  http://www.opengis.net/ont/geosparql# \
  http://www.opengis.net/ont/gml# \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/Alignments/CityGML2-GeoSPARQL \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/Alignments/CityGML2-ISO19136 \
  https://def.isotc211.org/ontologies/iso19136/2007/Feature.rdf \
  https://def.isotc211.org/ontologies/iso19107/2003/CoordinateGeometry.rdf
```
Or for CityGML 3.0:
```bash
python XML2RDF.py \
  -v \
  --format ttl \
  ../test-data/GML/Building_CityGML3.0_LOD2_with_several_attributes.gml \
  ./citygml_3_mappings.json \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/building \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/construction \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/core \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/CityGML/3.0/generics \
  https://www.w3.org/2009/08/skos-reference/skos.rdf \
  http://www.opengis.net/ont/geosparql# \
  http://www.opengis.net/ont/gml# \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/Alignments/CityGML3-GeoSPARQL \
  https://dataset-dl.liris.cnrs.fr/rdf-owl-urban-data-ontologies/Ontologies/Alignments/CityGML3-ISO19136 \
  https://def.isotc211.org/ontologies/iso19136/2007/Feature.rdf \
  https://def.isotc211.org/ontologies/iso19107/2003/CoordinateGeometry.rdf
```
## XSLT-based-transformations
This is a similar approach based on XSLT to transform XML to RDF according to a given XML Schema file (as .xsd). See the [readme](./XSLT-based-transformations/Readme.md) for more information.

The transformation stylesheet provided are a product of the following works:
> [3] D. Vinasco-Alvarez, J. S. Samuel, S. Servigne, and G. Gesquière, “Towards a semantic web representation from a 3D geospatial urban data model,” in SAGEO 2021, 16ème Conférence Internationale de la Géomatique, de l’Analyse Spatiale et des Sciences de l’Information Géographique., La Rochelle [Online Event], France, May 2021, pp. 227–238. [Online]. Available: https://hal.archives-ouvertes.fr/hal-03240567

> [4] D. Vinasco-Alvarez, J. S. Samuel, S. Servigne, and G. Gesquière, “From CityGML to OWL,” LIRIS UMR 5205, Technical Report, Sep. 2020. [Online]. Available: https://hal.archives-ouvertes.fr/hal-02948955
