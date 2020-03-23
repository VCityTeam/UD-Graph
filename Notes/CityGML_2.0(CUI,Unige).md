# CityGML 2.0 OWL
This is a review over the CityGML Owl ontology created by the Université de Genève, which can be found [here](http://vgibox.eu/repository/index.php/CityGML_in_OWL)

## Related Articles
* **From a CityGML to an ontology-based approach to support preventive conservation of built cultural heritage** - Olga Zalamea, Jos Van Orshoven, Thérèse Steenberghen
* **EXTENSION AND CONTEXTUALISATION FOR LINKED SEMANTIC 3D GEODATA** - Claudine Métral, Gilles Falquet

## Notes
Upon initial analysis, CityGML Owl has all of the classes and subclasses of the original CityGML XML Schema. There are, however, a few distinct changes that are made to the UML structure. Apart from these changes, CityGML is indeed a semantic ontology of CityGML 2.0

### gml:geometry

Schemas: http://schemas.opengis.net/gml/3.2.1/ , http://www.datypic.com/sc/niem21/ns-gml32.html

CityGML owl contains the following geometry classes from CityGML 2.0

* `Geometry`
  * `Abstract Geometric Aggregate`
    * `MultiGeometry`
    * `MultiCurve`
    * `MultiPoint`
    * `MultiSolid`
    * `MultiSurface`
  * `Geometric Primitive`
    * `Curve`
    * `Point`
    * `Solid`
    * `Surface`
      * `Polygon`
      * `Surface Patch`
        * `Triangle`
      * `Triangulated Surface`
      * `Orientable Surface`
        * `Textured Surface` (deprecated but represented)

Geometry classes are also related through the following object properties:

MultiCurve: `curveMember only Curve`

MultiPoint: `pointMember only Point`

MultiSolid: `solidMember only Solid`

MultiSurface: `surfaceMember only Surface`

SurfacePatch: `patchOf some Surface`

Triangle: `trianglePatchOf some TriangulatedSurface`

TriangulatedSurface: `trianglePatches only Triangle`

_Note that sub classes inherit the object properties of their superclasses_

A few distinct differences are visible. First, composite classes such as _Composite Surface_ and _Composite Solid_ do not exist. Yet, their associations to corresponding classes are maintained through the object properties `surfaceMember` and `solidMember` respectively. Although this preserves the groupings between _Abstract Geometric Aggregate_ children, the essential geometric primitives under _Ring_ and _LinearRing_ classes are not classified in this ontology. Curiously, the _exterior_, _interior_, and _baseSurface_ associations exist as object properties, but are not related to any other class or object property. Additionally, the `triangle` and `triangulatedSurface` geometry classes exist and are related through a `trianglePatchOf` object property and its inverse `trianglePatches`. Finally, the multiplicity of relationships between classes is not comletely preserved through object properties or axions. They are only specified through "some" or "only" expressions. Here is a list of all of the missing objects and properties from `gml:geometry` that are commonly used in CityGML 2.0:

* Classes
  * `CompositeSolid`
  * `CompositeSurface`
  * `CompositeCurve`
  * `TIN`
  * `LineString`
  * `_Ring`
  * `LinearRing`
  * `Rectangle`
* Attributes
  * `posList`
  * `pos`

Aside from these omissions the ontological representation of `gml:geometry` appears semantically correct.

### CityGML:Building

Schemas: http://schemas.opengis.net/citygml/building/2.0/building.xsd

CityGML owl contains the following building classes from CityGML 2.0

* `_CityObject`
  * `_Site`
    * `_AbstractBuilding`
      *  `Building`
      *  `BuildingPart`
  * `BuildingInstallation`
  * `IntBuildingInstallation`
  * `_BoundarySurface`
    *  `RoofSurface`
    * `WallSurface`
    * `GroundSurface`
    * `ClosureSurface`
    * `FloorSurface`
    * `OuterFloorSurface`
    * `InteriorWallSurface`
    * `CeilingSurface`
    * `OuterCeilingSurface`
  * `_Opening`
    * `Window`
    * `Door`
  * `Room`
  * `BuildingFurniture`

Building classes are also related through the following object properties:

_AbstractBuilding:
* `address only Address`
* `boundedBy only _BoundarySurface`
* `class only CodeType`
* `consistsOfBuildingPart only BuildingPart`
* `function only CodeType`
* `interiorBuildingInstallation only IntBuildingInstallation`
* `interiorRoom only Room`
* `measuredHeight only LengthType`
* `outerBuildingInstallation only BuildingInstallation`
* `roofType only CodeType`
* `storeyHeightsAboveGround only MeasureOrNullListType`
* `storeyHeightsBelowGround only MeasureOrNullListType`
* `storeysAboveGround  only XMLSchmanonNegativeInteger`
* `storeysBelowGround only XMLSchmanonNegativeInteger`
* `usage only CodeType`
* `yearOfConstruction only XMLSchemagYear`
* `yearOfDemolition only XMLSchemagYear`
* `lod0FootPrint only MultiSurface`
* `lod0RoofEdge only MultiSurface`
* `lod1Solid only Solid`
* `lod1MultiSurface only MultiSurface`
* `lod1TerrainIntersection only MultiCurve`
* `lod2MultiCurve only MultiCurve`
* `lod2MultiSurface only MultiSurface`
* `lod2Solid only Solid`
* `lod2TerrainIntersection only MultiCurve`
* `lod3MultiCurve only MultiCurve`
* `lod3MultiSurface only MultiSurface`
* `lod3Solid only Solid`
* `lod3TerrainIntersection only MultiCurve`
* `lod4MultiCurve only MultiCurve`
* `lod4MultiSurface only MultiSurface`
* `lod4Solid only Solid`
* `lod4TerrainIntersection only MultiCurve`

BuildingInstallation:
* `boundedBy only _BoundarySurface`
* `class only CodeType`
* `function only CodeType`
* `usage only CodeType`
* `lod2Geometry only Geometry`
* `lod2ImplicitRepresentation only ImplicitGeometry`
* `lod3Geometry only Geometry`
* `lod3ImplicitRepresentation only ImplicitGeometry`
* `lod4Geometry only Geometry`
* `lod4ImplicitRepresentation only ImplicitGeometry`

IntBuildingInstallation:
* `boundedBy only _BoundarySurface`
* `class only CodeType`
* `function only CodeType`
* `usage only CodeType`
* `lod4Geometry only Geometry`
* `lod4ImplicitRepresentation only ImplicitGeometry`

Room:
* `boundedBy only _BoundarySurface`
* `class only CodeType`
* `function only CodeType`
* `usage only CodeType`
* `interiorFurniture only BridgeFurniture` (likely a typo, see comments<sup>1</sup>)
* `roomInstallation only IntBuildingInstallation`
* `lod4MultiSurface only MultiSurface`
* `lod4Solid only Solid`

_Opening:
* `lod3ImplicitRepresentation only ImplicitGeometry`
* `lod3MultiSurface only MultiSurface`
* `lod4ImplicitRepresentation only ImplicitGeometry`
* `lod4MultiSurface only MultiSurface`

Door:
* `address only Address`

BuildingFurniture:
* `class only CodeType`
* `function only CodeType`
* `usage only CodeType`
* `lod4Geometry only Geometry`
* `lod4ImplicitRepresentation only ImplicitGeometry`

_BoundarySurface:
* `lod2MultiSurface only MultiSurface`
* `lod3MultiSurface only MultiSurface`
* `lod4MultiSurface only MultiSurface`
* `opening only _Opening`

The CityGML 2.0 structure of the building module is well preserved. Almost every generalization and association is present and correct, along with their respective attributes. <sup>1</sup>There is however, one mistake regarding the furniture associated with the `Room` class, as noted above. The `Room` class has the object property: `interiorFurniture only BridgeFurniture` which should instead contain only **BuildingFurniture**. However, there are actually 2 distinct `BridgeFurniture` classes in the ontology and both of them are missing the required object properties of their attributes and associations, and are not subclasses of `_CityObject`. I believe these classes were made in error or imported incorrectly.

To fix these, I propose using the existing GML ontology provided my [GeoSPARQL](http://www.opengis.net/ont/gml). A new ontology will be created using a modification of the existing CityGML 2.0, that references the existing GML ontology. 

These changes will be made in the [UD-Graph](https://github.com/VCityTeam/UD-Graph) repository








