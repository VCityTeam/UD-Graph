# XSLT Conversion
XSLT transformations appear to be the most straightforward way to convert GML/CityGML into RDF or OWL. This is naturally because all of these formats are encoded in XML. This document will analyze the structure of Brink, et al's proposed stylesheet, which can be found [here](https://www.pldn.nl/wiki/Boek/BrinkEtAl-GML2RDF#XSLT_stylesheet_GML_.3E_RDF), for converting GML into RDF, and later how it functions when converting CityGML to RDF.


## Related Articles
* Brink, Linda van den, et al. « **Linking Spatial Data: Automated Conversion of Geo-Information Models and GML Data to RDF** ». International Journal of Spatial Data Infrastructures Research, vol. 9, nᵒ 0, octobre 2014, p. 59‑85. ijsdir.sadl.kuleuven.be, doi:10.2902/.
* Linda van den Brink, **Geospatial Data on the Web**, PhD Thesis, October 2018
* Van den Brink, L., et al. « **From Geo-Data to Linked Data: Automated Transformation from GML to RDF** ». Linked Open Data - Pilot Linked Open Data Nederland. Deel 2 - De Verdieping, Geonovum, 2013, Pp. 249-261, 2013. repository.tudelft.nl, https://repository.tudelft.nl/islandora/object/uuid%3A8ec77e83-8406-47d3-8705-32633619ba1f.

## Limits and requirements
* An XSLT transformer
  * we will be testing with Saxon which requires Java

## Notes
Initial transformations of GML into RDF retain the GML structure well but leave out some potentially important information. Initial testing was done with the following sample code based on GML 3.1.1:

```
<Example xmlns="www.example.com"
         xmlns:gml="http://www.opengis.net/gml"
         xmlns:xlink="http://www.w3.org/1999/xlink">
   <SomeGeometry gml:id="someGeometry_1">
      <gml:name>Sample GML</gml:name>
      <gml:boundedBy>
         <gml:Envelope srsDimension="3" srsName="sample_SRSName">
            <gml:lowerCorner>458868.0 5438343.0 112.0</gml:lowerCorner>
            <gml:upperCorner>458892.0 5438362.0 117.0</gml:upperCorner>
         </gml:Envelope>
      </gml:boundedBy>
      <gml:Solid gml:id="solid_1">
         <gml:exterior>
            <gml:CompositeSurface gml:id="compositeSurface_1">
               <gml:surfaceMember xlink:href="#polygon_1"/>
            </gml:CompositeSurface>
         </gml:exterior>
      </gml:Solid>
      <gml:MultiSurface gml:id="multiSurface_1" srsDimension="3">
         <gml:surfaceMember>
            <gml:Polygon gml:id="polygon_1">
               <gml:exterior>
                  <gml:LinearRing gml:id="linearRing_1">
                     <gml:posList>458874.6 5438355.312347524 115.0 458874.6 5438349.687652476 115.0 458885.4 5438349.687652476 115.0 458885.4 5438355.312347524 115.0 458874.6 5438355.312347524 115.0</gml:posList>
                  </gml:LinearRing>
               </gml:exterior>
            </gml:Polygon>
         </gml:surfaceMember>
      </gml:MultiSurface>
   </SomeGeometry>
</Example>
```

Which results in the following output:

