# ReDeFer's XML2RDF
http://rhizomik.net/redefer/#XML2RDF

## Limits and requirements
* Only a web service.
* Only accepts web-hosted XML files.
* The source code is currently not public on GitHub.

## Notes

There appears to be no information loss although much information is formatted differently as in CityGML. For example, hierarchical GML data such as the geometry of buildings is stored with the attribute `rdf:parseType=“Resource”` and retains its structure and depth. XML attributes are appropriately nested underneath the corresponding node as new elements. The exception to this behavior is id attributes which are translated to `rdf:about=“[namespace][id]”` attributes attached to an `<rdf:Description>` element. See the example below, converted from http://www.citygmlwiki.org/index.php?title=File:FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml

BEFORE:
```
<bldg:boundedBy>
  <bldg:WallSurface gml:id="GML_5856d7ad-5e34-498a-817b-9544bfbb1475">
    <gml:name>Outer Wall 1 (West)</gml:name>
    <bldg:lod2MultiSurface>
      <gml:MultiSurface>
        <gml:surfaceMember>
          <gml:Polygon gml:id="PolyID7350_878_759628_120742">
            <gml:exterior>
              <gml:LinearRing gml:id="PolyID7350_878_759628_120742_0">
                <gml:pos>457842 5439088 118.317691453624 </gml:pos>
                <gml:pos>457842 5439093 115.430940107676 </gml:pos>
                <gml:pos>457842 5439093 111.8 </gml:pos>
                <gml:pos>457842 5439083 111.8 </gml:pos>
                <gml:pos>457842 5439083 115.430940107676 </gml:pos>
                <gml:pos>457842 5439088 118.317691453624 </gml:pos>
              </gml:LinearRing>
            </gml:exterior>
          </gml:Polygon>
        </gml:surfaceMember>
      </gml:MultiSurface>
    </bldg:lod2MultiSurface>
  </bldg:WallSurface>
</bldg:boundedBy>
```
AFTER:
```
<j.5:boundedBy rdf:parseType="Resource">
  <j.5:WallSurface>
    <rdf:Description rdf:about="http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_5856d7ad-5e34-498a-817b-9544bfbb1475">
      <j.5:lod2MultiSurface rdf:parseType="Resource">
        <j.3:MultiSurface rdf:parseType="Resource">
          <j.3:surfaceMember rdf:parseType="Resource">
            <j.3:Polygon>
              <rdf:Description rdf:about="http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#PolyID7350_878_759628_120742">
                <j.3:exterior rdf:parseType="Resource">
                  <j.3:LinearRing>
                    <rdf:Description rdf:about="http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#PolyID7350_878_759628_120742_0">
                      <j.3:pos>457842 5439083 115.430940107676 </j.3:pos>
                      <j.3:pos>457842 5439083 111.8 </j.3:pos>
                      <j.3:pos>457842 5439093 111.8 </j.3:pos>
                      <j.3:pos>457842 5439093 115.430940107676 </j.3:pos>
                      <j.3:pos>457842 5439088 118.317691453624 </j.3:pos>
                    </rdf:Description>
                  </j.3:LinearRing>
                </j.3:exterior>
              </rdf:Description>
            </j.3:Polygon>
          </j.3:surfaceMember>
        </j.3:MultiSurface>
      </j.5:lod2MultiSurface>
      <j.3:name>Outer Wall 1 (West)</j.3:name>
    </rdf:Description>
  </j.5:WallSurface>
</j.5:boundedBy>
```
Another noteworthy change after conversion is how XLinks are preserved. The link itself is naturally referenced as a child element instead of an attribute, however not as a resource. Comments are omitted in the conversion. The generalization of namespace identifiers is also observed. The URI of each namespace is kept but the tag that declaring each space is converted into `<j.[namespace number]/>`

