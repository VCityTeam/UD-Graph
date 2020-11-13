<xsl:stylesheet xmlns:app="http://www.opengis.net/citygml/appearance/2.0" xmlns:bldg="http://www.opengis.net/citygml/building/2.0" xmlns:brid="http://www.opengis.net/citygml/bridge/2.0" xmlns:core="http://www.opengis.net/citygml/2.0" xmlns:dem="http://www.opengis.net/citygml/relief/2.0" xmlns:frn="http://www.opengis.net/citygml/cityfurniture/2.0" xmlns:gen="http://www.opengis.net/citygml/generics/2.0" xmlns:gml="http://www.opengis.net/gml" xmlns:grp="http://www.opengis.net/citygml/cityobjectgroup/2.0" xmlns:luse="http://www.opengis.net/citygml/landuse/2.0" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:smil20="http://www.w3.org/2001/SMIL20/" xmlns:tex="http://www.opengis.net/citygml/texturedsurface/2.0" xmlns:tran="http://www.opengis.net/citygml/transportation/2.0" xmlns:tun="http://www.opengis.net/citygml/tunnel/2.0" xmlns:veg="http://www.opengis.net/citygml/vegetation/2.0" xmlns:wtr="http://www.opengis.net/citygml/waterbody/2.0" xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"><xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:variable name="namespace" select="'https://liris.cnrs.fr/ontologies#'"/>
   <xsl:template match="/">
      <rdf:RDF xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#">
         <owl:Ontology rdf:about="https://liris.cnrs.fr/ontologies#"/>
         <xsl:apply-templates select="//*"/>
      </rdf:RDF>
   </xsl:template>
   <xsl:template name="geometry-serialization-template">
      <geo:asGML xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:datatype="http://www.opengis.net/ont/geosparql#gmlLiteral">
         <xsl:value-of select="serialize(.)"/>
      </geo:asGML>
   </xsl:template>
   <xsl:template name="gml:AbstractCoverageType_Template">
      <xsl:for-each select="./gml:domainSet|./gml:multiPointDomain|./gml:multiCurveDomain|./gml:multiSurfaceDomain|./gml:multiSolidDomain|./gml:gridDomain|./gml:rectifiedGridDomain">
         <xsl:call-template name="gml:domainSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:dimension">
         <xsl:call-template name="gml:dimension_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractContinuousCoverageType_Template">
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractDiscreteCoverageType_Template">
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DomainSetType_Template">
      <xsl:for-each select="./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeObject|./gml:_TimePrimitive|./gml:_TimeGeometricPrimitive|./gml:TimeInstant|./gml:TimePeriod|./gml:_TimeTopologyPrimitive|./gml:TimeNode|./gml:TimeEdge|./gml:_TimeComplex|./gml:TimeTopologyComplex">
         <xsl:call-template name="gml:_TimeObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:RangeSetType_Template">
      <xsl:for-each select="./gml:ValueArray">
         <xsl:call-template name="gml:ValueArray_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DataBlock">
         <xsl:call-template name="gml:DataBlock_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:File">
         <xsl:call-template name="gml:File_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ScalarValueList_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoverageFunctionType_Template">
      <xsl:for-each select="./gml:MappingRule">
         <xsl:call-template name="gml:MappingRule_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridFunction|./gml:IndexMap">
         <xsl:call-template name="gml:GridFunction_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:DataBlockType_Template">
      <xsl:for-each select="./gml:rangeParameters">
         <xsl:call-template name="gml:rangeParameters_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:tupleList">
         <xsl:call-template name="gml:tupleList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:doubleOrNullTupleList">
         <xsl:call-template name="gml:doubleOrNullTupleList_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:FileType_Template">
      <xsl:for-each select="./gml:rangeParameters">
         <xsl:call-template name="gml:rangeParameters_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:fileName">
         <xsl:call-template name="gml:fileName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:fileStructure">
         <xsl:call-template name="gml:fileStructure_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:mimeType">
         <xsl:call-template name="gml:mimeType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:compression">
         <xsl:call-template name="gml:compression_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:RangeParametersType_Template">
      <xsl:call-template name="gml:ValueObject_Template"/>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GridFunctionType_Template">
      <xsl:for-each select="./gml:sequenceRule">
         <xsl:call-template name="gml:sequenceRule_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:startPoint">
         <xsl:call-template name="gml:startPoint_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:IndexMapType_Template">
      <xsl:for-each select="./gml:lookUpTable">
         <xsl:call-template name="gml:lookUpTable_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:GridFunctionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SequenceRuleType_Template">
      <xsl:if test="@gml:order">
         <xsl:call-template name="gml:order_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:SequenceRuleNames_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiPointCoverageType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiPointDomain">
         <xsl:call-template name="gml:multiPointDomain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiPointDomainType_Template">
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xsl:call-template name="gml:DomainSetType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiCurveCoverageType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiCurveDomain">
         <xsl:call-template name="gml:multiCurveDomain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiCurveDomainType_Template">
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xsl:call-template name="gml:DomainSetType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSurfaceCoverageType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiSurfaceDomain">
         <xsl:call-template name="gml:multiSurfaceDomain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSurfaceDomainType_Template">
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xsl:call-template name="gml:DomainSetType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSolidCoverageType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiSolidDomain">
         <xsl:call-template name="gml:multiSolidDomain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSolidDomainType_Template">
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xsl:call-template name="gml:DomainSetType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GridCoverageType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:gridDomain">
         <xsl:call-template name="gml:gridDomain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GridDomainType_Template">
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xsl:call-template name="gml:DomainSetType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RectifiedGridCoverageType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rectifiedGridDomain">
         <xsl:call-template name="gml:rectifiedGridDomain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rangeSet">
         <xsl:call-template name="gml:rangeSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coverageFunction">
         <xsl:call-template name="gml:coverageFunction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RectifiedGridDomainType_Template">
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xsl:call-template name="gml:DomainSetType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DefinitionType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name|./gml:coordinateOperationName|./gml:methodName|./gml:parameterName|./gml:groupName|./gml:csName|./gml:srsName|./gml:datumName|./gml:meridianName|./gml:ellipsoidName">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DictionaryType_Template">
      <xsl:for-each select="./gml:dictionaryEntry|./gml:definitionMember">
         <xsl:call-template name="gml:dictionaryEntry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:indirectEntry">
         <xsl:call-template name="gml:indirectEntry_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DictionaryEntryType_Template">
      <xsl:for-each select="./gml:Definition|./gml:Dictionary|./gml:DefinitionCollection|./gml:DefinitionProxy|./gml:_TimeReferenceSystem|./gml:TimeCoordinateSystem|./gml:TimeOrdinalReferenceSystem|./gml:TimeCalendar|./gml:TimeClock|./gml:TimeCalendarEra|./gml:_CoordinateOperation|./gml:ConcatenatedOperation|./gml:_SingleOperation|./gml:PassThroughOperation|./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation|./gml:OperationMethod|./gml:_GeneralOperationParameter|./gml:OperationParameter|./gml:OperationParameterGroup|./gml:CoordinateSystemAxis|./gml:_CoordinateSystem|./gml:EllipsoidalCS|./gml:CartesianCS|./gml:VerticalCS|./gml:TemporalCS|./gml:LinearCS|./gml:UserDefinedCS|./gml:SphericalCS|./gml:PolarCS|./gml:CylindricalCS|./gml:ObliqueCartesianCS|./gml:_ReferenceSystem|./gml:_CRS|./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS|./gml:CompoundCRS|./gml:_Datum|./gml:EngineeringDatum|./gml:ImageDatum|./gml:VerticalDatum|./gml:TemporalDatum|./gml:GeodeticDatum|./gml:PrimeMeridian|./gml:Ellipsoid|./gml:UnitDefinition|./gml:BaseUnit|./gml:DerivedUnit|./gml:ConventionalUnit">
         <xsl:call-template name="gml:Definition_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:IndirectEntryType_Template">
      <xsl:for-each select="./gml:DefinitionProxy">
         <xsl:call-template name="gml:DefinitionProxy_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:DefinitionProxyType_Template">
      <xsl:for-each select="./gml:definitionRef">
         <xsl:call-template name="gml:definitionRef_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractFeatureType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:location|./gml:priorityLocation">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BoundingShapeType_Template">
      <xsl:for-each select="./gml:Envelope|./gml:EnvelopeWithTimePeriod">
         <xsl:call-template name="gml:Envelope_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Null">
         <xsl:call-template name="gml:Null_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:EnvelopeWithTimePeriodType_Template">
      <xsl:for-each select="./gml:timePosition">
         <xsl:call-template name="gml:timePosition_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:frame">
         <xsl:call-template name="gml:frame_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:EnvelopeType_Template"/>
   </xsl:template>
   <xsl:template name="gml:FeaturePropertyType_Template">
      <xsl:for-each select="./gml:_Feature|./gml:_Coverage|./gml:_ContinuousCoverage|./gml:_DiscreteCoverage|./gml:MultiPointCoverage|./gml:MultiCurveCoverage|./gml:MultiSurfaceCoverage|./gml:MultiSolidCoverage|./gml:GridCoverage|./gml:RectifiedGridCoverage|./gml:_FeatureCollection|./core:CityModel|./gml:FeatureCollection|./gml:Observation|./gml:DirectedObservation|./gml:DirectedObservationAtDistance|./app:Appearance|./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial|./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject|./core:Address">
         <xsl:call-template name="gml:_Feature_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:FeatureArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Feature|./gml:_Coverage|./gml:_ContinuousCoverage|./gml:_DiscreteCoverage|./gml:MultiPointCoverage|./gml:MultiCurveCoverage|./gml:MultiSurfaceCoverage|./gml:MultiSolidCoverage|./gml:GridCoverage|./gml:RectifiedGridCoverage|./gml:_FeatureCollection|./core:CityModel|./gml:FeatureCollection|./gml:Observation|./gml:DirectedObservation|./gml:DirectedObservationAtDistance|./app:Appearance|./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial|./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject|./core:Address">
         <xsl:call-template name="gml:_Feature_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractFeatureCollectionType_Template">
      <xsl:for-each select="./gml:featureMember|./app:appearanceMember|./core:cityObjectMember">
         <xsl:call-template name="gml:featureMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:featureMembers">
         <xsl:call-template name="gml:featureMembers_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:FeatureCollectionType_Template">
      <xsl:call-template name="gml:AbstractFeatureCollectionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BoundedFeatureType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:location|./gml:priorityLocation">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:LocationPropertyType_Template">
      <xsl:for-each select="./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LocationKeyWord">
         <xsl:call-template name="gml:LocationKeyWord_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LocationString">
         <xsl:call-template name="gml:LocationString_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Null">
         <xsl:call-template name="gml:Null_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:PriorityLocationPropertyType_Template">
      <xsl:if test="@gml:priority">
         <xsl:call-template name="gml:priority_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:LocationPropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimeReferenceSystemType_Template">
      <xsl:for-each select="./gml:domainOfValidity">
         <xsl:call-template name="gml:domainOfValidity_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeCoordinateSystemType_Template">
      <xsl:for-each select="./gml:originPosition">
         <xsl:call-template name="gml:originPosition_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:origin">
         <xsl:call-template name="gml:origin_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interval">
         <xsl:call-template name="gml:interval_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalReferenceSystemType_Template">
      <xsl:for-each select="./gml:component">
         <xsl:call-template name="gml:component_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalEraType_Template">
      <xsl:for-each select="./gml:relatedTime">
         <xsl:call-template name="gml:relatedTime_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:start">
         <xsl:call-template name="gml:start_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:end">
         <xsl:call-template name="gml:end_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:extent">
         <xsl:call-template name="gml:extent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:member">
         <xsl:call-template name="gml:member_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:group">
         <xsl:call-template name="gml:group_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalEraPropertyType_Template">
      <xsl:for-each select="./gml:TimeOrdinalEra">
         <xsl:call-template name="gml:TimeOrdinalEra_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarType_Template">
      <xsl:for-each select="./gml:referenceFrame">
         <xsl:call-template name="gml:referenceFrame_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarPropertyType_Template">
      <xsl:for-each select="./gml:TimeCalendar">
         <xsl:call-template name="gml:TimeCalendar_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarEraType_Template">
      <xsl:for-each select="./gml:referenceEvent">
         <xsl:call-template name="gml:referenceEvent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:referenceDate">
         <xsl:call-template name="gml:referenceDate_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:julianReference">
         <xsl:call-template name="gml:julianReference_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:epochOfUse">
         <xsl:call-template name="gml:epochOfUse_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarEraPropertyType_Template">
      <xsl:for-each select="./gml:TimeCalendarEra">
         <xsl:call-template name="gml:TimeCalendarEra_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeClockType_Template">
      <xsl:for-each select="./gml:referenceEvent">
         <xsl:call-template name="gml:referenceEvent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:referenceTime">
         <xsl:call-template name="gml:referenceTime_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:utcReference">
         <xsl:call-template name="gml:utcReference_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:dateBasis">
         <xsl:call-template name="gml:dateBasis_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeClockPropertyType_Template">
      <xsl:for-each select="./gml:TimeClock">
         <xsl:call-template name="gml:TimeClock_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTopologyType_Template">
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTopoPrimitiveType_Template">
      <xsl:for-each select="./gml:isolated">
         <xsl:call-template name="gml:isolated_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:container">
         <xsl:call-template name="gml:container_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopologyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:IsolatedPropertyType_Template">
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ContainerPropertyType_Template">
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:NodeType_Template">
      <xsl:for-each select="./gml:directedEdge">
         <xsl:call-template name="gml:directedEdge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopoPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectedNodePropertyType_Template">
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:orientation">
         <xsl:call-template name="gml:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:EdgeType_Template">
      <xsl:for-each select="./gml:directedNode">
         <xsl:call-template name="gml:directedNode_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:directedFace">
         <xsl:call-template name="gml:directedFace_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:curveProperty">
         <xsl:call-template name="gml:curveProperty_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopoPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectedEdgePropertyType_Template">
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:orientation">
         <xsl:call-template name="gml:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:FaceType_Template">
      <xsl:for-each select="./gml:directedEdge">
         <xsl:call-template name="gml:directedEdge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:directedTopoSolid">
         <xsl:call-template name="gml:directedTopoSolid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:surfaceProperty">
         <xsl:call-template name="gml:surfaceProperty_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopoPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectedFacePropertyType_Template">
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:orientation">
         <xsl:call-template name="gml:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoSolidType_Template">
      <xsl:for-each select="./gml:directedFace">
         <xsl:call-template name="gml:directedFace_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopoPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectedTopoSolidPropertyType_Template">
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:orientation">
         <xsl:call-template name="gml:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoPointType_Template">
      <xsl:for-each select="./gml:directedNode">
         <xsl:call-template name="gml:directedNode_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopologyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoPointPropertyType_Template">
      <xsl:for-each select="./gml:TopoPoint">
         <xsl:call-template name="gml:TopoPoint_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:TopoCurveType_Template">
      <xsl:for-each select="./gml:directedEdge">
         <xsl:call-template name="gml:directedEdge_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopologyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoCurvePropertyType_Template">
      <xsl:for-each select="./gml:TopoCurve">
         <xsl:call-template name="gml:TopoCurve_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:TopoSurfaceType_Template">
      <xsl:for-each select="./gml:directedFace">
         <xsl:call-template name="gml:directedFace_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopologyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoSurfacePropertyType_Template">
      <xsl:for-each select="./gml:TopoSurface">
         <xsl:call-template name="gml:TopoSurface_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:TopoVolumeType_Template">
      <xsl:for-each select="./gml:directedTopoSolid">
         <xsl:call-template name="gml:directedTopoSolid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTopologyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoVolumePropertyType_Template">
      <xsl:for-each select="./gml:TopoVolume">
         <xsl:call-template name="gml:TopoVolume_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:TopoComplexType_Template">
      <xsl:for-each select="./gml:maximalComplex">
         <xsl:call-template name="gml:maximalComplex_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:superComplex">
         <xsl:call-template name="gml:superComplex_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:subComplex">
         <xsl:call-template name="gml:subComplex_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:topoPrimitiveMember">
         <xsl:call-template name="gml:topoPrimitiveMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:topoPrimitiveMembers">
         <xsl:call-template name="gml:topoPrimitiveMembers_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:isMaximal">
         <xsl:call-template name="gml:isMaximal_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractTopologyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoComplexMemberType_Template">
      <xsl:for-each select="./gml:TopoComplex">
         <xsl:call-template name="gml:TopoComplex_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoPrimitiveMemberType_Template">
      <xsl:for-each select="./gml:_TopoPrimitive|./gml:Node|./gml:Edge|./gml:Face|./gml:TopoSolid">
         <xsl:call-template name="gml:_TopoPrimitive_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoPrimitiveArrayAssociationType_Template">
      <xsl:for-each select="./gml:_TopoPrimitive|./gml:Node|./gml:Edge|./gml:Face|./gml:TopoSolid">
         <xsl:call-template name="gml:_TopoPrimitive_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractCoordinateOperationBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractCoordinateOperationType_Template">
      <xsl:for-each select="./gml:coordinateOperationID">
         <xsl:call-template name="gml:coordinateOperationID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:operationVersion">
         <xsl:call-template name="gml:operationVersion_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:validArea">
         <xsl:call-template name="gml:validArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scope">
         <xsl:call-template name="gml:scope_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_positionalAccuracy|./gml:absoluteExternalPositionalAccuracy|./gml:relativeInternalPositionalAccuracy|./gml:covarianceMatrix">
         <xsl:call-template name="gml:_positionalAccuracy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:sourceCRS">
         <xsl:call-template name="gml:sourceCRS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:targetCRS">
         <xsl:call-template name="gml:targetCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCoordinateOperationBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateOperationRefType_Template">
      <xsl:for-each select="./gml:_CoordinateOperation|./gml:ConcatenatedOperation|./gml:_SingleOperation|./gml:PassThroughOperation|./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation">
         <xsl:call-template name="gml:_CoordinateOperation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConcatenatedOperationType_Template">
      <xsl:for-each select="./gml:usesSingleOperation">
         <xsl:call-template name="gml:usesSingleOperation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConcatenatedOperationRefType_Template">
      <xsl:for-each select="./gml:ConcatenatedOperation">
         <xsl:call-template name="gml:ConcatenatedOperation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SingleOperationRefType_Template">
      <xsl:for-each select="./gml:_SingleOperation|./gml:PassThroughOperation|./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation">
         <xsl:call-template name="gml:_SingleOperation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:PassThroughOperationType_Template">
      <xsl:for-each select="./gml:modifiedCoordinate">
         <xsl:call-template name="gml:modifiedCoordinate_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesOperation">
         <xsl:call-template name="gml:usesOperation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PassThroughOperationRefType_Template">
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationRefType_Template">
      <xsl:for-each select="./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation">
         <xsl:call-template name="gml:_Operation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeneralConversionType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationID">
         <xsl:call-template name="gml:coordinateOperationID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:validArea">
         <xsl:call-template name="gml:validArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scope">
         <xsl:call-template name="gml:scope_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_positionalAccuracy|./gml:absoluteExternalPositionalAccuracy|./gml:relativeInternalPositionalAccuracy|./gml:covarianceMatrix">
         <xsl:call-template name="gml:_positionalAccuracy_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeneralConversionRefType_Template">
      <xsl:for-each select="./gml:_GeneralConversion|./gml:Conversion">
         <xsl:call-template name="gml:_GeneralConversion_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConversionType_Template">
      <xsl:for-each select="./gml:usesMethod">
         <xsl:call-template name="gml:usesMethod_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesValue">
         <xsl:call-template name="gml:usesValue_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeneralConversionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConversionRefType_Template">
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeneralTransformationType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationID">
         <xsl:call-template name="gml:coordinateOperationID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:operationVersion">
         <xsl:call-template name="gml:operationVersion_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:validArea">
         <xsl:call-template name="gml:validArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scope">
         <xsl:call-template name="gml:scope_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_positionalAccuracy|./gml:absoluteExternalPositionalAccuracy|./gml:relativeInternalPositionalAccuracy|./gml:covarianceMatrix">
         <xsl:call-template name="gml:_positionalAccuracy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:sourceCRS">
         <xsl:call-template name="gml:sourceCRS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:targetCRS">
         <xsl:call-template name="gml:targetCRS_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeneralTransformationRefType_Template">
      <xsl:for-each select="./gml:_GeneralTransformation|./gml:Transformation">
         <xsl:call-template name="gml:_GeneralTransformation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TransformationType_Template">
      <xsl:for-each select="./gml:usesMethod">
         <xsl:call-template name="gml:usesMethod_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesValue">
         <xsl:call-template name="gml:usesValue_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeneralTransformationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TransformationRefType_Template">
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeneralParameterValueType_Template"/>
   <xsl:template name="gml:ParameterValueType_Template">
      <xsl:for-each select="./gml:value">
         <xsl:call-template name="gml:value_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:dmsAngleValue">
         <xsl:call-template name="gml:dmsAngleValue_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:stringValue">
         <xsl:call-template name="gml:stringValue_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:integerValue">
         <xsl:call-template name="gml:integerValue_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:booleanValue">
         <xsl:call-template name="gml:booleanValue_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:valueList">
         <xsl:call-template name="gml:valueList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:integerValueList">
         <xsl:call-template name="gml:integerValueList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:valueFile">
         <xsl:call-template name="gml:valueFile_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:valueOfParameter">
         <xsl:call-template name="gml:valueOfParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeneralParameterValueType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ParameterValueGroupType_Template">
      <xsl:for-each select="./gml:includesValue">
         <xsl:call-template name="gml:includesValue_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:valuesOfGroup">
         <xsl:call-template name="gml:valuesOfGroup_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeneralParameterValueType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationMethodBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodName">
         <xsl:call-template name="gml:methodName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationMethodType_Template">
      <xsl:for-each select="./gml:methodID">
         <xsl:call-template name="gml:methodID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodFormula">
         <xsl:call-template name="gml:methodFormula_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:sourceDimensions">
         <xsl:call-template name="gml:sourceDimensions_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:targetDimensions">
         <xsl:call-template name="gml:targetDimensions_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesParameter">
         <xsl:call-template name="gml:usesParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:OperationMethodBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationMethodRefType_Template">
      <xsl:for-each select="./gml:OperationMethod">
         <xsl:call-template name="gml:OperationMethod_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeneralOperationParameterType_Template">
      <xsl:for-each select="./gml:minimumOccurs">
         <xsl:call-template name="gml:minimumOccurs_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeneralOperationParameterRefType_Template">
      <xsl:for-each select="./gml:_GeneralOperationParameter|./gml:OperationParameter|./gml:OperationParameterGroup">
         <xsl:call-template name="gml:_GeneralOperationParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:parameterName">
         <xsl:call-template name="gml:parameterName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:minimumOccurs">
         <xsl:call-template name="gml:minimumOccurs_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGeneralOperationParameterType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterType_Template">
      <xsl:for-each select="./gml:parameterID">
         <xsl:call-template name="gml:parameterID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:OperationParameterBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterRefType_Template">
      <xsl:for-each select="./gml:OperationParameter">
         <xsl:call-template name="gml:OperationParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterGroupBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:groupName">
         <xsl:call-template name="gml:groupName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:minimumOccurs">
         <xsl:call-template name="gml:minimumOccurs_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGeneralOperationParameterType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterGroupType_Template">
      <xsl:for-each select="./gml:groupID">
         <xsl:call-template name="gml:groupID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:maximumOccurs">
         <xsl:call-template name="gml:maximumOccurs_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:includesParameter">
         <xsl:call-template name="gml:includesParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:OperationParameterGroupBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterGroupRefType_Template">
      <xsl:for-each select="./gml:OperationParameterGroup">
         <xsl:call-template name="gml:OperationParameterGroup_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompositeCurveType_Template">
      <xsl:for-each select="./gml:curveMember">
         <xsl:call-template name="gml:curveMember_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCurveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompositeCurvePropertyType_Template">
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSurfaceType_Template">
      <xsl:for-each select="./gml:surfaceMember">
         <xsl:call-template name="gml:surfaceMember_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSurfacePropertyType_Template">
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSolidType_Template">
      <xsl:for-each select="./gml:solidMember">
         <xsl:call-template name="gml:solidMember_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSolidType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSolidPropertyType_Template">
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometricComplexType_Template">
      <xsl:for-each select="./gml:element">
         <xsl:call-template name="gml:element_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometricComplexPropertyType_Template">
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGMLType_Template">
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
   </xsl:template>
   <xsl:template name="gml:BagType_Template">
      <xsl:for-each select="./gml:member">
         <xsl:call-template name="gml:member_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:members">
         <xsl:call-template name="gml:members_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArrayType_Template">
      <xsl:for-each select="./gml:members">
         <xsl:call-template name="gml:members_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractMetaDataType_Template">
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gml:GenericMetaDataType_Template">
      <xsl:call-template name="gml:AbstractMetaDataType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AssociationType_Template">
      <xsl:for-each select="./gml:_Object|./gml:_GML|./gml:Definition|./gml:Dictionary|./gml:DefinitionCollection|./gml:DefinitionProxy|./gml:_TimeReferenceSystem|./gml:TimeCoordinateSystem|./gml:TimeOrdinalReferenceSystem|./gml:TimeCalendar|./gml:TimeClock|./gml:TimeCalendarEra|./gml:_CoordinateOperation|./gml:ConcatenatedOperation|./gml:_SingleOperation|./gml:PassThroughOperation|./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation|./gml:OperationMethod|./gml:_GeneralOperationParameter|./gml:OperationParameter|./gml:OperationParameterGroup|./gml:CoordinateSystemAxis|./gml:_CoordinateSystem|./gml:EllipsoidalCS|./gml:CartesianCS|./gml:VerticalCS|./gml:TemporalCS|./gml:LinearCS|./gml:UserDefinedCS|./gml:SphericalCS|./gml:PolarCS|./gml:CylindricalCS|./gml:ObliqueCartesianCS|./gml:_ReferenceSystem|./gml:_CRS|./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS|./gml:CompoundCRS|./gml:_Datum|./gml:EngineeringDatum|./gml:ImageDatum|./gml:VerticalDatum|./gml:TemporalDatum|./gml:GeodeticDatum|./gml:PrimeMeridian|./gml:Ellipsoid|./gml:UnitDefinition|./gml:BaseUnit|./gml:DerivedUnit|./gml:ConventionalUnit|./gml:_Feature|./gml:_Coverage|./gml:_ContinuousCoverage|./gml:_DiscreteCoverage|./gml:MultiPointCoverage|./gml:MultiCurveCoverage|./gml:MultiSurfaceCoverage|./gml:MultiSolidCoverage|./gml:GridCoverage|./gml:RectifiedGridCoverage|./gml:_FeatureCollection|./core:CityModel|./gml:FeatureCollection|./gml:Observation|./gml:DirectedObservation|./gml:DirectedObservationAtDistance|./app:Appearance|./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial|./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject|./core:Address|./gml:_Topology|./gml:_TopoPrimitive|./gml:Node|./gml:Edge|./gml:Face|./gml:TopoSolid|./gml:TopoComplex|./gml:Bag|./gml:Array|./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid|./gml:_TimeSlice|./gml:MovingObjectStatus|./gml:_TimeObject|./gml:_TimePrimitive|./gml:_TimeGeometricPrimitive|./gml:TimeInstant|./gml:TimePeriod|./gml:_TimeTopologyPrimitive|./gml:TimeNode|./gml:TimeEdge|./gml:_TimeComplex|./gml:TimeTopologyComplex|./gml:_Style|./gml:Style|./gml:FeatureStyle|./gml:GeometryStyle|./gml:TopologyStyle|./gml:LabelStyle|./gml:GraphStyle|./app:_TextureParameterization|./app:TexCoordList|./app:TexCoordGen|./core:ImplicitGeometry|./tex:_Appearance|./tex:Material|./tex:SimpleTexture|./gml:_MetaData|./gml:GenericMetaData|./dem:Elevation">
         <xsl:call-template name="gml:_Object_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ReferenceType_Template">
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArrayAssociationType_Template">
      <xsl:for-each select="./gml:_Object|./gml:_GML|./gml:Definition|./gml:Dictionary|./gml:DefinitionCollection|./gml:DefinitionProxy|./gml:_TimeReferenceSystem|./gml:TimeCoordinateSystem|./gml:TimeOrdinalReferenceSystem|./gml:TimeCalendar|./gml:TimeClock|./gml:TimeCalendarEra|./gml:_CoordinateOperation|./gml:ConcatenatedOperation|./gml:_SingleOperation|./gml:PassThroughOperation|./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation|./gml:OperationMethod|./gml:_GeneralOperationParameter|./gml:OperationParameter|./gml:OperationParameterGroup|./gml:CoordinateSystemAxis|./gml:_CoordinateSystem|./gml:EllipsoidalCS|./gml:CartesianCS|./gml:VerticalCS|./gml:TemporalCS|./gml:LinearCS|./gml:UserDefinedCS|./gml:SphericalCS|./gml:PolarCS|./gml:CylindricalCS|./gml:ObliqueCartesianCS|./gml:_ReferenceSystem|./gml:_CRS|./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS|./gml:CompoundCRS|./gml:_Datum|./gml:EngineeringDatum|./gml:ImageDatum|./gml:VerticalDatum|./gml:TemporalDatum|./gml:GeodeticDatum|./gml:PrimeMeridian|./gml:Ellipsoid|./gml:UnitDefinition|./gml:BaseUnit|./gml:DerivedUnit|./gml:ConventionalUnit|./gml:_Feature|./gml:_Coverage|./gml:_ContinuousCoverage|./gml:_DiscreteCoverage|./gml:MultiPointCoverage|./gml:MultiCurveCoverage|./gml:MultiSurfaceCoverage|./gml:MultiSolidCoverage|./gml:GridCoverage|./gml:RectifiedGridCoverage|./gml:_FeatureCollection|./core:CityModel|./gml:FeatureCollection|./gml:Observation|./gml:DirectedObservation|./gml:DirectedObservationAtDistance|./app:Appearance|./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial|./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject|./core:Address|./gml:_Topology|./gml:_TopoPrimitive|./gml:Node|./gml:Edge|./gml:Face|./gml:TopoSolid|./gml:TopoComplex|./gml:Bag|./gml:Array|./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid|./gml:_TimeSlice|./gml:MovingObjectStatus|./gml:_TimeObject|./gml:_TimePrimitive|./gml:_TimeGeometricPrimitive|./gml:TimeInstant|./gml:TimePeriod|./gml:_TimeTopologyPrimitive|./gml:TimeNode|./gml:TimeEdge|./gml:_TimeComplex|./gml:TimeTopologyComplex|./gml:_Style|./gml:Style|./gml:FeatureStyle|./gml:GeometryStyle|./gml:TopologyStyle|./gml:LabelStyle|./gml:GraphStyle|./app:_TextureParameterization|./app:TexCoordList|./app:TexCoordGen|./core:ImplicitGeometry|./tex:_Appearance|./tex:Material|./tex:SimpleTexture|./gml:_MetaData|./gml:GenericMetaData|./dem:Elevation">
         <xsl:call-template name="gml:_Object_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:MetaDataPropertyType_Template">
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:StringOrRefType_Template">
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:CompositeValueType_Template">
      <xsl:for-each select="./gml:valueComponent">
         <xsl:call-template name="gml:valueComponent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:valueComponents">
         <xsl:call-template name="gml:valueComponents_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ValueArrayType_Template">
      <xsl:call-template name="gml:referenceSystem_Template"/>
      <xsl:call-template name="gml:CompositeValueType_Template"/>
   </xsl:template>
   <xsl:template name="gml:QuantityExtentType_Template">
      <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CategoryExtentType_Template">
      <xsl:call-template name="gml:CodeOrNullListType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ValuePropertyType_Template">
      <xsl:call-template name="gml:Value_Template"/>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ValueArrayPropertyType_Template">
      <xsl:call-template name="gml:Value_Template"/>
   </xsl:template>
   <xsl:template name="gml:ScalarValuePropertyType_Template">
      <xsl:call-template name="gml:ScalarValue_Template"/>
      <xsl:call-template name="gml:ValuePropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BooleanPropertyType_Template">
      <xsl:for-each select="./gml:Boolean">
         <xsl:call-template name="gml:Boolean_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ValuePropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CategoryPropertyType_Template">
      <xsl:for-each select="./gml:Category">
         <xsl:call-template name="gml:Category_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ValuePropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:QuantityPropertyType_Template">
      <xsl:for-each select="./gml:Quantity">
         <xsl:call-template name="gml:Quantity_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ValuePropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CountPropertyType_Template">
      <xsl:for-each select="./gml:Count">
         <xsl:call-template name="gml:Count_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ValuePropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometryPropertyType_Template">
      <xsl:for-each select="./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometryArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractGeometryType_Template">
      <xsl:if test="@gml:gid">
         <xsl:call-template name="gml:gid_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:SRSReferenceGroup_Template"/>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
      <xsl:if test="not(parent::gml:*) and count(descendant::*) = count(descendant::gml:*)">
         <xsl:call-template name="geometry-serialization-template"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gml:AbstractGeometricPrimitiveType_Template">
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometricPrimitivePropertyType_Template">
      <xsl:for-each select="./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid">
         <xsl:call-template name="gml:_GeometricPrimitive_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:PointType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coord">
         <xsl:call-template name="gml:coord_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PointPropertyType_Template">
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:PointArrayPropertyType_Template">
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractCurveType_Template">
      <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CurvePropertyType_Template">
      <xsl:for-each select="./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve">
         <xsl:call-template name="gml:_Curve_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CurveArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve">
         <xsl:call-template name="gml:_Curve_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:LineStringType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coord">
         <xsl:call-template name="gml:coord_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCurveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectPositionType_Template">
      <xsl:call-template name="gml:SRSReferenceGroup_Template"/>
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectPositionListType_Template">
      <xsl:if test="@gml:count">
         <xsl:call-template name="gml:count_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:SRSReferenceGroup_Template"/>
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="gml:VectorType_Template">
      <xsl:call-template name="gml:SRSReferenceGroup_Template"/>
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="gml:EnvelopeType_Template">
      <xsl:for-each select="./gml:lowerCorner">
         <xsl:call-template name="gml:lowerCorner_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:upperCorner">
         <xsl:call-template name="gml:upperCorner_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coord">
         <xsl:call-template name="gml:coord_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:SRSReferenceGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordType_Template">
      <xsl:for-each select="./gml:X">
         <xsl:call-template name="gml:X_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Y">
         <xsl:call-template name="gml:Y_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Z">
         <xsl:call-template name="gml:Z_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:LineStringPropertyType_Template">
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateReferenceSystemRefType_Template">
      <xsl:for-each select="./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompoundCRSType_Template">
      <xsl:for-each select="./gml:includesCRS">
         <xsl:call-template name="gml:includesCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CompoundCRSRefType_Template">
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeographicCRSType_Template">
      <xsl:for-each select="./gml:usesEllipsoidalCS">
         <xsl:call-template name="gml:usesEllipsoidalCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesGeodeticDatum">
         <xsl:call-template name="gml:usesGeodeticDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeographicCRSRefType_Template">
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCRSType_Template">
      <xsl:for-each select="./gml:usesVerticalCS">
         <xsl:call-template name="gml:usesVerticalCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesVerticalDatum">
         <xsl:call-template name="gml:usesVerticalDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCRSRefType_Template">
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeocentricCRSType_Template">
      <xsl:for-each select="./gml:usesCartesianCS">
         <xsl:call-template name="gml:usesCartesianCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesSphericalCS">
         <xsl:call-template name="gml:usesSphericalCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesGeodeticDatum">
         <xsl:call-template name="gml:usesGeodeticDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeocentricCRSRefType_Template">
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeneralDerivedCRSType_Template">
      <xsl:for-each select="./gml:baseCRS">
         <xsl:call-template name="gml:baseCRS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:definedByConversion">
         <xsl:call-template name="gml:definedByConversion_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ProjectedCRSType_Template">
      <xsl:for-each select="./gml:usesCartesianCS">
         <xsl:call-template name="gml:usesCartesianCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeneralDerivedCRSType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ProjectedCRSRefType_Template">
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:DerivedCRSType_Template">
      <xsl:for-each select="./gml:derivedCRSType">
         <xsl:call-template name="gml:derivedCRSType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesCS">
         <xsl:call-template name="gml:usesCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeneralDerivedCRSType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DerivedCRSTypeType_Template">
      <xsl:if test="@gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:CodeType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DerivedCRSRefType_Template">
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringCRSType_Template">
      <xsl:for-each select="./gml:usesCS">
         <xsl:call-template name="gml:usesCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesEngineeringDatum">
         <xsl:call-template name="gml:usesEngineeringDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringCRSRefType_Template">
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ImageCRSType_Template">
      <xsl:for-each select="./gml:usesCartesianCS">
         <xsl:call-template name="gml:usesCartesianCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesObliqueCartesianCS">
         <xsl:call-template name="gml:usesObliqueCartesianCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesImageDatum">
         <xsl:call-template name="gml:usesImageDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ImageCRSRefType_Template">
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCRSType_Template">
      <xsl:for-each select="./gml:usesTemporalCS">
         <xsl:call-template name="gml:usesTemporalCS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesTemporalDatum">
         <xsl:call-template name="gml:usesTemporalDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCRSRefType_Template">
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TargetPropertyType_Template">
      <xsl:for-each select="./gml:_Feature|./gml:_Coverage|./gml:_ContinuousCoverage|./gml:_DiscreteCoverage|./gml:MultiPointCoverage|./gml:MultiCurveCoverage|./gml:MultiSurfaceCoverage|./gml:MultiSolidCoverage|./gml:GridCoverage|./gml:RectifiedGridCoverage|./gml:_FeatureCollection|./core:CityModel|./gml:FeatureCollection|./gml:Observation|./gml:DirectedObservation|./gml:DirectedObservationAtDistance|./app:Appearance|./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial|./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject|./core:Address">
         <xsl:call-template name="gml:_Feature_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ObservationType_Template">
      <xsl:for-each select="./gml:validTime">
         <xsl:call-template name="gml:validTime_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:using">
         <xsl:call-template name="gml:using_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:target|./gml:subject">
         <xsl:call-template name="gml:target_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:resultOf">
         <xsl:call-template name="gml:resultOf_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectedObservationType_Template">
      <xsl:for-each select="./gml:direction">
         <xsl:call-template name="gml:direction_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ObservationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectedObservationAtDistanceType_Template">
      <xsl:for-each select="./gml:distance">
         <xsl:call-template name="gml:distance_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DirectedObservationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemAxisBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name|./gml:coordinateOperationName|./gml:methodName|./gml:parameterName|./gml:groupName|./gml:csName|./gml:srsName|./gml:datumName|./gml:meridianName|./gml:ellipsoidName">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemAxisType_Template">
      <xsl:for-each select="./gml:axisID">
         <xsl:call-template name="gml:axisID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:axisAbbrev">
         <xsl:call-template name="gml:axisAbbrev_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:axisDirection">
         <xsl:call-template name="gml:axisDirection_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:uom">
         <xsl:call-template name="gml:uom_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:CoordinateSystemAxisBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemAxisRefType_Template">
      <xsl:for-each select="./gml:CoordinateSystemAxis">
         <xsl:call-template name="gml:CoordinateSystemAxis_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractCoordinateSystemBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:csName">
         <xsl:call-template name="gml:csName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractCoordinateSystemType_Template">
      <xsl:for-each select="./gml:csID">
         <xsl:call-template name="gml:csID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesAxis">
         <xsl:call-template name="gml:usesAxis_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCoordinateSystemBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemRefType_Template">
      <xsl:for-each select="./gml:_CoordinateSystem|./gml:EllipsoidalCS|./gml:CartesianCS|./gml:VerticalCS|./gml:TemporalCS|./gml:LinearCS|./gml:UserDefinedCS|./gml:SphericalCS|./gml:PolarCS|./gml:CylindricalCS|./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:_CoordinateSystem_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidalCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidalCSRefType_Template">
      <xsl:for-each select="./gml:EllipsoidalCS">
         <xsl:call-template name="gml:EllipsoidalCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CartesianCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CartesianCSRefType_Template">
      <xsl:for-each select="./gml:CartesianCS">
         <xsl:call-template name="gml:CartesianCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCSRefType_Template">
      <xsl:for-each select="./gml:VerticalCS">
         <xsl:call-template name="gml:VerticalCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCSRefType_Template">
      <xsl:for-each select="./gml:TemporalCS">
         <xsl:call-template name="gml:TemporalCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:LinearCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:LinearCSRefType_Template">
      <xsl:for-each select="./gml:LinearCS">
         <xsl:call-template name="gml:LinearCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:UserDefinedCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:UserDefinedCSRefType_Template">
      <xsl:for-each select="./gml:UserDefinedCS">
         <xsl:call-template name="gml:UserDefinedCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SphericalCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SphericalCSRefType_Template">
      <xsl:for-each select="./gml:SphericalCS">
         <xsl:call-template name="gml:SphericalCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:PolarCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PolarCSRefType_Template">
      <xsl:for-each select="./gml:PolarCS">
         <xsl:call-template name="gml:PolarCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CylindricalCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CylindricalCSRefType_Template">
      <xsl:for-each select="./gml:CylindricalCS">
         <xsl:call-template name="gml:CylindricalCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ObliqueCartesianCSType_Template">
      <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ObliqueCartesianCSRefType_Template">
      <xsl:for-each select="./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:ObliqueCartesianCS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractSurfaceType_Template">
      <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SurfacePropertyType_Template">
      <xsl:for-each select="./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface">
         <xsl:call-template name="gml:_Surface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SurfaceArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface">
         <xsl:call-template name="gml:_Surface_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:PolygonType_Template">
      <xsl:for-each select="./gml:exterior|./gml:outerBoundaryIs">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interior|./gml:innerBoundaryIs">
         <xsl:call-template name="gml:interior_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractRingType_Template">
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractRingPropertyType_Template">
      <xsl:for-each select="./gml:_Ring|./gml:LinearRing|./gml:Ring">
         <xsl:call-template name="gml:_Ring_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:LinearRingType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coord">
         <xsl:call-template name="gml:coord_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractRingType_Template"/>
   </xsl:template>
   <xsl:template name="gml:LinearRingPropertyType_Template">
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:PolygonPropertyType_Template">
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimeSliceType_Template">
      <xsl:for-each select="./gml:validTime">
         <xsl:call-template name="gml:validTime_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:dataSource">
         <xsl:call-template name="gml:dataSource_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MovingObjectStatusType_Template">
      <xsl:for-each select="./gml:location|./gml:priorityLocation">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:speed">
         <xsl:call-template name="gml:speed_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:bearing">
         <xsl:call-template name="gml:bearing_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:acceleration">
         <xsl:call-template name="gml:acceleration_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:elevation">
         <xsl:call-template name="gml:elevation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:status">
         <xsl:call-template name="gml:status_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeSliceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:HistoryPropertyType_Template">
      <xsl:for-each select="./gml:_TimeSlice|./gml:MovingObjectStatus">
         <xsl:call-template name="gml:_TimeSlice_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:TrackType_Template">
      <xsl:for-each select="./gml:MovingObjectStatus">
         <xsl:call-template name="gml:MovingObjectStatus_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:HistoryPropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DynamicFeatureType_Template">
      <xsl:call-template name="gml:dynamicProperties_Template"/>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DynamicFeatureCollectionType_Template">
      <xsl:call-template name="gml:dynamicProperties_Template"/>
      <xsl:call-template name="gml:FeatureCollectionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimeObjectType_Template">
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimePrimitiveType_Template">
      <xsl:for-each select="./gml:relatedTime">
         <xsl:call-template name="gml:relatedTime_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeObjectType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimePrimitivePropertyType_Template">
      <xsl:for-each select="./gml:_TimePrimitive|./gml:_TimeGeometricPrimitive|./gml:TimeInstant|./gml:TimePeriod|./gml:_TimeTopologyPrimitive|./gml:TimeNode|./gml:TimeEdge">
         <xsl:call-template name="gml:_TimePrimitive_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:RelatedTimeType_Template">
      <xsl:if test="@gml:relativePosition">
         <xsl:call-template name="gml:relativePosition_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:TimePrimitivePropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimeComplexType_Template">
      <xsl:call-template name="gml:AbstractTimeObjectType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimeGeometricPrimitiveType_Template">
      <xsl:if test="@gml:frame">
         <xsl:call-template name="gml:frame_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractTimePrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeGeometricPrimitivePropertyType_Template">
      <xsl:for-each select="./gml:_TimeGeometricPrimitive|./gml:TimeInstant|./gml:TimePeriod">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeInstantType_Template">
      <xsl:for-each select="./gml:timePosition">
         <xsl:call-template name="gml:timePosition_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeInstantPropertyType_Template">
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimePeriodType_Template">
      <xsl:for-each select="./gml:beginPosition">
         <xsl:call-template name="gml:beginPosition_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:begin">
         <xsl:call-template name="gml:begin_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:endPosition">
         <xsl:call-template name="gml:endPosition_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:end">
         <xsl:call-template name="gml:end_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:timeLength_Template"/>
      <xsl:call-template name="gml:AbstractTimeGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimePeriodPropertyType_Template">
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeIntervalLengthType_Template">
      <xsl:if test="@gml:unit">
         <xsl:call-template name="gml:unit_Property"/>
      </xsl:if>
      <xsl:if test="@gml:radix">
         <xsl:call-template name="gml:radix_Property"/>
      </xsl:if>
      <xsl:if test="@gml:factor">
         <xsl:call-template name="gml:factor_Property"/>
      </xsl:if>
      <xs:hasdecimal>
         <xsl:value-of select="text()"/>
      </xs:hasdecimal>
   </xsl:template>
   <xsl:template name="gml:TimePositionType_Template">
      <xsl:if test="@gml:frame">
         <xsl:call-template name="gml:frame_Property"/>
      </xsl:if>
      <xsl:if test="@gml:calendarEraName">
         <xsl:call-template name="gml:calendarEraName_Property"/>
      </xsl:if>
      <xsl:if test="@gml:indeterminatePosition">
         <xsl:call-template name="gml:indeterminatePosition_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:TimePositionUnion_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectionPropertyType_Template">
      <xsl:for-each select="./gml:DirectionVector">
         <xsl:call-template name="gml:DirectionVector_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompassPoint">
         <xsl:call-template name="gml:CompassPoint_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectionKeyword">
         <xsl:call-template name="gml:DirectionKeyword_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectionString">
         <xsl:call-template name="gml:DirectionString_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:DirectionVectorType_Template">
      <xsl:for-each select="./gml:vector">
         <xsl:call-template name="gml:vector_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:horizontalAngle">
         <xsl:call-template name="gml:horizontalAngle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:verticalAngle">
         <xsl:call-template name="gml:verticalAngle_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractGeometricAggregateType_Template">
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiGeometryType_Template">
      <xsl:for-each select="./gml:geometryMember">
         <xsl:call-template name="gml:geometryMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:geometryMembers">
         <xsl:call-template name="gml:geometryMembers_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiGeometryPropertyType_Template">
      <xsl:for-each select="./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString">
         <xsl:call-template name="gml:_GeometricAggregate_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiPointType_Template">
      <xsl:for-each select="./gml:pointMember">
         <xsl:call-template name="gml:pointMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointMembers">
         <xsl:call-template name="gml:pointMembers_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiPointPropertyType_Template">
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiCurveType_Template">
      <xsl:for-each select="./gml:curveMember">
         <xsl:call-template name="gml:curveMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:curveMembers">
         <xsl:call-template name="gml:curveMembers_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiCurvePropertyType_Template">
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSurfaceType_Template">
      <xsl:for-each select="./gml:surfaceMember">
         <xsl:call-template name="gml:surfaceMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:surfaceMembers">
         <xsl:call-template name="gml:surfaceMembers_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSurfacePropertyType_Template">
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSolidType_Template">
      <xsl:for-each select="./gml:solidMember">
         <xsl:call-template name="gml:solidMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:solidMembers">
         <xsl:call-template name="gml:solidMembers_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiSolidPropertyType_Template">
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiLineStringType_Template">
      <xsl:for-each select="./gml:lineStringMember">
         <xsl:call-template name="gml:lineStringMember_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiLineStringPropertyType_Template">
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiPolygonType_Template">
      <xsl:for-each select="./gml:polygonMember">
         <xsl:call-template name="gml:polygonMember_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
   </xsl:template>
   <xsl:template name="gml:MultiPolygonPropertyType_Template">
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractPositionalAccuracyType_Template">
      <xsl:for-each select="./gml:measureDescription">
         <xsl:call-template name="gml:measureDescription_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbsoluteExternalPositionalAccuracyType_Template">
      <xsl:for-each select="./gml:result">
         <xsl:call-template name="gml:result_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractPositionalAccuracyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RelativeInternalPositionalAccuracyType_Template">
      <xsl:for-each select="./gml:result">
         <xsl:call-template name="gml:result_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractPositionalAccuracyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CovarianceMatrixType_Template">
      <xsl:for-each select="./gml:unitOfMeasure">
         <xsl:call-template name="gml:unitOfMeasure_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:includesElement">
         <xsl:call-template name="gml:includesElement_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractPositionalAccuracyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CovarianceElementType_Template">
      <xsl:for-each select="./gml:rowIndex">
         <xsl:call-template name="gml:rowIndex_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:columnIndex">
         <xsl:call-template name="gml:columnIndex_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:covariance">
         <xsl:call-template name="gml:covariance_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractReferenceSystemBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractReferenceSystemType_Template">
      <xsl:for-each select="./gml:srsID">
         <xsl:call-template name="gml:srsID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:validArea">
         <xsl:call-template name="gml:validArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scope">
         <xsl:call-template name="gml:scope_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractReferenceSystemBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ReferenceSystemRefType_Template">
      <xsl:for-each select="./gml:_ReferenceSystem|./gml:_CRS|./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS|./gml:CompoundCRS">
         <xsl:call-template name="gml:_ReferenceSystem_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CRSRefType_Template">
      <xsl:for-each select="./gml:_CRS|./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS|./gml:CompoundCRS">
         <xsl:call-template name="gml:_CRS_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:IdentifierType_Template">
      <xsl:for-each select="./gml:name|./gml:coordinateOperationName|./gml:methodName|./gml:parameterName|./gml:groupName|./gml:csName|./gml:srsName|./gml:datumName|./gml:meridianName|./gml:ellipsoidName">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:version">
         <xsl:call-template name="gml:version_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:ExtentType_Template">
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:boundingBox">
         <xsl:call-template name="gml:boundingBox_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:boundingPolygon">
         <xsl:call-template name="gml:boundingPolygon_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:verticalExtent">
         <xsl:call-template name="gml:verticalExtent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:temporalExtent">
         <xsl:call-template name="gml:temporalExtent_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:CodeType_Template">
      <xsl:if test="@gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:if>
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:CodeListType_Template">
      <xsl:if test="@gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:NameList_Template"/>
   </xsl:template>
   <xsl:template name="gml:CodeOrNullListType_Template">
      <xsl:if test="@gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:NameOrNullList_Template"/>
   </xsl:template>
   <xsl:template name="gml:MeasureType_Template">
      <xsl:if test="@gml:uom">
         <xsl:call-template name="gml:uom_Property"/>
      </xsl:if>
      <xs:hasdouble>
         <xsl:value-of select="text()"/>
      </xs:hasdouble>
   </xsl:template>
   <xsl:template name="gml:MeasureListType_Template">
      <xsl:if test="@gml:uom">
         <xsl:call-template name="gml:uom_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="gml:MeasureOrNullListType_Template">
      <xsl:if test="@gml:uom">
         <xsl:call-template name="gml:uom_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:doubleOrNullList_Template"/>
   </xsl:template>
   <xsl:template name="gml:CoordinatesType_Template">
      <xsl:if test="@gml:decimal">
         <xsl:call-template name="gml:decimal_Property"/>
      </xsl:if>
      <xsl:if test="@gml:cs">
         <xsl:call-template name="gml:cs_Property"/>
      </xsl:if>
      <xsl:if test="@gml:ts">
         <xsl:call-template name="gml:ts_Property"/>
      </xsl:if>
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:AbstractDatumBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractDatumType_Template">
      <xsl:for-each select="./gml:datumID">
         <xsl:call-template name="gml:datumID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:anchorPoint">
         <xsl:call-template name="gml:anchorPoint_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:realizationEpoch">
         <xsl:call-template name="gml:realizationEpoch_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:validArea">
         <xsl:call-template name="gml:validArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scope">
         <xsl:call-template name="gml:scope_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractDatumBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DatumRefType_Template">
      <xsl:for-each select="./gml:_Datum|./gml:EngineeringDatum|./gml:ImageDatum|./gml:VerticalDatum|./gml:TemporalDatum|./gml:GeodeticDatum">
         <xsl:call-template name="gml:_Datum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringDatumType_Template">
      <xsl:call-template name="gml:AbstractDatumType_Template"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringDatumRefType_Template">
      <xsl:for-each select="./gml:EngineeringDatum">
         <xsl:call-template name="gml:EngineeringDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ImageDatumType_Template">
      <xsl:for-each select="./gml:pixelInCell">
         <xsl:call-template name="gml:pixelInCell_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractDatumType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PixelInCellType_Template">
      <xsl:if test="@gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:CodeType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ImageDatumRefType_Template">
      <xsl:for-each select="./gml:ImageDatum">
         <xsl:call-template name="gml:ImageDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalDatumType_Template">
      <xsl:for-each select="./gml:verticalDatumType">
         <xsl:call-template name="gml:verticalDatumType_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractDatumType_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalDatumTypeType_Template">
      <xsl:if test="@gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:CodeType_Template"/>
   </xsl:template>
   <xsl:template name="gml:VerticalDatumRefType_Template">
      <xsl:for-each select="./gml:VerticalDatum">
         <xsl:call-template name="gml:VerticalDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalDatumBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumID">
         <xsl:call-template name="gml:datumID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:validArea">
         <xsl:call-template name="gml:validArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scope">
         <xsl:call-template name="gml:scope_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractDatumType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalDatumType_Template">
      <xsl:for-each select="./gml:origin">
         <xsl:call-template name="gml:origin_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:TemporalDatumBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TemporalDatumRefType_Template">
      <xsl:for-each select="./gml:TemporalDatum">
         <xsl:call-template name="gml:TemporalDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeodeticDatumType_Template">
      <xsl:for-each select="./gml:usesPrimeMeridian">
         <xsl:call-template name="gml:usesPrimeMeridian_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:usesEllipsoid">
         <xsl:call-template name="gml:usesEllipsoid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractDatumType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeodeticDatumRefType_Template">
      <xsl:for-each select="./gml:GeodeticDatum">
         <xsl:call-template name="gml:GeodeticDatum_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:PrimeMeridianBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:meridianName">
         <xsl:call-template name="gml:meridianName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PrimeMeridianType_Template">
      <xsl:for-each select="./gml:meridianID">
         <xsl:call-template name="gml:meridianID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:greenwichLongitude">
         <xsl:call-template name="gml:greenwichLongitude_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:PrimeMeridianBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PrimeMeridianRefType_Template">
      <xsl:for-each select="./gml:PrimeMeridian">
         <xsl:call-template name="gml:PrimeMeridian_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ellipsoidName">
         <xsl:call-template name="gml:ellipsoidName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidType_Template">
      <xsl:for-each select="./gml:ellipsoidID">
         <xsl:call-template name="gml:ellipsoidID_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:remarks">
         <xsl:call-template name="gml:remarks_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:semiMajorAxis">
         <xsl:call-template name="gml:semiMajorAxis_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:secondDefiningParameter">
         <xsl:call-template name="gml:secondDefiningParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:EllipsoidBaseType_Template"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidRefType_Template">
      <xsl:for-each select="./gml:Ellipsoid">
         <xsl:call-template name="gml:Ellipsoid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SecondDefiningParameterType_Template">
      <xsl:for-each select="./gml:inverseFlattening">
         <xsl:call-template name="gml:inverseFlattening_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:semiMinorAxis">
         <xsl:call-template name="gml:semiMinorAxis_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:isSphere">
         <xsl:call-template name="gml:isSphere_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:TimeTopologyComplexType_Template">
      <xsl:for-each select="./gml:primitive">
         <xsl:call-template name="gml:primitive_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeComplexType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeTopologyComplexPropertyType_Template">
      <xsl:for-each select="./gml:TimeTopologyComplex">
         <xsl:call-template name="gml:TimeTopologyComplex_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractTimeTopologyPrimitiveType_Template">
      <xsl:for-each select="./gml:complex">
         <xsl:call-template name="gml:complex_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimePrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeTopologyPrimitivePropertyType_Template">
      <xsl:for-each select="./gml:_TimeTopologyPrimitive|./gml:TimeNode|./gml:TimeEdge">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeNodeType_Template">
      <xsl:for-each select="./gml:previousEdge">
         <xsl:call-template name="gml:previousEdge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:nextEdge">
         <xsl:call-template name="gml:nextEdge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:position">
         <xsl:call-template name="gml:position_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeTopologyPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeNodePropertyType_Template">
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeEdgeType_Template">
      <xsl:for-each select="./gml:start">
         <xsl:call-template name="gml:start_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:end">
         <xsl:call-template name="gml:end_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:extent">
         <xsl:call-template name="gml:extent_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractTimeTopologyPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeEdgePropertyType_Template">
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:LengthType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ScaleType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimeType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GridLengthType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AreaType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:VolumeType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SpeedType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AngleChoiceType_Template">
      <xsl:for-each select="./gml:angle">
         <xsl:call-template name="gml:angle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:dmsAngle">
         <xsl:call-template name="gml:dmsAngle_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AngleType_Template">
      <xsl:call-template name="gml:MeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DMSAngleType_Template">
      <xsl:for-each select="./gml:degrees">
         <xsl:call-template name="gml:degrees_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:decimalMinutes">
         <xsl:call-template name="gml:decimalMinutes_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:minutes">
         <xsl:call-template name="gml:minutes_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:seconds">
         <xsl:call-template name="gml:seconds_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:DegreesType_Template">
      <xsl:if test="@gml:direction">
         <xsl:call-template name="gml:direction_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:DegreeValueType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DefaultStylePropertyType_Template">
      <xsl:for-each select="./gml:_Style|./gml:Style">
         <xsl:call-template name="gml:_Style_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractStyleType_Template">
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:StyleType_Template">
      <xsl:for-each select="./gml:featureStyle">
         <xsl:call-template name="gml:featureStyle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:graphStyle">
         <xsl:call-template name="gml:graphStyle_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractStyleType_Template"/>
   </xsl:template>
   <xsl:template name="gml:FeatureStylePropertyType_Template">
      <xsl:for-each select="./gml:FeatureStyle">
         <xsl:call-template name="gml:FeatureStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:FeatureStyleType_Template">
      <xsl:for-each select="./gml:featureConstraint">
         <xsl:call-template name="gml:featureConstraint_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:geometryStyle">
         <xsl:call-template name="gml:geometryStyle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:topologyStyle">
         <xsl:call-template name="gml:topologyStyle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:labelStyle">
         <xsl:call-template name="gml:labelStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:featureType">
         <xsl:call-template name="gml:featureType_Property"/>
      </xsl:if>
      <xsl:if test="@gml:baseType">
         <xsl:call-template name="gml:baseType_Property"/>
      </xsl:if>
      <xsl:if test="@gml:queryGrammar">
         <xsl:call-template name="gml:queryGrammar_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BaseStyleDescriptorType_Template">
      <xsl:for-each select="./gml:spatialResolution">
         <xsl:call-template name="gml:spatialResolution_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:styleVariation">
         <xsl:call-template name="gml:styleVariation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./smil20:animate">
         <xsl:call-template name="smil20:animate_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./smil20:animateMotion">
         <xsl:call-template name="smil20:animateMotion_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./smil20:animateColor">
         <xsl:call-template name="smil20:animateColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./smil20:set">
         <xsl:call-template name="smil20:set_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometryStylePropertyType_Template">
      <xsl:for-each select="./gml:GeometryStyle">
         <xsl:call-template name="gml:GeometryStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometryStyleType_Template">
      <xsl:for-each select="./gml:symbol">
         <xsl:call-template name="gml:symbol_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:style">
         <xsl:call-template name="gml:style_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:labelStyle">
         <xsl:call-template name="gml:labelStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:geometryProperty">
         <xsl:call-template name="gml:geometryProperty_Property"/>
      </xsl:if>
      <xsl:if test="@gml:geometryType">
         <xsl:call-template name="gml:geometryType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:BaseStyleDescriptorType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopologyStylePropertyType_Template">
      <xsl:for-each select="./gml:TopologyStyle">
         <xsl:call-template name="gml:TopologyStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopologyStyleType_Template">
      <xsl:for-each select="./gml:symbol">
         <xsl:call-template name="gml:symbol_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:style">
         <xsl:call-template name="gml:style_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:labelStyle">
         <xsl:call-template name="gml:labelStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:topologyProperty">
         <xsl:call-template name="gml:topologyProperty_Property"/>
      </xsl:if>
      <xsl:if test="@gml:topologyType">
         <xsl:call-template name="gml:topologyType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:BaseStyleDescriptorType_Template"/>
   </xsl:template>
   <xsl:template name="gml:LabelStylePropertyType_Template">
      <xsl:for-each select="./gml:LabelStyle">
         <xsl:call-template name="gml:LabelStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:LabelStyleType_Template">
      <xsl:for-each select="./gml:style">
         <xsl:call-template name="gml:style_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:label">
         <xsl:call-template name="gml:label_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:BaseStyleDescriptorType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GraphStylePropertyType_Template">
      <xsl:for-each select="./gml:GraphStyle">
         <xsl:call-template name="gml:GraphStyle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GraphStyleType_Template">
      <xsl:for-each select="./gml:planar">
         <xsl:call-template name="gml:planar_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:directed">
         <xsl:call-template name="gml:directed_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:grid">
         <xsl:call-template name="gml:grid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:minDistance">
         <xsl:call-template name="gml:minDistance_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:minAngle">
         <xsl:call-template name="gml:minAngle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:graphType">
         <xsl:call-template name="gml:graphType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:drawingType">
         <xsl:call-template name="gml:drawingType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:lineType">
         <xsl:call-template name="gml:lineType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:aestheticCriteria">
         <xsl:call-template name="gml:aestheticCriteria_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:BaseStyleDescriptorType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SymbolType_Template">
      <xsl:if test="@gml:symbolType">
         <xsl:call-template name="gml:symbolType_Property"/>
      </xsl:if>
      <xsl:if test="@gml:transform">
         <xsl:call-template name="gml:transform_Property"/>
      </xsl:if>
      <xsl:if test="@gml:about">
         <xsl:call-template name="gml:about_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:LabelType_Template">
      <xsl:for-each select="./gml:LabelExpression">
         <xsl:call-template name="gml:LabelExpression_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:transform">
         <xsl:call-template name="gml:transform_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gml:StyleVariationType_Template">
      <xsl:if test="@gml:styleProperty">
         <xsl:call-template name="gml:styleProperty_Property"/>
      </xsl:if>
      <xsl:if test="@gml:featurePropertyRange">
         <xsl:call-template name="gml:featurePropertyRange_Property"/>
      </xsl:if>
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:CurveType_Template">
      <xsl:for-each select="./gml:segments">
         <xsl:call-template name="gml:segments_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCurveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OrientableCurveType_Template">
      <xsl:for-each select="./gml:baseCurve">
         <xsl:call-template name="gml:baseCurve_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:orientation">
         <xsl:call-template name="gml:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractCurveSegmentType_Template">
      <xsl:if test="@gml:numDerivativesAtStart">
         <xsl:call-template name="gml:numDerivativesAtStart_Property"/>
      </xsl:if>
      <xsl:if test="@gml:numDerivativesAtEnd">
         <xsl:call-template name="gml:numDerivativesAtEnd_Property"/>
      </xsl:if>
      <xsl:if test="@gml:numDerivativeInterior">
         <xsl:call-template name="gml:numDerivativeInterior_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gml:CurveSegmentArrayPropertyType_Template">
      <xsl:for-each select="./gml:_CurveSegment|./gml:LineStringSegment|./gml:ArcString|./gml:Arc|./gml:Circle|./gml:ArcStringByBulge|./gml:ArcByBulge|./gml:ArcByCenterPoint|./gml:CircleByCenterPoint|./gml:OffsetCurve|./gml:Clothoid|./gml:GeodesicString|./gml:Geodesic|./gml:CubicSpline|./gml:BSpline|./gml:Bezier">
         <xsl:call-template name="gml:_CurveSegment_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:LineStringSegmentType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArcStringType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:if test="@gml:numArc">
         <xsl:call-template name="gml:numArc_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArcType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:numArc">
         <xsl:call-template name="gml:numArc_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:ArcStringType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CircleType_Template">
      <xsl:call-template name="gml:ArcType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArcStringByBulgeType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:bulge">
         <xsl:call-template name="gml:bulge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:normal">
         <xsl:call-template name="gml:normal_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:if test="@gml:numArc">
         <xsl:call-template name="gml:numArc_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArcByBulgeType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:bulge">
         <xsl:call-template name="gml:bulge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:normal">
         <xsl:call-template name="gml:normal_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:numArc">
         <xsl:call-template name="gml:numArc_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:ArcStringByBulgeType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArcByCenterPointType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:radius">
         <xsl:call-template name="gml:radius_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:startAngle">
         <xsl:call-template name="gml:startAngle_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:endAngle">
         <xsl:call-template name="gml:endAngle_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:if test="@gml:numArc">
         <xsl:call-template name="gml:numArc_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CircleByCenterPointType_Template">
      <xsl:call-template name="gml:ArcByCenterPointType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OffsetCurveType_Template">
      <xsl:for-each select="./gml:offsetBase">
         <xsl:call-template name="gml:offsetBase_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:distance">
         <xsl:call-template name="gml:distance_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:refDirection">
         <xsl:call-template name="gml:refDirection_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AffinePlacementType_Template">
      <xsl:for-each select="./gml:location|./gml:priorityLocation">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:refDirection">
         <xsl:call-template name="gml:refDirection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:inDimension">
         <xsl:call-template name="gml:inDimension_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:outDimension">
         <xsl:call-template name="gml:outDimension_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:ClothoidType_Template">
      <xsl:for-each select="./gml:refLocation">
         <xsl:call-template name="gml:refLocation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:scaleFactor">
         <xsl:call-template name="gml:scaleFactor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:startParameter">
         <xsl:call-template name="gml:startParameter_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:endParameter">
         <xsl:call-template name="gml:endParameter_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:refLocation_Template"/>
   <xsl:template name="gml:GeodesicStringType_Template">
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:geometricPositionGroup_Template"/>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeodesicType_Template">
      <xsl:call-template name="gml:GeodesicStringType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CubicSplineType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:vectorAtStart">
         <xsl:call-template name="gml:vectorAtStart_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:vectorAtEnd">
         <xsl:call-template name="gml:vectorAtEnd_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:if test="@gml:degree">
         <xsl:call-template name="gml:degree_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:KnotType_Template">
      <xsl:for-each select="./gml:value">
         <xsl:call-template name="gml:value_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiplicity">
         <xsl:call-template name="gml:multiplicity_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:weight">
         <xsl:call-template name="gml:weight_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:KnotPropertyType_Template">
      <xsl:for-each select="./gml:Knot">
         <xsl:call-template name="gml:Knot_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:BSplineType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:degree">
         <xsl:call-template name="gml:degree_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:knot">
         <xsl:call-template name="gml:knot_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:if test="@gml:isPolynomial">
         <xsl:call-template name="gml:isPolynomial_Property"/>
      </xsl:if>
      <xsl:if test="@gml:knotType">
         <xsl:call-template name="gml:knotType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BezierType_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointRep">
         <xsl:call-template name="gml:pointRep_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinates">
         <xsl:call-template name="gml:coordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:degree">
         <xsl:call-template name="gml:degree_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:knot">
         <xsl:call-template name="gml:knot_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:if test="@gml:isPolynomial">
         <xsl:call-template name="gml:isPolynomial_Property"/>
      </xsl:if>
      <xsl:if test="@gml:knotType">
         <xsl:call-template name="gml:knotType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:BSplineType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SurfaceType_Template">
      <xsl:for-each select="./gml:patches|./gml:polygonPatches|./gml:trianglePatches">
         <xsl:call-template name="gml:patches_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:OrientableSurfaceType_Template">
      <xsl:for-each select="./gml:baseSurface">
         <xsl:call-template name="gml:baseSurface_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:orientation">
         <xsl:call-template name="gml:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractSurfacePatchType_Template"/>
   <xsl:template name="gml:SurfacePatchArrayPropertyType_Template">
      <xsl:for-each select="./gml:_SurfacePatch|./gml:PolygonPatch|./gml:Triangle|./gml:Rectangle|./gml:_ParametricCurveSurface|./gml:_GriddedSurface|./gml:Cone|./gml:Cylinder|./gml:Sphere">
         <xsl:call-template name="gml:_SurfacePatch_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:PolygonPatchType_Template">
      <xsl:for-each select="./gml:exterior|./gml:outerBoundaryIs">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interior|./gml:innerBoundaryIs">
         <xsl:call-template name="gml:interior_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TriangleType_Template">
      <xsl:for-each select="./gml:exterior|./gml:outerBoundaryIs">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RectangleType_Template">
      <xsl:for-each select="./gml:exterior|./gml:outerBoundaryIs">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RingType_Template">
      <xsl:for-each select="./gml:curveMember">
         <xsl:call-template name="gml:curveMember_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractRingType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RingPropertyType_Template">
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:row_Template">
      <xsl:call-template name="gml:geometricPositionListGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractParametricCurveSurfaceType_Template">
      <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGriddedSurfaceType_Template">
      <xsl:for-each select="./gml:rows">
         <xsl:call-template name="gml:rows_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:columns">
         <xsl:call-template name="gml:columns_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:PointGrid_Template"/>
      <xsl:call-template name="gml:AbstractParametricCurveSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConeType_Template">
      <xsl:if test="@gml:horizontalCurveType">
         <xsl:call-template name="gml:horizontalCurveType_Property"/>
      </xsl:if>
      <xsl:if test="@gml:verticalCurveType">
         <xsl:call-template name="gml:verticalCurveType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGriddedSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:CylinderType_Template">
      <xsl:if test="@gml:horizontalCurveType">
         <xsl:call-template name="gml:horizontalCurveType_Property"/>
      </xsl:if>
      <xsl:if test="@gml:verticalCurveType">
         <xsl:call-template name="gml:verticalCurveType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGriddedSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SphereType_Template">
      <xsl:if test="@gml:horizontalCurveType">
         <xsl:call-template name="gml:horizontalCurveType_Property"/>
      </xsl:if>
      <xsl:if test="@gml:verticalCurveType">
         <xsl:call-template name="gml:verticalCurveType_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGriddedSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PolyhedralSurfaceType_Template">
      <xsl:for-each select="./gml:polygonPatches">
         <xsl:call-template name="gml:polygonPatches_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:SurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:PolygonPatchArrayPropertyType_Template">
      <xsl:for-each select="./gml:PolygonPatch">
         <xsl:call-template name="gml:PolygonPatch_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:SurfacePatchArrayPropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TrianglePatchArrayPropertyType_Template">
      <xsl:for-each select="./gml:Triangle">
         <xsl:call-template name="gml:Triangle_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:SurfacePatchArrayPropertyType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TriangulatedSurfaceType_Template">
      <xsl:for-each select="./gml:trianglePatches">
         <xsl:call-template name="gml:trianglePatches_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:SurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TinType_Template">
      <xsl:for-each select="./gml:stopLines">
         <xsl:call-template name="gml:stopLines_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:breakLines">
         <xsl:call-template name="gml:breakLines_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:maxLength">
         <xsl:call-template name="gml:maxLength_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:controlPoint">
         <xsl:call-template name="gml:controlPoint_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:TriangulatedSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:controlPoint_Template"/>
   <xsl:template name="gml:LineStringSegmentArrayPropertyType_Template">
      <xsl:for-each select="./gml:LineStringSegment">
         <xsl:call-template name="gml:LineStringSegment_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractSolidType_Template">
      <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SolidPropertyType_Template">
      <xsl:for-each select="./gml:_Solid|./gml:CompositeSolid|./gml:Solid">
         <xsl:call-template name="gml:_Solid_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SolidArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Solid|./gml:CompositeSolid|./gml:Solid">
         <xsl:call-template name="gml:_Solid_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:SolidType_Template">
      <xsl:for-each select="./gml:exterior|./gml:outerBoundaryIs">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interior|./gml:innerBoundaryIs">
         <xsl:call-template name="gml:interior_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSolidType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GridType_Template">
      <xsl:for-each select="./gml:limits">
         <xsl:call-template name="gml:limits_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:axisName">
         <xsl:call-template name="gml:axisName_Property"/>
      </xsl:for-each>
      <xsl:if test="@gml:dimension">
         <xsl:call-template name="gml:dimension_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GridLimitsType_Template">
      <xsl:for-each select="./gml:GridEnvelope">
         <xsl:call-template name="gml:GridEnvelope_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:GridEnvelopeType_Template">
      <xsl:for-each select="./gml:low">
         <xsl:call-template name="gml:low_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:high">
         <xsl:call-template name="gml:high_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:RectifiedGridType_Template">
      <xsl:for-each select="./gml:origin">
         <xsl:call-template name="gml:origin_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:offsetVector">
         <xsl:call-template name="gml:offsetVector_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:GridType_Template"/>
   </xsl:template>
   <xsl:template name="gml:UnitOfMeasureType_Template">
      <xsl:if test="@gml:uom">
         <xsl:call-template name="gml:uom_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gml:UnitDefinitionType_Template">
      <xsl:for-each select="./gml:quantityType">
         <xsl:call-template name="gml:quantityType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:catalogSymbol">
         <xsl:call-template name="gml:catalogSymbol_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BaseUnitType_Template">
      <xsl:for-each select="./gml:unitsSystem">
         <xsl:call-template name="gml:unitsSystem_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:UnitDefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DerivedUnitType_Template">
      <xsl:for-each select="./gml:derivationUnitTerm">
         <xsl:call-template name="gml:derivationUnitTerm_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:UnitDefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConventionalUnitType_Template">
      <xsl:for-each select="./gml:conversionToPreferredUnit">
         <xsl:call-template name="gml:conversionToPreferredUnit_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:roughConversionToPreferredUnit">
         <xsl:call-template name="gml:roughConversionToPreferredUnit_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:derivationUnitTerm">
         <xsl:call-template name="gml:derivationUnitTerm_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:UnitDefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DerivationUnitTermType_Template">
      <xsl:if test="@gml:exponent">
         <xsl:call-template name="gml:exponent_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:UnitOfMeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:ConversionToPreferredUnitType_Template">
      <xsl:for-each select="./gml:factor">
         <xsl:call-template name="gml:factor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:formula">
         <xsl:call-template name="gml:formula_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:UnitOfMeasureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:FormulaType_Template">
      <xsl:for-each select="./gml:a">
         <xsl:call-template name="gml:a_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:b">
         <xsl:call-template name="gml:b_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:c">
         <xsl:call-template name="gml:c_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:d">
         <xsl:call-template name="gml:d_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="app:AppearanceType_Template">
      <xsl:for-each select="./app:theme">
         <xsl:call-template name="app:theme_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:surfaceDataMember">
         <xsl:call-template name="app:surfaceDataMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfAppearance">
         <xsl:call-template name="app:_GenericApplicationPropertyOfAppearance_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="app:AppearancePropertyType_Template">
      <xsl:for-each select="./app:Appearance">
         <xsl:call-template name="app:Appearance_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="app:AbstractSurfaceDataType_Template">
      <xsl:for-each select="./app:isFront">
         <xsl:call-template name="app:isFront_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfSurfaceData">
         <xsl:call-template name="app:_GenericApplicationPropertyOfSurfaceData_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="app:SurfaceDataPropertyType_Template">
      <xsl:for-each select="./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial">
         <xsl:call-template name="app:_SurfaceData_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="app:AbstractTextureType_Template">
      <xsl:for-each select="./app:imageURI">
         <xsl:call-template name="app:imageURI_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:mimeType">
         <xsl:call-template name="app:mimeType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:textureType">
         <xsl:call-template name="app:textureType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:wrapMode">
         <xsl:call-template name="app:wrapMode_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:borderColor">
         <xsl:call-template name="app:borderColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfTexture">
         <xsl:call-template name="app:_GenericApplicationPropertyOfTexture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="app:AbstractSurfaceDataType_Template"/>
   </xsl:template>
   <xsl:template name="app:ParameterizedTextureType_Template">
      <xsl:for-each select="./app:target">
         <xsl:call-template name="app:target_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfParameterizedTexture">
         <xsl:call-template name="app:_GenericApplicationPropertyOfParameterizedTexture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="app:AbstractTextureType_Template"/>
   </xsl:template>
   <xsl:template name="app:GeoreferencedTextureType_Template">
      <xsl:for-each select="./app:preferWorldFile">
         <xsl:call-template name="app:preferWorldFile_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:referencePoint">
         <xsl:call-template name="app:referencePoint_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:orientation">
         <xsl:call-template name="app:orientation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:target">
         <xsl:call-template name="app:target_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfGeoreferencedTexture">
         <xsl:call-template name="app:_GenericApplicationPropertyOfGeoreferencedTexture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="app:AbstractTextureType_Template"/>
   </xsl:template>
   <xsl:template name="app:TextureAssociationType_Template">
      <xsl:for-each select="./app:_TextureParameterization|./app:TexCoordList|./app:TexCoordGen">
         <xsl:call-template name="app:_TextureParameterization_Property"/>
      </xsl:for-each>
      <xsl:if test="@app:uri">
         <xsl:call-template name="app:uri_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="app:AbstractTextureParameterizationType_Template">
      <xsl:for-each select="./app:_GenericApplicationPropertyOfTextureParameterization">
         <xsl:call-template name="app:_GenericApplicationPropertyOfTextureParameterization_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="app:TexCoordListType_Template">
      <xsl:for-each select="./app:textureCoordinates">
         <xsl:call-template name="app:textureCoordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfTexCoordList">
         <xsl:call-template name="app:_GenericApplicationPropertyOfTexCoordList_Property"/>
      </xsl:for-each>
      <xsl:call-template name="app:AbstractTextureParameterizationType_Template"/>
   </xsl:template>
   <xsl:template name="app:textureCoordinates_Template">
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="app:TexCoordGenType_Template">
      <xsl:for-each select="./app:worldToTexture">
         <xsl:call-template name="app:worldToTexture_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfTexCoordGen">
         <xsl:call-template name="app:_GenericApplicationPropertyOfTexCoordGen_Property"/>
      </xsl:for-each>
      <xsl:call-template name="app:AbstractTextureParameterizationType_Template"/>
   </xsl:template>
   <xsl:template name="app:worldToTexture_Template">
      <xsl:call-template name="core:TransformationMatrix3x4Type_Template"/>
   </xsl:template>
   <xsl:template name="app:X3DMaterialType_Template">
      <xsl:for-each select="./app:ambientIntensity">
         <xsl:call-template name="app:ambientIntensity_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:diffuseColor">
         <xsl:call-template name="app:diffuseColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:emissiveColor">
         <xsl:call-template name="app:emissiveColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:specularColor">
         <xsl:call-template name="app:specularColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:shininess">
         <xsl:call-template name="app:shininess_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:transparency">
         <xsl:call-template name="app:transparency_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:isSmooth">
         <xsl:call-template name="app:isSmooth_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:target">
         <xsl:call-template name="app:target_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./app:_GenericApplicationPropertyOfX3DMaterial">
         <xsl:call-template name="app:_GenericApplicationPropertyOfX3DMaterial_Property"/>
      </xsl:for-each>
      <xsl:call-template name="app:AbstractSurfaceDataType_Template"/>
   </xsl:template>
   <xsl:template name="frn:CityFurnitureType_Template">
      <xsl:for-each select="./frn:class">
         <xsl:call-template name="frn:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:function">
         <xsl:call-template name="frn:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:usage">
         <xsl:call-template name="frn:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod1Geometry">
         <xsl:call-template name="frn:lod1Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod2Geometry">
         <xsl:call-template name="frn:lod2Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod3Geometry">
         <xsl:call-template name="frn:lod3Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod4Geometry">
         <xsl:call-template name="frn:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod1TerrainIntersection">
         <xsl:call-template name="frn:lod1TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod2TerrainIntersection">
         <xsl:call-template name="frn:lod2TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod3TerrainIntersection">
         <xsl:call-template name="frn:lod3TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod4TerrainIntersection">
         <xsl:call-template name="frn:lod4TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod1ImplicitRepresentation">
         <xsl:call-template name="frn:lod1ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod2ImplicitRepresentation">
         <xsl:call-template name="frn:lod2ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod3ImplicitRepresentation">
         <xsl:call-template name="frn:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:lod4ImplicitRepresentation">
         <xsl:call-template name="frn:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./frn:_GenericApplicationPropertyOfCityFurniture">
         <xsl:call-template name="frn:_GenericApplicationPropertyOfCityFurniture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="wtr:AbstractWaterObjectType_Template">
      <xsl:for-each select="./wtr:_GenericApplicationPropertyOfWaterObject">
         <xsl:call-template name="wtr:_GenericApplicationPropertyOfWaterObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="wtr:WaterBodyType_Template">
      <xsl:for-each select="./wtr:class">
         <xsl:call-template name="wtr:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:function">
         <xsl:call-template name="wtr:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:usage">
         <xsl:call-template name="wtr:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod0MultiCurve">
         <xsl:call-template name="wtr:lod0MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod0MultiSurface">
         <xsl:call-template name="wtr:lod0MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod1MultiCurve">
         <xsl:call-template name="wtr:lod1MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod1MultiSurface">
         <xsl:call-template name="wtr:lod1MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod1Solid">
         <xsl:call-template name="wtr:lod1Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod2Solid">
         <xsl:call-template name="wtr:lod2Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod3Solid">
         <xsl:call-template name="wtr:lod3Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod4Solid">
         <xsl:call-template name="wtr:lod4Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:boundedBy">
         <xsl:call-template name="wtr:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:_GenericApplicationPropertyOfWaterBody">
         <xsl:call-template name="wtr:_GenericApplicationPropertyOfWaterBody_Property"/>
      </xsl:for-each>
      <xsl:call-template name="wtr:AbstractWaterObjectType_Template"/>
   </xsl:template>
   <xsl:template name="wtr:BoundedByWaterSurfacePropertyType_Template">
      <xsl:for-each select="./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface">
         <xsl:call-template name="wtr:_WaterBoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="wtr:AbstractWaterBoundarySurfaceType_Template">
      <xsl:for-each select="./wtr:lod2Surface">
         <xsl:call-template name="wtr:lod2Surface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod3Surface">
         <xsl:call-template name="wtr:lod3Surface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:lod4Surface">
         <xsl:call-template name="wtr:lod4Surface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:_GenericApplicationPropertyOfWaterBoundarySurface">
         <xsl:call-template name="wtr:_GenericApplicationPropertyOfWaterBoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="wtr:WaterSurfaceType_Template">
      <xsl:for-each select="./wtr:waterLevel">
         <xsl:call-template name="wtr:waterLevel_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./wtr:_GenericApplicationPropertyOfWaterSurface">
         <xsl:call-template name="wtr:_GenericApplicationPropertyOfWaterSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="wtr:AbstractWaterBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="wtr:WaterGroundSurfaceType_Template">
      <xsl:for-each select="./wtr:_GenericApplicationPropertyOfWaterGroundSurface">
         <xsl:call-template name="wtr:_GenericApplicationPropertyOfWaterGroundSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="wtr:AbstractWaterBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="wtr:WaterClosureSurfaceType_Template">
      <xsl:for-each select="./wtr:_GenericApplicationPropertyOfWaterClosureSurface">
         <xsl:call-template name="wtr:_GenericApplicationPropertyOfWaterClosureSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="wtr:AbstractWaterBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="core:CityModelType_Template">
      <xsl:for-each select="./core:_GenericApplicationPropertyOfCityModel">
         <xsl:call-template name="core:_GenericApplicationPropertyOfCityModel_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureCollectionType_Template"/>
   </xsl:template>
   <xsl:template name="core:AbstractCityObjectType_Template">
      <xsl:for-each select="./core:creationDate">
         <xsl:call-template name="core:creationDate_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:terminationDate">
         <xsl:call-template name="core:terminationDate_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:externalReference">
         <xsl:call-template name="core:externalReference_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:generalizesTo">
         <xsl:call-template name="core:generalizesTo_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:relativeToTerrain">
         <xsl:call-template name="core:relativeToTerrain_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:relativeToWater">
         <xsl:call-template name="core:relativeToWater_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_GenericApplicationPropertyOfCityObject|./app:appearance|./gen:_genericAttribute|./gen:stringAttribute|./gen:intAttribute|./gen:doubleAttribute|./gen:dateAttribute|./gen:uriAttribute|./gen:measureAttribute|./gen:genericAttributeSet">
         <xsl:call-template name="core:_GenericApplicationPropertyOfCityObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="core:AbstractSiteType_Template">
      <xsl:for-each select="./core:_GenericApplicationPropertyOfSite">
         <xsl:call-template name="core:_GenericApplicationPropertyOfSite_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="core:GeneralizationRelationType_Template">
      <xsl:for-each select="./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject">
         <xsl:call-template name="core:_CityObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="core:ExternalReferenceType_Template">
      <xsl:for-each select="./core:informationSystem">
         <xsl:call-template name="core:informationSystem_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:externalObject">
         <xsl:call-template name="core:externalObject_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="core:ExternalObjectReferenceType_Template">
      <xsl:for-each select="./core:name">
         <xsl:call-template name="core:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:uri">
         <xsl:call-template name="core:uri_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="core:AddressPropertyType_Template">
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="core:AddressType_Template">
      <xsl:for-each select="./core:xalAddress">
         <xsl:call-template name="core:xalAddress_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:multiPoint">
         <xsl:call-template name="core:multiPoint_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_GenericApplicationPropertyOfAddress">
         <xsl:call-template name="core:_GenericApplicationPropertyOfAddress_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="core:xalAddressPropertyType_Template">
      <xsl:for-each select="./xAL:AddressDetails">
         <xsl:call-template name="xAL:AddressDetails_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="core:ImplicitGeometryType_Template">
      <xsl:for-each select="./core:mimeType">
         <xsl:call-template name="core:mimeType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:transformationMatrix">
         <xsl:call-template name="core:transformationMatrix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:libraryObject">
         <xsl:call-template name="core:libraryObject_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:relativeGMLGeometry">
         <xsl:call-template name="core:relativeGMLGeometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:referencePoint">
         <xsl:call-template name="core:referencePoint_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="core:ImplicitRepresentationPropertyType_Template">
      <xsl:for-each select="./core:ImplicitGeometry">
         <xsl:call-template name="core:ImplicitGeometry_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="veg:AbstractVegetationObjectType_Template">
      <xsl:for-each select="./veg:_GenericApplicationPropertyOfVegetationObject">
         <xsl:call-template name="veg:_GenericApplicationPropertyOfVegetationObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="veg:PlantCoverType_Template">
      <xsl:for-each select="./veg:class">
         <xsl:call-template name="veg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:function">
         <xsl:call-template name="veg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:usage">
         <xsl:call-template name="veg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:averageHeight">
         <xsl:call-template name="veg:averageHeight_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod1MultiSurface">
         <xsl:call-template name="veg:lod1MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod2MultiSurface">
         <xsl:call-template name="veg:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod3MultiSurface">
         <xsl:call-template name="veg:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod4MultiSurface">
         <xsl:call-template name="veg:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod1MultiSolid">
         <xsl:call-template name="veg:lod1MultiSolid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod2MultiSolid">
         <xsl:call-template name="veg:lod2MultiSolid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod3MultiSolid">
         <xsl:call-template name="veg:lod3MultiSolid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod4MultiSolid">
         <xsl:call-template name="veg:lod4MultiSolid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:_GenericApplicationPropertyOfPlantCover">
         <xsl:call-template name="veg:_GenericApplicationPropertyOfPlantCover_Property"/>
      </xsl:for-each>
      <xsl:call-template name="veg:AbstractVegetationObjectType_Template"/>
   </xsl:template>
   <xsl:template name="veg:SolitaryVegetationObjectType_Template">
      <xsl:for-each select="./veg:class">
         <xsl:call-template name="veg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:function">
         <xsl:call-template name="veg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:usage">
         <xsl:call-template name="veg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:species">
         <xsl:call-template name="veg:species_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:height">
         <xsl:call-template name="veg:height_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:trunkDiameter">
         <xsl:call-template name="veg:trunkDiameter_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:crownDiameter">
         <xsl:call-template name="veg:crownDiameter_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod1Geometry">
         <xsl:call-template name="veg:lod1Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod2Geometry">
         <xsl:call-template name="veg:lod2Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod3Geometry">
         <xsl:call-template name="veg:lod3Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod4Geometry">
         <xsl:call-template name="veg:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod1ImplicitRepresentation">
         <xsl:call-template name="veg:lod1ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod2ImplicitRepresentation">
         <xsl:call-template name="veg:lod2ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod3ImplicitRepresentation">
         <xsl:call-template name="veg:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:lod4ImplicitRepresentation">
         <xsl:call-template name="veg:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./veg:_GenericApplicationPropertyOfSolitaryVegetationObject">
         <xsl:call-template name="veg:_GenericApplicationPropertyOfSolitaryVegetationObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="veg:AbstractVegetationObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tran:AbstractTransportationObjectType_Template">
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfTransportationObject">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfTransportationObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tran:TransportationComplexType_Template">
      <xsl:for-each select="./tran:class">
         <xsl:call-template name="tran:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:function">
         <xsl:call-template name="tran:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:usage">
         <xsl:call-template name="tran:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:trafficArea">
         <xsl:call-template name="tran:trafficArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:auxiliaryTrafficArea">
         <xsl:call-template name="tran:auxiliaryTrafficArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod0Network">
         <xsl:call-template name="tran:lod0Network_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod1MultiSurface">
         <xsl:call-template name="tran:lod1MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod2MultiSurface">
         <xsl:call-template name="tran:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod3MultiSurface">
         <xsl:call-template name="tran:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod4MultiSurface">
         <xsl:call-template name="tran:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfTransportationComplex">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfTransportationComplex_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:AbstractTransportationObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tran:TrafficAreaType_Template">
      <xsl:for-each select="./tran:class">
         <xsl:call-template name="tran:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:function">
         <xsl:call-template name="tran:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:usage">
         <xsl:call-template name="tran:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:surfaceMaterial">
         <xsl:call-template name="tran:surfaceMaterial_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod2MultiSurface">
         <xsl:call-template name="tran:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod3MultiSurface">
         <xsl:call-template name="tran:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod4MultiSurface">
         <xsl:call-template name="tran:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfTrafficArea">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfTrafficArea_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:AbstractTransportationObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tran:AuxiliaryTrafficAreaType_Template">
      <xsl:for-each select="./tran:class">
         <xsl:call-template name="tran:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:function">
         <xsl:call-template name="tran:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:usage">
         <xsl:call-template name="tran:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:surfaceMaterial">
         <xsl:call-template name="tran:surfaceMaterial_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod2MultiSurface">
         <xsl:call-template name="tran:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod3MultiSurface">
         <xsl:call-template name="tran:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:lod4MultiSurface">
         <xsl:call-template name="tran:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfAuxiliaryTrafficArea">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfAuxiliaryTrafficArea_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:AbstractTransportationObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tran:TrafficAreaPropertyType_Template">
      <xsl:for-each select="./tran:TrafficArea">
         <xsl:call-template name="tran:TrafficArea_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tran:AuxiliaryTrafficAreaPropertyType_Template">
      <xsl:for-each select="./tran:AuxiliaryTrafficArea">
         <xsl:call-template name="tran:AuxiliaryTrafficArea_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tran:TrackType_Template">
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfTrack">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfTrack_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:TransportationComplexType_Template"/>
   </xsl:template>
   <xsl:template name="tran:RoadType_Template">
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfRoad">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfRoad_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:TransportationComplexType_Template"/>
   </xsl:template>
   <xsl:template name="tran:RailwayType_Template">
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfRailway">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfRailway_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:TransportationComplexType_Template"/>
   </xsl:template>
   <xsl:template name="tran:SquareType_Template">
      <xsl:for-each select="./tran:_GenericApplicationPropertyOfSquare">
         <xsl:call-template name="tran:_GenericApplicationPropertyOfSquare_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tran:TransportationComplexType_Template"/>
   </xsl:template>
   <xsl:template name="tex:TexturedSurfaceType_Template">
      <xsl:for-each select="./tex:appearance">
         <xsl:call-template name="tex:appearance_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:OrientableSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tex:AppearancePropertyType_Template">
      <xsl:for-each select="./tex:_Appearance|./tex:Material|./tex:SimpleTexture">
         <xsl:call-template name="tex:_Appearance_Property"/>
      </xsl:for-each>
      <xsl:if test="@tex:orientation">
         <xsl:call-template name="tex:orientation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tex:AbstractAppearanceType_Template">
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="tex:MaterialType_Template">
      <xsl:for-each select="./tex:shininess">
         <xsl:call-template name="tex:shininess_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:transparency">
         <xsl:call-template name="tex:transparency_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:ambientIntensity">
         <xsl:call-template name="tex:ambientIntensity_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:specularColor">
         <xsl:call-template name="tex:specularColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:diffuseColor">
         <xsl:call-template name="tex:diffuseColor_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:emissiveColor">
         <xsl:call-template name="tex:emissiveColor_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tex:AbstractAppearanceType_Template"/>
   </xsl:template>
   <xsl:template name="tex:SimpleTextureType_Template">
      <xsl:for-each select="./tex:textureMap">
         <xsl:call-template name="tex:textureMap_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:textureCoordinates">
         <xsl:call-template name="tex:textureCoordinates_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:textureType">
         <xsl:call-template name="tex:textureType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tex:repeat">
         <xsl:call-template name="tex:repeat_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tex:AbstractAppearanceType_Template"/>
   </xsl:template>
   <xsl:template name="luse:LandUseType_Template">
      <xsl:for-each select="./luse:class">
         <xsl:call-template name="luse:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:function">
         <xsl:call-template name="luse:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:usage">
         <xsl:call-template name="luse:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:lod0MultiSurface">
         <xsl:call-template name="luse:lod0MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:lod1MultiSurface">
         <xsl:call-template name="luse:lod1MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:lod2MultiSurface">
         <xsl:call-template name="luse:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:lod3MultiSurface">
         <xsl:call-template name="luse:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:lod4MultiSurface">
         <xsl:call-template name="luse:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./luse:_GenericApplicationPropertyOfLandUse">
         <xsl:call-template name="luse:_GenericApplicationPropertyOfLandUse_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:AbstractTunnelType_Template">
      <xsl:for-each select="./tun:class">
         <xsl:call-template name="tun:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:function">
         <xsl:call-template name="tun:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:usage">
         <xsl:call-template name="tun:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:yearOfConstruction">
         <xsl:call-template name="tun:yearOfConstruction_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:yearOfDemolition">
         <xsl:call-template name="tun:yearOfDemolition_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod1Solid">
         <xsl:call-template name="tun:lod1Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod1MultiSurface">
         <xsl:call-template name="tun:lod1MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod1TerrainIntersection">
         <xsl:call-template name="tun:lod1TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod2Solid">
         <xsl:call-template name="tun:lod2Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod2MultiSurface">
         <xsl:call-template name="tun:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod2MultiCurve">
         <xsl:call-template name="tun:lod2MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod2TerrainIntersection">
         <xsl:call-template name="tun:lod2TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:outerTunnelInstallation">
         <xsl:call-template name="tun:outerTunnelInstallation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:interiorTunnelInstallation">
         <xsl:call-template name="tun:interiorTunnelInstallation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:boundedBy">
         <xsl:call-template name="tun:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3Solid">
         <xsl:call-template name="tun:lod3Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3MultiSurface">
         <xsl:call-template name="tun:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3MultiCurve">
         <xsl:call-template name="tun:lod3MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3TerrainIntersection">
         <xsl:call-template name="tun:lod3TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4Solid">
         <xsl:call-template name="tun:lod4Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4MultiSurface">
         <xsl:call-template name="tun:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4MultiCurve">
         <xsl:call-template name="tun:lod4MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4TerrainIntersection">
         <xsl:call-template name="tun:lod4TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:interiorHollowSpace">
         <xsl:call-template name="tun:interiorHollowSpace_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:consistsOfTunnelPart">
         <xsl:call-template name="tun:consistsOfTunnelPart_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfAbstractTunnel">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfAbstractTunnel_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractSiteType_Template"/>
   </xsl:template>
   <xsl:template name="tun:TunnelType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfTunnel">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfTunnel_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractTunnelType_Template"/>
   </xsl:template>
   <xsl:template name="tun:TunnelPartType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfTunnelPart">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfTunnelPart_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractTunnelType_Template"/>
   </xsl:template>
   <xsl:template name="tun:TunnelPartPropertyType_Template">
      <xsl:for-each select="./tun:TunnelPart">
         <xsl:call-template name="tun:TunnelPart_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:TunnelInstallationType_Template">
      <xsl:for-each select="./tun:class">
         <xsl:call-template name="tun:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:function">
         <xsl:call-template name="tun:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:usage">
         <xsl:call-template name="tun:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod2Geometry">
         <xsl:call-template name="tun:lod2Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3Geometry">
         <xsl:call-template name="tun:lod3Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4Geometry">
         <xsl:call-template name="tun:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod2ImplicitRepresentation">
         <xsl:call-template name="tun:lod2ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3ImplicitRepresentation">
         <xsl:call-template name="tun:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4ImplicitRepresentation">
         <xsl:call-template name="tun:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:boundedBy">
         <xsl:call-template name="tun:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfTunnelInstallation">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfTunnelInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:TunnelInstallationPropertyType_Template">
      <xsl:for-each select="./tun:TunnelInstallation">
         <xsl:call-template name="tun:TunnelInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:IntTunnelInstallationType_Template">
      <xsl:for-each select="./tun:class">
         <xsl:call-template name="tun:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:function">
         <xsl:call-template name="tun:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:usage">
         <xsl:call-template name="tun:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4Geometry">
         <xsl:call-template name="tun:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4ImplicitRepresentation">
         <xsl:call-template name="tun:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:boundedBy">
         <xsl:call-template name="tun:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfIntTunnelInstallation">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfIntTunnelInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:IntTunnelInstallationPropertyType_Template">
      <xsl:for-each select="./tun:IntTunnelInstallation">
         <xsl:call-template name="tun:IntTunnelInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:BoundarySurfacePropertyType_Template">
      <xsl:for-each select="./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface">
         <xsl:call-template name="tun:_BoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:AbstractBoundarySurfaceType_Template">
      <xsl:for-each select="./tun:lod2MultiSurface">
         <xsl:call-template name="tun:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3MultiSurface">
         <xsl:call-template name="tun:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4MultiSurface">
         <xsl:call-template name="tun:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:opening">
         <xsl:call-template name="tun:opening_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfBoundarySurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfBoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:RoofSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfRoofSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfRoofSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:WallSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfWallSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfWallSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:GroundSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfGroundSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfGroundSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:ClosureSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfClosureSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfClosureSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:FloorSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfFloorSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfFloorSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:OuterFloorSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfOuterFloorSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfOuterFloorSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:InteriorWallSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfInteriorWallSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfInteriorWallSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:CeilingSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfCeilingSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfCeilingSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:OuterCeilingSurfaceType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfOuterCeilingSurface">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfOuterCeilingSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="tun:HollowSpaceType_Template">
      <xsl:for-each select="./tun:class">
         <xsl:call-template name="tun:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:function">
         <xsl:call-template name="tun:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:usage">
         <xsl:call-template name="tun:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4Solid">
         <xsl:call-template name="tun:lod4Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4MultiSurface">
         <xsl:call-template name="tun:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:boundedBy">
         <xsl:call-template name="tun:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:interiorFurniture">
         <xsl:call-template name="tun:interiorFurniture_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:hollowSpaceInstallation">
         <xsl:call-template name="tun:hollowSpaceInstallation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfHollowSpace">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfHollowSpace_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:InteriorHollowSpacePropertyType_Template">
      <xsl:for-each select="./tun:HollowSpace">
         <xsl:call-template name="tun:HollowSpace_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:TunnelFurnitureType_Template">
      <xsl:for-each select="./tun:class">
         <xsl:call-template name="tun:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:function">
         <xsl:call-template name="tun:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:usage">
         <xsl:call-template name="tun:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4Geometry">
         <xsl:call-template name="tun:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4ImplicitRepresentation">
         <xsl:call-template name="tun:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfTunnelFurniture">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfTunnelFurniture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:InteriorFurniturePropertyType_Template">
      <xsl:for-each select="./tun:TunnelFurniture">
         <xsl:call-template name="tun:TunnelFurniture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:AbstractOpeningType_Template">
      <xsl:for-each select="./tun:lod3MultiSurface">
         <xsl:call-template name="tun:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4MultiSurface">
         <xsl:call-template name="tun:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod3ImplicitRepresentation">
         <xsl:call-template name="tun:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:lod4ImplicitRepresentation">
         <xsl:call-template name="tun:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfOpening">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfOpening_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="tun:OpeningPropertyType_Template">
      <xsl:for-each select="./tun:_Opening|./tun:Window|./tun:Door">
         <xsl:call-template name="tun:_Opening_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="tun:WindowType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfWindow">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfWindow_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractOpeningType_Template"/>
   </xsl:template>
   <xsl:template name="tun:DoorType_Template">
      <xsl:for-each select="./tun:_GenericApplicationPropertyOfDoor">
         <xsl:call-template name="tun:_GenericApplicationPropertyOfDoor_Property"/>
      </xsl:for-each>
      <xsl:call-template name="tun:AbstractOpeningType_Template"/>
   </xsl:template>
   <xsl:template name="xAL:xAL_Template">
      <xsl:for-each select="./xAL:AddressDetails">
         <xsl:call-template name="xAL:AddressDetails_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Version">
         <xsl:call-template name="xAL:Version_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:AddressDetails_Template">
      <xsl:for-each select="./xAL:PostalServiceElements">
         <xsl:call-template name="xAL:PostalServiceElements_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Address">
         <xsl:call-template name="xAL:Address_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:AddressLines">
         <xsl:call-template name="xAL:AddressLines_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Country">
         <xsl:call-template name="xAL:Country_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:AdministrativeArea">
         <xsl:call-template name="xAL:AdministrativeArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Locality">
         <xsl:call-template name="xAL:Locality_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Thoroughfare">
         <xsl:call-template name="xAL:Thoroughfare_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:AddressType">
         <xsl:call-template name="xAL:AddressType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:CurrentStatus">
         <xsl:call-template name="xAL:CurrentStatus_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:ValidFromDate">
         <xsl:call-template name="xAL:ValidFromDate_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:ValidToDate">
         <xsl:call-template name="xAL:ValidToDate_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Usage">
         <xsl:call-template name="xAL:Usage_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:AddressDetailsKey">
         <xsl:call-template name="xAL:AddressDetailsKey_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:PostalServiceElements_Template"/>
   <xsl:template name="xAL:AddressIdentifier_Template"/>
   <xsl:template name="xAL:EndorsementLineCode_Template"/>
   <xsl:template name="xAL:KeyLineCode_Template"/>
   <xsl:template name="xAL:Barcode_Template"/>
   <xsl:template name="xAL:SortingCode_Template"/>
   <xsl:template name="xAL:AddressLatitude_Template"/>
   <xsl:template name="xAL:AddressLatitudeDirection_Template"/>
   <xsl:template name="xAL:AddressLongitude_Template"/>
   <xsl:template name="xAL:AddressLongitudeDirection_Template"/>
   <xsl:template name="xAL:SupplementaryPostalServiceData_Template"/>
   <xsl:template name="xAL:Address_Template"/>
   <xsl:template name="xAL:Country_Template"/>
   <xsl:template name="xAL:CountryNameCode_Template"/>
   <xsl:template name="xAL:AddressLinesType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="xAL:BuildingNameType_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:TypeOccurrence">
         <xsl:call-template name="xAL:TypeOccurrence_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:DependentLocalityType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DependentLocalityName">
         <xsl:call-template name="xAL:DependentLocalityName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DependentLocalityNumber">
         <xsl:call-template name="xAL:DependentLocalityNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBox">
         <xsl:call-template name="xAL:PostBox_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:LargeMailUser">
         <xsl:call-template name="xAL:LargeMailUser_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostOffice">
         <xsl:call-template name="xAL:PostOffice_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalRoute">
         <xsl:call-template name="xAL:PostalRoute_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Thoroughfare">
         <xsl:call-template name="xAL:Thoroughfare_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Premise">
         <xsl:call-template name="xAL:Premise_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DependentLocality">
         <xsl:call-template name="xAL:DependentLocality_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:UsageType">
         <xsl:call-template name="xAL:UsageType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Connector">
         <xsl:call-template name="xAL:Connector_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:DependentLocalityName_Template"/>
   <xsl:template name="xAL:DependentLocalityNumber_Template"/>
   <xsl:template name="xAL:FirmType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:FirmName">
         <xsl:call-template name="xAL:FirmName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Department">
         <xsl:call-template name="xAL:Department_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:MailStop">
         <xsl:call-template name="xAL:MailStop_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:FirmName_Template"/>
   <xsl:template name="xAL:LargeMailUserType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:LargeMailUserName">
         <xsl:call-template name="xAL:LargeMailUserName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:LargeMailUserIdentifier">
         <xsl:call-template name="xAL:LargeMailUserIdentifier_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:BuildingName">
         <xsl:call-template name="xAL:BuildingName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Department">
         <xsl:call-template name="xAL:Department_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBox">
         <xsl:call-template name="xAL:PostBox_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Thoroughfare">
         <xsl:call-template name="xAL:Thoroughfare_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:LargeMailUserName_Template"/>
   <xsl:template name="xAL:LargeMailUserIdentifier_Template"/>
   <xsl:template name="xAL:MailStopType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:MailStopName">
         <xsl:call-template name="xAL:MailStopName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:MailStopNumber">
         <xsl:call-template name="xAL:MailStopNumber_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:MailStopName_Template"/>
   <xsl:template name="xAL:MailStopNumber_Template"/>
   <xsl:template name="xAL:PostalRouteType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalRouteName">
         <xsl:call-template name="xAL:PostalRouteName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalRouteNumber">
         <xsl:call-template name="xAL:PostalRouteNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBox">
         <xsl:call-template name="xAL:PostBox_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:PostalRouteName_Template"/>
   <xsl:template name="xAL:PostalRouteNumber_Template"/>
   <xsl:template name="xAL:SubPremiseType_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremiseName">
         <xsl:call-template name="xAL:SubPremiseName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremiseLocation">
         <xsl:call-template name="xAL:SubPremiseLocation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremiseNumber">
         <xsl:call-template name="xAL:SubPremiseNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremiseNumberPrefix">
         <xsl:call-template name="xAL:SubPremiseNumberPrefix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremiseNumberSuffix">
         <xsl:call-template name="xAL:SubPremiseNumberSuffix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:BuildingName">
         <xsl:call-template name="xAL:BuildingName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Firm">
         <xsl:call-template name="xAL:Firm_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:MailStop">
         <xsl:call-template name="xAL:MailStop_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremise">
         <xsl:call-template name="xAL:SubPremise_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:SubPremiseName_Template"/>
   <xsl:template name="xAL:SubPremiseLocation_Template"/>
   <xsl:template name="xAL:SubPremiseNumber_Template"/>
   <xsl:template name="xAL:SubPremiseNumberPrefix_Template"/>
   <xsl:template name="xAL:SubPremiseNumberSuffix_Template"/>
   <xsl:template name="xAL:ThoroughfareLeadingTypeType_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNameType_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfarePostDirectionType_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfarePreDirectionType_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareTrailingTypeType_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLine_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:Locality_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:LocalityName">
         <xsl:call-template name="xAL:LocalityName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBox">
         <xsl:call-template name="xAL:PostBox_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:LargeMailUser">
         <xsl:call-template name="xAL:LargeMailUser_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostOffice">
         <xsl:call-template name="xAL:PostOffice_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalRoute">
         <xsl:call-template name="xAL:PostalRoute_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Thoroughfare">
         <xsl:call-template name="xAL:Thoroughfare_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Premise">
         <xsl:call-template name="xAL:Premise_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DependentLocality">
         <xsl:call-template name="xAL:DependentLocality_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:UsageType">
         <xsl:call-template name="xAL:UsageType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:LocalityName_Template"/>
   <xsl:template name="xAL:Thoroughfare_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareNumber">
         <xsl:call-template name="xAL:ThoroughfareNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareNumberRange">
         <xsl:call-template name="xAL:ThoroughfareNumberRange_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareNumberPrefix">
         <xsl:call-template name="xAL:ThoroughfareNumberPrefix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareNumberSuffix">
         <xsl:call-template name="xAL:ThoroughfareNumberSuffix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfarePreDirection">
         <xsl:call-template name="xAL:ThoroughfarePreDirection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareLeadingType">
         <xsl:call-template name="xAL:ThoroughfareLeadingType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareName">
         <xsl:call-template name="xAL:ThoroughfareName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfareTrailingType">
         <xsl:call-template name="xAL:ThoroughfareTrailingType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:ThoroughfarePostDirection">
         <xsl:call-template name="xAL:ThoroughfarePostDirection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DependentThoroughfare">
         <xsl:call-template name="xAL:DependentThoroughfare_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DependentLocality">
         <xsl:call-template name="xAL:DependentLocality_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Premise">
         <xsl:call-template name="xAL:Premise_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Firm">
         <xsl:call-template name="xAL:Firm_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:DependentThoroughfares">
         <xsl:call-template name="xAL:DependentThoroughfares_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:DependentThoroughfaresIndicator">
         <xsl:call-template name="xAL:DependentThoroughfaresIndicator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:DependentThoroughfaresConnector">
         <xsl:call-template name="xAL:DependentThoroughfaresConnector_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:DependentThoroughfaresType">
         <xsl:call-template name="xAL:DependentThoroughfaresType_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberRange_Template"/>
   <xsl:template name="xAL:ThoroughfareNumberFrom_Template"/>
   <xsl:template name="xAL:ThoroughfareNumberTo_Template"/>
   <xsl:template name="xAL:DependentThoroughfare_Template"/>
   <xsl:template name="xAL:AdministrativeArea_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:AdministrativeAreaName">
         <xsl:call-template name="xAL:AdministrativeAreaName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubAdministrativeArea">
         <xsl:call-template name="xAL:SubAdministrativeArea_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Locality">
         <xsl:call-template name="xAL:Locality_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostOffice">
         <xsl:call-template name="xAL:PostOffice_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:UsageType">
         <xsl:call-template name="xAL:UsageType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:AdministrativeAreaName_Template"/>
   <xsl:template name="xAL:SubAdministrativeArea_Template"/>
   <xsl:template name="xAL:SubAdministrativeAreaName_Template"/>
   <xsl:template name="xAL:PostOffice_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostOfficeName">
         <xsl:call-template name="xAL:PostOfficeName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostOfficeNumber">
         <xsl:call-template name="xAL:PostOfficeNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalRoute">
         <xsl:call-template name="xAL:PostalRoute_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBox">
         <xsl:call-template name="xAL:PostBox_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:PostOfficeName_Template"/>
   <xsl:template name="xAL:PostOfficeNumber_Template"/>
   <xsl:template name="xAL:PostalCode_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCodeNumber">
         <xsl:call-template name="xAL:PostalCodeNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCodeNumberExtension">
         <xsl:call-template name="xAL:PostalCodeNumberExtension_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostTown">
         <xsl:call-template name="xAL:PostTown_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:PostalCodeNumber_Template"/>
   <xsl:template name="xAL:PostalCodeNumberExtension_Template"/>
   <xsl:template name="xAL:PostTown_Template"/>
   <xsl:template name="xAL:PostTownName_Template"/>
   <xsl:template name="xAL:PostTownSuffix_Template"/>
   <xsl:template name="xAL:PostBox_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBoxNumber">
         <xsl:call-template name="xAL:PostBoxNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBoxNumberPrefix">
         <xsl:call-template name="xAL:PostBoxNumberPrefix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBoxNumberSuffix">
         <xsl:call-template name="xAL:PostBoxNumberSuffix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostBoxNumberExtension">
         <xsl:call-template name="xAL:PostBoxNumberExtension_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Firm">
         <xsl:call-template name="xAL:Firm_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:PostBoxNumber_Template"/>
   <xsl:template name="xAL:PostBoxNumberPrefix_Template"/>
   <xsl:template name="xAL:PostBoxNumberSuffix_Template"/>
   <xsl:template name="xAL:PostBoxNumberExtension_Template"/>
   <xsl:template name="xAL:Department_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:DepartmentName">
         <xsl:call-template name="xAL:DepartmentName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:MailStop">
         <xsl:call-template name="xAL:MailStop_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:DepartmentName_Template"/>
   <xsl:template name="xAL:Premise_Template">
      <xsl:for-each select="./xAL:AddressLine">
         <xsl:call-template name="xAL:AddressLine_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PremiseName">
         <xsl:call-template name="xAL:PremiseName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PremiseLocation">
         <xsl:call-template name="xAL:PremiseLocation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PremiseNumber">
         <xsl:call-template name="xAL:PremiseNumber_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PremiseNumberRange">
         <xsl:call-template name="xAL:PremiseNumberRange_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PremiseNumberPrefix">
         <xsl:call-template name="xAL:PremiseNumberPrefix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PremiseNumberSuffix">
         <xsl:call-template name="xAL:PremiseNumberSuffix_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:BuildingName">
         <xsl:call-template name="xAL:BuildingName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:SubPremise">
         <xsl:call-template name="xAL:SubPremise_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Firm">
         <xsl:call-template name="xAL:Firm_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:MailStop">
         <xsl:call-template name="xAL:MailStop_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:PostalCode">
         <xsl:call-template name="xAL:PostalCode_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./xAL:Premise">
         <xsl:call-template name="xAL:Premise_Property"/>
      </xsl:for-each>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:PremiseDependency">
         <xsl:call-template name="xAL:PremiseDependency_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:PremiseDependencyType">
         <xsl:call-template name="xAL:PremiseDependencyType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:PremiseThoroughfareConnector">
         <xsl:call-template name="xAL:PremiseThoroughfareConnector_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="xAL:PremiseName_Template"/>
   <xsl:template name="xAL:PremiseLocation_Template"/>
   <xsl:template name="xAL:PremiseNumberRange_Template"/>
   <xsl:template name="xAL:PremiseNumberRangeFrom_Template"/>
   <xsl:template name="xAL:PremiseNumberRangeTo_Template"/>
   <xsl:template name="xAL:ThoroughfareNumberPrefix_Template">
      <xsl:if test="@xAL:NumberPrefixSeparator">
         <xsl:call-template name="xAL:NumberPrefixSeparator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberSuffix_Template">
      <xsl:if test="@xAL:NumberSuffixSeparator">
         <xsl:call-template name="xAL:NumberSuffixSeparator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumber_Template">
      <xsl:if test="@xAL:NumberType">
         <xsl:call-template name="xAL:NumberType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:IndicatorOccurrence">
         <xsl:call-template name="xAL:IndicatorOccurrence_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:NumberOccurrence">
         <xsl:call-template name="xAL:NumberOccurrence_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumber_Template">
      <xsl:if test="@xAL:NumberType">
         <xsl:call-template name="xAL:NumberType_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Indicator">
         <xsl:call-template name="xAL:Indicator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:IndicatorOccurrence">
         <xsl:call-template name="xAL:IndicatorOccurrence_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:NumberTypeOccurrence">
         <xsl:call-template name="xAL:NumberTypeOccurrence_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberPrefix_Template">
      <xsl:if test="@xAL:NumberPrefixSeparator">
         <xsl:call-template name="xAL:NumberPrefixSeparator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberSuffix_Template">
      <xsl:if test="@xAL:NumberSuffixSeparator">
         <xsl:call-template name="xAL:NumberSuffixSeparator_Property"/>
      </xsl:if>
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="xAL:CountryName_Template">
      <xsl:if test="@xAL:Type">
         <xsl:call-template name="xAL:Type_Property"/>
      </xsl:if>
      <xsl:call-template name="xAL:grPostal_Template"/>
   </xsl:template>
   <xsl:template name="grp:CityObjectGroupType_Template">
      <xsl:for-each select="./grp:class">
         <xsl:call-template name="grp:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./grp:function">
         <xsl:call-template name="grp:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./grp:usage">
         <xsl:call-template name="grp:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./grp:groupMember">
         <xsl:call-template name="grp:groupMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./grp:parent">
         <xsl:call-template name="grp:parent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./grp:geometry">
         <xsl:call-template name="grp:geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./grp:_GenericApplicationPropertyOfCityObjectGroup">
         <xsl:call-template name="grp:_GenericApplicationPropertyOfCityObjectGroup_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="grp:CityObjectGroupMemberType_Template">
      <xsl:for-each select="./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject">
         <xsl:call-template name="core:_CityObject_Property"/>
      </xsl:for-each>
      <xsl:if test="@grp:role">
         <xsl:call-template name="grp:role_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="grp:CityObjectGroupParentType_Template">
      <xsl:for-each select="./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject">
         <xsl:call-template name="core:_CityObject_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="dem:ReliefFeatureType_Template">
      <xsl:for-each select="./dem:lod">
         <xsl:call-template name="dem:lod_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:reliefComponent">
         <xsl:call-template name="dem:reliefComponent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:_GenericApplicationPropertyOfReliefFeature">
         <xsl:call-template name="dem:_GenericApplicationPropertyOfReliefFeature_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="dem:AbstractReliefComponentType_Template">
      <xsl:for-each select="./dem:lod">
         <xsl:call-template name="dem:lod_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:extent">
         <xsl:call-template name="dem:extent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:_GenericApplicationPropertyOfReliefComponent">
         <xsl:call-template name="dem:_GenericApplicationPropertyOfReliefComponent_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="dem:ReliefComponentPropertyType_Template">
      <xsl:for-each select="./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief">
         <xsl:call-template name="dem:_ReliefComponent_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="dem:TINReliefType_Template">
      <xsl:for-each select="./dem:tin">
         <xsl:call-template name="dem:tin_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:_GenericApplicationPropertyOfTinRelief">
         <xsl:call-template name="dem:_GenericApplicationPropertyOfTinRelief_Property"/>
      </xsl:for-each>
      <xsl:call-template name="dem:AbstractReliefComponentType_Template"/>
   </xsl:template>
   <xsl:template name="dem:RasterReliefType_Template">
      <xsl:for-each select="./dem:grid">
         <xsl:call-template name="dem:grid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:_GenericApplicationPropertyOfRasterRelief">
         <xsl:call-template name="dem:_GenericApplicationPropertyOfRasterRelief_Property"/>
      </xsl:for-each>
      <xsl:call-template name="dem:AbstractReliefComponentType_Template"/>
   </xsl:template>
   <xsl:template name="dem:MassPointReliefType_Template">
      <xsl:for-each select="./dem:reliefPoints">
         <xsl:call-template name="dem:reliefPoints_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:_GenericApplicationPropertyOfMassPointRelief">
         <xsl:call-template name="dem:_GenericApplicationPropertyOfMassPointRelief_Property"/>
      </xsl:for-each>
      <xsl:call-template name="dem:AbstractReliefComponentType_Template"/>
   </xsl:template>
   <xsl:template name="dem:BreaklineReliefType_Template">
      <xsl:for-each select="./dem:ridgeOrValleyLines">
         <xsl:call-template name="dem:ridgeOrValleyLines_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:breaklines">
         <xsl:call-template name="dem:breaklines_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./dem:_GenericApplicationPropertyOfBreaklineRelief">
         <xsl:call-template name="dem:_GenericApplicationPropertyOfBreaklineRelief_Property"/>
      </xsl:for-each>
      <xsl:call-template name="dem:AbstractReliefComponentType_Template"/>
   </xsl:template>
   <xsl:template name="dem:tinPropertyType_Template">
      <xsl:for-each select="./gml:TriangulatedSurface|./gml:Tin">
         <xsl:call-template name="gml:TriangulatedSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="dem:gridPropertyType_Template">
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:AbstractBuildingType_Template">
      <xsl:for-each select="./bldg:class">
         <xsl:call-template name="bldg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:function">
         <xsl:call-template name="bldg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:usage">
         <xsl:call-template name="bldg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:yearOfConstruction">
         <xsl:call-template name="bldg:yearOfConstruction_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:yearOfDemolition">
         <xsl:call-template name="bldg:yearOfDemolition_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:roofType">
         <xsl:call-template name="bldg:roofType_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:measuredHeight">
         <xsl:call-template name="bldg:measuredHeight_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:storeysAboveGround">
         <xsl:call-template name="bldg:storeysAboveGround_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:storeysBelowGround">
         <xsl:call-template name="bldg:storeysBelowGround_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:storeyHeightsAboveGround">
         <xsl:call-template name="bldg:storeyHeightsAboveGround_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:storeyHeightsBelowGround">
         <xsl:call-template name="bldg:storeyHeightsBelowGround_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod0FootPrint">
         <xsl:call-template name="bldg:lod0FootPrint_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod0RoofEdge">
         <xsl:call-template name="bldg:lod0RoofEdge_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod1Solid">
         <xsl:call-template name="bldg:lod1Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod1MultiSurface">
         <xsl:call-template name="bldg:lod1MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod1TerrainIntersection">
         <xsl:call-template name="bldg:lod1TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod2Solid">
         <xsl:call-template name="bldg:lod2Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod2MultiSurface">
         <xsl:call-template name="bldg:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod2MultiCurve">
         <xsl:call-template name="bldg:lod2MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod2TerrainIntersection">
         <xsl:call-template name="bldg:lod2TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:outerBuildingInstallation">
         <xsl:call-template name="bldg:outerBuildingInstallation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:interiorBuildingInstallation">
         <xsl:call-template name="bldg:interiorBuildingInstallation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:boundedBy">
         <xsl:call-template name="bldg:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3Solid">
         <xsl:call-template name="bldg:lod3Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3MultiSurface">
         <xsl:call-template name="bldg:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3MultiCurve">
         <xsl:call-template name="bldg:lod3MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3TerrainIntersection">
         <xsl:call-template name="bldg:lod3TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4Solid">
         <xsl:call-template name="bldg:lod4Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4MultiSurface">
         <xsl:call-template name="bldg:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4MultiCurve">
         <xsl:call-template name="bldg:lod4MultiCurve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4TerrainIntersection">
         <xsl:call-template name="bldg:lod4TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:interiorRoom">
         <xsl:call-template name="bldg:interiorRoom_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:consistsOfBuildingPart">
         <xsl:call-template name="bldg:consistsOfBuildingPart_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:address">
         <xsl:call-template name="bldg:address_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfAbstractBuilding">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfAbstractBuilding_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractSiteType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfBuilding">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfBuilding_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBuildingType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingPartType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfBuildingPart">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfBuildingPart_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBuildingType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingPartPropertyType_Template">
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingInstallationType_Template">
      <xsl:for-each select="./bldg:class">
         <xsl:call-template name="bldg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:function">
         <xsl:call-template name="bldg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:usage">
         <xsl:call-template name="bldg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod2Geometry">
         <xsl:call-template name="bldg:lod2Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3Geometry">
         <xsl:call-template name="bldg:lod3Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4Geometry">
         <xsl:call-template name="bldg:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod2ImplicitRepresentation">
         <xsl:call-template name="bldg:lod2ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3ImplicitRepresentation">
         <xsl:call-template name="bldg:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4ImplicitRepresentation">
         <xsl:call-template name="bldg:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:boundedBy">
         <xsl:call-template name="bldg:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfBuildingInstallation">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfBuildingInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingInstallationPropertyType_Template">
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:IntBuildingInstallationType_Template">
      <xsl:for-each select="./bldg:class">
         <xsl:call-template name="bldg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:function">
         <xsl:call-template name="bldg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:usage">
         <xsl:call-template name="bldg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4Geometry">
         <xsl:call-template name="bldg:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4ImplicitRepresentation">
         <xsl:call-template name="bldg:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:boundedBy">
         <xsl:call-template name="bldg:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfIntBuildingInstallation">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfIntBuildingInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:IntBuildingInstallationPropertyType_Template">
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:AbstractBoundarySurfaceType_Template">
      <xsl:for-each select="./bldg:lod2MultiSurface">
         <xsl:call-template name="bldg:lod2MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3MultiSurface">
         <xsl:call-template name="bldg:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4MultiSurface">
         <xsl:call-template name="bldg:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:opening">
         <xsl:call-template name="bldg:opening_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfBoundarySurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfBoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:RoofSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfRoofSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfRoofSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:WallSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfWallSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfWallSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:GroundSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfGroundSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfGroundSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:ClosureSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfClosureSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfClosureSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:FloorSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfFloorSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfFloorSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:OuterFloorSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfOuterFloorSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfOuterFloorSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:InteriorWallSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfInteriorWallSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfInteriorWallSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:CeilingSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfCeilingSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfCeilingSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:OuterCeilingSurfaceType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfOuterCeilingSurface">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfOuterCeilingSurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BoundarySurfacePropertyType_Template">
      <xsl:for-each select="./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:_BoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:OpeningPropertyType_Template">
      <xsl:for-each select="./bldg:_Opening|./bldg:Window|./bldg:Door">
         <xsl:call-template name="bldg:_Opening_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:AbstractOpeningType_Template">
      <xsl:for-each select="./bldg:lod3MultiSurface">
         <xsl:call-template name="bldg:lod3MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4MultiSurface">
         <xsl:call-template name="bldg:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod3ImplicitRepresentation">
         <xsl:call-template name="bldg:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4ImplicitRepresentation">
         <xsl:call-template name="bldg:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfOpening">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfOpening_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:WindowType_Template">
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfWindow">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfWindow_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractOpeningType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:DoorType_Template">
      <xsl:for-each select="./bldg:address">
         <xsl:call-template name="bldg:address_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfDoor">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfDoor_Property"/>
      </xsl:for-each>
      <xsl:call-template name="bldg:AbstractOpeningType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:RoomType_Template">
      <xsl:for-each select="./bldg:class">
         <xsl:call-template name="bldg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:function">
         <xsl:call-template name="bldg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:usage">
         <xsl:call-template name="bldg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4Solid">
         <xsl:call-template name="bldg:lod4Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4MultiSurface">
         <xsl:call-template name="bldg:lod4MultiSurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:boundedBy">
         <xsl:call-template name="bldg:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:interiorFurniture">
         <xsl:call-template name="bldg:interiorFurniture_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:roomInstallation">
         <xsl:call-template name="bldg:roomInstallation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfRoom">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfRoom_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingFurnitureType_Template">
      <xsl:for-each select="./bldg:class">
         <xsl:call-template name="bldg:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:function">
         <xsl:call-template name="bldg:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:usage">
         <xsl:call-template name="bldg:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4Geometry">
         <xsl:call-template name="bldg:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:lod4ImplicitRepresentation">
         <xsl:call-template name="bldg:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_GenericApplicationPropertyOfBuildingFurniture">
         <xsl:call-template name="bldg:_GenericApplicationPropertyOfBuildingFurniture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="bldg:InteriorRoomPropertyType_Template">
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:InteriorFurniturePropertyType_Template">
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gen:GenericCityObjectType_Template">
      <xsl:for-each select="./gen:class">
         <xsl:call-template name="gen:class_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:function">
         <xsl:call-template name="gen:function_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:usage">
         <xsl:call-template name="gen:usage_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod0Geometry">
         <xsl:call-template name="gen:lod0Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod1Geometry">
         <xsl:call-template name="gen:lod1Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod2Geometry">
         <xsl:call-template name="gen:lod2Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod3Geometry">
         <xsl:call-template name="gen:lod3Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod4Geometry">
         <xsl:call-template name="gen:lod4Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod0TerrainIntersection">
         <xsl:call-template name="gen:lod0TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod1TerrainIntersection">
         <xsl:call-template name="gen:lod1TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod2TerrainIntersection">
         <xsl:call-template name="gen:lod2TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod3TerrainIntersection">
         <xsl:call-template name="gen:lod3TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod4TerrainIntersection">
         <xsl:call-template name="gen:lod4TerrainIntersection_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod0ImplicitRepresentation">
         <xsl:call-template name="gen:lod0ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod1ImplicitRepresentation">
         <xsl:call-template name="gen:lod1ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod2ImplicitRepresentation">
         <xsl:call-template name="gen:lod2ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod3ImplicitRepresentation">
         <xsl:call-template name="gen:lod3ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gen:lod4ImplicitRepresentation">
         <xsl:call-template name="gen:lod4ImplicitRepresentation_Property"/>
      </xsl:for-each>
      <xsl:call-template name="core:AbstractCityObjectType_Template"/>
   </xsl:template>
   <xsl:template name="gen:AbstractGenericAttributeType_Template">
      <xsl:if test="@gen:name">
         <xsl:call-template name="gen:name_Property"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="gen:StringAttributeType_Template">
      <xsl:for-each select="./gen:value">
         <xsl:call-template name="gen:value_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gen:IntAttributeType_Template">
      <xsl:for-each select="./gen:value">
         <xsl:call-template name="gen:value_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gen:DoubleAttributeType_Template">
      <xsl:for-each select="./gen:value">
         <xsl:call-template name="gen:value_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gen:DateAttributeType_Template">
      <xsl:for-each select="./gen:value">
         <xsl:call-template name="gen:value_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gen:UriAttributeType_Template">
      <xsl:for-each select="./gen:value">
         <xsl:call-template name="gen:value_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gen:MeasureAttributeType_Template">
      <xsl:for-each select="./gen:value">
         <xsl:call-template name="gen:value_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gen:GenericAttributeSetType_Template">
      <xsl:for-each select="./gen:_genericAttribute|./gen:stringAttribute|./gen:intAttribute|./gen:doubleAttribute|./gen:dateAttribute|./gen:uriAttribute|./gen:measureAttribute|./gen:genericAttributeSet">
         <xsl:call-template name="gen:_genericAttribute_Property"/>
      </xsl:for-each>
      <xsl:if test="@gen:codeSpace">
         <xsl:call-template name="gen:codeSpace_Property"/>
      </xsl:if>
      <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
   </xsl:template>
   <xsl:template name="gml:FileValueModelType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:SequenceRuleNames_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:IncrementOrder_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:CountExtentType_Template">
      <xsl:call-template name="gml:integerOrNullList_Template"/>
   </xsl:template>
   <xsl:template name="gml:relativePosition_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:TimeUnitType_Template"/>
   <xsl:template name="_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   <xsl:call-template name="gml:SignType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TimePositionUnion_Template"/>
   <xsl:template name="gml:CalDate_Template"/>
   <xsl:template name="gml:TimeIndeterminateValueType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:CompassPointEnumeration_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:NullEnumeration_Template"/>
   <xsl:template name="gml:NullType_Template"/>
   <xsl:template name="gml:SignType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:booleanOrNull_Template"/>
   <xsl:template name="gml:booleanOrNullList_Template">
      <gml:hasbooleanOrNullList>
         <xsl:value-of select="text()"/>
      </gml:hasbooleanOrNullList>
   </xsl:template>
   <xsl:template name="gml:booleanList_Template">
      <gml:hasbooleanList>
         <xsl:value-of select="text()"/>
      </gml:hasbooleanList>
   </xsl:template>
   <xsl:template name="gml:stringOrNull_Template"/>
   <xsl:template name="gml:NameOrNull_Template"/>
   <xsl:template name="gml:NameOrNullList_Template">
      <gml:hasNameOrNullList>
         <xsl:value-of select="text()"/>
      </gml:hasNameOrNullList>
   </xsl:template>
   <xsl:template name="gml:NameList_Template">
      <gml:hasNameList>
         <xsl:value-of select="text()"/>
      </gml:hasNameList>
   </xsl:template>
   <xsl:template name="gml:doubleOrNull_Template"/>
   <xsl:template name="gml:doubleOrNullList_Template">
      <gml:hasdoubleOrNullList>
         <xsl:value-of select="text()"/>
      </gml:hasdoubleOrNullList>
   </xsl:template>
   <xsl:template name="gml:doubleList_Template">
      <gml:hasdoubleList>
         <xsl:value-of select="text()"/>
      </gml:hasdoubleList>
   </xsl:template>
   <xsl:template name="gml:integerOrNull_Template"/>
   <xsl:template name="gml:integerOrNullList_Template">
      <gml:hasintegerOrNullList>
         <xsl:value-of select="text()"/>
      </gml:hasintegerOrNullList>
   </xsl:template>
   <xsl:template name="gml:integerList_Template">
      <gml:hasintegerList>
         <xsl:value-of select="text()"/>
      </gml:hasintegerList>
   </xsl:template>
   <xsl:template name="gml:NCNameList_Template">
      <gml:hasNCNameList>
         <xsl:value-of select="text()"/>
      </gml:hasNCNameList>
   </xsl:template>
   <xsl:template name="gml:QNameList_Template">
      <gml:hasQNameList>
         <xsl:value-of select="text()"/>
      </gml:hasQNameList>
   </xsl:template>
   <xsl:template name="gml:isSphere_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:SuccessionType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:direction_Template"/>
   <xsl:template name="gml:DegreeValueType_Template">
      <xs:hasnonNegativeInteger>
         <xsl:value-of select="text()"/>
      </xs:hasnonNegativeInteger>
   </xsl:template>
   <xsl:template name="gml:DecimalMinutesType_Template">
      <xs:hasdecimal>
         <xsl:value-of select="text()"/>
      </xs:hasdecimal>
   </xsl:template>
   <xsl:template name="gml:ArcMinutesType_Template">
      <xs:hasnonNegativeInteger>
         <xsl:value-of select="text()"/>
      </xs:hasnonNegativeInteger>
   </xsl:template>
   <xsl:template name="gml:ArcSecondsType_Template">
      <xs:hasdecimal>
         <xsl:value-of select="text()"/>
      </xs:hasdecimal>
   </xsl:template>
   <xsl:template name="gml:QueryGrammarEnumeration_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:SymbolTypeEnumeration_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:GraphTypeType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:DrawingTypeType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:LineTypeType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:AesheticCriteriaType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:CurveInterpolationType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:SurfaceInterpolationType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:KnotTypesType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="app:WrapModeType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="app:TextureTypeType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="app:Color_Template">
      <xsl:call-template name="core:doubleBetween0and1List_Template"/>
   </xsl:template>
   <xsl:template name="app:ColorPlusOpacity_Template">
      <xsl:call-template name="core:doubleBetween0and1List_Template"/>
   </xsl:template>
   <xsl:template name="core:RelativeToTerrainType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="core:RelativeToWaterType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="core:doubleBetween0and1_Template">
      <xs:hasdouble>
         <xsl:value-of select="text()"/>
      </xs:hasdouble>
   </xsl:template>
   <xsl:template name="core:doubleBetween0and1List_Template">
      <core:hasdoubleBetween0and1List>
         <xsl:value-of select="text()"/>
      </core:hasdoubleBetween0and1List>
   </xsl:template>
   <xsl:template name="core:TransformationMatrix4x4Type_Template">
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="core:TransformationMatrix2x2Type_Template">
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="core:TransformationMatrix3x4Type_Template">
      <xsl:call-template name="gml:doubleList_Template"/>
   </xsl:template>
   <xsl:template name="core:integerBetween0and4_Template">
      <xs:hasinteger>
         <xsl:value-of select="text()"/>
      </xs:hasinteger>
   </xsl:template>
   <xsl:template name="tex:TextureTypeType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="tex:Color_Template">
      <xsl:call-template name="core:doubleBetween0and1List_Template"/>
   </xsl:template>
   <xsl:template name="xAL:TypeOccurrence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:NameNumberOccurrence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:IndicatorOccurrence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:NumberTypeOccurrence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:RangeType_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:NumberRangeOccurrence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:DependentThoroughfares_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:IndicatorOccurence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:NumberRangeOccurence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:NumberType_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template name="xAL:NumberOccurrence_Template">
      <xs:hasNMTOKEN>
         <xsl:value-of select="text()"/>
      </xs:hasNMTOKEN>
   </xsl:template>
   <xsl:template match="//gml:_Coverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Coverage"/>
         <xsl:call-template name="gml:AbstractCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_ContinuousCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ContinuousCoverage"/>
         <xsl:call-template name="gml:AbstractContinuousCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_DiscreteCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_DiscreteCoverage"/>
         <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:domainSet">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:domainSet"/>
         <xsl:call-template name="gml:DomainSetType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:rangeSet">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:rangeSet"/>
         <xsl:call-template name="gml:RangeSetType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coverageFunction">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coverageFunction"/>
         <xsl:call-template name="gml:CoverageFunctionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DataBlock">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DataBlock"/>
         <xsl:call-template name="gml:DataBlockType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:tupleList">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:tupleList"/>
         <xsl:call-template name="gml:CoordinatesType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:doubleOrNullTupleList_Substitution">
      <xsl:call-template name="gml:doubleOrNullList_Template"/>
   </xsl:template>
   <xsl:template match="//gml:File">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:File"/>
         <xsl:call-template name="gml:FileType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:rangeParameters">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:rangeParameters"/>
         <xsl:call-template name="gml:RangeParametersType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MappingRule">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MappingRule"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GridFunction">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GridFunction"/>
         <xsl:call-template name="gml:GridFunctionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:IndexMap">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:IndexMap"/>
         <xsl:call-template name="gml:IndexMapType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiPointCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiPointCoverage"/>
         <xsl:call-template name="gml:MultiPointCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiPointDomain">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiPointDomain"/>
         <xsl:call-template name="gml:MultiPointDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiCurveCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiCurveCoverage"/>
         <xsl:call-template name="gml:MultiCurveCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiCurveDomain">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCurveDomain"/>
         <xsl:call-template name="gml:MultiCurveDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiSurfaceCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSurfaceCoverage"/>
         <xsl:call-template name="gml:MultiSurfaceCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiSurfaceDomain">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSurfaceDomain"/>
         <xsl:call-template name="gml:MultiSurfaceDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiSolidCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSolidCoverage"/>
         <xsl:call-template name="gml:MultiSolidCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiSolidDomain">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSolidDomain"/>
         <xsl:call-template name="gml:MultiSolidDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GridCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GridCoverage"/>
         <xsl:call-template name="gml:GridCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:gridDomain">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:gridDomain"/>
         <xsl:call-template name="gml:GridDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:RectifiedGridCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:RectifiedGridCoverage"/>
         <xsl:call-template name="gml:RectifiedGridCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:rectifiedGridDomain">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:rectifiedGridDomain"/>
         <xsl:call-template name="gml:RectifiedGridDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Definition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Definition"/>
         <xsl:call-template name="gml:DefinitionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Dictionary">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Dictionary"/>
         <xsl:call-template name="gml:DictionaryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DefinitionCollection">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DefinitionCollection"/>
         <xsl:call-template name="gml:DictionaryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:dictionaryEntry">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dictionaryEntry"/>
         <xsl:call-template name="gml:DictionaryEntryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:definitionMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:definitionMember"/>
         <xsl:call-template name="gml:DictionaryEntryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:indirectEntry">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:indirectEntry"/>
         <xsl:call-template name="gml:IndirectEntryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DefinitionProxy">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DefinitionProxy"/>
         <xsl:call-template name="gml:DefinitionProxyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:definitionRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:definitionRef"/>
         <xsl:call-template name="gml:ReferenceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Feature">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Feature"/>
         <xsl:call-template name="gml:AbstractFeatureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:boundedBy">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:boundedBy"/>
         <xsl:call-template name="gml:BoundingShapeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:EnvelopeWithTimePeriod">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EnvelopeWithTimePeriod"/>
         <xsl:call-template name="gml:EnvelopeWithTimePeriodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:featureMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureMember"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:featureProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureProperty"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:featureMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureMembers"/>
         <xsl:call-template name="gml:FeatureArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_FeatureCollection">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_FeatureCollection"/>
         <xsl:call-template name="gml:AbstractFeatureCollectionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:FeatureCollection">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:FeatureCollection"/>
         <xsl:call-template name="gml:FeatureCollectionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LocationKeyWord">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LocationKeyWord"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LocationString">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LocationString"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:centerOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:centerOf"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:position">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:position"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:edgeOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:edgeOf"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:centerLineOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:centerLineOf"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:extentOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:extentOf"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:location">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:location"/>
         <xsl:call-template name="gml:LocationPropertyType_Template"/>
      </owl:NamedIndividual>
   <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'DirectPositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:location"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:priorityLocation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:priorityLocation"/>
         <xsl:call-template name="gml:PriorityLocationPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimeReferenceSystem">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeReferenceSystem"/>
         <xsl:call-template name="gml:AbstractTimeReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeCoordinateSystem">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeCoordinateSystem"/>
         <xsl:call-template name="gml:TimeCoordinateSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeOrdinalReferenceSystem">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeOrdinalReferenceSystem"/>
         <xsl:call-template name="gml:TimeOrdinalReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeOrdinalEra">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeOrdinalEra"/>
         <xsl:call-template name="gml:TimeOrdinalEraType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeCalendar">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeCalendar"/>
         <xsl:call-template name="gml:TimeCalendarType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeCalendarEra">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeCalendarEra"/>
         <xsl:call-template name="gml:TimeCalendarEraType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeClock">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeClock"/>
         <xsl:call-template name="gml:TimeClockType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Topology">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Topology"/>
         <xsl:call-template name="gml:AbstractTopologyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TopoPrimitive">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TopoPrimitive"/>
         <xsl:call-template name="gml:AbstractTopoPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:isolated">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:isolated"/>
         <xsl:call-template name="gml:IsolatedPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:container">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:container"/>
         <xsl:call-template name="gml:ContainerPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Node">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Node"/>
         <xsl:call-template name="gml:NodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:directedNode">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedNode"/>
         <xsl:call-template name="gml:DirectedNodePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Edge">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Edge"/>
         <xsl:call-template name="gml:EdgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:directedEdge">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedEdge"/>
         <xsl:call-template name="gml:DirectedEdgePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Face">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Face"/>
         <xsl:call-template name="gml:FaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:directedFace">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedFace"/>
         <xsl:call-template name="gml:DirectedFacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopoSolid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoSolid"/>
         <xsl:call-template name="gml:TopoSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:directedTopoSolid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedTopoSolid"/>
         <xsl:call-template name="gml:DirectedTopoSolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopoPoint">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoPoint"/>
         <xsl:call-template name="gml:TopoPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoPointProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoPointProperty"/>
         <xsl:call-template name="gml:TopoPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopoCurve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoCurve"/>
         <xsl:call-template name="gml:TopoCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoCurveProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoCurveProperty"/>
         <xsl:call-template name="gml:TopoCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopoSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoSurface"/>
         <xsl:call-template name="gml:TopoSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoSurfaceProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoSurfaceProperty"/>
         <xsl:call-template name="gml:TopoSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopoVolume">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoVolume"/>
         <xsl:call-template name="gml:TopoVolumeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoVolumeProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoVolumeProperty"/>
         <xsl:call-template name="gml:TopoVolumePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopoComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoComplex"/>
         <xsl:call-template name="gml:TopoComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoComplexProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoComplexProperty"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:subComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:subComplex"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:superComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:superComplex"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:maximalComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:maximalComplex"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoPrimitiveMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoPrimitiveMember"/>
         <xsl:call-template name="gml:TopoPrimitiveMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topoPrimitiveMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoPrimitiveMembers"/>
         <xsl:call-template name="gml:TopoPrimitiveArrayAssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_CoordinateOperation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CoordinateOperation"/>
         <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinateOperationName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateOperationName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinateOperationID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateOperationID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:sourceCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:sourceCRS"/>
         <xsl:call-template name="gml:CRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:targetCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:targetCRS"/>
         <xsl:call-template name="gml:CRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinateOperationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateOperationRef"/>
         <xsl:call-template name="gml:CoordinateOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ConcatenatedOperation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ConcatenatedOperation"/>
         <xsl:call-template name="gml:ConcatenatedOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesSingleOperation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesSingleOperation"/>
         <xsl:call-template name="gml:SingleOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:concatenatedOperationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:concatenatedOperationRef"/>
         <xsl:call-template name="gml:ConcatenatedOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_SingleOperation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_SingleOperation"/>
         <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:singleOperationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:singleOperationRef"/>
         <xsl:call-template name="gml:SingleOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:PassThroughOperation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PassThroughOperation"/>
         <xsl:call-template name="gml:PassThroughOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesOperation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesOperation"/>
         <xsl:call-template name="gml:OperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:passThroughOperationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:passThroughOperationRef"/>
         <xsl:call-template name="gml:PassThroughOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Operation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Operation"/>
         <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:operationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationRef"/>
         <xsl:call-template name="gml:OperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GeneralConversion">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralConversion"/>
         <xsl:call-template name="gml:AbstractGeneralConversionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:generalConversionRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:generalConversionRef"/>
         <xsl:call-template name="gml:GeneralConversionRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Conversion">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Conversion"/>
         <xsl:call-template name="gml:ConversionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesMethod">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesMethod"/>
         <xsl:call-template name="gml:OperationMethodRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesValue">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesValue"/>
         <xsl:call-template name="gml:ParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:conversionRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:conversionRef"/>
         <xsl:call-template name="gml:ConversionRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GeneralTransformation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralTransformation"/>
         <xsl:call-template name="gml:AbstractGeneralTransformationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:generalTransformationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:generalTransformationRef"/>
         <xsl:call-template name="gml:GeneralTransformationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Transformation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Transformation"/>
         <xsl:call-template name="gml:TransformationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:transformationRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:transformationRef"/>
         <xsl:call-template name="gml:TransformationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_generalParameterValue">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_generalParameterValue"/>
         <xsl:call-template name="gml:AbstractGeneralParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:parameterValue">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterValue"/>
         <xsl:call-template name="gml:ParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:value">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:value"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:dmsAngleValue">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dmsAngleValue"/>
         <xsl:call-template name="gml:DMSAngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:valueList">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueList"/>
         <xsl:call-template name="gml:MeasureListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:integerValueList_Substitution">
      <xsl:call-template name="gml:integerList_Template"/>
   </xsl:template>
   <xsl:template match="//gml:valueOfParameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueOfParameter"/>
         <xsl:call-template name="gml:OperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:parameterValueGroup">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterValueGroup"/>
         <xsl:call-template name="gml:ParameterValueGroupType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:includesValue">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesValue"/>
         <xsl:call-template name="gml:AbstractGeneralParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:valuesOfGroup">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valuesOfGroup"/>
         <xsl:call-template name="gml:OperationParameterGroupRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:OperationMethod">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OperationMethod"/>
         <xsl:call-template name="gml:OperationMethodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:methodName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:methodName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:methodID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:methodID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:methodFormula">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:methodFormula"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesParameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesParameter"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:operationMethodRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationMethodRef"/>
         <xsl:call-template name="gml:OperationMethodRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GeneralOperationParameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralOperationParameter"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:abstractGeneralOperationParameterRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:abstractGeneralOperationParameterRef"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:OperationParameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OperationParameter"/>
         <xsl:call-template name="gml:OperationParameterType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:parameterName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:parameterID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:operationParameterRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationParameterRef"/>
         <xsl:call-template name="gml:OperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:OperationParameterGroup">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OperationParameterGroup"/>
         <xsl:call-template name="gml:OperationParameterGroupType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:groupName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:groupName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:groupID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:groupID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:includesParameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesParameter"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:operationParameterGroupRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationParameterGroupRef"/>
         <xsl:call-template name="gml:OperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CompositeCurve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeCurve"/>
         <xsl:call-template name="gml:CompositeCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CompositeSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeSurface"/>
         <xsl:call-template name="gml:CompositeSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CompositeSolid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeSolid"/>
         <xsl:call-template name="gml:CompositeSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GeometricComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeometricComplex"/>
         <xsl:call-template name="gml:GeometricComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GML">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GML"/>
         <xsl:call-template name="gml:AbstractGMLType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Bag">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Bag"/>
         <xsl:call-template name="gml:BagType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Array">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Array"/>
         <xsl:call-template name="gml:ArrayType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_MetaData">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_MetaData"/>
         <xsl:call-template name="gml:AbstractMetaDataType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GenericMetaData">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GenericMetaData"/>
         <xsl:call-template name="gml:GenericMetaDataType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_association">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_association"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_strictAssociation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_strictAssociation"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:member">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:member"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_reference">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_reference"/>
         <xsl:call-template name="gml:ReferenceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:members">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:members"/>
         <xsl:call-template name="gml:ArrayAssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:metaDataProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:metaDataProperty"/>
         <xsl:call-template name="gml:MetaDataPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:name">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:name"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:description">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:description"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:BooleanList_Substitution">
      <xsl:call-template name="gml:booleanOrNullList_Template"/>
   </xsl:template>
   <xsl:template match="//gml:Category">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Category"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CategoryList">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CategoryList"/>
         <xsl:call-template name="gml:CodeOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Quantity">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Quantity"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:QuantityList">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:QuantityList"/>
         <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CountList_Substitution">
      <xsl:call-template name="gml:integerOrNullList_Template"/>
   </xsl:template>
   <xsl:template match="//gml:CompositeValue">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeValue"/>
         <xsl:call-template name="gml:CompositeValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ValueArray">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ValueArray"/>
         <xsl:call-template name="gml:ValueArrayType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:QuantityExtent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:QuantityExtent"/>
         <xsl:call-template name="gml:QuantityExtentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CategoryExtent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CategoryExtent"/>
         <xsl:call-template name="gml:CategoryExtentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CountExtent_Substitution">
      <xsl:call-template name="gml:CountExtentType_Template"/>
   </xsl:template>
   <xsl:template match="//gml:valueProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueProperty"/>
         <xsl:call-template name="gml:ValuePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:valueComponent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueComponent"/>
         <xsl:call-template name="gml:ValuePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:valueComponents">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueComponents"/>
         <xsl:call-template name="gml:ValueArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Geometry">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Geometry"/>
         <xsl:call-template name="gml:AbstractGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GeometricPrimitive">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeometricPrimitive"/>
         <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Point">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Point"/>
         <xsl:call-template name="gml:PointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pointProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointProperty"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pointRep">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointRep"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pointArrayProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointArrayProperty"/>
         <xsl:call-template name="gml:PointArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Curve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Curve"/>
         <xsl:call-template name="gml:AbstractCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:curveProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveProperty"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:curveArrayProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveArrayProperty"/>
         <xsl:call-template name="gml:CurveArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LineString">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LineString"/>
         <xsl:call-template name="gml:LineStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pos">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pos"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:posList">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:posList"/>
         <xsl:call-template name="gml:DirectPositionListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:vector">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:vector"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinates">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinates"/>
         <xsl:call-template name="gml:CoordinatesType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Envelope">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Envelope"/>
         <xsl:call-template name="gml:EnvelopeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coord">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coord"/>
         <xsl:call-template name="gml:CoordType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:lineStringProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:lineStringProperty"/>
         <xsl:call-template name="gml:LineStringPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_CoordinateReferenceSystem">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CoordinateReferenceSystem"/>
         <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinateReferenceSystemRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateReferenceSystemRef"/>
         <xsl:call-template name="gml:CoordinateReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CompoundCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompoundCRS"/>
         <xsl:call-template name="gml:CompoundCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:includesCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesCRS"/>
         <xsl:call-template name="gml:CoordinateReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:compoundCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:compoundCRSRef"/>
         <xsl:call-template name="gml:CompoundCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GeographicCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeographicCRS"/>
         <xsl:call-template name="gml:GeographicCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesEllipsoidalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesEllipsoidalCS"/>
         <xsl:call-template name="gml:EllipsoidalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesGeodeticDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesGeodeticDatum"/>
         <xsl:call-template name="gml:GeodeticDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:geographicCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geographicCRSRef"/>
         <xsl:call-template name="gml:GeographicCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:VerticalCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:VerticalCRS"/>
         <xsl:call-template name="gml:VerticalCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesVerticalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesVerticalCS"/>
         <xsl:call-template name="gml:VerticalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesVerticalDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesVerticalDatum"/>
         <xsl:call-template name="gml:VerticalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:verticalCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalCRSRef"/>
         <xsl:call-template name="gml:VerticalCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GeocentricCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeocentricCRS"/>
         <xsl:call-template name="gml:GeocentricCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesCartesianCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesCartesianCS"/>
         <xsl:call-template name="gml:CartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesSphericalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesSphericalCS"/>
         <xsl:call-template name="gml:SphericalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:geocentricCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geocentricCRSRef"/>
         <xsl:call-template name="gml:GeocentricCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GeneralDerivedCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralDerivedCRS"/>
         <xsl:call-template name="gml:AbstractGeneralDerivedCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:baseCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:baseCRS"/>
         <xsl:call-template name="gml:CoordinateReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:definedByConversion">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:definedByConversion"/>
         <xsl:call-template name="gml:GeneralConversionRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ProjectedCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ProjectedCRS"/>
         <xsl:call-template name="gml:ProjectedCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:projectedCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:projectedCRSRef"/>
         <xsl:call-template name="gml:ProjectedCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DerivedCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DerivedCRS"/>
         <xsl:call-template name="gml:DerivedCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:derivedCRSType">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:derivedCRSType"/>
         <xsl:call-template name="gml:DerivedCRSTypeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesCS"/>
         <xsl:call-template name="gml:CoordinateSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:derivedCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:derivedCRSRef"/>
         <xsl:call-template name="gml:DerivedCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:EngineeringCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EngineeringCRS"/>
         <xsl:call-template name="gml:EngineeringCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesEngineeringDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesEngineeringDatum"/>
         <xsl:call-template name="gml:EngineeringDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:engineeringCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:engineeringCRSRef"/>
         <xsl:call-template name="gml:EngineeringCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ImageCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ImageCRS"/>
         <xsl:call-template name="gml:ImageCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesObliqueCartesianCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesObliqueCartesianCS"/>
         <xsl:call-template name="gml:ObliqueCartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesImageDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesImageDatum"/>
         <xsl:call-template name="gml:ImageDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:imageCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:imageCRSRef"/>
         <xsl:call-template name="gml:ImageCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TemporalCRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TemporalCRS"/>
         <xsl:call-template name="gml:TemporalCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesTemporalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesTemporalCS"/>
         <xsl:call-template name="gml:TemporalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesTemporalDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesTemporalDatum"/>
         <xsl:call-template name="gml:TemporalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:temporalCRSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalCRSRef"/>
         <xsl:call-template name="gml:TemporalCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:using">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:using"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:target">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:target"/>
         <xsl:call-template name="gml:TargetPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:subject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:subject"/>
         <xsl:call-template name="gml:TargetPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:resultOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:resultOf"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Observation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Observation"/>
         <xsl:call-template name="gml:ObservationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DirectedObservation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectedObservation"/>
         <xsl:call-template name="gml:DirectedObservationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DirectedObservationAtDistance">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectedObservationAtDistance"/>
         <xsl:call-template name="gml:DirectedObservationAtDistanceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CoordinateSystemAxis">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CoordinateSystemAxis"/>
         <xsl:call-template name="gml:CoordinateSystemAxisType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:axisID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:axisID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:axisAbbrev">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:axisAbbrev"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:axisDirection">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:axisDirection"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinateSystemAxisRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateSystemAxisRef"/>
         <xsl:call-template name="gml:CoordinateSystemAxisRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_CoordinateSystem">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CoordinateSystem"/>
         <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:csName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:csName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:csID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:csID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesAxis">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesAxis"/>
         <xsl:call-template name="gml:CoordinateSystemAxisRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:coordinateSystemRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateSystemRef"/>
         <xsl:call-template name="gml:CoordinateSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:EllipsoidalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EllipsoidalCS"/>
         <xsl:call-template name="gml:EllipsoidalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidalCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidalCSRef"/>
         <xsl:call-template name="gml:EllipsoidalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CartesianCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CartesianCS"/>
         <xsl:call-template name="gml:CartesianCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:cartesianCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:cartesianCSRef"/>
         <xsl:call-template name="gml:CartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:VerticalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:VerticalCS"/>
         <xsl:call-template name="gml:VerticalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:verticalCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalCSRef"/>
         <xsl:call-template name="gml:VerticalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TemporalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TemporalCS"/>
         <xsl:call-template name="gml:TemporalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:temporalCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalCSRef"/>
         <xsl:call-template name="gml:TemporalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LinearCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LinearCS"/>
         <xsl:call-template name="gml:LinearCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:linearCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:linearCSRef"/>
         <xsl:call-template name="gml:LinearCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:UserDefinedCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:UserDefinedCS"/>
         <xsl:call-template name="gml:UserDefinedCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:userDefinedCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:userDefinedCSRef"/>
         <xsl:call-template name="gml:UserDefinedCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:SphericalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:SphericalCS"/>
         <xsl:call-template name="gml:SphericalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:sphericalCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:sphericalCSRef"/>
         <xsl:call-template name="gml:SphericalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:PolarCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PolarCS"/>
         <xsl:call-template name="gml:PolarCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:polarCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polarCSRef"/>
         <xsl:call-template name="gml:PolarCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CylindricalCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CylindricalCS"/>
         <xsl:call-template name="gml:CylindricalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:cylindricalCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:cylindricalCSRef"/>
         <xsl:call-template name="gml:CylindricalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ObliqueCartesianCS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ObliqueCartesianCS"/>
         <xsl:call-template name="gml:ObliqueCartesianCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:obliqueCartesianCSRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:obliqueCartesianCSRef"/>
         <xsl:call-template name="gml:ObliqueCartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Surface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Surface"/>
         <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:surfaceProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceProperty"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:surfaceArrayProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceArrayProperty"/>
         <xsl:call-template name="gml:SurfaceArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Polygon">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Polygon"/>
         <xsl:call-template name="gml:PolygonType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Ring">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Ring"/>
         <xsl:call-template name="gml:AbstractRingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:exterior">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:exterior"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:interior">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:interior"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:outerBoundaryIs">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:outerBoundaryIs"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:innerBoundaryIs">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:innerBoundaryIs"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LinearRing">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LinearRing"/>
         <xsl:call-template name="gml:LinearRingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:polygonProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polygonProperty"/>
         <xsl:call-template name="gml:PolygonPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:dataSource">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dataSource"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:status">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:status"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimeSlice">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeSlice"/>
         <xsl:call-template name="gml:AbstractTimeSliceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MovingObjectStatus">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MovingObjectStatus"/>
         <xsl:call-template name="gml:MovingObjectStatusType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:history">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:history"/>
         <xsl:call-template name="gml:HistoryPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:track">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:track"/>
         <xsl:call-template name="gml:TrackType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimeObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeObject"/>
         <xsl:call-template name="gml:AbstractTimeObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimePrimitive">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimePrimitive"/>
         <xsl:call-template name="gml:AbstractTimePrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimeComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeComplex"/>
         <xsl:call-template name="gml:AbstractTimeComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimeGeometricPrimitive">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeGeometricPrimitive"/>
         <xsl:call-template name="gml:AbstractTimeGeometricPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeInstant">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeInstant"/>
         <xsl:call-template name="gml:TimeInstantType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimePeriod">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimePeriod"/>
         <xsl:call-template name="gml:TimePeriodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:timeInterval">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:timeInterval"/>
         <xsl:call-template name="gml:TimeIntervalLengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:timePosition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:timePosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:validTime">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:validTime"/>
         <xsl:call-template name="gml:TimePrimitivePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:direction">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:direction"/>
         <xsl:call-template name="gml:DirectionPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DirectionVector">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectionVector"/>
         <xsl:call-template name="gml:DirectionVectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CompassPoint_Substitution">
      <xsl:call-template name="gml:CompassPointEnumeration_Template"/>
   </xsl:template>
   <xsl:template match="//gml:_GeometricAggregate">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeometricAggregate"/>
         <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiGeometry">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiGeometry"/>
         <xsl:call-template name="gml:MultiGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiGeometryProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiGeometryProperty"/>
         <xsl:call-template name="gml:MultiGeometryPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiPoint">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiPoint"/>
         <xsl:call-template name="gml:MultiPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiPointProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiPointProperty"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiCurve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiCurve"/>
         <xsl:call-template name="gml:MultiCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiCurveProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCurveProperty"/>
         <xsl:call-template name="gml:MultiCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSurface"/>
         <xsl:call-template name="gml:MultiSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiSurfaceProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSurfaceProperty"/>
         <xsl:call-template name="gml:MultiSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiSolid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSolid"/>
         <xsl:call-template name="gml:MultiSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiSolidProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSolidProperty"/>
         <xsl:call-template name="gml:MultiSolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiPolygon">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiPolygon"/>
         <xsl:call-template name="gml:MultiPolygonType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:MultiLineString">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiLineString"/>
         <xsl:call-template name="gml:MultiLineStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:geometryMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geometryMember"/>
         <xsl:call-template name="gml:GeometryPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:geometryMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geometryMembers"/>
         <xsl:call-template name="gml:GeometryArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pointMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointMember"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pointMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointMembers"/>
         <xsl:call-template name="gml:PointArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:curveMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveMembers"/>
         <xsl:call-template name="gml:CurveArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:surfaceMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceMember"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:surfaceMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceMembers"/>
         <xsl:call-template name="gml:SurfaceArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:solidMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidMember"/>
         <xsl:call-template name="gml:SolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:solidMembers">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidMembers"/>
         <xsl:call-template name="gml:SolidArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiCenterOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCenterOf"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiPosition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiPosition"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiCenterLineOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCenterLineOf"/>
         <xsl:call-template name="gml:MultiCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiEdgeOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiEdgeOf"/>
         <xsl:call-template name="gml:MultiCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiCoverage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCoverage"/>
         <xsl:call-template name="gml:MultiSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiExtentOf">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiExtentOf"/>
         <xsl:call-template name="gml:MultiSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:multiLocation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiLocation"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:lineStringMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:lineStringMember"/>
         <xsl:call-template name="gml:LineStringPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:polygonMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polygonMember"/>
         <xsl:call-template name="gml:PolygonPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_positionalAccuracy">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_positionalAccuracy"/>
         <xsl:call-template name="gml:AbstractPositionalAccuracyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:measureDescription">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:measureDescription"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:absoluteExternalPositionalAccuracy">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:absoluteExternalPositionalAccuracy"/>
         <xsl:call-template name="gml:AbsoluteExternalPositionalAccuracyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:relativeInternalPositionalAccuracy">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:relativeInternalPositionalAccuracy"/>
         <xsl:call-template name="gml:RelativeInternalPositionalAccuracyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:result">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:result"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:covarianceMatrix">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:covarianceMatrix"/>
         <xsl:call-template name="gml:CovarianceMatrixType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:includesElement">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesElement"/>
         <xsl:call-template name="gml:CovarianceElementType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_ReferenceSystem">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ReferenceSystem"/>
         <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:srsName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:srsName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:srsID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:srsID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:referenceSystemRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:referenceSystemRef"/>
         <xsl:call-template name="gml:ReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_CRS">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CRS"/>
         <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:crsRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:crsRef"/>
         <xsl:call-template name="gml:CRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:remarks">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:remarks"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:validArea">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:validArea"/>
         <xsl:call-template name="gml:ExtentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:boundingBox">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:boundingBox"/>
         <xsl:call-template name="gml:EnvelopeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:boundingPolygon">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:boundingPolygon"/>
         <xsl:call-template name="gml:PolygonType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:verticalExtent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalExtent"/>
         <xsl:call-template name="gml:EnvelopeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:temporalExtent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalExtent"/>
         <xsl:call-template name="gml:TimePeriodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Null_Substitution">
      <xsl:call-template name="gml:NullType_Template"/>
   </xsl:template>
   <xsl:template match="//gml:_Datum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Datum"/>
         <xsl:call-template name="gml:AbstractDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:datumName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:datumName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:datumID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:datumID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:anchorPoint">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:anchorPoint"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:datumRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:datumRef"/>
         <xsl:call-template name="gml:DatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:EngineeringDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EngineeringDatum"/>
         <xsl:call-template name="gml:EngineeringDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:engineeringDatumRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:engineeringDatumRef"/>
         <xsl:call-template name="gml:EngineeringDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ImageDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ImageDatum"/>
         <xsl:call-template name="gml:ImageDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:pixelInCell">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pixelInCell"/>
         <xsl:call-template name="gml:PixelInCellType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:imageDatumRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:imageDatumRef"/>
         <xsl:call-template name="gml:ImageDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:VerticalDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:VerticalDatum"/>
         <xsl:call-template name="gml:VerticalDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:verticalDatumType">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalDatumType"/>
         <xsl:call-template name="gml:VerticalDatumTypeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:verticalDatumRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalDatumRef"/>
         <xsl:call-template name="gml:VerticalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TemporalDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TemporalDatum"/>
         <xsl:call-template name="gml:TemporalDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:temporalDatumRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalDatumRef"/>
         <xsl:call-template name="gml:TemporalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GeodeticDatum">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeodeticDatum"/>
         <xsl:call-template name="gml:GeodeticDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesPrimeMeridian">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesPrimeMeridian"/>
         <xsl:call-template name="gml:PrimeMeridianRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:usesEllipsoid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesEllipsoid"/>
         <xsl:call-template name="gml:EllipsoidRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:geodeticDatumRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geodeticDatumRef"/>
         <xsl:call-template name="gml:GeodeticDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:PrimeMeridian">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PrimeMeridian"/>
         <xsl:call-template name="gml:PrimeMeridianType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:meridianName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:meridianName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:meridianID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:meridianID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:greenwichLongitude">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:greenwichLongitude"/>
         <xsl:call-template name="gml:AngleChoiceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:primeMeridianRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:primeMeridianRef"/>
         <xsl:call-template name="gml:PrimeMeridianRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Ellipsoid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Ellipsoid"/>
         <xsl:call-template name="gml:EllipsoidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidID">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:semiMajorAxis">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:semiMajorAxis"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidRef">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidRef"/>
         <xsl:call-template name="gml:EllipsoidRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:secondDefiningParameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:secondDefiningParameter"/>
         <xsl:call-template name="gml:SecondDefiningParameterType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:inverseFlattening">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:inverseFlattening"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:semiMinorAxis">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:semiMinorAxis"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:isSphere_Substitution">
      <xsl:call-template name="_Template"/>
   </xsl:template>
   <xsl:template match="//gml:TimeTopologyComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeTopologyComplex"/>
         <xsl:call-template name="gml:TimeTopologyComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_TimeTopologyPrimitive">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeTopologyPrimitive"/>
         <xsl:call-template name="gml:AbstractTimeTopologyPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeNode">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeNode"/>
         <xsl:call-template name="gml:TimeNodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TimeEdge">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeEdge"/>
         <xsl:call-template name="gml:TimeEdgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:measure">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:measure"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:angle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:angle"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:dmsAngle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dmsAngle"/>
         <xsl:call-template name="gml:DMSAngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:degrees">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:degrees"/>
         <xsl:call-template name="gml:DegreesType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:decimalMinutes_Substitution">
      <xsl:call-template name="gml:DecimalMinutesType_Template"/>
   </xsl:template>
   <xsl:template name="gml:minutes_Substitution">
      <xsl:call-template name="gml:ArcMinutesType_Template"/>
   </xsl:template>
   <xsl:template name="gml:seconds_Substitution">
      <xsl:call-template name="gml:ArcSecondsType_Template"/>
   </xsl:template>
   <xsl:template match="//gml:defaultStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:defaultStyle"/>
         <xsl:call-template name="gml:DefaultStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Style">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Style"/>
         <xsl:call-template name="gml:AbstractStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Style">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Style"/>
         <xsl:call-template name="gml:StyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:featureStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureStyle"/>
         <xsl:call-template name="gml:FeatureStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:FeatureStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:FeatureStyle"/>
         <xsl:call-template name="gml:FeatureStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:geometryStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geometryStyle"/>
         <xsl:call-template name="gml:GeometryStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GeometryStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeometryStyle"/>
         <xsl:call-template name="gml:GeometryStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:topologyStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topologyStyle"/>
         <xsl:call-template name="gml:TopologyStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TopologyStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopologyStyle"/>
         <xsl:call-template name="gml:TopologyStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:labelStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:labelStyle"/>
         <xsl:call-template name="gml:LabelStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LabelStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LabelStyle"/>
         <xsl:call-template name="gml:LabelStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:graphStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:graphStyle"/>
         <xsl:call-template name="gml:GraphStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GraphStyle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GraphStyle"/>
         <xsl:call-template name="gml:GraphStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:symbol">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:symbol"/>
         <xsl:call-template name="gml:SymbolType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Curve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Curve"/>
         <xsl:call-template name="gml:CurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:baseCurve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:baseCurve"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:OrientableCurve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OrientableCurve"/>
         <xsl:call-template name="gml:OrientableCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_CurveSegment">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CurveSegment"/>
         <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:segments">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:segments"/>
         <xsl:call-template name="gml:CurveSegmentArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:LineStringSegment">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LineStringSegment"/>
         <xsl:call-template name="gml:LineStringSegmentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ArcString">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcString"/>
         <xsl:call-template name="gml:ArcStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Arc">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Arc"/>
         <xsl:call-template name="gml:ArcType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Circle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Circle"/>
         <xsl:call-template name="gml:CircleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ArcStringByBulge">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcStringByBulge"/>
         <xsl:call-template name="gml:ArcStringByBulgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ArcByBulge">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcByBulge"/>
         <xsl:call-template name="gml:ArcByBulgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ArcByCenterPoint">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcByCenterPoint"/>
         <xsl:call-template name="gml:ArcByCenterPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CircleByCenterPoint">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CircleByCenterPoint"/>
         <xsl:call-template name="gml:CircleByCenterPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:OffsetCurve">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OffsetCurve"/>
         <xsl:call-template name="gml:OffsetCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:AffinePlacement">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:AffinePlacement"/>
         <xsl:call-template name="gml:AffinePlacementType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Clothoid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Clothoid"/>
         <xsl:call-template name="gml:ClothoidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:GeodesicString">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeodesicString"/>
         <xsl:call-template name="gml:GeodesicStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Geodesic">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Geodesic"/>
         <xsl:call-template name="gml:GeodesicType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:CubicSpline">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CubicSpline"/>
         <xsl:call-template name="gml:CubicSplineType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:BSpline">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:BSpline"/>
         <xsl:call-template name="gml:BSplineType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Bezier">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Bezier"/>
         <xsl:call-template name="gml:BezierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Surface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Surface"/>
         <xsl:call-template name="gml:SurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:baseSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:baseSurface"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:OrientableSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OrientableSurface"/>
         <xsl:call-template name="gml:OrientableSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_SurfacePatch">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_SurfacePatch"/>
         <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:patches">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:patches"/>
         <xsl:call-template name="gml:SurfacePatchArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:PolygonPatch">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PolygonPatch"/>
         <xsl:call-template name="gml:PolygonPatchType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Triangle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Triangle"/>
         <xsl:call-template name="gml:TriangleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Rectangle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Rectangle"/>
         <xsl:call-template name="gml:RectangleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:curveMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveMember"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Ring">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Ring"/>
         <xsl:call-template name="gml:RingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_ParametricCurveSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ParametricCurveSurface"/>
         <xsl:call-template name="gml:AbstractParametricCurveSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_GriddedSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GriddedSurface"/>
         <xsl:call-template name="gml:AbstractGriddedSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Cone">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Cone"/>
         <xsl:call-template name="gml:ConeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Cylinder">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Cylinder"/>
         <xsl:call-template name="gml:CylinderType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Sphere">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Sphere"/>
         <xsl:call-template name="gml:SphereType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:PolyhedralSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PolyhedralSurface"/>
         <xsl:call-template name="gml:PolyhedralSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:polygonPatches">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polygonPatches"/>
         <xsl:call-template name="gml:PolygonPatchArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:trianglePatches">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:trianglePatches"/>
         <xsl:call-template name="gml:TrianglePatchArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:TriangulatedSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TriangulatedSurface"/>
         <xsl:call-template name="gml:TriangulatedSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Tin">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Tin"/>
         <xsl:call-template name="gml:TinType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_Solid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Solid"/>
         <xsl:call-template name="gml:AbstractSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:solidProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidProperty"/>
         <xsl:call-template name="gml:SolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:solidArrayProperty">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidArrayProperty"/>
         <xsl:call-template name="gml:SolidArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Solid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Solid"/>
         <xsl:call-template name="gml:SolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:_ImplicitGeometry">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ImplicitGeometry"/>
         <xsl:call-template name="gml:AbstractGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:Grid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Grid"/>
         <xsl:call-template name="gml:GridType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:RectifiedGrid">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:RectifiedGrid"/>
         <xsl:call-template name="gml:RectifiedGridType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:unitOfMeasure">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:unitOfMeasure"/>
         <xsl:call-template name="gml:UnitOfMeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:UnitDefinition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:UnitDefinition"/>
         <xsl:call-template name="gml:UnitDefinitionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:BaseUnit">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:BaseUnit"/>
         <xsl:call-template name="gml:BaseUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:DerivedUnit">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DerivedUnit"/>
         <xsl:call-template name="gml:DerivedUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:ConventionalUnit">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ConventionalUnit"/>
         <xsl:call-template name="gml:ConventionalUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:quantityType">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:quantityType"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:catalogSymbol">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:catalogSymbol"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:derivationUnitTerm">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:derivationUnitTerm"/>
         <xsl:call-template name="gml:DerivationUnitTermType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:conversionToPreferredUnit">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:conversionToPreferredUnit"/>
         <xsl:call-template name="gml:ConversionToPreferredUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:roughConversionToPreferredUnit">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:roughConversionToPreferredUnit"/>
         <xsl:call-template name="gml:ConversionToPreferredUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//app:Appearance">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:Appearance"/>
         <xsl:call-template name="app:AppearanceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfAppearance_Substitution"/>
   <xsl:template match="//app:appearanceMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:appearanceMember"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//app:appearance">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:appearance"/>
         <xsl:call-template name="app:AppearancePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//app:_SurfaceData">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:_SurfaceData"/>
         <xsl:call-template name="app:AbstractSurfaceDataType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfSurfaceData_Substitution"/>
   <xsl:template match="//app:_Texture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:_Texture"/>
         <xsl:call-template name="app:AbstractTextureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTexture_Substitution"/>
   <xsl:template match="//app:ParameterizedTexture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:ParameterizedTexture"/>
         <xsl:call-template name="app:ParameterizedTextureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfParameterizedTexture_Substitution"/>
   <xsl:template match="//app:GeoreferencedTexture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:GeoreferencedTexture"/>
         <xsl:call-template name="app:GeoreferencedTextureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfGeoreferencedTexture_Substitution"/>
   <xsl:template match="//app:_TextureParameterization">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:_TextureParameterization"/>
         <xsl:call-template name="app:AbstractTextureParameterizationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTextureParameterization_Substitution"/>
   <xsl:template match="//app:TexCoordList">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:TexCoordList"/>
         <xsl:call-template name="app:TexCoordListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTexCoordList_Substitution"/>
   <xsl:template match="//app:TexCoordGen">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:TexCoordGen"/>
         <xsl:call-template name="app:TexCoordGenType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTexCoordGen_Substitution"/>
   <xsl:template match="//app:X3DMaterial">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="app:X3DMaterial"/>
         <xsl:call-template name="app:X3DMaterialType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfX3DMaterial_Substitution"/>
   <xsl:template match="//frn:CityFurniture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="frn:CityFurniture"/>
         <xsl:call-template name="frn:CityFurnitureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="frn:_GenericApplicationPropertyOfCityFurniture_Substitution"/>
   <xsl:template match="//wtr:_WaterObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:_WaterObject"/>
         <xsl:call-template name="wtr:AbstractWaterObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterObject_Substitution"/>
   <xsl:template match="//wtr:WaterBody">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:WaterBody"/>
         <xsl:call-template name="wtr:WaterBodyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterBody_Substitution"/>
   <xsl:template match="//wtr:_WaterBoundarySurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:_WaterBoundarySurface"/>
         <xsl:call-template name="wtr:AbstractWaterBoundarySurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterBoundarySurface_Substitution"/>
   <xsl:template match="//wtr:WaterSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:WaterSurface"/>
         <xsl:call-template name="wtr:WaterSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterSurface_Substitution"/>
   <xsl:template match="//wtr:WaterGroundSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:WaterGroundSurface"/>
         <xsl:call-template name="wtr:WaterGroundSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterGroundSurface_Substitution"/>
   <xsl:template match="//wtr:WaterClosureSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:WaterClosureSurface"/>
         <xsl:call-template name="wtr:WaterClosureSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterClosureSurface_Substitution"/>
   <xsl:template match="//core:CityModel">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:CityModel"/>
         <xsl:call-template name="core:CityModelType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfCityModel_Substitution"/>
   <xsl:template match="//core:cityObjectMember">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:cityObjectMember"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//core:_CityObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:_CityObject"/>
         <xsl:call-template name="core:AbstractCityObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfCityObject_Substitution"/>
   <xsl:template match="//core:_Site">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:_Site"/>
         <xsl:call-template name="core:AbstractSiteType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfSite_Substitution"/>
   <xsl:template match="//core:Address">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:Address"/>
         <xsl:call-template name="core:AddressType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfAddress_Substitution"/>
   <xsl:template match="//core:ImplicitGeometry">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:ImplicitGeometry"/>
         <xsl:call-template name="core:ImplicitGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//veg:_VegetationObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="veg:_VegetationObject"/>
         <xsl:call-template name="veg:AbstractVegetationObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:_GenericApplicationPropertyOfVegetationObject_Substitution"/>
   <xsl:template match="//veg:PlantCover">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="veg:PlantCover"/>
         <xsl:call-template name="veg:PlantCoverType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:_GenericApplicationPropertyOfPlantCover_Substitution"/>
   <xsl:template match="//veg:SolitaryVegetationObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="veg:SolitaryVegetationObject"/>
         <xsl:call-template name="veg:SolitaryVegetationObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:_GenericApplicationPropertyOfSolitaryVegetationObject_Substitution"/>
   <xsl:template match="//tran:_TransportationObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:_TransportationObject"/>
         <xsl:call-template name="tran:AbstractTransportationObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTransportationObject_Substitution"/>
   <xsl:template match="//tran:TransportationComplex">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:TransportationComplex"/>
         <xsl:call-template name="tran:TransportationComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTransportationComplex_Substitution"/>
   <xsl:template match="//tran:TrafficArea">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:TrafficArea"/>
         <xsl:call-template name="tran:TrafficAreaType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTrafficArea_Substitution"/>
   <xsl:template match="//tran:AuxiliaryTrafficArea">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:AuxiliaryTrafficArea"/>
         <xsl:call-template name="tran:AuxiliaryTrafficAreaType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfAuxiliaryTrafficArea_Substitution"/>
   <xsl:template match="//tran:Track">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:Track"/>
         <xsl:call-template name="tran:TrackType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTrack_Substitution"/>
   <xsl:template match="//tran:Road">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:Road"/>
         <xsl:call-template name="tran:RoadType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfRoad_Substitution"/>
   <xsl:template match="//tran:Railway">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:Railway"/>
         <xsl:call-template name="tran:RailwayType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfRailway_Substitution"/>
   <xsl:template match="//tran:Square">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tran:Square"/>
         <xsl:call-template name="tran:SquareType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfSquare_Substitution"/>
   <xsl:template match="//tex:TexturedSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tex:TexturedSurface"/>
         <xsl:call-template name="tex:TexturedSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//tex:appearance">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tex:appearance"/>
         <xsl:call-template name="tex:AppearancePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//tex:_Appearance">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tex:_Appearance"/>
         <xsl:call-template name="tex:AbstractAppearanceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//tex:Material">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tex:Material"/>
         <xsl:call-template name="tex:MaterialType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//tex:SimpleTexture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tex:SimpleTexture"/>
         <xsl:call-template name="tex:SimpleTextureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//luse:LandUse">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="luse:LandUse"/>
         <xsl:call-template name="luse:LandUseType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="luse:_GenericApplicationPropertyOfLandUse_Substitution"/>
   <xsl:template match="//tun:_AbstractTunnel">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:_AbstractTunnel"/>
         <xsl:call-template name="tun:AbstractTunnelType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfAbstractTunnel_Substitution"/>
   <xsl:template match="//tun:Tunnel">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:Tunnel"/>
         <xsl:call-template name="tun:TunnelType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnel_Substitution"/>
   <xsl:template match="//tun:TunnelPart">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:TunnelPart"/>
         <xsl:call-template name="tun:TunnelPartType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnelPart_Substitution"/>
   <xsl:template match="//tun:TunnelInstallation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:TunnelInstallation"/>
         <xsl:call-template name="tun:TunnelInstallationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnelInstallation_Substitution"/>
   <xsl:template match="//tun:IntTunnelInstallation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:IntTunnelInstallation"/>
         <xsl:call-template name="tun:IntTunnelInstallationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfIntTunnelInstallation_Substitution"/>
   <xsl:template match="//tun:_BoundarySurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:_BoundarySurface"/>
         <xsl:call-template name="tun:AbstractBoundarySurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfBoundarySurface_Substitution"/>
   <xsl:template match="//tun:RoofSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:RoofSurface"/>
         <xsl:call-template name="tun:RoofSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfRoofSurface_Substitution"/>
   <xsl:template match="//tun:WallSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:WallSurface"/>
         <xsl:call-template name="tun:WallSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfWallSurface_Substitution"/>
   <xsl:template match="//tun:GroundSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:GroundSurface"/>
         <xsl:call-template name="tun:GroundSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfGroundSurface_Substitution"/>
   <xsl:template match="//tun:ClosureSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:ClosureSurface"/>
         <xsl:call-template name="tun:ClosureSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfClosureSurface_Substitution"/>
   <xsl:template match="//tun:FloorSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:FloorSurface"/>
         <xsl:call-template name="tun:FloorSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfFloorSurface_Substitution"/>
   <xsl:template match="//tun:OuterFloorSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:OuterFloorSurface"/>
         <xsl:call-template name="tun:OuterFloorSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfOuterFloorSurface_Substitution"/>
   <xsl:template match="//tun:InteriorWallSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:InteriorWallSurface"/>
         <xsl:call-template name="tun:InteriorWallSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfInteriorWallSurface_Substitution"/>
   <xsl:template match="//tun:CeilingSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:CeilingSurface"/>
         <xsl:call-template name="tun:CeilingSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfCeilingSurface_Substitution"/>
   <xsl:template match="//tun:OuterCeilingSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:OuterCeilingSurface"/>
         <xsl:call-template name="tun:OuterCeilingSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfOuterCeilingSurface_Substitution"/>
   <xsl:template match="//tun:HollowSpace">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:HollowSpace"/>
         <xsl:call-template name="tun:HollowSpaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfHollowSpace_Substitution"/>
   <xsl:template match="//tun:TunnelFurniture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:TunnelFurniture"/>
         <xsl:call-template name="tun:TunnelFurnitureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnelFurniture_Substitution"/>
   <xsl:template match="//tun:_Opening">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:_Opening"/>
         <xsl:call-template name="tun:AbstractOpeningType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfOpening_Substitution"/>
   <xsl:template match="//tun:Window">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:Window"/>
         <xsl:call-template name="tun:WindowType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfWindow_Substitution"/>
   <xsl:template match="//tun:Door">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="tun:Door"/>
         <xsl:call-template name="tun:DoorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfDoor_Substitution"/>
   <xsl:template match="//xAL:xAL">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:xAL"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:AddressDetails">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:AddressDetails"/>
         <xsl:call-template name="xAL:AddressDetails_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:AddressLine">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:AddressLine"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:Locality">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:Locality"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:Thoroughfare">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:Thoroughfare"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:AdministrativeArea">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:AdministrativeArea"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:PostOffice">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:PostOffice"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:PostalCode">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:PostalCode"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:PostBox">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:PostBox"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:Department">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:Department"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:Premise">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:Premise"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:ThoroughfareNumberPrefix">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:ThoroughfareNumberPrefix"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:ThoroughfareNumberSuffix">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:ThoroughfareNumberSuffix"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:ThoroughfareNumber">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:ThoroughfareNumber"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:PremiseNumber">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:PremiseNumber"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:PremiseNumberPrefix">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:PremiseNumberPrefix"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'PremiseNumberPrefix', '_', generate-id() )}">
         <rdf:type rdf:resource=""/>
         <xsl:call-template name="xAL:PremiseNumberPrefix_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:PremiseNumberSuffix">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:PremiseNumberSuffix"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//xAL:CountryName">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="xAL:CountryName"/>
         <xsl:call-template name="_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//grp:CityObjectGroup">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="grp:CityObjectGroup"/>
         <xsl:call-template name="grp:CityObjectGroupType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="grp:_GenericApplicationPropertyOfCityObjectGroup_Substitution"/>
   <xsl:template match="//dem:ReliefFeature">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:ReliefFeature"/>
         <xsl:call-template name="dem:ReliefFeatureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfReliefFeature_Substitution"/>
   <xsl:template match="//dem:_ReliefComponent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:_ReliefComponent"/>
         <xsl:call-template name="dem:AbstractReliefComponentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfReliefComponent_Substitution"/>
   <xsl:template match="//dem:TINRelief">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:TINRelief"/>
         <xsl:call-template name="dem:TINReliefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfTinRelief_Substitution"/>
   <xsl:template match="//dem:RasterRelief">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:RasterRelief"/>
         <xsl:call-template name="dem:RasterReliefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfRasterRelief_Substitution"/>
   <xsl:template match="//dem:MassPointRelief">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:MassPointRelief"/>
         <xsl:call-template name="dem:MassPointReliefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfMassPointRelief_Substitution"/>
   <xsl:template match="//dem:BreaklineRelief">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:BreaklineRelief"/>
         <xsl:call-template name="dem:BreaklineReliefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfBreaklineRelief_Substitution"/>
   <xsl:template match="//dem:Elevation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="dem:Elevation"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:_AbstractBuilding">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:_AbstractBuilding"/>
         <xsl:call-template name="bldg:AbstractBuildingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfAbstractBuilding_Substitution"/>
   <xsl:template match="//bldg:Building">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Building"/>
         <xsl:call-template name="bldg:BuildingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuilding_Substitution"/>
   <xsl:template match="//bldg:BuildingPart">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:BuildingPart"/>
         <xsl:call-template name="bldg:BuildingPartType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingPart_Substitution"/>
   <xsl:template match="//bldg:BuildingInstallation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:BuildingInstallation"/>
         <xsl:call-template name="bldg:BuildingInstallationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingInstallation_Substitution"/>
   <xsl:template match="//bldg:IntBuildingInstallation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:IntBuildingInstallation"/>
         <xsl:call-template name="bldg:IntBuildingInstallationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfIntBuildingInstallation_Substitution"/>
   <xsl:template match="//bldg:_BoundarySurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:_BoundarySurface"/>
         <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBoundarySurface_Substitution"/>
   <xsl:template match="//bldg:RoofSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:RoofSurface"/>
         <xsl:call-template name="bldg:RoofSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfRoofSurface_Substitution"/>
   <xsl:template match="//bldg:WallSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:WallSurface"/>
         <xsl:call-template name="bldg:WallSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfWallSurface_Substitution"/>
   <xsl:template match="//bldg:GroundSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:GroundSurface"/>
         <xsl:call-template name="bldg:GroundSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfGroundSurface_Substitution"/>
   <xsl:template match="//bldg:ClosureSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:ClosureSurface"/>
         <xsl:call-template name="bldg:ClosureSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfClosureSurface_Substitution"/>
   <xsl:template match="//bldg:FloorSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:FloorSurface"/>
         <xsl:call-template name="bldg:FloorSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfFloorSurface_Substitution"/>
   <xsl:template match="//bldg:OuterFloorSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:OuterFloorSurface"/>
         <xsl:call-template name="bldg:OuterFloorSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOuterFloorSurface_Substitution"/>
   <xsl:template match="//bldg:InteriorWallSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:InteriorWallSurface"/>
         <xsl:call-template name="bldg:InteriorWallSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfInteriorWallSurface_Substitution"/>
   <xsl:template match="//bldg:CeilingSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:CeilingSurface"/>
         <xsl:call-template name="bldg:CeilingSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfCeilingSurface_Substitution"/>
   <xsl:template match="//bldg:OuterCeilingSurface">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:OuterCeilingSurface"/>
         <xsl:call-template name="bldg:OuterCeilingSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOuterCeilingSurface_Substitution"/>
   <xsl:template match="//bldg:_Opening">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:_Opening"/>
         <xsl:call-template name="bldg:AbstractOpeningType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOpening_Substitution"/>
   <xsl:template match="//bldg:Window">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Window"/>
         <xsl:call-template name="bldg:WindowType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfWindow_Substitution"/>
   <xsl:template match="//bldg:Door">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Door"/>
         <xsl:call-template name="bldg:DoorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfDoor_Substitution"/>
   <xsl:template match="//bldg:Room">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Room"/>
         <xsl:call-template name="bldg:RoomType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfRoom_Substitution"/>
   <xsl:template match="//bldg:BuildingFurniture">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:BuildingFurniture"/>
         <xsl:call-template name="bldg:BuildingFurnitureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingFurniture_Substitution"/>
   <xsl:template match="//gen:GenericCityObject">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:GenericCityObject"/>
         <xsl:call-template name="gen:GenericCityObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:_genericAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:_genericAttribute"/>
         <xsl:call-template name="gen:AbstractGenericAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:stringAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:stringAttribute"/>
         <xsl:call-template name="gen:StringAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:intAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:intAttribute"/>
         <xsl:call-template name="gen:IntAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:doubleAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:doubleAttribute"/>
         <xsl:call-template name="gen:DoubleAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:dateAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:dateAttribute"/>
         <xsl:call-template name="gen:DateAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:uriAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:uriAttribute"/>
         <xsl:call-template name="gen:UriAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:measureAttribute">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:measureAttribute"/>
         <xsl:call-template name="gen:MeasureAttributeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gen:genericAttributeSet">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gen:genericAttributeSet"/>
         <xsl:call-template name="gen:GenericAttributeSetType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:domainSet_Property">
      <gml:hasdomainSet xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rangeSet_Property">
      <gml:hasrangeSet xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coverageFunction_Property">
      <gml:hascoverageFunction xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Geometry_Property">
      <gml:has_Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeObject_Property">
      <gml:has_TimeObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ValueArray_Property">
      <gml:hasValueArray xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DataBlock_Property">
      <gml:hasDataBlock xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:File_Property">
      <gml:hasFile xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MappingRule_Property">
      <gml:hasMappingRule xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GridFunction_Property">
      <gml:hasGridFunction xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rangeParameters_Property">
      <gml:hasrangeParameters xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:tupleList_Property">
      <gml:hastupleList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:doubleOrNullTupleList_Property">
      <gml:hasdoubleOrNullTupleList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:fileName_Property">
      <gml:fileName>
         <xsl:value-of select="text()"/>
      </gml:fileName>
   </xsl:template>
   <xsl:template name="gml:fileStructure_Property">
      <gml:fileStructure xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:mimeType_Property">
      <gml:mimeType>
         <xsl:value-of select="text()"/>
      </gml:mimeType>
   </xsl:template>
   <xsl:template name="gml:compression_Property">
      <gml:compression>
         <xsl:value-of select="text()"/>
      </gml:compression>
   </xsl:template>
   <xsl:template name="gml:sequenceRule_Property">
      <gml:sequenceRule xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:SequenceRuleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:sequenceRule">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'SequenceRuleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:sequenceRule"/>
         <xsl:call-template name="gml:SequenceRuleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:startPoint_Property">
      <gml:startPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:lookUpTable_Property">
      <gml:lookUpTable xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:boundedBy_Property">
      <gml:hasboundedBy xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiPointDomain_Property">
      <gml:hasmultiPointDomain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiPoint_Property">
      <gml:hasMultiPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiCurveDomain_Property">
      <gml:hasmultiCurveDomain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiCurve_Property">
      <gml:hasMultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiSurfaceDomain_Property">
      <gml:hasmultiSurfaceDomain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiSurface_Property">
      <gml:hasMultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiSolidDomain_Property">
      <gml:hasmultiSolidDomain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiSolid_Property">
      <gml:hasMultiSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:gridDomain_Property">
      <gml:hasgridDomain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Grid_Property">
      <gml:hasGrid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rectifiedGridDomain_Property">
      <gml:hasrectifiedGridDomain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:RectifiedGrid_Property">
      <gml:hasRectifiedGrid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:metaDataProperty_Property">
      <gml:hasmetaDataProperty xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:description_Property">
      <gml:hasdescription xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:name_Property">
      <gml:hasname xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dictionaryEntry_Property">
      <gml:hasdictionaryEntry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:indirectEntry_Property">
      <gml:hasindirectEntry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Definition_Property">
      <gml:hasDefinition xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DefinitionProxy_Property">
      <gml:hasDefinitionProxy xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:definitionRef_Property">
      <gml:hasdefinitionRef xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:location_Property">
      <gml:haslocation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:location xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:DirectPositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Envelope_Property">
      <gml:hasEnvelope xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Null_Property">
      <gml:hasNull xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:timePosition_Property">
      <gml:hastimePosition xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Feature_Property">
      <gml:has_Feature xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureMember_Property">
      <gml:hasfeatureMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureMembers_Property">
      <gml:hasfeatureMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LocationKeyWord_Property">
      <gml:hasLocationKeyWord xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LocationString_Property">
      <gml:hasLocationString xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:domainOfValidity_Property">
      <gml:domainOfValidity>
         <xsl:value-of select="text()"/>
      </gml:domainOfValidity>
   </xsl:template>
   <xsl:template name="gml:originPosition_Property">
      <gml:originPosition xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:TimePositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:originPosition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'TimePositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:originPosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:origin_Property">
      <gml:origin xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   <gml:hasorigin xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:interval_Property">
      <gml:interval xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:TimeIntervalLengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:interval">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'TimeIntervalLengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:interval"/>
         <xsl:call-template name="gml:TimeIntervalLengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:component_Property">
      <gml:component xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:relatedTime_Property">
      <gml:relatedTime xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:start_Property">
      <gml:start xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:end_Property">
      <gml:end xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:extent_Property">
      <gml:extent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:member_Property">
      <gml:member xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   <gml:hasmember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:group_Property">
      <gml:group xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalEra_Property">
      <gml:hasTimeOrdinalEra xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:referenceFrame_Property">
      <gml:referenceFrame xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendar_Property">
      <gml:hasTimeCalendar xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:referenceEvent_Property">
      <gml:referenceEvent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:StringOrRefType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:referenceEvent">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'StringOrRefType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:referenceEvent"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:referenceDate_Property">
      <gml:referenceDate>
         <xsl:value-of select="text()"/>
      </gml:referenceDate>
   </xsl:template>
   <xsl:template name="gml:julianReference_Property">
      <gml:julianReference>
         <xsl:value-of select="text()"/>
      </gml:julianReference>
   </xsl:template>
   <xsl:template name="gml:epochOfUse_Property">
      <gml:epochOfUse xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarEra_Property">
      <gml:hasTimeCalendarEra xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:referenceTime_Property">
      <gml:referenceTime>
         <xsl:value-of select="text()"/>
      </gml:referenceTime>
   </xsl:template>
   <xsl:template name="gml:utcReference_Property">
      <gml:utcReference>
         <xsl:value-of select="text()"/>
      </gml:utcReference>
   </xsl:template>
   <xsl:template name="gml:dateBasis_Property">
      <gml:dateBasis xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeClock_Property">
      <gml:hasTimeClock xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:isolated_Property">
      <gml:hasisolated xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:container_Property">
      <gml:hascontainer xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Node_Property">
      <gml:hasNode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Edge_Property">
      <gml:hasEdge xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Face_Property">
      <gml:hasFace xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoSolid_Property">
      <gml:hasTopoSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedEdge_Property">
      <gml:hasdirectedEdge xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointProperty_Property">
      <gml:haspointProperty xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedNode_Property">
      <gml:hasdirectedNode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedFace_Property">
      <gml:hasdirectedFace xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:curveProperty_Property">
      <gml:hascurveProperty xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedTopoSolid_Property">
      <gml:hasdirectedTopoSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:surfaceProperty_Property">
      <gml:hassurfaceProperty xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoPoint_Property">
      <gml:hasTopoPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoCurve_Property">
      <gml:hasTopoCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoSurface_Property">
      <gml:hasTopoSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoVolume_Property">
      <gml:hasTopoVolume xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:maximalComplex_Property">
      <gml:hasmaximalComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:superComplex_Property">
      <gml:hassuperComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:subComplex_Property">
      <gml:hassubComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:topoPrimitiveMember_Property">
      <gml:hastopoPrimitiveMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:topoPrimitiveMembers_Property">
      <gml:hastopoPrimitiveMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoComplex_Property">
      <gml:hasTopoComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TopoPrimitive_Property">
      <gml:has_TopoPrimitive xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationName_Property">
      <gml:hascoordinateOperationName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationID_Property">
      <gml:hascoordinateOperationID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:remarks_Property">
      <gml:hasremarks xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:operationVersion_Property">
      <gml:hasoperationVersion xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:validArea_Property">
      <gml:hasvalidArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:scope_Property">
      <gml:hasscope xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_positionalAccuracy_Property">
      <gml:has_positionalAccuracy xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:sourceCRS_Property">
      <gml:hassourceCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:targetCRS_Property">
      <gml:hastargetCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CoordinateOperation_Property">
      <gml:has_CoordinateOperation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesSingleOperation_Property">
      <gml:hasusesSingleOperation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ConcatenatedOperation_Property">
      <gml:hasConcatenatedOperation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_SingleOperation_Property">
      <gml:has_SingleOperation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:modifiedCoordinate_Property">
      <gml:hasmodifiedCoordinate xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesOperation_Property">
      <gml:hasusesOperation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PassThroughOperation_Property">
      <gml:hasPassThroughOperation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Operation_Property">
      <gml:has_Operation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeneralConversion_Property">
      <gml:has_GeneralConversion xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesMethod_Property">
      <gml:hasusesMethod xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesValue_Property">
      <gml:hasusesValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Conversion_Property">
      <gml:hasConversion xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeneralTransformation_Property">
      <gml:has_GeneralTransformation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Transformation_Property">
      <gml:hasTransformation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:value_Property">
      <gml:hasvalue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:value>
         <xsl:value-of select="text()"/>
      </gml:value>
   </xsl:template>
   <xsl:template name="gml:dmsAngleValue_Property">
      <gml:hasdmsAngleValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:stringValue_Property">
      <gml:hasstringValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:integerValue_Property">
      <gml:hasintegerValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:booleanValue_Property">
      <gml:hasbooleanValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueList_Property">
      <gml:hasvalueList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:integerValueList_Property">
      <gml:hasintegerValueList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueFile_Property">
      <gml:hasvalueFile xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueOfParameter_Property">
      <gml:hasvalueOfParameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesValue_Property">
      <gml:hasincludesValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valuesOfGroup_Property">
      <gml:hasvaluesOfGroup xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:methodName_Property">
      <gml:hasmethodName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:methodID_Property">
      <gml:hasmethodID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:methodFormula_Property">
      <gml:hasmethodFormula xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:sourceDimensions_Property">
      <gml:hassourceDimensions xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:targetDimensions_Property">
      <gml:hastargetDimensions xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesParameter_Property">
      <gml:hasusesParameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:OperationMethod_Property">
      <gml:hasOperationMethod xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:minimumOccurs_Property">
      <gml:hasminimumOccurs xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeneralOperationParameter_Property">
      <gml:has_GeneralOperationParameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:parameterName_Property">
      <gml:hasparameterName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:parameterID_Property">
      <gml:hasparameterID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameter_Property">
      <gml:hasOperationParameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:groupName_Property">
      <gml:hasgroupName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:groupID_Property">
      <gml:hasgroupID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:maximumOccurs_Property">
      <gml:hasmaximumOccurs xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesParameter_Property">
      <gml:hasincludesParameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterGroup_Property">
      <gml:hasOperationParameterGroup xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:curveMember_Property">
      <gml:hascurveMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeCurve_Property">
      <gml:hasCompositeCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:surfaceMember_Property">
      <gml:hassurfaceMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSurface_Property">
      <gml:hasCompositeSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:solidMember_Property">
      <gml:hassolidMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSolid_Property">
      <gml:hasCompositeSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:element_Property">
      <gml:element xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:GeometricComplex_Property">
      <gml:hasGeometricComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:members_Property">
      <gml:hasmembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Object_Property">
      <gml:has_Object xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueComponent_Property">
      <gml:hasvalueComponent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueComponents_Property">
      <gml:hasvalueComponents xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Boolean_Property">
      <gml:hasBoolean xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Category_Property">
      <gml:hasCategory xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Quantity_Property">
      <gml:hasQuantity xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Count_Property">
      <gml:hasCount xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeometricPrimitive_Property">
      <gml:has_GeometricPrimitive xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pos_Property">
      <gml:haspos xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coordinates_Property">
      <gml:hascoordinates xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coord_Property">
      <gml:hascoord xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Point_Property">
      <gml:hasPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Curve_Property">
      <gml:has_Curve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointRep_Property">
      <gml:haspointRep xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:posList_Property">
      <gml:hasposList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:lowerCorner_Property">
      <gml:lowerCorner xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:DirectPositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:lowerCorner">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'DirectPositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:lowerCorner"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:upperCorner_Property">
      <gml:upperCorner xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:DirectPositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:upperCorner">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'DirectPositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:upperCorner"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:X_Property">
      <gml:X>
         <xsl:value-of select="text()"/>
      </gml:X>
   </xsl:template>
   <xsl:template name="gml:Y_Property">
      <gml:Y>
         <xsl:value-of select="text()"/>
      </gml:Y>
   </xsl:template>
   <xsl:template name="gml:Z_Property">
      <gml:Z>
         <xsl:value-of select="text()"/>
      </gml:Z>
   </xsl:template>
   <xsl:template name="gml:LineString_Property">
      <gml:hasLineString xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CoordinateReferenceSystem_Property">
      <gml:has_CoordinateReferenceSystem xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesCRS_Property">
      <gml:hasincludesCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompoundCRS_Property">
      <gml:hasCompoundCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesEllipsoidalCS_Property">
      <gml:hasusesEllipsoidalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesGeodeticDatum_Property">
      <gml:hasusesGeodeticDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeographicCRS_Property">
      <gml:hasGeographicCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesVerticalCS_Property">
      <gml:hasusesVerticalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesVerticalDatum_Property">
      <gml:hasusesVerticalDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCRS_Property">
      <gml:hasVerticalCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesCartesianCS_Property">
      <gml:hasusesCartesianCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesSphericalCS_Property">
      <gml:hasusesSphericalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeocentricCRS_Property">
      <gml:hasGeocentricCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:baseCRS_Property">
      <gml:hasbaseCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:definedByConversion_Property">
      <gml:hasdefinedByConversion xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ProjectedCRS_Property">
      <gml:hasProjectedCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:derivedCRSType_Property">
      <gml:hasderivedCRSType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesCS_Property">
      <gml:hasusesCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DerivedCRS_Property">
      <gml:hasDerivedCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesEngineeringDatum_Property">
      <gml:hasusesEngineeringDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringCRS_Property">
      <gml:hasEngineeringCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesObliqueCartesianCS_Property">
      <gml:hasusesObliqueCartesianCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesImageDatum_Property">
      <gml:hasusesImageDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ImageCRS_Property">
      <gml:hasImageCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesTemporalCS_Property">
      <gml:hasusesTemporalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesTemporalDatum_Property">
      <gml:hasusesTemporalDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCRS_Property">
      <gml:hasTemporalCRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:validTime_Property">
      <gml:hasvalidTime xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:using_Property">
      <gml:hasusing xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:target_Property">
      <gml:hastarget xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:resultOf_Property">
      <gml:hasresultOf xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:direction_Property">
      <gml:hasdirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:direction>
         <xsl:value-of select="./@gml:direction"/>
      </gml:direction>
   </xsl:template>
   <xsl:template name="gml:distance_Property">
      <gml:distance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   <gml:distance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:distance">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:distance"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:distance"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:axisID_Property">
      <gml:hasaxisID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:axisAbbrev_Property">
      <gml:hasaxisAbbrev xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:axisDirection_Property">
      <gml:hasaxisDirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemAxis_Property">
      <gml:hasCoordinateSystemAxis xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:csName_Property">
      <gml:hascsName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:csID_Property">
      <gml:hascsID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesAxis_Property">
      <gml:hasusesAxis xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CoordinateSystem_Property">
      <gml:has_CoordinateSystem xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidalCS_Property">
      <gml:hasEllipsoidalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CartesianCS_Property">
      <gml:hasCartesianCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCS_Property">
      <gml:hasVerticalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCS_Property">
      <gml:hasTemporalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LinearCS_Property">
      <gml:hasLinearCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:UserDefinedCS_Property">
      <gml:hasUserDefinedCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:SphericalCS_Property">
      <gml:hasSphericalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PolarCS_Property">
      <gml:hasPolarCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CylindricalCS_Property">
      <gml:hasCylindricalCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ObliqueCartesianCS_Property">
      <gml:hasObliqueCartesianCS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Surface_Property">
      <gml:has_Surface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:exterior_Property">
      <gml:hasexterior xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:exterior xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:interior_Property">
      <gml:hasinterior xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:interior xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:_Ring_Property">
      <gml:has_Ring xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LinearRing_Property">
      <gml:hasLinearRing xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Polygon_Property">
      <gml:hasPolygon xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dataSource_Property">
      <gml:hasdataSource xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:speed_Property">
      <gml:speed xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:speed">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:speed"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:bearing_Property">
      <gml:bearing xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:acceleration_Property">
      <gml:acceleration xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:acceleration">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:acceleration"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:elevation_Property">
      <gml:elevation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:elevation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:elevation"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:status_Property">
      <gml:hasstatus xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeSlice_Property">
      <gml:has_TimeSlice xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MovingObjectStatus_Property">
      <gml:hasMovingObjectStatus xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimePrimitive_Property">
      <gml:has_TimePrimitive xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeGeometricPrimitive_Property">
      <gml:has_TimeGeometricPrimitive xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeInstant_Property">
      <gml:hasTimeInstant xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:beginPosition_Property">
      <gml:beginPosition xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:TimePositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:beginPosition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'TimePositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:beginPosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:begin_Property">
      <gml:begin xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:endPosition_Property">
      <gml:endPosition xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:TimePositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:endPosition">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'TimePositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:endPosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimePeriod_Property">
      <gml:hasTimePeriod xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DirectionVector_Property">
      <gml:hasDirectionVector xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompassPoint_Property">
      <gml:hasCompassPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DirectionKeyword_Property">
      <gml:DirectionKeyword xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectionKeyword">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectionKeyword"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DirectionString_Property">
      <gml:DirectionString xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:StringOrRefType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectionString">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'StringOrRefType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectionString"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:vector_Property">
      <gml:hasvector xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:horizontalAngle_Property">
      <gml:horizontalAngle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:horizontalAngle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:horizontalAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalAngle_Property">
      <gml:verticalAngle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalAngle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geometryMember_Property">
      <gml:hasgeometryMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:geometryMembers_Property">
      <gml:hasgeometryMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeometricAggregate_Property">
      <gml:has_GeometricAggregate xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointMember_Property">
      <gml:haspointMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointMembers_Property">
      <gml:haspointMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:curveMembers_Property">
      <gml:hascurveMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:surfaceMembers_Property">
      <gml:hassurfaceMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:solidMembers_Property">
      <gml:hassolidMembers xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:lineStringMember_Property">
      <gml:haslineStringMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiLineString_Property">
      <gml:hasMultiLineString xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:polygonMember_Property">
      <gml:haspolygonMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiPolygon_Property">
      <gml:hasMultiPolygon xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:measureDescription_Property">
      <gml:hasmeasureDescription xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:result_Property">
      <gml:hasresult xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:unitOfMeasure_Property">
      <gml:hasunitOfMeasure xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesElement_Property">
      <gml:hasincludesElement xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rowIndex_Property">
      <gml:hasrowIndex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:columnIndex_Property">
      <gml:hascolumnIndex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:covariance_Property">
      <gml:hascovariance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:srsName_Property">
      <gml:hassrsName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:srsName>
         <xsl:value-of select="./@gml:srsName"/>
      </gml:srsName>
   </xsl:template>
   <xsl:template name="gml:srsID_Property">
      <gml:hassrsID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_ReferenceSystem_Property">
      <gml:has_ReferenceSystem xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CRS_Property">
      <gml:has_CRS xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:version_Property">
      <gml:hasversion xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:boundingBox_Property">
      <gml:hasboundingBox xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:boundingPolygon_Property">
      <gml:hasboundingPolygon xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:verticalExtent_Property">
      <gml:hasverticalExtent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:temporalExtent_Property">
      <gml:hastemporalExtent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:datumName_Property">
      <gml:hasdatumName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:datumID_Property">
      <gml:hasdatumID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:anchorPoint_Property">
      <gml:hasanchorPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:realizationEpoch_Property">
      <gml:hasrealizationEpoch xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Datum_Property">
      <gml:has_Datum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringDatum_Property">
      <gml:hasEngineeringDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pixelInCell_Property">
      <gml:haspixelInCell xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ImageDatum_Property">
      <gml:hasImageDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:verticalDatumType_Property">
      <gml:hasverticalDatumType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:VerticalDatum_Property">
      <gml:hasVerticalDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TemporalDatum_Property">
      <gml:hasTemporalDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesPrimeMeridian_Property">
      <gml:hasusesPrimeMeridian xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesEllipsoid_Property">
      <gml:hasusesEllipsoid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeodeticDatum_Property">
      <gml:hasGeodeticDatum xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:meridianName_Property">
      <gml:hasmeridianName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:meridianID_Property">
      <gml:hasmeridianID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:greenwichLongitude_Property">
      <gml:hasgreenwichLongitude xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PrimeMeridian_Property">
      <gml:hasPrimeMeridian xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ellipsoidName_Property">
      <gml:hasellipsoidName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ellipsoidID_Property">
      <gml:hasellipsoidID xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:semiMajorAxis_Property">
      <gml:hassemiMajorAxis xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:secondDefiningParameter_Property">
      <gml:hassecondDefiningParameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Ellipsoid_Property">
      <gml:hasEllipsoid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:inverseFlattening_Property">
      <gml:hasinverseFlattening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:semiMinorAxis_Property">
      <gml:hassemiMinorAxis xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:isSphere_Property">
      <gml:hasisSphere xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:primitive_Property">
      <gml:primitive xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeTopologyComplex_Property">
      <gml:hasTimeTopologyComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:complex_Property">
      <gml:complex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeTopologyPrimitive_Property">
      <gml:has_TimeTopologyPrimitive xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:previousEdge_Property">
      <gml:previousEdge xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:nextEdge_Property">
      <gml:nextEdge xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:position_Property">
      <gml:position xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeNode_Property">
      <gml:hasTimeNode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeEdge_Property">
      <gml:hasTimeEdge xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:angle_Property">
      <gml:hasangle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dmsAngle_Property">
      <gml:hasdmsAngle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:degrees_Property">
      <gml:hasdegrees xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:decimalMinutes_Property">
      <gml:hasdecimalMinutes xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:minutes_Property">
      <gml:hasminutes xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:seconds_Property">
      <gml:hasseconds xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Style_Property">
      <gml:has_Style xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureStyle_Property">
      <gml:hasfeatureStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:graphStyle_Property">
      <gml:hasgraphStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:FeatureStyle_Property">
      <gml:hasFeatureStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureConstraint_Property">
      <gml:featureConstraint>
         <xsl:value-of select="text()"/>
      </gml:featureConstraint>
   </xsl:template>
   <xsl:template name="gml:geometryStyle_Property">
      <gml:hasgeometryStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:topologyStyle_Property">
      <gml:hastopologyStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:labelStyle_Property">
      <gml:haslabelStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:spatialResolution_Property">
      <gml:spatialResolution xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:ScaleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:spatialResolution">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'ScaleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:spatialResolution"/>
         <xsl:call-template name="gml:ScaleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:styleVariation_Property">
      <gml:styleVariation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:StyleVariationType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:styleVariation">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'StyleVariationType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:styleVariation"/>
         <xsl:call-template name="gml:StyleVariationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="smil20:animate_Property">
      <smil20:hasanimate xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="smil20:animateMotion_Property">
      <smil20:hasanimateMotion xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="smil20:animateColor_Property">
      <smil20:hasanimateColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="smil20:set_Property">
      <smil20:hasset xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeometryStyle_Property">
      <gml:hasGeometryStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:symbol_Property">
      <gml:hassymbol xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:style_Property">
      <gml:style>
         <xsl:value-of select="text()"/>
      </gml:style>
   </xsl:template>
   <xsl:template name="gml:TopologyStyle_Property">
      <gml:hasTopologyStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LabelStyle_Property">
      <gml:hasLabelStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:label_Property">
      <gml:label xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:GraphStyle_Property">
      <gml:hasGraphStyle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:planar_Property">
      <gml:planar>
         <xsl:value-of select="text()"/>
      </gml:planar>
   </xsl:template>
   <xsl:template name="gml:directed_Property">
      <gml:directed>
         <xsl:value-of select="text()"/>
      </gml:directed>
   </xsl:template>
   <xsl:template name="gml:grid_Property">
      <gml:grid>
         <xsl:value-of select="text()"/>
      </gml:grid>
   </xsl:template>
   <xsl:template name="gml:minDistance_Property">
      <gml:minDistance>
         <xsl:value-of select="text()"/>
      </gml:minDistance>
   </xsl:template>
   <xsl:template name="gml:minAngle_Property">
      <gml:minAngle>
         <xsl:value-of select="text()"/>
      </gml:minAngle>
   </xsl:template>
   <xsl:template name="gml:graphType_Property">
      <gml:graphType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:drawingType_Property">
      <gml:drawingType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:lineType_Property">
      <gml:lineType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:aestheticCriteria_Property">
      <gml:aestheticCriteria xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:LabelExpression_Property">
      <gml:LabelExpression>
         <xsl:value-of select="text()"/>
      </gml:LabelExpression>
   </xsl:template>
   <xsl:template name="gml:segments_Property">
      <gml:hassegments xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:baseCurve_Property">
      <gml:hasbaseCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CurveSegment_Property">
      <gml:has_CurveSegment xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:bulge_Property">
      <gml:bulge>
         <xsl:value-of select="text()"/>
      </gml:bulge>
   </xsl:template>
   <xsl:template name="gml:normal_Property">
      <gml:normal xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:normal">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:normal"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:radius_Property">
      <gml:radius xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:radius">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:radius"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:startAngle_Property">
      <gml:startAngle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:startAngle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:startAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:endAngle_Property">
      <gml:endAngle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:endAngle">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:endAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:offsetBase_Property">
      <gml:offsetBase xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:refDirection_Property">
      <gml:refDirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:refDirection">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:refDirection"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:inDimension_Property">
      <gml:inDimension>
         <xsl:value-of select="text()"/>
      </gml:inDimension>
   </xsl:template>
   <xsl:template name="gml:outDimension_Property">
      <gml:outDimension>
         <xsl:value-of select="text()"/>
      </gml:outDimension>
   </xsl:template>
   <xsl:template name="gml:refLocation_Property">
      <gml:refLocation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:AffinePlacement_Property">
      <gml:hasAffinePlacement xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:scaleFactor_Property">
      <gml:scaleFactor>
         <xsl:value-of select="text()"/>
      </gml:scaleFactor>
   </xsl:template>
   <xsl:template name="gml:startParameter_Property">
      <gml:startParameter>
         <xsl:value-of select="text()"/>
      </gml:startParameter>
   </xsl:template>
   <xsl:template name="gml:endParameter_Property">
      <gml:endParameter>
         <xsl:value-of select="text()"/>
      </gml:endParameter>
   </xsl:template>
   <xsl:template name="gml:vectorAtStart_Property">
      <gml:vectorAtStart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:vectorAtStart">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:vectorAtStart"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:vectorAtEnd_Property">
      <gml:vectorAtEnd xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:vectorAtEnd">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:vectorAtEnd"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiplicity_Property">
      <gml:multiplicity>
         <xsl:value-of select="text()"/>
      </gml:multiplicity>
   </xsl:template>
   <xsl:template name="gml:weight_Property">
      <gml:weight>
         <xsl:value-of select="text()"/>
      </gml:weight>
   </xsl:template>
   <xsl:template name="gml:Knot_Property">
      <gml:Knot xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:degree_Property">
      <gml:degree>
         <xsl:value-of select="text()"/>
      </gml:degree>
   </xsl:template>
   <xsl:template name="gml:knot_Property">
      <gml:knot xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:patches_Property">
      <gml:haspatches xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:baseSurface_Property">
      <gml:hasbaseSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_SurfacePatch_Property">
      <gml:has_SurfacePatch xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Ring_Property">
      <gml:hasRing xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rows_Property">
      <gml:rows>
         <xsl:value-of select="text()"/>
      </gml:rows>
   </xsl:template>
   <xsl:template name="gml:columns_Property">
      <gml:columns>
         <xsl:value-of select="text()"/>
      </gml:columns>
   </xsl:template>
   <xsl:template name="gml:polygonPatches_Property">
      <gml:haspolygonPatches xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PolygonPatch_Property">
      <gml:hasPolygonPatch xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Triangle_Property">
      <gml:hasTriangle xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:trianglePatches_Property">
      <gml:hastrianglePatches xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:stopLines_Property">
      <gml:stopLines xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:breakLines_Property">
      <gml:breakLines xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:maxLength_Property">
      <gml:maxLength xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:maxLength">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:maxLength"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:controlPoint_Property">
      <gml:controlPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:LineStringSegment_Property">
      <gml:hasLineStringSegment xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Solid_Property">
      <gml:has_Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:limits_Property">
      <gml:limits xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:axisName_Property">
      <gml:axisName>
         <xsl:value-of select="text()"/>
      </gml:axisName>
   </xsl:template>
   <xsl:template name="gml:GridEnvelope_Property">
      <gml:GridEnvelope xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:low_Property">
      <gml:low xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:high_Property">
      <gml:high xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:offsetVector_Property">
      <gml:offsetVector xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:offsetVector">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:offsetVector"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:quantityType_Property">
      <gml:hasquantityType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:catalogSymbol_Property">
      <gml:hascatalogSymbol xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:unitsSystem_Property">
      <gml:unitsSystem xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:derivationUnitTerm_Property">
      <gml:hasderivationUnitTerm xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:conversionToPreferredUnit_Property">
      <gml:hasconversionToPreferredUnit xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:roughConversionToPreferredUnit_Property">
      <gml:hasroughConversionToPreferredUnit xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:factor_Property">
      <gml:factor>
         <xsl:value-of select="text()"/>
      </gml:factor>
   </xsl:template>
   <xsl:template name="gml:formula_Property">
      <gml:formula xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:a_Property">
      <gml:a>
         <xsl:value-of select="text()"/>
      </gml:a>
   </xsl:template>
   <xsl:template name="gml:b_Property">
      <gml:b>
         <xsl:value-of select="text()"/>
      </gml:b>
   </xsl:template>
   <xsl:template name="gml:c_Property">
      <gml:c>
         <xsl:value-of select="text()"/>
      </gml:c>
   </xsl:template>
   <xsl:template name="gml:d_Property">
      <gml:d>
         <xsl:value-of select="text()"/>
      </gml:d>
   </xsl:template>
   <xsl:template name="app:theme_Property">
      <app:theme>
         <xsl:value-of select="text()"/>
      </app:theme>
   </xsl:template>
   <xsl:template name="app:surfaceDataMember_Property">
      <app:surfaceDataMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfAppearance_Property">
      <app:has_GenericApplicationPropertyOfAppearance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:Appearance_Property">
      <app:hasAppearance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:isFront_Property">
      <app:isFront>
         <xsl:value-of select="text()"/>
      </app:isFront>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfSurfaceData_Property">
      <app:has_GenericApplicationPropertyOfSurfaceData xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:_SurfaceData_Property">
      <app:has_SurfaceData xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:imageURI_Property">
      <app:imageURI>
         <xsl:value-of select="text()"/>
      </app:imageURI>
   </xsl:template>
   <xsl:template name="app:mimeType_Property">
      <app:mimeType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//app:mimeType">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="app:mimeType"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="app:textureType_Property">
      <app:textureType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:wrapMode_Property">
      <app:wrapMode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:borderColor_Property">
      <app:borderColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTexture_Property">
      <app:has_GenericApplicationPropertyOfTexture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:target_Property">
      <app:target xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   <app:target>
         <xsl:value-of select="text()"/>
      </app:target>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfParameterizedTexture_Property">
      <app:has_GenericApplicationPropertyOfParameterizedTexture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:preferWorldFile_Property">
      <app:preferWorldFile>
         <xsl:value-of select="text()"/>
      </app:preferWorldFile>
   </xsl:template>
   <xsl:template name="app:referencePoint_Property">
      <app:referencePoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:orientation_Property">
      <app:orientation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfGeoreferencedTexture_Property">
      <app:has_GenericApplicationPropertyOfGeoreferencedTexture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:_TextureParameterization_Property">
      <app:has_TextureParameterization xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTextureParameterization_Property">
      <app:has_GenericApplicationPropertyOfTextureParameterization xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:textureCoordinates_Property">
      <app:textureCoordinates xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTexCoordList_Property">
      <app:has_GenericApplicationPropertyOfTexCoordList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:worldToTexture_Property">
      <app:worldToTexture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfTexCoordGen_Property">
      <app:has_GenericApplicationPropertyOfTexCoordGen xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="app:ambientIntensity_Property">
      <app:ambientIntensity xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:diffuseColor_Property">
      <app:diffuseColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:emissiveColor_Property">
      <app:emissiveColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:specularColor_Property">
      <app:specularColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:shininess_Property">
      <app:shininess xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:transparency_Property">
      <app:transparency xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="app:isSmooth_Property">
      <app:isSmooth>
         <xsl:value-of select="text()"/>
      </app:isSmooth>
   </xsl:template>
   <xsl:template name="app:_GenericApplicationPropertyOfX3DMaterial_Property">
      <app:has_GenericApplicationPropertyOfX3DMaterial xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="frn:class_Property">
      <frn:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//frn:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="frn:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="frn:function_Property">
      <frn:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//frn:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="frn:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="frn:usage_Property">
      <frn:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//frn:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="frn:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="frn:lod1Geometry_Property">
      <frn:lod1Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod2Geometry_Property">
      <frn:lod2Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod3Geometry_Property">
      <frn:lod3Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod4Geometry_Property">
      <frn:lod4Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod1TerrainIntersection_Property">
      <frn:lod1TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod2TerrainIntersection_Property">
      <frn:lod2TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod3TerrainIntersection_Property">
      <frn:lod3TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod4TerrainIntersection_Property">
      <frn:lod4TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod1ImplicitRepresentation_Property">
      <frn:lod1ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod2ImplicitRepresentation_Property">
      <frn:lod2ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod3ImplicitRepresentation_Property">
      <frn:lod3ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:lod4ImplicitRepresentation_Property">
      <frn:lod4ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="frn:_GenericApplicationPropertyOfCityFurniture_Property">
      <frn:has_GenericApplicationPropertyOfCityFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterObject_Property">
      <wtr:has_GenericApplicationPropertyOfWaterObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:class_Property">
      <wtr:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//wtr:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:function_Property">
      <wtr:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//wtr:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:usage_Property">
      <wtr:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//wtr:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:lod0MultiCurve_Property">
      <wtr:lod0MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod0MultiSurface_Property">
      <wtr:lod0MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod1MultiCurve_Property">
      <wtr:lod1MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod1MultiSurface_Property">
      <wtr:lod1MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod1Solid_Property">
      <wtr:lod1Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod2Solid_Property">
      <wtr:lod2Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod3Solid_Property">
      <wtr:lod3Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod4Solid_Property">
      <wtr:lod4Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:boundedBy_Property">
      <wtr:boundedBy xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterBody_Property">
      <wtr:has_GenericApplicationPropertyOfWaterBody xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:_WaterBoundarySurface_Property">
      <wtr:has_WaterBoundarySurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod2Surface_Property">
      <wtr:lod2Surface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod3Surface_Property">
      <wtr:lod3Surface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:lod4Surface_Property">
      <wtr:lod4Surface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterBoundarySurface_Property">
      <wtr:has_GenericApplicationPropertyOfWaterBoundarySurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:waterLevel_Property">
      <wtr:waterLevel xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//wtr:waterLevel">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="wtr:waterLevel"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterSurface_Property">
      <wtr:has_GenericApplicationPropertyOfWaterSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterGroundSurface_Property">
      <wtr:has_GenericApplicationPropertyOfWaterGroundSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="wtr:_GenericApplicationPropertyOfWaterClosureSurface_Property">
      <wtr:has_GenericApplicationPropertyOfWaterClosureSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfCityModel_Property">
      <core:has_GenericApplicationPropertyOfCityModel xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:creationDate_Property">
      <core:creationDate>
         <xsl:value-of select="text()"/>
      </core:creationDate>
   </xsl:template>
   <xsl:template name="core:terminationDate_Property">
      <core:terminationDate>
         <xsl:value-of select="text()"/>
      </core:terminationDate>
   </xsl:template>
   <xsl:template name="core:externalReference_Property">
      <core:externalReference xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:generalizesTo_Property">
      <core:generalizesTo xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:relativeToTerrain_Property">
      <core:relativeToTerrain xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:relativeToWater_Property">
      <core:relativeToWater xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfCityObject_Property">
      <core:has_GenericApplicationPropertyOfCityObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfSite_Property">
      <core:has_GenericApplicationPropertyOfSite xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:_CityObject_Property">
      <core:has_CityObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:informationSystem_Property">
      <core:informationSystem>
         <xsl:value-of select="text()"/>
      </core:informationSystem>
   </xsl:template>
   <xsl:template name="core:externalObject_Property">
      <core:externalObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:name_Property">
      <core:name>
         <xsl:value-of select="text()"/>
      </core:name>
   </xsl:template>
   <xsl:template name="core:uri_Property">
      <core:uri>
         <xsl:value-of select="text()"/>
      </core:uri>
   </xsl:template>
   <xsl:template name="core:Address_Property">
      <core:hasAddress xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:xalAddress_Property">
      <core:xalAddress xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:multiPoint_Property">
      <core:multiPoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfAddress_Property">
      <core:has_GenericApplicationPropertyOfAddress xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressDetails_Property">
      <xAL:hasAddressDetails xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:mimeType_Property">
      <core:mimeType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:mimeType">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="core:mimeType"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:transformationMatrix_Property">
      <core:transformationMatrix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:libraryObject_Property">
      <core:libraryObject>
         <xsl:value-of select="text()"/>
      </core:libraryObject>
   </xsl:template>
   <xsl:template name="core:relativeGMLGeometry_Property">
      <core:relativeGMLGeometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:referencePoint_Property">
      <core:referencePoint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:ImplicitGeometry_Property">
      <core:hasImplicitGeometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="veg:_GenericApplicationPropertyOfVegetationObject_Property">
      <veg:has_GenericApplicationPropertyOfVegetationObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="veg:class_Property">
      <veg:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:function_Property">
      <veg:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:usage_Property">
      <veg:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:averageHeight_Property">
      <veg:averageHeight xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:averageHeight">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:averageHeight"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:lod1MultiSurface_Property">
      <veg:lod1MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod2MultiSurface_Property">
      <veg:lod2MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod3MultiSurface_Property">
      <veg:lod3MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod4MultiSurface_Property">
      <veg:lod4MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod1MultiSolid_Property">
      <veg:lod1MultiSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod2MultiSolid_Property">
      <veg:lod2MultiSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod3MultiSolid_Property">
      <veg:lod3MultiSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod4MultiSolid_Property">
      <veg:lod4MultiSolid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:_GenericApplicationPropertyOfPlantCover_Property">
      <veg:has_GenericApplicationPropertyOfPlantCover xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="veg:species_Property">
      <veg:species xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:species">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:species"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:height_Property">
      <veg:height xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:height">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:height"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:trunkDiameter_Property">
      <veg:trunkDiameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:trunkDiameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:trunkDiameter"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:crownDiameter_Property">
      <veg:crownDiameter xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//veg:crownDiameter">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="veg:crownDiameter"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="veg:lod1Geometry_Property">
      <veg:lod1Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod2Geometry_Property">
      <veg:lod2Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod3Geometry_Property">
      <veg:lod3Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod4Geometry_Property">
      <veg:lod4Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod1ImplicitRepresentation_Property">
      <veg:lod1ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod2ImplicitRepresentation_Property">
      <veg:lod2ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod3ImplicitRepresentation_Property">
      <veg:lod3ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:lod4ImplicitRepresentation_Property">
      <veg:lod4ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="veg:_GenericApplicationPropertyOfSolitaryVegetationObject_Property">
      <veg:has_GenericApplicationPropertyOfSolitaryVegetationObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTransportationObject_Property">
      <tran:has_GenericApplicationPropertyOfTransportationObject xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:class_Property">
      <tran:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tran:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tran:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:function_Property">
      <tran:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tran:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tran:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:usage_Property">
      <tran:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tran:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tran:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:trafficArea_Property">
      <tran:trafficArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:auxiliaryTrafficArea_Property">
      <tran:auxiliaryTrafficArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:lod0Network_Property">
      <tran:lod0Network xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:lod1MultiSurface_Property">
      <tran:lod1MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:lod2MultiSurface_Property">
      <tran:lod2MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:lod3MultiSurface_Property">
      <tran:lod3MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:lod4MultiSurface_Property">
      <tran:lod4MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTransportationComplex_Property">
      <tran:has_GenericApplicationPropertyOfTransportationComplex xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:surfaceMaterial_Property">
      <tran:surfaceMaterial xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tran:surfaceMaterial">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tran:surfaceMaterial"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTrafficArea_Property">
      <tran:has_GenericApplicationPropertyOfTrafficArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfAuxiliaryTrafficArea_Property">
      <tran:has_GenericApplicationPropertyOfAuxiliaryTrafficArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:TrafficArea_Property">
      <tran:hasTrafficArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:AuxiliaryTrafficArea_Property">
      <tran:hasAuxiliaryTrafficArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfTrack_Property">
      <tran:has_GenericApplicationPropertyOfTrack xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfRoad_Property">
      <tran:has_GenericApplicationPropertyOfRoad xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfRailway_Property">
      <tran:has_GenericApplicationPropertyOfRailway xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tran:_GenericApplicationPropertyOfSquare_Property">
      <tran:has_GenericApplicationPropertyOfSquare xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tex:appearance_Property">
      <tex:hasappearance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tex:_Appearance_Property">
      <tex:has_Appearance xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tex:shininess_Property">
      <tex:shininess xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:transparency_Property">
      <tex:transparency xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:ambientIntensity_Property">
      <tex:ambientIntensity xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:specularColor_Property">
      <tex:specularColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:diffuseColor_Property">
      <tex:diffuseColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:emissiveColor_Property">
      <tex:emissiveColor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:textureMap_Property">
      <tex:textureMap>
         <xsl:value-of select="text()"/>
      </tex:textureMap>
   </xsl:template>
   <xsl:template name="tex:textureCoordinates_Property">
      <tex:textureCoordinates xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:textureType_Property">
      <tex:textureType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tex:repeat_Property">
      <tex:repeat>
         <xsl:value-of select="text()"/>
      </tex:repeat>
   </xsl:template>
   <xsl:template name="luse:class_Property">
      <luse:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//luse:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="luse:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="luse:function_Property">
      <luse:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//luse:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="luse:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="luse:usage_Property">
      <luse:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//luse:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="luse:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="luse:lod0MultiSurface_Property">
      <luse:lod0MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="luse:lod1MultiSurface_Property">
      <luse:lod1MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="luse:lod2MultiSurface_Property">
      <luse:lod2MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="luse:lod3MultiSurface_Property">
      <luse:lod3MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="luse:lod4MultiSurface_Property">
      <luse:lod4MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="luse:_GenericApplicationPropertyOfLandUse_Property">
      <luse:has_GenericApplicationPropertyOfLandUse xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:class_Property">
      <tun:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tun:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tun:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:function_Property">
      <tun:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tun:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tun:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:usage_Property">
      <tun:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//tun:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="tun:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="tun:yearOfConstruction_Property">
      <tun:yearOfConstruction>
         <xsl:value-of select="text()"/>
      </tun:yearOfConstruction>
   </xsl:template>
   <xsl:template name="tun:yearOfDemolition_Property">
      <tun:yearOfDemolition>
         <xsl:value-of select="text()"/>
      </tun:yearOfDemolition>
   </xsl:template>
   <xsl:template name="tun:lod1Solid_Property">
      <tun:lod1Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod1MultiSurface_Property">
      <tun:lod1MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod1TerrainIntersection_Property">
      <tun:lod1TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod2Solid_Property">
      <tun:lod2Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod2MultiSurface_Property">
      <tun:lod2MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod2MultiCurve_Property">
      <tun:lod2MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod2TerrainIntersection_Property">
      <tun:lod2TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:outerTunnelInstallation_Property">
      <tun:outerTunnelInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:interiorTunnelInstallation_Property">
      <tun:interiorTunnelInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:boundedBy_Property">
      <tun:boundedBy xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod3Solid_Property">
      <tun:lod3Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod3MultiSurface_Property">
      <tun:lod3MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod3MultiCurve_Property">
      <tun:lod3MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod3TerrainIntersection_Property">
      <tun:lod3TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod4Solid_Property">
      <tun:lod4Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod4MultiSurface_Property">
      <tun:lod4MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod4MultiCurve_Property">
      <tun:lod4MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod4TerrainIntersection_Property">
      <tun:lod4TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:interiorHollowSpace_Property">
      <tun:interiorHollowSpace xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:consistsOfTunnelPart_Property">
      <tun:consistsOfTunnelPart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfAbstractTunnel_Property">
      <tun:has_GenericApplicationPropertyOfAbstractTunnel xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnel_Property">
      <tun:has_GenericApplicationPropertyOfTunnel xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnelPart_Property">
      <tun:has_GenericApplicationPropertyOfTunnelPart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:TunnelPart_Property">
      <tun:hasTunnelPart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:lod2Geometry_Property">
      <tun:lod2Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod3Geometry_Property">
      <tun:lod3Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod4Geometry_Property">
      <tun:lod4Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod2ImplicitRepresentation_Property">
      <tun:lod2ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod3ImplicitRepresentation_Property">
      <tun:lod3ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:lod4ImplicitRepresentation_Property">
      <tun:lod4ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnelInstallation_Property">
      <tun:has_GenericApplicationPropertyOfTunnelInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:TunnelInstallation_Property">
      <tun:hasTunnelInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfIntTunnelInstallation_Property">
      <tun:has_GenericApplicationPropertyOfIntTunnelInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:IntTunnelInstallation_Property">
      <tun:hasIntTunnelInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_BoundarySurface_Property">
      <tun:has_BoundarySurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:opening_Property">
      <tun:opening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfBoundarySurface_Property">
      <tun:has_GenericApplicationPropertyOfBoundarySurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfRoofSurface_Property">
      <tun:has_GenericApplicationPropertyOfRoofSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfWallSurface_Property">
      <tun:has_GenericApplicationPropertyOfWallSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfGroundSurface_Property">
      <tun:has_GenericApplicationPropertyOfGroundSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfClosureSurface_Property">
      <tun:has_GenericApplicationPropertyOfClosureSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfFloorSurface_Property">
      <tun:has_GenericApplicationPropertyOfFloorSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfOuterFloorSurface_Property">
      <tun:has_GenericApplicationPropertyOfOuterFloorSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfInteriorWallSurface_Property">
      <tun:has_GenericApplicationPropertyOfInteriorWallSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfCeilingSurface_Property">
      <tun:has_GenericApplicationPropertyOfCeilingSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfOuterCeilingSurface_Property">
      <tun:has_GenericApplicationPropertyOfOuterCeilingSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:interiorFurniture_Property">
      <tun:interiorFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:hollowSpaceInstallation_Property">
      <tun:hollowSpaceInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfHollowSpace_Property">
      <tun:has_GenericApplicationPropertyOfHollowSpace xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:HollowSpace_Property">
      <tun:hasHollowSpace xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfTunnelFurniture_Property">
      <tun:has_GenericApplicationPropertyOfTunnelFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:TunnelFurniture_Property">
      <tun:hasTunnelFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfOpening_Property">
      <tun:has_GenericApplicationPropertyOfOpening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_Opening_Property">
      <tun:has_Opening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfWindow_Property">
      <tun:has_GenericApplicationPropertyOfWindow xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="tun:_GenericApplicationPropertyOfDoor_Property">
      <tun:has_GenericApplicationPropertyOfDoor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalServiceElements_Property">
      <xAL:PostalServiceElements xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressIdentifier_Property">
      <xAL:AddressIdentifier xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:EndorsementLineCode_Property">
      <xAL:EndorsementLineCode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:KeyLineCode_Property">
      <xAL:KeyLineCode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:Barcode_Property">
      <xAL:Barcode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SortingCode_Property">
      <xAL:SortingCode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLatitude_Property">
      <xAL:AddressLatitude xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLatitudeDirection_Property">
      <xAL:AddressLatitudeDirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLongitude_Property">
      <xAL:AddressLongitude xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLongitudeDirection_Property">
      <xAL:AddressLongitudeDirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SupplementaryPostalServiceData_Property">
      <xAL:SupplementaryPostalServiceData xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:Address_Property">
      <xAL:Address xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLines_Property">
      <xAL:AddressLines xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:Country_Property">
      <xAL:Country xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressLine_Property">
      <xAL:hasAddressLine xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:CountryNameCode_Property">
      <xAL:CountryNameCode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:CountryName_Property">
      <xAL:hasCountryName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:AdministrativeArea_Property">
      <xAL:hasAdministrativeArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:Locality_Property">
      <xAL:hasLocality xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:Thoroughfare_Property">
      <xAL:hasThoroughfare xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:DependentLocalityName_Property">
      <xAL:DependentLocalityName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:DependentLocalityNumber_Property">
      <xAL:DependentLocalityNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostBox_Property">
      <xAL:hasPostBox xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:LargeMailUser_Property">
      <xAL:LargeMailUser xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostOffice_Property">
      <xAL:hasPostOffice xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalRoute_Property">
      <xAL:PostalRoute xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:Premise_Property">
      <xAL:hasPremise xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:DependentLocality_Property">
      <xAL:DependentLocality xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalCode_Property">
      <xAL:hasPostalCode xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:FirmName_Property">
      <xAL:FirmName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:Department_Property">
      <xAL:hasDepartment xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:MailStop_Property">
      <xAL:MailStop xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:LargeMailUserName_Property">
      <xAL:LargeMailUserName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:LargeMailUserIdentifier_Property">
      <xAL:LargeMailUserIdentifier xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:BuildingName_Property">
      <xAL:BuildingName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:MailStopName_Property">
      <xAL:MailStopName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:MailStopNumber_Property">
      <xAL:MailStopNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalRouteName_Property">
      <xAL:PostalRouteName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalRouteNumber_Property">
      <xAL:PostalRouteNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubPremiseName_Property">
      <xAL:SubPremiseName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubPremiseLocation_Property">
      <xAL:SubPremiseLocation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubPremiseNumber_Property">
      <xAL:SubPremiseNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubPremiseNumberPrefix_Property">
      <xAL:SubPremiseNumberPrefix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubPremiseNumberSuffix_Property">
      <xAL:SubPremiseNumberSuffix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:Firm_Property">
      <xAL:Firm xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubPremise_Property">
      <xAL:SubPremise xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:LocalityName_Property">
      <xAL:LocalityName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumber_Property">
      <xAL:hasThoroughfareNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberRange_Property">
      <xAL:ThoroughfareNumberRange xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberFrom_Property">
      <xAL:ThoroughfareNumberFrom xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberPrefix_Property">
      <xAL:hasThoroughfareNumberPrefix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberSuffix_Property">
      <xAL:hasThoroughfareNumberSuffix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareNumberTo_Property">
      <xAL:ThoroughfareNumberTo xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfarePreDirection_Property">
      <xAL:ThoroughfarePreDirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareLeadingType_Property">
      <xAL:ThoroughfareLeadingType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareName_Property">
      <xAL:ThoroughfareName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfareTrailingType_Property">
      <xAL:ThoroughfareTrailingType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:ThoroughfarePostDirection_Property">
      <xAL:ThoroughfarePostDirection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:DependentThoroughfare_Property">
      <xAL:DependentThoroughfare xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:AdministrativeAreaName_Property">
      <xAL:AdministrativeAreaName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubAdministrativeArea_Property">
      <xAL:SubAdministrativeArea xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:SubAdministrativeAreaName_Property">
      <xAL:SubAdministrativeAreaName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostOfficeName_Property">
      <xAL:PostOfficeName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostOfficeNumber_Property">
      <xAL:PostOfficeNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalCodeNumber_Property">
      <xAL:PostalCodeNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostalCodeNumberExtension_Property">
      <xAL:PostalCodeNumberExtension xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostTown_Property">
      <xAL:PostTown xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostTownName_Property">
      <xAL:PostTownName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostTownSuffix_Property">
      <xAL:PostTownSuffix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostBoxNumber_Property">
      <xAL:PostBoxNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostBoxNumberPrefix_Property">
      <xAL:PostBoxNumberPrefix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostBoxNumberSuffix_Property">
      <xAL:PostBoxNumberSuffix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PostBoxNumberExtension_Property">
      <xAL:PostBoxNumberExtension xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:DepartmentName_Property">
      <xAL:DepartmentName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseName_Property">
      <xAL:PremiseName xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseLocation_Property">
      <xAL:PremiseLocation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumber_Property">
      <xAL:hasPremiseNumber xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberRange_Property">
      <xAL:PremiseNumberRange xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberRangeFrom_Property">
      <xAL:PremiseNumberRangeFrom xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberPrefix_Property">
      <xAL:hasPremiseNumberPrefix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'xAL:PremiseNumberPrefix', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberSuffix_Property">
      <xAL:hasPremiseNumberSuffix xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberRangeTo_Property">
      <xAL:PremiseNumberRangeTo xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="grp:class_Property">
      <grp:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//grp:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="grp:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="grp:function_Property">
      <grp:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//grp:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="grp:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="grp:usage_Property">
      <grp:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//grp:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="grp:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="grp:groupMember_Property">
      <grp:groupMember xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="grp:parent_Property">
      <grp:parent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="grp:geometry_Property">
      <grp:geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="grp:_GenericApplicationPropertyOfCityObjectGroup_Property">
      <grp:has_GenericApplicationPropertyOfCityObjectGroup xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:lod_Property">
      <dem:lod xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:reliefComponent_Property">
      <dem:reliefComponent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfReliefFeature_Property">
      <dem:has_GenericApplicationPropertyOfReliefFeature xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:extent_Property">
      <dem:extent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfReliefComponent_Property">
      <dem:has_GenericApplicationPropertyOfReliefComponent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:_ReliefComponent_Property">
      <dem:has_ReliefComponent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:tin_Property">
      <dem:tin xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfTinRelief_Property">
      <dem:has_GenericApplicationPropertyOfTinRelief xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:grid_Property">
      <dem:grid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfRasterRelief_Property">
      <dem:has_GenericApplicationPropertyOfRasterRelief xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:reliefPoints_Property">
      <dem:reliefPoints xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfMassPointRelief_Property">
      <dem:has_GenericApplicationPropertyOfMassPointRelief xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="dem:ridgeOrValleyLines_Property">
      <dem:ridgeOrValleyLines xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:breaklines_Property">
      <dem:breaklines xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="dem:_GenericApplicationPropertyOfBreaklineRelief_Property">
      <dem:has_GenericApplicationPropertyOfBreaklineRelief xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TriangulatedSurface_Property">
      <gml:hasTriangulatedSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:RectifiedGridCoverage_Property">
      <gml:hasRectifiedGridCoverage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:class_Property">
      <bldg:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:function_Property">
      <bldg:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:usage_Property">
      <bldg:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:yearOfConstruction_Property">
      <bldg:yearOfConstruction>
         <xsl:value-of select="text()"/>
      </bldg:yearOfConstruction>
   </xsl:template>
   <xsl:template name="bldg:yearOfDemolition_Property">
      <bldg:yearOfDemolition>
         <xsl:value-of select="text()"/>
      </bldg:yearOfDemolition>
   </xsl:template>
   <xsl:template name="bldg:roofType_Property">
      <bldg:roofType xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:roofType">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:roofType"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:measuredHeight_Property">
      <bldg:measuredHeight xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:measuredHeight">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:measuredHeight"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:storeysAboveGround_Property">
      <bldg:storeysAboveGround>
         <xsl:value-of select="text()"/>
      </bldg:storeysAboveGround>
   </xsl:template>
   <xsl:template name="bldg:storeysBelowGround_Property">
      <bldg:storeysBelowGround>
         <xsl:value-of select="text()"/>
      </bldg:storeysBelowGround>
   </xsl:template>
   <xsl:template name="bldg:storeyHeightsAboveGround_Property">
      <bldg:storeyHeightsAboveGround xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureOrNullListType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:storeyHeightsAboveGround">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureOrNullListType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:storeyHeightsAboveGround"/>
         <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:storeyHeightsBelowGround_Property">
      <bldg:storeyHeightsBelowGround xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureOrNullListType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:storeyHeightsBelowGround">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureOrNullListType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:storeyHeightsBelowGround"/>
         <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:lod0FootPrint_Property">
      <bldg:lod0FootPrint xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod0RoofEdge_Property">
      <bldg:lod0RoofEdge xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod1Solid_Property">
      <bldg:lod1Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod1MultiSurface_Property">
      <bldg:lod1MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod1TerrainIntersection_Property">
      <bldg:lod1TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2Solid_Property">
      <bldg:lod2Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2MultiSurface_Property">
      <bldg:lod2MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2MultiCurve_Property">
      <bldg:lod2MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2TerrainIntersection_Property">
      <bldg:lod2TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:outerBuildingInstallation_Property">
      <bldg:outerBuildingInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:interiorBuildingInstallation_Property">
      <bldg:interiorBuildingInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:boundedBy_Property">
      <bldg:boundedBy xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3Solid_Property">
      <bldg:lod3Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3MultiSurface_Property">
      <bldg:lod3MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3MultiCurve_Property">
      <bldg:lod3MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3TerrainIntersection_Property">
      <bldg:lod3TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4Solid_Property">
      <bldg:lod4Solid xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4MultiSurface_Property">
      <bldg:lod4MultiSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4MultiCurve_Property">
      <bldg:lod4MultiCurve xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4TerrainIntersection_Property">
      <bldg:lod4TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:interiorRoom_Property">
      <bldg:interiorRoom xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:consistsOfBuildingPart_Property">
      <bldg:consistsOfBuildingPart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:address_Property">
      <bldg:address xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfAbstractBuilding_Property">
      <bldg:has_GenericApplicationPropertyOfAbstractBuilding xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuilding_Property">
      <bldg:has_GenericApplicationPropertyOfBuilding xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingPart_Property">
      <bldg:has_GenericApplicationPropertyOfBuildingPart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingPart_Property">
      <bldg:hasBuildingPart xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2Geometry_Property">
      <bldg:lod2Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3Geometry_Property">
      <bldg:lod3Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4Geometry_Property">
      <bldg:lod4Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2ImplicitRepresentation_Property">
      <bldg:lod2ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3ImplicitRepresentation_Property">
      <bldg:lod3ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4ImplicitRepresentation_Property">
      <bldg:lod4ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingInstallation_Property">
      <bldg:has_GenericApplicationPropertyOfBuildingInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingInstallation_Property">
      <bldg:hasBuildingInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfIntBuildingInstallation_Property">
      <bldg:has_GenericApplicationPropertyOfIntBuildingInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:IntBuildingInstallation_Property">
      <bldg:hasIntBuildingInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:opening_Property">
      <bldg:opening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBoundarySurface_Property">
      <bldg:has_GenericApplicationPropertyOfBoundarySurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfRoofSurface_Property">
      <bldg:has_GenericApplicationPropertyOfRoofSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfWallSurface_Property">
      <bldg:has_GenericApplicationPropertyOfWallSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfGroundSurface_Property">
      <bldg:has_GenericApplicationPropertyOfGroundSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfClosureSurface_Property">
      <bldg:has_GenericApplicationPropertyOfClosureSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfFloorSurface_Property">
      <bldg:has_GenericApplicationPropertyOfFloorSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOuterFloorSurface_Property">
      <bldg:has_GenericApplicationPropertyOfOuterFloorSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfInteriorWallSurface_Property">
      <bldg:has_GenericApplicationPropertyOfInteriorWallSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfCeilingSurface_Property">
      <bldg:has_GenericApplicationPropertyOfCeilingSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOuterCeilingSurface_Property">
      <bldg:has_GenericApplicationPropertyOfOuterCeilingSurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_BoundarySurface_Property">
      <bldg:has_BoundarySurface xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_Opening_Property">
      <bldg:has_Opening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOpening_Property">
      <bldg:has_GenericApplicationPropertyOfOpening xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfWindow_Property">
      <bldg:has_GenericApplicationPropertyOfWindow xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfDoor_Property">
      <bldg:has_GenericApplicationPropertyOfDoor xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:interiorFurniture_Property">
      <bldg:interiorFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:roomInstallation_Property">
      <bldg:roomInstallation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfRoom_Property">
      <bldg:has_GenericApplicationPropertyOfRoom xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingFurniture_Property">
      <bldg:has_GenericApplicationPropertyOfBuildingFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:Room_Property">
      <bldg:hasRoom xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingFurniture_Property">
      <bldg:hasBuildingFurniture xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gen:class_Property">
      <gen:class xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gen:class">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="gen:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gen:function_Property">
      <gen:function xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gen:function">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="gen:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gen:usage_Property">
      <gen:usage xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gen:usage">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="gen:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gen:lod0Geometry_Property">
      <gen:lod0Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod1Geometry_Property">
      <gen:lod1Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod2Geometry_Property">
      <gen:lod2Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod3Geometry_Property">
      <gen:lod3Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod4Geometry_Property">
      <gen:lod4Geometry xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod0TerrainIntersection_Property">
      <gen:lod0TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod1TerrainIntersection_Property">
      <gen:lod1TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod2TerrainIntersection_Property">
      <gen:lod2TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod3TerrainIntersection_Property">
      <gen:lod3TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod4TerrainIntersection_Property">
      <gen:lod4TerrainIntersection xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod0ImplicitRepresentation_Property">
      <gen:lod0ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod1ImplicitRepresentation_Property">
      <gen:lod1ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod2ImplicitRepresentation_Property">
      <gen:lod2ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod3ImplicitRepresentation_Property">
      <gen:lod3ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:lod4ImplicitRepresentation_Property">
      <gen:lod4ImplicitRepresentation xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gen:value_Property">
      <gen:value>
         <xsl:value-of select="text()"/>
      </gen:value>
   <gen:value xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gen:value">
      <owl:NamedIndividual xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:geo="http://www.opengis.net/ont/geosparql#" xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:about="{concat( 'MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gen:value"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gen:_genericAttribute_Property">
      <gen:has_genericAttribute xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeValue_Property">
      <gml:hasCompositeValue xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:BooleanList_Property">
      <gml:hasBooleanList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CategoryList_Property">
      <gml:hasCategoryList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:QuantityList_Property">
      <gml:hasQuantityList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CountList_Property">
      <gml:hasCountList xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CategoryExtent_Property">
      <gml:hasCategoryExtent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:QuantityExtent_Property">
      <gml:hasQuantityExtent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CountExtent_Property">
      <gml:hasCountExtent xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:history_Property">
      <gml:hashistory xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:duration_Property">
      <gml:hasduration xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:timeInterval_Property">
      <gml:hastimeInterval xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:row_Property">
      <gml:row xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:dimension_Property">
      <gml:dimension>
         <xsl:value-of select="./@gml:dimension"/>
      </gml:dimension>
   </xsl:template>
   <xsl:template name="gml:order_Property">
      <gml:order>
         <xsl:value-of select="./@gml:order"/>
      </gml:order>
   </xsl:template>
   <xsl:template name="gml:id_Property">
      <gml:hasid>
         <xsl:value-of select="./@gml:id"/>
      </gml:hasid>
   <gml:id>
         <xsl:value-of select="./@gml:id"/>
      </gml:id>
   </xsl:template>
   <xsl:template name="gml:frame_Property">
      <gml:frame>
         <xsl:value-of select="./@gml:frame"/>
      </gml:frame>
   </xsl:template>
   <xsl:template name="gml:priority_Property">
      <gml:priority>
         <xsl:value-of select="./@gml:priority"/>
      </gml:priority>
   </xsl:template>
   <xsl:template name="gml:orientation_Property">
      <gml:orientation>
         <xsl:value-of select="./@gml:orientation"/>
      </gml:orientation>
   </xsl:template>
   <xsl:template name="gml:isMaximal_Property">
      <gml:isMaximal>
         <xsl:value-of select="./@gml:isMaximal"/>
      </gml:isMaximal>
   </xsl:template>
   <xsl:template name="gml:about_Property">
      <gml:about>
         <xsl:value-of select="./@gml:about"/>
      </gml:about>
   </xsl:template>
   <xsl:template name="gml:remoteSchema_Property">
      <gml:remoteSchema>
         <xsl:value-of select="./@gml:remoteSchema"/>
      </gml:remoteSchema>
   <gml:hasremoteSchema>
         <xsl:value-of select="./@gml:remoteSchema"/>
      </gml:hasremoteSchema>
   </xsl:template>
   <xsl:template name="gml:codeSpace_Property">
      <gml:codeSpace>
         <xsl:value-of select="./@gml:codeSpace"/>
      </gml:codeSpace>
   </xsl:template>
   <xsl:template name="gml:uom_Property">
      <gml:uom>
         <xsl:value-of select="./@gml:uom"/>
      </gml:uom>
   <gml:hasuom>
         <xsl:value-of select="./@gml:uom"/>
      </gml:hasuom>
   </xsl:template>
   <xsl:template name="gml:gid_Property">
      <gml:gid>
         <xsl:value-of select="./@gml:gid"/>
      </gml:gid>
   </xsl:template>
   <xsl:template name="gml:srsDimension_Property">
      <gml:srsDimension>
         <xsl:value-of select="./@gml:srsDimension"/>
      </gml:srsDimension>
   </xsl:template>
   <xsl:template name="gml:axisLabels_Property">
      <gml:axisLabels>
         <xsl:value-of select="./@gml:axisLabels"/>
      </gml:axisLabels>
   </xsl:template>
   <xsl:template name="gml:uomLabels_Property">
      <gml:uomLabels>
         <xsl:value-of select="./@gml:uomLabels"/>
      </gml:uomLabels>
   </xsl:template>
   <xsl:template name="gml:count_Property">
      <gml:count>
         <xsl:value-of select="./@gml:count"/>
      </gml:count>
   </xsl:template>
   <xsl:template name="gml:relativePosition_Property">
      <gml:relativePosition>
         <xsl:value-of select="./@gml:relativePosition"/>
      </gml:relativePosition>
   </xsl:template>
   <xsl:template name="gml:unit_Property">
      <gml:unit>
         <xsl:value-of select="./@gml:unit"/>
      </gml:unit>
   </xsl:template>
   <xsl:template name="gml:radix_Property">
      <gml:radix>
         <xsl:value-of select="./@gml:radix"/>
      </gml:radix>
   </xsl:template>
   <xsl:template name="gml:calendarEraName_Property">
      <gml:calendarEraName>
         <xsl:value-of select="./@gml:calendarEraName"/>
      </gml:calendarEraName>
   </xsl:template>
   <xsl:template name="gml:indeterminatePosition_Property">
      <gml:indeterminatePosition>
         <xsl:value-of select="./@gml:indeterminatePosition"/>
      </gml:indeterminatePosition>
   </xsl:template>
   <xsl:template name="gml:decimal_Property">
      <gml:decimal>
         <xsl:value-of select="./@gml:decimal"/>
      </gml:decimal>
   </xsl:template>
   <xsl:template name="gml:cs_Property">
      <gml:cs>
         <xsl:value-of select="./@gml:cs"/>
      </gml:cs>
   </xsl:template>
   <xsl:template name="gml:ts_Property">
      <gml:ts>
         <xsl:value-of select="./@gml:ts"/>
      </gml:ts>
   </xsl:template>
   <xsl:template name="gml:featureType_Property">
      <gml:featureType>
         <xsl:value-of select="./@gml:featureType"/>
      </gml:featureType>
   </xsl:template>
   <xsl:template name="gml:baseType_Property">
      <gml:baseType>
         <xsl:value-of select="./@gml:baseType"/>
      </gml:baseType>
   </xsl:template>
   <xsl:template name="gml:queryGrammar_Property">
      <gml:queryGrammar>
         <xsl:value-of select="./@gml:queryGrammar"/>
      </gml:queryGrammar>
   </xsl:template>
   <xsl:template name="gml:geometryProperty_Property">
      <gml:geometryProperty>
         <xsl:value-of select="./@gml:geometryProperty"/>
      </gml:geometryProperty>
   </xsl:template>
   <xsl:template name="gml:geometryType_Property">
      <gml:geometryType>
         <xsl:value-of select="./@gml:geometryType"/>
      </gml:geometryType>
   </xsl:template>
   <xsl:template name="gml:topologyProperty_Property">
      <gml:topologyProperty>
         <xsl:value-of select="./@gml:topologyProperty"/>
      </gml:topologyProperty>
   </xsl:template>
   <xsl:template name="gml:topologyType_Property">
      <gml:topologyType>
         <xsl:value-of select="./@gml:topologyType"/>
      </gml:topologyType>
   </xsl:template>
   <xsl:template name="gml:symbolType_Property">
      <gml:symbolType>
         <xsl:value-of select="./@gml:symbolType"/>
      </gml:symbolType>
   </xsl:template>
   <xsl:template name="gml:transform_Property">
      <gml:hastransform>
         <xsl:value-of select="./@gml:transform"/>
      </gml:hastransform>
   <gml:transform>
         <xsl:value-of select="./@gml:transform"/>
      </gml:transform>
   </xsl:template>
   <xsl:template name="gml:styleProperty_Property">
      <gml:styleProperty>
         <xsl:value-of select="./@gml:styleProperty"/>
      </gml:styleProperty>
   </xsl:template>
   <xsl:template name="gml:featurePropertyRange_Property">
      <gml:featurePropertyRange>
         <xsl:value-of select="./@gml:featurePropertyRange"/>
      </gml:featurePropertyRange>
   </xsl:template>
   <xsl:template name="gml:numDerivativesAtStart_Property">
      <gml:numDerivativesAtStart>
         <xsl:value-of select="./@gml:numDerivativesAtStart"/>
      </gml:numDerivativesAtStart>
   </xsl:template>
   <xsl:template name="gml:numDerivativesAtEnd_Property">
      <gml:numDerivativesAtEnd>
         <xsl:value-of select="./@gml:numDerivativesAtEnd"/>
      </gml:numDerivativesAtEnd>
   </xsl:template>
   <xsl:template name="gml:numDerivativeInterior_Property">
      <gml:numDerivativeInterior>
         <xsl:value-of select="./@gml:numDerivativeInterior"/>
      </gml:numDerivativeInterior>
   </xsl:template>
   <xsl:template name="gml:interpolation_Property">
      <gml:interpolation>
         <xsl:value-of select="./@gml:interpolation"/>
      </gml:interpolation>
   </xsl:template>
   <xsl:template name="gml:numArc_Property">
      <gml:numArc>
         <xsl:value-of select="./@gml:numArc"/>
      </gml:numArc>
   </xsl:template>
   <xsl:template name="gml:isPolynomial_Property">
      <gml:isPolynomial>
         <xsl:value-of select="./@gml:isPolynomial"/>
      </gml:isPolynomial>
   </xsl:template>
   <xsl:template name="gml:knotType_Property">
      <gml:knotType>
         <xsl:value-of select="./@gml:knotType"/>
      </gml:knotType>
   </xsl:template>
   <xsl:template name="gml:horizontalCurveType_Property">
      <gml:horizontalCurveType>
         <xsl:value-of select="./@gml:horizontalCurveType"/>
      </gml:horizontalCurveType>
   </xsl:template>
   <xsl:template name="gml:verticalCurveType_Property">
      <gml:verticalCurveType>
         <xsl:value-of select="./@gml:verticalCurveType"/>
      </gml:verticalCurveType>
   </xsl:template>
   <xsl:template name="gml:exponent_Property">
      <gml:exponent>
         <xsl:value-of select="./@gml:exponent"/>
      </gml:exponent>
   </xsl:template>
   <xsl:template name="app:uri_Property">
      <app:uri>
         <xsl:value-of select="./@app:uri"/>
      </app:uri>
   </xsl:template>
   <xsl:template name="app:ring_Property">
      <app:ring>
         <xsl:value-of select="./@app:ring"/>
      </app:ring>
   </xsl:template>
   <xsl:template name="tex:orientation_Property">
      <tex:orientation>
         <xsl:value-of select="./@tex:orientation"/>
      </tex:orientation>
   </xsl:template>
   <xsl:template name="xAL:Code_Property">
      <xAL:Code>
         <xsl:value-of select="./@xAL:Code"/>
      </xAL:Code>
   </xsl:template>
   <xsl:template name="xAL:Version_Property">
      <xAL:Version>
         <xsl:value-of select="./@xAL:Version"/>
      </xAL:Version>
   </xsl:template>
   <xsl:template name="xAL:IdentifierType_Property">
      <xAL:IdentifierType>
         <xsl:value-of select="./@xAL:IdentifierType"/>
      </xAL:IdentifierType>
   </xsl:template>
   <xsl:template name="xAL:Type_Property">
      <xAL:Type>
         <xsl:value-of select="./@xAL:Type"/>
      </xAL:Type>
   </xsl:template>
   <xsl:template name="xAL:Scheme_Property">
      <xAL:Scheme>
         <xsl:value-of select="./@xAL:Scheme"/>
      </xAL:Scheme>
   </xsl:template>
   <xsl:template name="xAL:AddressType_Property">
      <xAL:AddressType>
         <xsl:value-of select="./@xAL:AddressType"/>
      </xAL:AddressType>
   </xsl:template>
   <xsl:template name="xAL:CurrentStatus_Property">
      <xAL:CurrentStatus>
         <xsl:value-of select="./@xAL:CurrentStatus"/>
      </xAL:CurrentStatus>
   </xsl:template>
   <xsl:template name="xAL:ValidFromDate_Property">
      <xAL:ValidFromDate>
         <xsl:value-of select="./@xAL:ValidFromDate"/>
      </xAL:ValidFromDate>
   </xsl:template>
   <xsl:template name="xAL:ValidToDate_Property">
      <xAL:ValidToDate>
         <xsl:value-of select="./@xAL:ValidToDate"/>
      </xAL:ValidToDate>
   </xsl:template>
   <xsl:template name="xAL:Usage_Property">
      <xAL:Usage>
         <xsl:value-of select="./@xAL:Usage"/>
      </xAL:Usage>
   </xsl:template>
   <xsl:template name="xAL:AddressDetailsKey_Property">
      <xAL:AddressDetailsKey>
         <xsl:value-of select="./@xAL:AddressDetailsKey"/>
      </xAL:AddressDetailsKey>
   </xsl:template>
   <xsl:template name="xAL:TypeOccurrence_Property">
      <xAL:TypeOccurrence>
         <xsl:value-of select="./@xAL:TypeOccurrence"/>
      </xAL:TypeOccurrence>
   </xsl:template>
   <xsl:template name="xAL:NameNumberOccurrence_Property">
      <xAL:NameNumberOccurrence>
         <xsl:value-of select="./@xAL:NameNumberOccurrence"/>
      </xAL:NameNumberOccurrence>
   </xsl:template>
   <xsl:template name="xAL:UsageType_Property">
      <xAL:UsageType>
         <xsl:value-of select="./@xAL:UsageType"/>
      </xAL:UsageType>
   </xsl:template>
   <xsl:template name="xAL:Connector_Property">
      <xAL:Connector>
         <xsl:value-of select="./@xAL:Connector"/>
      </xAL:Connector>
   </xsl:template>
   <xsl:template name="xAL:Indicator_Property">
      <xAL:Indicator>
         <xsl:value-of select="./@xAL:Indicator"/>
      </xAL:Indicator>
   </xsl:template>
   <xsl:template name="xAL:NameNumberSeparator_Property">
      <xAL:NameNumberSeparator>
         <xsl:value-of select="./@xAL:NameNumberSeparator"/>
      </xAL:NameNumberSeparator>
   </xsl:template>
   <xsl:template name="xAL:IndicatorOccurrence_Property">
      <xAL:IndicatorOccurrence>
         <xsl:value-of select="./@xAL:IndicatorOccurrence"/>
      </xAL:IndicatorOccurrence>
   </xsl:template>
   <xsl:template name="xAL:NumberTypeOccurrence_Property">
      <xAL:NumberTypeOccurrence>
         <xsl:value-of select="./@xAL:NumberTypeOccurrence"/>
      </xAL:NumberTypeOccurrence>
   </xsl:template>
   <xsl:template name="xAL:PremiseNumberSeparator_Property">
      <xAL:PremiseNumberSeparator>
         <xsl:value-of select="./@xAL:PremiseNumberSeparator"/>
      </xAL:PremiseNumberSeparator>
   </xsl:template>
   <xsl:template name="xAL:NumberPrefixSeparator_Property">
      <xAL:NumberPrefixSeparator>
         <xsl:value-of select="./@xAL:NumberPrefixSeparator"/>
      </xAL:NumberPrefixSeparator>
   </xsl:template>
   <xsl:template name="xAL:NumberSuffixSeparator_Property">
      <xAL:NumberSuffixSeparator>
         <xsl:value-of select="./@xAL:NumberSuffixSeparator"/>
      </xAL:NumberSuffixSeparator>
   </xsl:template>
   <xsl:template name="xAL:RangeType_Property">
      <xAL:RangeType>
         <xsl:value-of select="./@xAL:RangeType"/>
      </xAL:RangeType>
   </xsl:template>
   <xsl:template name="xAL:Separator_Property">
      <xAL:Separator>
         <xsl:value-of select="./@xAL:Separator"/>
      </xAL:Separator>
   </xsl:template>
   <xsl:template name="xAL:NumberRangeOccurrence_Property">
      <xAL:NumberRangeOccurrence>
         <xsl:value-of select="./@xAL:NumberRangeOccurrence"/>
      </xAL:NumberRangeOccurrence>
   </xsl:template>
   <xsl:template name="xAL:DependentThoroughfares_Property">
      <xAL:DependentThoroughfares>
         <xsl:value-of select="./@xAL:DependentThoroughfares"/>
      </xAL:DependentThoroughfares>
   </xsl:template>
   <xsl:template name="xAL:DependentThoroughfaresIndicator_Property">
      <xAL:DependentThoroughfaresIndicator>
         <xsl:value-of select="./@xAL:DependentThoroughfaresIndicator"/>
      </xAL:DependentThoroughfaresIndicator>
   </xsl:template>
   <xsl:template name="xAL:DependentThoroughfaresConnector_Property">
      <xAL:DependentThoroughfaresConnector>
         <xsl:value-of select="./@xAL:DependentThoroughfaresConnector"/>
      </xAL:DependentThoroughfaresConnector>
   </xsl:template>
   <xsl:template name="xAL:DependentThoroughfaresType_Property">
      <xAL:DependentThoroughfaresType>
         <xsl:value-of select="./@xAL:DependentThoroughfaresType"/>
      </xAL:DependentThoroughfaresType>
   </xsl:template>
   <xsl:template name="xAL:NumberExtensionSeparator_Property">
      <xAL:NumberExtensionSeparator>
         <xsl:value-of select="./@xAL:NumberExtensionSeparator"/>
      </xAL:NumberExtensionSeparator>
   </xsl:template>
   <xsl:template name="xAL:IndicatorOccurence_Property">
      <xAL:IndicatorOccurence>
         <xsl:value-of select="./@xAL:IndicatorOccurence"/>
      </xAL:IndicatorOccurence>
   </xsl:template>
   <xsl:template name="xAL:NumberRangeOccurence_Property">
      <xAL:NumberRangeOccurence>
         <xsl:value-of select="./@xAL:NumberRangeOccurence"/>
      </xAL:NumberRangeOccurence>
   </xsl:template>
   <xsl:template name="xAL:PremiseDependency_Property">
      <xAL:PremiseDependency>
         <xsl:value-of select="./@xAL:PremiseDependency"/>
      </xAL:PremiseDependency>
   </xsl:template>
   <xsl:template name="xAL:PremiseDependencyType_Property">
      <xAL:PremiseDependencyType>
         <xsl:value-of select="./@xAL:PremiseDependencyType"/>
      </xAL:PremiseDependencyType>
   </xsl:template>
   <xsl:template name="xAL:PremiseThoroughfareConnector_Property">
      <xAL:PremiseThoroughfareConnector>
         <xsl:value-of select="./@xAL:PremiseThoroughfareConnector"/>
      </xAL:PremiseThoroughfareConnector>
   </xsl:template>
   <xsl:template name="xAL:NumberType_Property">
      <xAL:NumberType>
         <xsl:value-of select="./@xAL:NumberType"/>
      </xAL:NumberType>
   </xsl:template>
   <xsl:template name="xAL:NumberOccurrence_Property">
      <xAL:NumberOccurrence>
         <xsl:value-of select="./@xAL:NumberOccurrence"/>
      </xAL:NumberOccurrence>
   </xsl:template>
   <xsl:template name="grp:role_Property">
      <grp:role>
         <xsl:value-of select="./@grp:role"/>
      </grp:role>
   </xsl:template>
   <xsl:template name="gen:name_Property">
      <gen:name>
         <xsl:value-of select="./@gen:name"/>
      </gen:name>
   </xsl:template>
   <xsl:template name="gen:codeSpace_Property">
      <gen:codeSpace>
         <xsl:value-of select="./@gen:codeSpace"/>
      </gen:codeSpace>
   </xsl:template>
   <xsl:template name="gml:StandardDefinitionProperties_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name|./gml:coordinateOperationName|./gml:methodName|./gml:parameterName|./gml:groupName|./gml:csName|./gml:srsName|./gml:datumName|./gml:meridianName|./gml:ellipsoidName">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:StandardObjectProperties_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name|./gml:coordinateOperationName|./gml:methodName|./gml:parameterName|./gml:groupName|./gml:csName|./gml:srsName|./gml:datumName|./gml:meridianName|./gml:ellipsoidName">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:Value_Template">
      <xsl:for-each select="./gml:_Object|./gml:_GML|./gml:Definition|./gml:Dictionary|./gml:DefinitionCollection|./gml:DefinitionProxy|./gml:_TimeReferenceSystem|./gml:TimeCoordinateSystem|./gml:TimeOrdinalReferenceSystem|./gml:TimeCalendar|./gml:TimeClock|./gml:TimeCalendarEra|./gml:_CoordinateOperation|./gml:ConcatenatedOperation|./gml:_SingleOperation|./gml:PassThroughOperation|./gml:_Operation|./gml:_GeneralConversion|./gml:Conversion|./gml:_GeneralTransformation|./gml:Transformation|./gml:OperationMethod|./gml:_GeneralOperationParameter|./gml:OperationParameter|./gml:OperationParameterGroup|./gml:CoordinateSystemAxis|./gml:_CoordinateSystem|./gml:EllipsoidalCS|./gml:CartesianCS|./gml:VerticalCS|./gml:TemporalCS|./gml:LinearCS|./gml:UserDefinedCS|./gml:SphericalCS|./gml:PolarCS|./gml:CylindricalCS|./gml:ObliqueCartesianCS|./gml:_ReferenceSystem|./gml:_CRS|./gml:_CoordinateReferenceSystem|./gml:GeographicCRS|./gml:VerticalCRS|./gml:GeocentricCRS|./gml:_GeneralDerivedCRS|./gml:ProjectedCRS|./gml:DerivedCRS|./gml:EngineeringCRS|./gml:ImageCRS|./gml:TemporalCRS|./gml:CompoundCRS|./gml:_Datum|./gml:EngineeringDatum|./gml:ImageDatum|./gml:VerticalDatum|./gml:TemporalDatum|./gml:GeodeticDatum|./gml:PrimeMeridian|./gml:Ellipsoid|./gml:UnitDefinition|./gml:BaseUnit|./gml:DerivedUnit|./gml:ConventionalUnit|./gml:_Feature|./gml:_Coverage|./gml:_ContinuousCoverage|./gml:_DiscreteCoverage|./gml:MultiPointCoverage|./gml:MultiCurveCoverage|./gml:MultiSurfaceCoverage|./gml:MultiSolidCoverage|./gml:GridCoverage|./gml:RectifiedGridCoverage|./gml:_FeatureCollection|./core:CityModel|./gml:FeatureCollection|./gml:Observation|./gml:DirectedObservation|./gml:DirectedObservationAtDistance|./app:Appearance|./app:_SurfaceData|./app:_Texture|./app:ParameterizedTexture|./app:GeoreferencedTexture|./app:X3DMaterial|./core:_CityObject|./frn:CityFurniture|./wtr:_WaterObject|./wtr:WaterBody|./wtr:_WaterBoundarySurface|./wtr:WaterSurface|./wtr:WaterGroundSurface|./wtr:WaterClosureSurface|./core:_Site|./tun:_AbstractTunnel|./tun:Tunnel|./tun:TunnelPart|./bldg:_AbstractBuilding|./bldg:Building|./bldg:BuildingPart|./veg:_VegetationObject|./veg:PlantCover|./veg:SolitaryVegetationObject|./tran:_TransportationObject|./tran:TransportationComplex|./tran:Track|./tran:Road|./tran:Railway|./tran:Square|./tran:TrafficArea|./tran:AuxiliaryTrafficArea|./luse:LandUse|./tun:TunnelInstallation|./tun:IntTunnelInstallation|./tun:_BoundarySurface|./tun:RoofSurface|./tun:WallSurface|./tun:GroundSurface|./tun:ClosureSurface|./tun:FloorSurface|./tun:OuterFloorSurface|./tun:InteriorWallSurface|./tun:CeilingSurface|./tun:OuterCeilingSurface|./tun:HollowSpace|./tun:TunnelFurniture|./tun:_Opening|./tun:Window|./tun:Door|./grp:CityObjectGroup|./dem:ReliefFeature|./dem:_ReliefComponent|./dem:TINRelief|./dem:RasterRelief|./dem:MassPointRelief|./dem:BreaklineRelief|./bldg:BuildingInstallation|./bldg:IntBuildingInstallation|./bldg:_BoundarySurface|./bldg:RoofSurface|./bldg:WallSurface|./bldg:GroundSurface|./bldg:ClosureSurface|./bldg:FloorSurface|./bldg:OuterFloorSurface|./bldg:InteriorWallSurface|./bldg:CeilingSurface|./bldg:OuterCeilingSurface|./bldg:_Opening|./bldg:Window|./bldg:Door|./bldg:Room|./bldg:BuildingFurniture|./gen:GenericCityObject|./core:Address|./gml:_Topology|./gml:_TopoPrimitive|./gml:Node|./gml:Edge|./gml:Face|./gml:TopoSolid|./gml:TopoComplex|./gml:Bag|./gml:Array|./gml:_Geometry|./gml:GeometricComplex|./gml:_GeometricPrimitive|./gml:Point|./gml:_Curve|./gml:CompositeCurve|./gml:LineString|./gml:Curve|./gml:OrientableCurve|./gml:_Surface|./gml:CompositeSurface|./gml:Polygon|./gml:Surface|./gml:PolyhedralSurface|./gml:TriangulatedSurface|./gml:Tin|./gml:OrientableSurface|./tex:TexturedSurface|./gml:_Solid|./gml:CompositeSolid|./gml:Solid|./gml:_Ring|./gml:LinearRing|./gml:Ring|./gml:_GeometricAggregate|./gml:MultiGeometry|./gml:MultiPoint|./gml:MultiCurve|./gml:MultiSurface|./gml:MultiSolid|./gml:MultiPolygon|./gml:MultiLineString|./gml:_ImplicitGeometry|./gml:Grid|./gml:RectifiedGrid|./gml:_TimeSlice|./gml:MovingObjectStatus|./gml:_TimeObject|./gml:_TimePrimitive|./gml:_TimeGeometricPrimitive|./gml:TimeInstant|./gml:TimePeriod|./gml:_TimeTopologyPrimitive|./gml:TimeNode|./gml:TimeEdge|./gml:_TimeComplex|./gml:TimeTopologyComplex|./gml:_Style|./gml:Style|./gml:FeatureStyle|./gml:GeometryStyle|./gml:TopologyStyle|./gml:LabelStyle|./gml:GraphStyle|./app:_TextureParameterization|./app:TexCoordList|./app:TexCoordGen|./core:ImplicitGeometry|./tex:_Appearance|./tex:Material|./tex:SimpleTexture|./gml:_MetaData|./gml:GenericMetaData|./dem:Elevation">
         <xsl:call-template name="gml:_Object_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Null">
         <xsl:call-template name="gml:Null_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ValueObject_Template"/>
   </xsl:template>
   <xsl:template name="gml:ValueObject_Template">
      <xsl:for-each select="./gml:CompositeValue|./gml:ValueArray">
         <xsl:call-template name="gml:CompositeValue_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ScalarValue_Template"/>
      <xsl:call-template name="gml:ScalarValueList_Template"/>
      <xsl:call-template name="gml:ValueExtent_Template"/>
   </xsl:template>
   <xsl:template name="gml:ScalarValue_Template">
      <xsl:for-each select="./gml:Boolean">
         <xsl:call-template name="gml:Boolean_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Category">
         <xsl:call-template name="gml:Category_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Quantity">
         <xsl:call-template name="gml:Quantity_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Count">
         <xsl:call-template name="gml:Count_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:ScalarValueList_Template">
      <xsl:for-each select="./gml:BooleanList">
         <xsl:call-template name="gml:BooleanList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CategoryList">
         <xsl:call-template name="gml:CategoryList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:QuantityList">
         <xsl:call-template name="gml:QuantityList_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CountList">
         <xsl:call-template name="gml:CountList_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:ValueExtent_Template">
      <xsl:for-each select="./gml:CategoryExtent">
         <xsl:call-template name="gml:CategoryExtent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:QuantityExtent">
         <xsl:call-template name="gml:QuantityExtent_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CountExtent">
         <xsl:call-template name="gml:CountExtent_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:geometricPositionGroup_Template">
      <xsl:for-each select="./gml:pos">
         <xsl:call-template name="gml:pos_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:pointProperty">
         <xsl:call-template name="gml:pointProperty_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:geometricPositionListGroup_Template">
      <xsl:for-each select="./gml:posList">
         <xsl:call-template name="gml:posList_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:geometricPositionGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:dynamicProperties_Template">
      <xsl:for-each select="./gml:validTime">
         <xsl:call-template name="gml:validTime_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:history|./gml:track">
         <xsl:call-template name="gml:history_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:dataSource">
         <xsl:call-template name="gml:dataSource_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:timeLength_Template">
      <xsl:for-each select="./gml:duration">
         <xsl:call-template name="gml:duration_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:timeInterval">
         <xsl:call-template name="gml:timeInterval_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:PointGrid_Template">
      <xsl:for-each select="./gml:row">
         <xsl:call-template name="gml:row_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:geometricPositionListGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:AssociationAttributeGroup_Template">
      <xsl:for-each select="./gml:remoteSchema">
         <xsl:call-template name="gml:remoteSchema_Property"/>
      </xsl:for-each>
      <xsl:call-template name="xlink:simpleAttrs_Template"/>
   </xsl:template>
   <xsl:template name="gml:referenceSystem_Template">
      <xsl:for-each select="./gml:codeSpace">
         <xsl:call-template name="gml:codeSpace_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:uom">
         <xsl:call-template name="gml:uom_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:SRSReferenceGroup_Template">
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsDimension">
         <xsl:call-template name="gml:srsDimension_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:SRSInformationGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SRSInformationGroup_Template">
      <xsl:for-each select="./gml:axisLabels">
         <xsl:call-template name="gml:axisLabels_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:uomLabels">
         <xsl:call-template name="gml:uomLabels_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="xAL:grPostal_Template">
      <xsl:for-each select="./xAL:Code">
         <xsl:call-template name="xAL:Code_Property"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="text()">
      <xsl:if test="string(.) = ''"/>
   </xsl:template>
<xsl:template name="gml:_Object_Template"/><xsl:template name="xlink:simpleAttrs_Template"/></xsl:stylesheet>