```
<rdf:RDF xmlns:imro="http://www.geonovum.nl/imro/2008/1"
         xmlns:xlink="http://www.w3.org/1999/xlink"
         xmlns:gml="http://www.opengis.net/gml"
         xmlns:math="http://www.w3.org/2005/xpath-functions/math"
         xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:dc="http://purl.org/dc/elements/1.1/"
         xmlns:owl="http://www.w3.org/2002/07/owl#"
         xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
   <rdf:Description rdf:about="d1e1" rdf:type="http://someuri#Example">
      <SomeGeometry rdf:resource="#d1e3"/>
      <SomeGeometry rdf:resource="#d1e4"/>
      <SomeGeometry rdf:resource="#solid_1"/>
      <SomeGeometry rdf:resource="#multiSurface_1"/>
   </rdf:Description>
   <rdf:Description rdf:about="d1e3" rdf:type="http://someuri#name">Sample GML</rdf:Description>
   <rdf:Description rdf:about="d1e4" rdf:type="http://someuri#boundedBy">
      <gml:Envelope rdf:resource="#d1e6"/>
      <gml:Envelope rdf:resource="#d1e7"/>
   </rdf:Description>
   <rdf:Description rdf:about="d1e6" rdf:type="http://someuri#lowerCorner">458868.0 5438343.0 112.0</rdf:Description>
   <rdf:Description rdf:about="d1e7" rdf:type="http://someuri#upperCorner">458892.0 5438362.0 117.0</rdf:Description>
   <rdf:Description rdf:about="solid_1" rdf:type="http://someuri#Solid">
      <gml:exterior rdf:resource="#compositeSurface_1"/>
   </rdf:Description>
   <rdf:Description rdf:about="compositeSurface_1"
                    rdf:type="http://someuri#CompositeSurface">
      <gml:surfaceMember rdf:resource="#polygon_1"/>
   </rdf:Description>
   <rdf:Description rdf:about="multiSurface_1" rdf:type="http://someuri#MultiSurface">
      <gml:surfaceMember rdf:resource="#polygon_1"/>
   </rdf:Description>
   <rdf:Description rdf:about="polygon_1" rdf:type="http://someuri#Polygon">
      <gml:exterior rdf:resource="#linearRing_1"/>
   </rdf:Description>
   <rdf:Description rdf:about="linearRing_1" rdf:type="http://someuri#LinearRing">
      <gml:posList>458874.6 5438355.312347524 115.0 458874.6 5438349.687652476 115.0 458885.4 5438349.687652476 115.0 458885.4 5438355.312347524 115.0 458874.6 5438355.312347524 115.0</gml:posList>
   </rdf:Description>
</rdf:RDF>
```

The resulting RDF is a hierarchy of `rdf:Description`s and `rdf:resource`s representing the GML classes and their children. Each element is given an `rdf:about` to identify itself. These are based off of it's corresponding `gml:id` and if no such ID exists, a generic ID is generated. Note that only the `gml:id`s of even depth elements are recorded. For example `#solid_1` is saved after the transformation, while `#someGeometry_1` is not. In addition, every `rdfDescription` generated has an `rdf-type` _(this may a typo from the existing RDF attribute `rdf:type`)_ attribute that corresponds to its GML tag or class instance. The transformation of this attribute is always prefixed with "http://someuri". Besides `gml:id`, `gml:srsName` is the only other attribute to be translated. The attribute `srsDimension` is lost during transformation, for example in the `gml:Envelope` element in the sample data. Additionally, it is worth noting that the transformation of `xlink`s are preserved as `rdf:resource`s.

Before making SPARQL queries on the data the assignment of `rdf-type` was changed to `rdf:type`

The following query lists all `rdf:type`
```
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT *
WHERE {
    ?subject rdf:type ?object .
}
```
And returns:

| subject            | object                            |
|--------------------|-----------------------------------|
| d1e7               | <http://someuri#upperCorner>      |
| d1e1               | <http://someuri#Example>          |
| d1e4               | <http://someuri#boundedBy>        |
| linearRing_1       | <http://someuri#LinearRing>       |
| solid_1            | <http://someuri#Solid>            |
| d1e6               | <http://someuri#lowerCorner>      |
| multiSurface_1     | <http://someuri#MultiSurface>     |
| compositeSurface_1 | <http://someuri#CompositeSurface> |
| polygon_1          | <http://someuri#Polygon>          |
| d1e3               | <http://someuri#name>             |


This approach works well for representing GML but how can it be adapted for CityGML?

In order to make this XSLT comply dynamically with CityGML, the following changes are proposed:
* Modify the assignment of `rdf-type` to `rdf:type`
* Add CityGML xml namespaces
* Modify rdf:type transformations to respect namespaces
* Add missing GML attributes such as `srsDimensions`
* Add support for CityGML attributes such as `name`