BEFORE:
```
<bldg:lod2Solid>
  <gml:Solid>
    <gml:exterior>
      <gml:CompositeSurface>
        <!--Outer Wall 1 (West)  -->
        <gml:surfaceMember xlink:href="#PolyID7350_878_759628_120742"> </gml:surfaceMember>
        <!--Outer Wall 1 (West)  -->
        <!--Outer Wall 2 (South)  -->
        <gml:surfaceMember xlink:href="#PolyID7351_1722_416019_316876" />
        <!--Outer Wall 2 (South)  -->
        <!--Outer Wall 3 (East)  -->
        <gml:surfaceMember xlink:href="#PolyID7352_230_209861_355851" />
        <!--Outer Wall 3 (East)  -->
        <!--Roof 1 (North)  -->
        <gml:surfaceMember xlink:href="#PolyID7353_166_774155_320806" />
        <!--Roof 1 (North)  -->
        <!--Outer Wall 4 (North)  -->
        <gml:surfaceMember xlink:href="#PolyID7354_1362_450904_410226" />
        <!--Outer Wall 2 (North)  -->
        <!--Roof 2 (South)  -->
        <gml:surfaceMember xlink:href="#PolyID7355_537_416207_260034" />
        <!--Roof 2 (South)  -->
        <!--Base Surface  -->
        <gml:surfaceMember xlink:href="#PolyID7356_612_880782_415367" />
        <!--Base Surface  -->
      </gml:CompositeSurface>
    </gml:exterior>
  </gml:Solid>
</bldg:lod2Solid>
```
AFTER:
```
<j.5:lod2Solid rdf:parseType="Resource">
  <j.3:Solid rdf:parseType="Resource">
    <j.3:exterior rdf:parseType="Resource">
      <j.3:CompositeSurface rdf:parseType="Resource">
        <j.3:surfaceMember>
          <j.2:PolyID7356_612_880782_415367/>
        </j.3:surfaceMember>
        <j.3:surfaceMember>
          <j.2:PolyID7355_537_416207_260034/>
        </j.3:surfaceMember>
        <j.3:surfaceMember>
          <j.2:PolyID7354_1362_450904_410226/>
        </j.3:surfaceMember>
        <j.3:surfaceMember>
          <j.2:PolyID7353_166_774155_320806/>
        </j.3:surfaceMember>
        <j.3:surfaceMember>
          <j.2:PolyID7352_230_209861_355851/>
        </j.3:surfaceMember>
        <j.3:surfaceMember>
          <j.2:PolyID7351_1722_416019_316876/>
        </j.3:surfaceMember>
        <j.3:surfaceMember>
          <j.2:PolyID7350_878_759628_120742>
            <rdf:value/>
          </j.2:PolyID7350_878_759628_120742>
        </j.3:surfaceMember>
      </j.3:CompositeSurface>
    </j.3:exterior>
  </j.3:Solid>
</j.5:lod2Solid>
```

Queries made on this data are done using SPARQL with Twinkle as our query editor. Querying all elements of a single type is straightforward but since CityGML contains many hierarchical elements without Ids, simple queries do not always yield useful results. Here is an example of how to query all of the GML name types in the converted example:

```
PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX gml:<http://www.opengis.net/gml#>

SELECT *
WHERE {

# Query all GML name types
?subjects gml:name ?objects .

}
```

Which produces the following:

| Subjects | Objects |
|----------|---------|
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml>                                           | "AC14-FZK-Haus"        |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_0f30f604-e70d-4dfe-ba35-853bc69609cc>  | "Outer Wall 4 (North)" |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_d38cf762-c29d-4491-88c9-bdc89e141978>  | "Outer Wall 2 (South)" |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_875d470b-32b4-4985-a4c8-0f02caa342a2>  | "Roof 1 (North)"       |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | "AC14-FZK-Haus"        |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_8e5db638-e46a-4739-a98a-2fc2d39c9069>  | "Outer Wall 3 (East)"  |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_257a8dde-8194-4ca3-b581-abd591dcd6a3>  | "Base Surface"         |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_5856d7ad-5e34-498a-817b-9544bfbb1475>  | "Outer Wall 1 (West)"  |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#GML_eeb6796a-e261-4d3b-a6f2-475940cca80a>  | "Roof 2 (South)"  |

By comparison, queries made on an element's geographic or 3D elements data can be much more lengthy. Much of the original data does not have identifiers and those identifiers are reassigned arbitrarily between queries (this may depend on the tool used to query). For instance, to make a query on a building's LoD2 surface members using the example file, the following strategy is required:

```
PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX gml:<http://www.opengis.net/gml#>
PREFIX bldg:<http://www.opengis.net/citygml/building/2.0#>

SELECT ?building ?surfaceID
WHERE {

# Query building "UUID_d281adfc-4901-0f52-540b-4cc1a9325f82" lod2Solid children
?building bldg:lod2Solid ?solidGeometry .
?solidGeometry ?p0 ?solid .
?solid ?p1 ?exterior .
?exterior ?p2 ?compositeSurface .
?compositeSurface ?p3 ?surfaceMember .
?surfaceMember ?p4 ?surfaceID .

FILTER ( ?building = <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> )
}
```

Which produces the following:


| building | surfaceID |
|----------|-----------|
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7350_878_759628_120742>  |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7351_1722_416019_316876> |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7352_230_209861_355851>  |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7353_166_774155_320806>  |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7354_1362_450904_410226> |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7355_537_416207_260034>  |
| <http://www.citygmlwiki.org/images/9/95/FZK-Haus-LoD2-KIT-IAI-KHH-B36-V1.gml#UUID_d281adfc-4901-0f52-540b-4cc1a9325f82> | <http://www.opengis.net/citygml/profiles/base/2.0#PolyID7356_612_880782_415367>  |

Because of the lack of IDs in the intermediary elements between the root element and it's leaf children, a query must be made at each level of the hierarchy.
