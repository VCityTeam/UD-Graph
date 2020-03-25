# GeoSPARQL
http://www.geosparql.org/, https://www.ogc.org/standards/geosparql, http://ontolog.cim3.net/file/work/EarthScienceOntolog/2012-12-12_EarthScienceOntolog_session-5/GeoSPARQL_Getting_Started--DaveKolas_20121212.pdf

## Related Articles
* **OGC GeoSPARQL - A Geographic Query Language for RDF Data** - Open Geospatial Consortium
* **GeoSPARQL: Enabling a Geospatial Semantic Web** - Robert Battle, Dave Kolas

## Limits and requirements
* Web api requires ontologies and rdf files to be hosted on the web
* Jena Apache requires Java

## Notes
GeoSPARQL is a SPARQL extension that enables spacial queries based on the GML and WKT standards for
representing topology and geometry. The extension implements the [GML 3.2 ontology](http://www.opengis.net/ont/gml)
in order to represent GML as literal values. 

Objects that have geometry in GeoSPARQL are sub classes of the `Feature` class. To serialize a GML
literal, `geo:asGML` and `geo:gmlLiteral` can be used. For example:

```
@prefix owl:  <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix geo:  <http://www.opengis.net/ont/geosparql#> .
@prefix gml:  <http://www.opengis.net/ont/gml#> .
@prefix ex:   <http://www.example.org/example#> .

ex:ExampleBuilding a owl:Class;
   rdfs:subClassOf geo:Feature;
   geo:hasGeometry ex:ExamplePoint;
ex:ExamplePoint a gml:Point;
   geo:asGML "<gml:Point xmlns:gml=\"http://www.opengis.net/ont/gml\">
                 <gml:pos>-83.38 33.95</gml:pos>
              </gml:Point>"^^geo:gmlLiteral .
```

The geometry in this example ontology could be declared using the following query**(!TODO TEST!)**:

```
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX ex: <http://www.example.org/POI#>

SELECT ?building ?geometry
WHERE {
   ?building a ex:ExampleBuilding ;
      geo:hasGeometry ?geometry .
}
```