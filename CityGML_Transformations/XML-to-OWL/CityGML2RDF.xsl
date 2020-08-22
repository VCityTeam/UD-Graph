<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gml="http://www.opengis.net/gml" xmlns:base="http://www.opengis.net/citygml/base/2.0" xmlns:bldg="http://www.opengis.net/citygml/building/2.0" xmlns:core="http://www.opengis.net/citygml/2.0" xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:smil20="http://www.w3.org/2001/SMIL20/" version="2.0"><xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:variable name="namespace" select="'https://liris.cnrs.fr/ontologies#'"/>
   <xsl:template match="/">
      <rdf:RDF xmlns:liris="https://liris.cnrs.fr/ontologies#">
         <owl:Ontology rdf:about="https://liris.cnrs.fr/ontologies#"/>
         <xsl:apply-templates select="//*"/>
      </rdf:RDF>
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
      <xsl:for-each select="./core:_GenericApplicationPropertyOfCityObject">
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
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
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
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="bldg:OpeningPropertyType_Template">
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
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
      <xsl:for-each select="./gml:location">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:priorityLocation">
         <xsl:call-template name="gml:priorityLocation_Substitution"/>
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
      <xsl:for-each select="./gml:_TimeSlice">
         <xsl:call-template name="gml:_TimeSlice_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MovingObjectStatus">
         <xsl:call-template name="gml:MovingObjectStatus_Substitution"/>
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
   <xsl:template name="gml:AbstractFeatureType_Template">
      <xsl:for-each select="./gml:boundedBy">
         <xsl:call-template name="gml:boundedBy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:location">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:priorityLocation">
         <xsl:call-template name="gml:priorityLocation_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:BoundingShapeType_Template">
      <xsl:for-each select="./gml:Envelope">
         <xsl:call-template name="gml:Envelope_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EnvelopeWithTimePeriod">
         <xsl:call-template name="gml:EnvelopeWithTimePeriod_Substitution"/>
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
      <xsl:for-each select="./gml:_Feature">
         <xsl:call-template name="gml:_Feature_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_FeatureCollection">
         <xsl:call-template name="gml:_FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:CityModel">
         <xsl:call-template name="core:CityModel_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureCollection">
         <xsl:call-template name="gml:FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Coverage">
         <xsl:call-template name="gml:_Coverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ContinuousCoverage">
         <xsl:call-template name="gml:_ContinuousCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_DiscreteCoverage">
         <xsl:call-template name="gml:_DiscreteCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPointCoverage">
         <xsl:call-template name="gml:MultiPointCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurveCoverage">
         <xsl:call-template name="gml:MultiCurveCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurfaceCoverage">
         <xsl:call-template name="gml:MultiSurfaceCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolidCoverage">
         <xsl:call-template name="gml:MultiSolidCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridCoverage">
         <xsl:call-template name="gml:GridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Observation">
         <xsl:call-template name="gml:Observation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservation">
         <xsl:call-template name="gml:DirectedObservation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservationAtDistance">
         <xsl:call-template name="gml:DirectedObservationAtDistance_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:FeatureArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Feature">
         <xsl:call-template name="gml:_Feature_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_FeatureCollection">
         <xsl:call-template name="gml:_FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:CityModel">
         <xsl:call-template name="core:CityModel_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureCollection">
         <xsl:call-template name="gml:FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Coverage">
         <xsl:call-template name="gml:_Coverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ContinuousCoverage">
         <xsl:call-template name="gml:_ContinuousCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_DiscreteCoverage">
         <xsl:call-template name="gml:_DiscreteCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPointCoverage">
         <xsl:call-template name="gml:MultiPointCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurveCoverage">
         <xsl:call-template name="gml:MultiCurveCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurfaceCoverage">
         <xsl:call-template name="gml:MultiSurfaceCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolidCoverage">
         <xsl:call-template name="gml:MultiSolidCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridCoverage">
         <xsl:call-template name="gml:GridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Observation">
         <xsl:call-template name="gml:Observation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservation">
         <xsl:call-template name="gml:DirectedObservation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservationAtDistance">
         <xsl:call-template name="gml:DirectedObservationAtDistance_Substitution"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractFeatureCollectionType_Template">
      <xsl:for-each select="./gml:featureMember">
         <xsl:call-template name="gml:featureMember_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:cityObjectMember">
         <xsl:call-template name="core:cityObjectMember_Substitution"/>
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
      <xsl:for-each select="./gml:location">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:priorityLocation">
         <xsl:call-template name="gml:priorityLocation_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:StandardObjectProperties_Template"/>
      <xsl:call-template name="gml:AbstractFeatureType_Template"/>
   </xsl:template>
   <xsl:template name="gml:LocationPropertyType_Template">
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
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
   <xsl:template name="gml:AbstractSurfaceType_Template">
      <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
   </xsl:template>
   <xsl:template name="gml:SurfacePropertyType_Template">
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SurfaceArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:PolygonType_Template">
      <xsl:for-each select="./gml:exterior">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:outerBoundaryIs">
         <xsl:call-template name="gml:outerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interior">
         <xsl:call-template name="gml:interior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:innerBoundaryIs">
         <xsl:call-template name="gml:innerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractRingType_Template">
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractRingPropertyType_Template">
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
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
   <xsl:template name="gml:GeometryPropertyType_Template">
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometryArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:AbstractGeometryType_Template">
      <xsl:if test="@gml:gid">
         <xsl:call-template name="gml:gid_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:SRSReferenceGroup_Template"/>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractGeometricPrimitiveType_Template">
      <xsl:call-template name="gml:AbstractGeometryType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeometricPrimitivePropertyType_Template">
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
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
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CurveArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
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
   <xsl:template name="gml:DefinitionType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:csName">
         <xsl:call-template name="gml:csName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:meridianName">
         <xsl:call-template name="gml:meridianName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ellipsoidName">
         <xsl:call-template name="gml:ellipsoidName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodName">
         <xsl:call-template name="gml:methodName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:parameterName">
         <xsl:call-template name="gml:parameterName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:groupName">
         <xsl:call-template name="gml:groupName_Substitution"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractGMLType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DictionaryType_Template">
      <xsl:for-each select="./gml:dictionaryEntry">
         <xsl:call-template name="gml:dictionaryEntry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:definitionMember">
         <xsl:call-template name="gml:definitionMember_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:indirectEntry">
         <xsl:call-template name="gml:indirectEntry_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:DefinitionType_Template"/>
   </xsl:template>
   <xsl:template name="gml:DictionaryEntryType_Template">
      <xsl:for-each select="./gml:Definition">
         <xsl:call-template name="gml:Definition_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UnitDefinition">
         <xsl:call-template name="gml:UnitDefinition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:BaseUnit">
         <xsl:call-template name="gml:BaseUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedUnit">
         <xsl:call-template name="gml:DerivedUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConventionalUnit">
         <xsl:call-template name="gml:ConventionalUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Dictionary">
         <xsl:call-template name="gml:Dictionary_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionCollection">
         <xsl:call-template name="gml:DefinitionCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionProxy">
         <xsl:call-template name="gml:DefinitionProxy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CoordinateSystemAxis">
         <xsl:call-template name="gml:CoordinateSystemAxis_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateSystem">
         <xsl:call-template name="gml:_CoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EllipsoidalCS">
         <xsl:call-template name="gml:EllipsoidalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CartesianCS">
         <xsl:call-template name="gml:CartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCS">
         <xsl:call-template name="gml:VerticalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCS">
         <xsl:call-template name="gml:TemporalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearCS">
         <xsl:call-template name="gml:LinearCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UserDefinedCS">
         <xsl:call-template name="gml:UserDefinedCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:SphericalCS">
         <xsl:call-template name="gml:SphericalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolarCS">
         <xsl:call-template name="gml:PolarCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CylindricalCS">
         <xsl:call-template name="gml:CylindricalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:ObliqueCartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ReferenceSystem">
         <xsl:call-template name="gml:_ReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CRS">
         <xsl:call-template name="gml:_CRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Datum">
         <xsl:call-template name="gml:_Datum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringDatum">
         <xsl:call-template name="gml:EngineeringDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageDatum">
         <xsl:call-template name="gml:ImageDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalDatum">
         <xsl:call-template name="gml:VerticalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalDatum">
         <xsl:call-template name="gml:TemporalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeodeticDatum">
         <xsl:call-template name="gml:GeodeticDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PrimeMeridian">
         <xsl:call-template name="gml:PrimeMeridian_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ellipsoid">
         <xsl:call-template name="gml:Ellipsoid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateOperation">
         <xsl:call-template name="gml:_CoordinateOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConcatenatedOperation">
         <xsl:call-template name="gml:ConcatenatedOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_SingleOperation">
         <xsl:call-template name="gml:_SingleOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationMethod">
         <xsl:call-template name="gml:OperationMethod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralOperationParameter">
         <xsl:call-template name="gml:_GeneralOperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameter">
         <xsl:call-template name="gml:OperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameterGroup">
         <xsl:call-template name="gml:OperationParameterGroup_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeReferenceSystem">
         <xsl:call-template name="gml:_TimeReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCoordinateSystem">
         <xsl:call-template name="gml:TimeCoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeOrdinalReferenceSystem">
         <xsl:call-template name="gml:TimeOrdinalReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendar">
         <xsl:call-template name="gml:TimeCalendar_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeClock">
         <xsl:call-template name="gml:TimeClock_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendarEra">
         <xsl:call-template name="gml:TimeCalendarEra_Substitution"/>
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
      <xsl:for-each select="./gml:_Object">
         <xsl:call-template name="gml:_Object_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GML">
         <xsl:call-template name="gml:_GML_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:ImplicitGeometry">
         <xsl:call-template name="core:ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeSlice">
         <xsl:call-template name="gml:_TimeSlice_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MovingObjectStatus">
         <xsl:call-template name="gml:MovingObjectStatus_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Feature">
         <xsl:call-template name="gml:_Feature_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_FeatureCollection">
         <xsl:call-template name="gml:_FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:CityModel">
         <xsl:call-template name="core:CityModel_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureCollection">
         <xsl:call-template name="gml:FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Coverage">
         <xsl:call-template name="gml:_Coverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ContinuousCoverage">
         <xsl:call-template name="gml:_ContinuousCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_DiscreteCoverage">
         <xsl:call-template name="gml:_DiscreteCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPointCoverage">
         <xsl:call-template name="gml:MultiPointCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurveCoverage">
         <xsl:call-template name="gml:MultiCurveCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurfaceCoverage">
         <xsl:call-template name="gml:MultiSurfaceCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolidCoverage">
         <xsl:call-template name="gml:MultiSolidCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridCoverage">
         <xsl:call-template name="gml:GridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Observation">
         <xsl:call-template name="gml:Observation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservation">
         <xsl:call-template name="gml:DirectedObservation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservationAtDistance">
         <xsl:call-template name="gml:DirectedObservationAtDistance_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Definition">
         <xsl:call-template name="gml:Definition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UnitDefinition">
         <xsl:call-template name="gml:UnitDefinition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:BaseUnit">
         <xsl:call-template name="gml:BaseUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedUnit">
         <xsl:call-template name="gml:DerivedUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConventionalUnit">
         <xsl:call-template name="gml:ConventionalUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Dictionary">
         <xsl:call-template name="gml:Dictionary_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionCollection">
         <xsl:call-template name="gml:DefinitionCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionProxy">
         <xsl:call-template name="gml:DefinitionProxy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CoordinateSystemAxis">
         <xsl:call-template name="gml:CoordinateSystemAxis_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateSystem">
         <xsl:call-template name="gml:_CoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EllipsoidalCS">
         <xsl:call-template name="gml:EllipsoidalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CartesianCS">
         <xsl:call-template name="gml:CartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCS">
         <xsl:call-template name="gml:VerticalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCS">
         <xsl:call-template name="gml:TemporalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearCS">
         <xsl:call-template name="gml:LinearCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UserDefinedCS">
         <xsl:call-template name="gml:UserDefinedCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:SphericalCS">
         <xsl:call-template name="gml:SphericalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolarCS">
         <xsl:call-template name="gml:PolarCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CylindricalCS">
         <xsl:call-template name="gml:CylindricalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:ObliqueCartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ReferenceSystem">
         <xsl:call-template name="gml:_ReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CRS">
         <xsl:call-template name="gml:_CRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Datum">
         <xsl:call-template name="gml:_Datum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringDatum">
         <xsl:call-template name="gml:EngineeringDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageDatum">
         <xsl:call-template name="gml:ImageDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalDatum">
         <xsl:call-template name="gml:VerticalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalDatum">
         <xsl:call-template name="gml:TemporalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeodeticDatum">
         <xsl:call-template name="gml:GeodeticDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PrimeMeridian">
         <xsl:call-template name="gml:PrimeMeridian_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ellipsoid">
         <xsl:call-template name="gml:Ellipsoid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateOperation">
         <xsl:call-template name="gml:_CoordinateOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConcatenatedOperation">
         <xsl:call-template name="gml:ConcatenatedOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_SingleOperation">
         <xsl:call-template name="gml:_SingleOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationMethod">
         <xsl:call-template name="gml:OperationMethod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralOperationParameter">
         <xsl:call-template name="gml:_GeneralOperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameter">
         <xsl:call-template name="gml:OperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameterGroup">
         <xsl:call-template name="gml:OperationParameterGroup_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeReferenceSystem">
         <xsl:call-template name="gml:_TimeReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCoordinateSystem">
         <xsl:call-template name="gml:TimeCoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeOrdinalReferenceSystem">
         <xsl:call-template name="gml:TimeOrdinalReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendar">
         <xsl:call-template name="gml:TimeCalendar_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeClock">
         <xsl:call-template name="gml:TimeClock_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendarEra">
         <xsl:call-template name="gml:TimeCalendarEra_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Bag">
         <xsl:call-template name="gml:Bag_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Array">
         <xsl:call-template name="gml:Array_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeObject">
         <xsl:call-template name="gml:_TimeObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimePrimitive">
         <xsl:call-template name="gml:_TimePrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeGeometricPrimitive">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeTopologyPrimitive">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeComplex">
         <xsl:call-template name="gml:_TimeComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeTopologyComplex">
         <xsl:call-template name="gml:TimeTopologyComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Topology">
         <xsl:call-template name="gml:_Topology_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TopoPrimitive">
         <xsl:call-template name="gml:_TopoPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoComplex">
         <xsl:call-template name="gml:TopoComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Style">
         <xsl:call-template name="gml:_Style_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Style">
         <xsl:call-template name="gml:Style_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureStyle">
         <xsl:call-template name="gml:FeatureStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometryStyle">
         <xsl:call-template name="gml:GeometryStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopologyStyle">
         <xsl:call-template name="gml:TopologyStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LabelStyle">
         <xsl:call-template name="gml:LabelStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GraphStyle">
         <xsl:call-template name="gml:GraphStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_MetaData">
         <xsl:call-template name="gml:_MetaData_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GenericMetaData">
         <xsl:call-template name="gml:GenericMetaData_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ReferenceType_Template">
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:ArrayAssociationType_Template">
      <xsl:for-each select="./gml:_Object">
         <xsl:call-template name="gml:_Object_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GML">
         <xsl:call-template name="gml:_GML_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:ImplicitGeometry">
         <xsl:call-template name="core:ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeSlice">
         <xsl:call-template name="gml:_TimeSlice_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MovingObjectStatus">
         <xsl:call-template name="gml:MovingObjectStatus_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Feature">
         <xsl:call-template name="gml:_Feature_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_FeatureCollection">
         <xsl:call-template name="gml:_FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:CityModel">
         <xsl:call-template name="core:CityModel_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureCollection">
         <xsl:call-template name="gml:FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Coverage">
         <xsl:call-template name="gml:_Coverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ContinuousCoverage">
         <xsl:call-template name="gml:_ContinuousCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_DiscreteCoverage">
         <xsl:call-template name="gml:_DiscreteCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPointCoverage">
         <xsl:call-template name="gml:MultiPointCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurveCoverage">
         <xsl:call-template name="gml:MultiCurveCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurfaceCoverage">
         <xsl:call-template name="gml:MultiSurfaceCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolidCoverage">
         <xsl:call-template name="gml:MultiSolidCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridCoverage">
         <xsl:call-template name="gml:GridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Observation">
         <xsl:call-template name="gml:Observation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservation">
         <xsl:call-template name="gml:DirectedObservation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservationAtDistance">
         <xsl:call-template name="gml:DirectedObservationAtDistance_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Definition">
         <xsl:call-template name="gml:Definition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UnitDefinition">
         <xsl:call-template name="gml:UnitDefinition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:BaseUnit">
         <xsl:call-template name="gml:BaseUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedUnit">
         <xsl:call-template name="gml:DerivedUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConventionalUnit">
         <xsl:call-template name="gml:ConventionalUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Dictionary">
         <xsl:call-template name="gml:Dictionary_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionCollection">
         <xsl:call-template name="gml:DefinitionCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionProxy">
         <xsl:call-template name="gml:DefinitionProxy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CoordinateSystemAxis">
         <xsl:call-template name="gml:CoordinateSystemAxis_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateSystem">
         <xsl:call-template name="gml:_CoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EllipsoidalCS">
         <xsl:call-template name="gml:EllipsoidalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CartesianCS">
         <xsl:call-template name="gml:CartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCS">
         <xsl:call-template name="gml:VerticalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCS">
         <xsl:call-template name="gml:TemporalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearCS">
         <xsl:call-template name="gml:LinearCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UserDefinedCS">
         <xsl:call-template name="gml:UserDefinedCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:SphericalCS">
         <xsl:call-template name="gml:SphericalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolarCS">
         <xsl:call-template name="gml:PolarCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CylindricalCS">
         <xsl:call-template name="gml:CylindricalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:ObliqueCartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ReferenceSystem">
         <xsl:call-template name="gml:_ReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CRS">
         <xsl:call-template name="gml:_CRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Datum">
         <xsl:call-template name="gml:_Datum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringDatum">
         <xsl:call-template name="gml:EngineeringDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageDatum">
         <xsl:call-template name="gml:ImageDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalDatum">
         <xsl:call-template name="gml:VerticalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalDatum">
         <xsl:call-template name="gml:TemporalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeodeticDatum">
         <xsl:call-template name="gml:GeodeticDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PrimeMeridian">
         <xsl:call-template name="gml:PrimeMeridian_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ellipsoid">
         <xsl:call-template name="gml:Ellipsoid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateOperation">
         <xsl:call-template name="gml:_CoordinateOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConcatenatedOperation">
         <xsl:call-template name="gml:ConcatenatedOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_SingleOperation">
         <xsl:call-template name="gml:_SingleOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationMethod">
         <xsl:call-template name="gml:OperationMethod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralOperationParameter">
         <xsl:call-template name="gml:_GeneralOperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameter">
         <xsl:call-template name="gml:OperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameterGroup">
         <xsl:call-template name="gml:OperationParameterGroup_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeReferenceSystem">
         <xsl:call-template name="gml:_TimeReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCoordinateSystem">
         <xsl:call-template name="gml:TimeCoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeOrdinalReferenceSystem">
         <xsl:call-template name="gml:TimeOrdinalReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendar">
         <xsl:call-template name="gml:TimeCalendar_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeClock">
         <xsl:call-template name="gml:TimeClock_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendarEra">
         <xsl:call-template name="gml:TimeCalendarEra_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Bag">
         <xsl:call-template name="gml:Bag_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Array">
         <xsl:call-template name="gml:Array_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeObject">
         <xsl:call-template name="gml:_TimeObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimePrimitive">
         <xsl:call-template name="gml:_TimePrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeGeometricPrimitive">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeTopologyPrimitive">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeComplex">
         <xsl:call-template name="gml:_TimeComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeTopologyComplex">
         <xsl:call-template name="gml:TimeTopologyComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Topology">
         <xsl:call-template name="gml:_Topology_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TopoPrimitive">
         <xsl:call-template name="gml:_TopoPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoComplex">
         <xsl:call-template name="gml:TopoComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Style">
         <xsl:call-template name="gml:_Style_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Style">
         <xsl:call-template name="gml:Style_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureStyle">
         <xsl:call-template name="gml:FeatureStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometryStyle">
         <xsl:call-template name="gml:GeometryStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopologyStyle">
         <xsl:call-template name="gml:TopologyStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LabelStyle">
         <xsl:call-template name="gml:LabelStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GraphStyle">
         <xsl:call-template name="gml:GraphStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_MetaData">
         <xsl:call-template name="gml:_MetaData_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GenericMetaData">
         <xsl:call-template name="gml:GenericMetaData_Substitution"/>
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
      <xsl:for-each select="./gml:_TimePrimitive">
         <xsl:call-template name="gml:_TimePrimitive_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeGeometricPrimitive">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeTopologyPrimitive">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Substitution"/>
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
      <xsl:for-each select="./gml:_TimeGeometricPrimitive">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Substitution"/>
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
      <xsl:for-each select="./gml:_TopoPrimitive">
         <xsl:call-template name="gml:_TopoPrimitive_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:TopoPrimitiveArrayAssociationType_Template">
      <xsl:for-each select="./gml:_TopoPrimitive">
         <xsl:call-template name="gml:_TopoPrimitive_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Substitution"/>
      </xsl:for-each>
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
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
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
      <xsl:for-each select="./gml:_CurveSegment">
         <xsl:call-template name="gml:_CurveSegment_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineStringSegment">
         <xsl:call-template name="gml:LineStringSegment_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ArcString">
         <xsl:call-template name="gml:ArcString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Arc">
         <xsl:call-template name="gml:Arc_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Circle">
         <xsl:call-template name="gml:Circle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ArcStringByBulge">
         <xsl:call-template name="gml:ArcStringByBulge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ArcByBulge">
         <xsl:call-template name="gml:ArcByBulge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ArcByCenterPoint">
         <xsl:call-template name="gml:ArcByCenterPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CircleByCenterPoint">
         <xsl:call-template name="gml:CircleByCenterPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OffsetCurve">
         <xsl:call-template name="gml:OffsetCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Clothoid">
         <xsl:call-template name="gml:Clothoid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeodesicString">
         <xsl:call-template name="gml:GeodesicString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Geodesic">
         <xsl:call-template name="gml:Geodesic_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CubicSpline">
         <xsl:call-template name="gml:CubicSpline_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:BSpline">
         <xsl:call-template name="gml:BSpline_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Bezier">
         <xsl:call-template name="gml:Bezier_Substitution"/>
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
      <xsl:for-each select="./gml:location">
         <xsl:call-template name="gml:location_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:priorityLocation">
         <xsl:call-template name="gml:priorityLocation_Substitution"/>
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
      <xsl:for-each select="./gml:patches">
         <xsl:call-template name="gml:patches_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:polygonPatches">
         <xsl:call-template name="gml:polygonPatches_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:trianglePatches">
         <xsl:call-template name="gml:trianglePatches_Substitution"/>
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
      <xsl:for-each select="./gml:_SurfacePatch">
         <xsl:call-template name="gml:_SurfacePatch_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolygonPatch">
         <xsl:call-template name="gml:PolygonPatch_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Triangle">
         <xsl:call-template name="gml:Triangle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Rectangle">
         <xsl:call-template name="gml:Rectangle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ParametricCurveSurface">
         <xsl:call-template name="gml:_ParametricCurveSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GriddedSurface">
         <xsl:call-template name="gml:_GriddedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Cone">
         <xsl:call-template name="gml:Cone_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Cylinder">
         <xsl:call-template name="gml:Cylinder_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Sphere">
         <xsl:call-template name="gml:Sphere_Substitution"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:PolygonPatchType_Template">
      <xsl:for-each select="./gml:exterior">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:outerBoundaryIs">
         <xsl:call-template name="gml:outerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interior">
         <xsl:call-template name="gml:interior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:innerBoundaryIs">
         <xsl:call-template name="gml:innerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
   </xsl:template>
   <xsl:template name="gml:TriangleType_Template">
      <xsl:for-each select="./gml:exterior">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:outerBoundaryIs">
         <xsl:call-template name="gml:outerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:if test="@gml:interpolation">
         <xsl:call-template name="gml:interpolation_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
   </xsl:template>
   <xsl:template name="gml:RectangleType_Template">
      <xsl:for-each select="./gml:exterior">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:outerBoundaryIs">
         <xsl:call-template name="gml:outerBoundaryIs_Substitution"/>
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
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:SolidArrayPropertyType_Template">
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:SolidType_Template">
      <xsl:for-each select="./gml:exterior">
         <xsl:call-template name="gml:exterior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:outerBoundaryIs">
         <xsl:call-template name="gml:outerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:interior">
         <xsl:call-template name="gml:interior_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:innerBoundaryIs">
         <xsl:call-template name="gml:innerBoundaryIs_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AbstractSolidType_Template"/>
   </xsl:template>
   <xsl:template name="gml:AbstractCoverageType_Template">
      <xsl:for-each select="./gml:domainSet">
         <xsl:call-template name="gml:domainSet_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiPointDomain">
         <xsl:call-template name="gml:multiPointDomain_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiCurveDomain">
         <xsl:call-template name="gml:multiCurveDomain_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiSurfaceDomain">
         <xsl:call-template name="gml:multiSurfaceDomain_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:multiSolidDomain">
         <xsl:call-template name="gml:multiSolidDomain_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:gridDomain">
         <xsl:call-template name="gml:gridDomain_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:rectifiedGridDomain">
         <xsl:call-template name="gml:rectifiedGridDomain_Substitution"/>
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
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeObject">
         <xsl:call-template name="gml:_TimeObject_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimePrimitive">
         <xsl:call-template name="gml:_TimePrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeGeometricPrimitive">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeTopologyPrimitive">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeComplex">
         <xsl:call-template name="gml:_TimeComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeTopologyComplex">
         <xsl:call-template name="gml:TimeTopologyComplex_Substitution"/>
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
      <xsl:for-each select="./gml:GridFunction">
         <xsl:call-template name="gml:GridFunction_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:IndexMap">
         <xsl:call-template name="gml:IndexMap_Substitution"/>
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
   <xsl:template name="gml:CoordinateReferenceSystemRefType_Template">
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
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
   <xsl:template name="gml:CoordinateSystemAxisBaseType_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:csName">
         <xsl:call-template name="gml:csName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:meridianName">
         <xsl:call-template name="gml:meridianName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ellipsoidName">
         <xsl:call-template name="gml:ellipsoidName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodName">
         <xsl:call-template name="gml:methodName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:parameterName">
         <xsl:call-template name="gml:parameterName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:groupName">
         <xsl:call-template name="gml:groupName_Substitution"/>
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
      <xsl:for-each select="./gml:_CoordinateSystem">
         <xsl:call-template name="gml:_CoordinateSystem_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EllipsoidalCS">
         <xsl:call-template name="gml:EllipsoidalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CartesianCS">
         <xsl:call-template name="gml:CartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCS">
         <xsl:call-template name="gml:VerticalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCS">
         <xsl:call-template name="gml:TemporalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearCS">
         <xsl:call-template name="gml:LinearCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UserDefinedCS">
         <xsl:call-template name="gml:UserDefinedCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:SphericalCS">
         <xsl:call-template name="gml:SphericalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolarCS">
         <xsl:call-template name="gml:PolarCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CylindricalCS">
         <xsl:call-template name="gml:CylindricalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:ObliqueCartesianCS_Substitution"/>
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
      <xsl:for-each select="./gml:_ReferenceSystem">
         <xsl:call-template name="gml:_ReferenceSystem_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CRS">
         <xsl:call-template name="gml:_CRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:CRSRefType_Template">
      <xsl:for-each select="./gml:_CRS">
         <xsl:call-template name="gml:_CRS_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Substitution"/>
      </xsl:for-each>
      <xsl:call-template name="gml:AssociationAttributeGroup_Template"/>
   </xsl:template>
   <xsl:template name="gml:IdentifierType_Template">
      <xsl:for-each select="./gml:name">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:csName">
         <xsl:call-template name="gml:csName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:meridianName">
         <xsl:call-template name="gml:meridianName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ellipsoidName">
         <xsl:call-template name="gml:ellipsoidName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodName">
         <xsl:call-template name="gml:methodName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:parameterName">
         <xsl:call-template name="gml:parameterName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:groupName">
         <xsl:call-template name="gml:groupName_Substitution"/>
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
      <xsl:for-each select="./gml:_Datum">
         <xsl:call-template name="gml:_Datum_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringDatum">
         <xsl:call-template name="gml:EngineeringDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageDatum">
         <xsl:call-template name="gml:ImageDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalDatum">
         <xsl:call-template name="gml:VerticalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalDatum">
         <xsl:call-template name="gml:TemporalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeodeticDatum">
         <xsl:call-template name="gml:GeodeticDatum_Substitution"/>
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
      <xsl:for-each select="./gml:_positionalAccuracy">
         <xsl:call-template name="gml:_positionalAccuracy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:absoluteExternalPositionalAccuracy">
         <xsl:call-template name="gml:absoluteExternalPositionalAccuracy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:relativeInternalPositionalAccuracy">
         <xsl:call-template name="gml:relativeInternalPositionalAccuracy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:covarianceMatrix">
         <xsl:call-template name="gml:covarianceMatrix_Substitution"/>
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
      <xsl:for-each select="./gml:_CoordinateOperation">
         <xsl:call-template name="gml:_CoordinateOperation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConcatenatedOperation">
         <xsl:call-template name="gml:ConcatenatedOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_SingleOperation">
         <xsl:call-template name="gml:_SingleOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
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
      <xsl:for-each select="./gml:_SingleOperation">
         <xsl:call-template name="gml:_SingleOperation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
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
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
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
      <xsl:for-each select="./gml:_positionalAccuracy">
         <xsl:call-template name="gml:_positionalAccuracy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:absoluteExternalPositionalAccuracy">
         <xsl:call-template name="gml:absoluteExternalPositionalAccuracy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:relativeInternalPositionalAccuracy">
         <xsl:call-template name="gml:relativeInternalPositionalAccuracy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:covarianceMatrix">
         <xsl:call-template name="gml:covarianceMatrix_Substitution"/>
      </xsl:for-each>
      <xsl:if test="@gml:id">
         <xsl:call-template name="gml:id_Property"/>
      </xsl:if>
      <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
   </xsl:template>
   <xsl:template name="gml:GeneralConversionRefType_Template">
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
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
      <xsl:for-each select="./gml:_positionalAccuracy">
         <xsl:call-template name="gml:_positionalAccuracy_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:absoluteExternalPositionalAccuracy">
         <xsl:call-template name="gml:absoluteExternalPositionalAccuracy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:relativeInternalPositionalAccuracy">
         <xsl:call-template name="gml:relativeInternalPositionalAccuracy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:covarianceMatrix">
         <xsl:call-template name="gml:covarianceMatrix_Substitution"/>
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
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
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
      <xsl:for-each select="./gml:_GeneralOperationParameter">
         <xsl:call-template name="gml:_GeneralOperationParameter_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameter">
         <xsl:call-template name="gml:OperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameterGroup">
         <xsl:call-template name="gml:OperationParameterGroup_Substitution"/>
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
   <xsl:template name="gml:TargetPropertyType_Template">
      <xsl:for-each select="./gml:_Feature">
         <xsl:call-template name="gml:_Feature_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_FeatureCollection">
         <xsl:call-template name="gml:_FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:CityModel">
         <xsl:call-template name="core:CityModel_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureCollection">
         <xsl:call-template name="gml:FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Coverage">
         <xsl:call-template name="gml:_Coverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ContinuousCoverage">
         <xsl:call-template name="gml:_ContinuousCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_DiscreteCoverage">
         <xsl:call-template name="gml:_DiscreteCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPointCoverage">
         <xsl:call-template name="gml:MultiPointCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurveCoverage">
         <xsl:call-template name="gml:MultiCurveCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurfaceCoverage">
         <xsl:call-template name="gml:MultiSurfaceCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolidCoverage">
         <xsl:call-template name="gml:MultiSolidCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridCoverage">
         <xsl:call-template name="gml:GridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Observation">
         <xsl:call-template name="gml:Observation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservation">
         <xsl:call-template name="gml:DirectedObservation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservationAtDistance">
         <xsl:call-template name="gml:DirectedObservationAtDistance_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
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
      <xsl:for-each select="./gml:target">
         <xsl:call-template name="gml:target_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:subject">
         <xsl:call-template name="gml:subject_Substitution"/>
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
   <xsl:template name="gml:DefaultStylePropertyType_Template">
      <xsl:for-each select="./gml:_Style">
         <xsl:call-template name="gml:_Style_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Style">
         <xsl:call-template name="gml:Style_Substitution"/>
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
      <xsl:for-each select="./gml:_TimeTopologyPrimitive">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Substitution"/>
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
   <xsl:template name="gml:direction_Template"/>
   <xsl:template name="_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   <xsl:call-template name="gml:SignType_Template"/>
   </xsl:template>
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
   <xsl:template name="gml:relativePosition_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template name="gml:TimeUnitType_Template"/>
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
   <xsl:template name="gml:isSphere_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
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
   <xsl:template name="gml:SuccessionType_Template">
      <xs:hasstring>
         <xsl:value-of select="text()"/>
      </xs:hasstring>
   </xsl:template>
   <xsl:template match="//core:CityModel">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:CityModel"/>
         <xsl:call-template name="core:CityModelType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:CityModel_Substitution">
      <core:CityModel rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:cityObjectMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:cityObjectMember"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:cityObjectMember_Substitution">
      <core:cityObjectMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:_CityObject">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:_CityObject"/>
         <xsl:call-template name="core:AbstractCityObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:_CityObject_Substitution">
      <core:_CityObject rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:_Site">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:_Site"/>
         <xsl:call-template name="core:AbstractSiteType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:_Site_Substitution">
      <core:_Site rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:Address">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:Address"/>
         <xsl:call-template name="core:AddressType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:Address_Substitution">
      <core:Address rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:ImplicitGeometry">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="core:ImplicitGeometry"/>
         <xsl:call-template name="core:ImplicitGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:ImplicitGeometry_Substitution">
      <core:ImplicitGeometry rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:_AbstractBuilding">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:_AbstractBuilding"/>
         <xsl:call-template name="bldg:AbstractBuildingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_AbstractBuilding_Substitution">
      <bldg:_AbstractBuilding rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:Building">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Building"/>
         <xsl:call-template name="bldg:BuildingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:Building_Substitution">
      <bldg:Building rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:BuildingPart">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:BuildingPart"/>
         <xsl:call-template name="bldg:BuildingPartType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:BuildingPart_Substitution">
      <bldg:BuildingPart rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:BuildingInstallation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:BuildingInstallation"/>
         <xsl:call-template name="bldg:BuildingInstallationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:BuildingInstallation_Substitution">
      <bldg:BuildingInstallation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:IntBuildingInstallation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:IntBuildingInstallation"/>
         <xsl:call-template name="bldg:IntBuildingInstallationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:IntBuildingInstallation_Substitution">
      <bldg:IntBuildingInstallation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:_BoundarySurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:_BoundarySurface"/>
         <xsl:call-template name="bldg:AbstractBoundarySurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_BoundarySurface_Substitution">
      <bldg:_BoundarySurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:RoofSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:RoofSurface"/>
         <xsl:call-template name="bldg:RoofSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:RoofSurface_Substitution">
      <bldg:RoofSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:WallSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:WallSurface"/>
         <xsl:call-template name="bldg:WallSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:WallSurface_Substitution">
      <bldg:WallSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:GroundSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:GroundSurface"/>
         <xsl:call-template name="bldg:GroundSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:GroundSurface_Substitution">
      <bldg:GroundSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:ClosureSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:ClosureSurface"/>
         <xsl:call-template name="bldg:ClosureSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:ClosureSurface_Substitution">
      <bldg:ClosureSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:FloorSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:FloorSurface"/>
         <xsl:call-template name="bldg:FloorSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:FloorSurface_Substitution">
      <bldg:FloorSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:OuterFloorSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:OuterFloorSurface"/>
         <xsl:call-template name="bldg:OuterFloorSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:OuterFloorSurface_Substitution">
      <bldg:OuterFloorSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:InteriorWallSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:InteriorWallSurface"/>
         <xsl:call-template name="bldg:InteriorWallSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:InteriorWallSurface_Substitution">
      <bldg:InteriorWallSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:CeilingSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:CeilingSurface"/>
         <xsl:call-template name="bldg:CeilingSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:CeilingSurface_Substitution">
      <bldg:CeilingSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:OuterCeilingSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:OuterCeilingSurface"/>
         <xsl:call-template name="bldg:OuterCeilingSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:OuterCeilingSurface_Substitution">
      <bldg:OuterCeilingSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:_Opening">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:_Opening"/>
         <xsl:call-template name="bldg:AbstractOpeningType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_Opening_Substitution">
      <bldg:_Opening rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:Window">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Window"/>
         <xsl:call-template name="bldg:WindowType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:Window_Substitution">
      <bldg:Window rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:Door">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Door"/>
         <xsl:call-template name="bldg:DoorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:Door_Substitution">
      <bldg:Door rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:Room">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:Room"/>
         <xsl:call-template name="bldg:RoomType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:Room_Substitution">
      <bldg:Room rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:BuildingFurniture">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:BuildingFurniture"/>
         <xsl:call-template name="bldg:BuildingFurnitureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:BuildingFurniture_Substitution">
      <bldg:BuildingFurniture rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:dataSource">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dataSource"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:dataSource_Substitution">
      <gml:dataSource rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:status">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:status"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:status_Substitution">
      <gml:status rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimeSlice">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeSlice"/>
         <xsl:call-template name="gml:AbstractTimeSliceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimeSlice_Substitution">
      <gml:_TimeSlice rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MovingObjectStatus">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MovingObjectStatus"/>
         <xsl:call-template name="gml:MovingObjectStatusType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MovingObjectStatus_Substitution">
      <gml:MovingObjectStatus rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:history">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:history"/>
         <xsl:call-template name="gml:HistoryPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:history_Substitution">
      <gml:history rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:track">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:track"/>
         <xsl:call-template name="gml:TrackType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:track_Substitution">
      <gml:track rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Feature">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Feature"/>
         <xsl:call-template name="gml:AbstractFeatureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Feature_Substitution">
      <gml:_Feature rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:boundedBy">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:boundedBy"/>
         <xsl:call-template name="gml:BoundingShapeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:boundedBy_Substitution">
      <gml:boundedBy rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:EnvelopeWithTimePeriod">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EnvelopeWithTimePeriod"/>
         <xsl:call-template name="gml:EnvelopeWithTimePeriodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:EnvelopeWithTimePeriod_Substitution">
      <gml:EnvelopeWithTimePeriod rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:featureMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureMember"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:featureMember_Substitution">
      <gml:featureMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:featureProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureProperty"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:featureProperty_Substitution">
      <gml:featureProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:featureMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureMembers"/>
         <xsl:call-template name="gml:FeatureArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:featureMembers_Substitution">
      <gml:featureMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_FeatureCollection">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_FeatureCollection"/>
         <xsl:call-template name="gml:AbstractFeatureCollectionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_FeatureCollection_Substitution">
      <gml:_FeatureCollection rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:FeatureCollection">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:FeatureCollection"/>
         <xsl:call-template name="gml:FeatureCollectionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:FeatureCollection_Substitution">
      <gml:FeatureCollection rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LocationKeyWord">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LocationKeyWord"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LocationKeyWord_Substitution">
      <gml:LocationKeyWord rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LocationString">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LocationString"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LocationString_Substitution">
      <gml:LocationString rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:centerOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:centerOf"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:centerOf_Substitution">
      <gml:centerOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:position">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:position"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:position_Substitution">
      <gml:position rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:edgeOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:edgeOf"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:edgeOf_Substitution">
      <gml:edgeOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:centerLineOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:centerLineOf"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:centerLineOf_Substitution">
      <gml:centerLineOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:extentOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:extentOf"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:extentOf_Substitution">
      <gml:extentOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:location">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:location"/>
         <xsl:call-template name="gml:LocationPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:location_Substitution">
      <gml:location rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:priorityLocation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:priorityLocation"/>
         <xsl:call-template name="gml:PriorityLocationPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:priorityLocation_Substitution">
      <gml:priorityLocation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Surface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Surface"/>
         <xsl:call-template name="gml:AbstractSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Surface_Substitution">
      <gml:_Surface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:surfaceProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceProperty"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:surfaceProperty_Substitution">
      <gml:surfaceProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:surfaceArrayProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceArrayProperty"/>
         <xsl:call-template name="gml:SurfaceArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:surfaceArrayProperty_Substitution">
      <gml:surfaceArrayProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Polygon">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Polygon"/>
         <xsl:call-template name="gml:PolygonType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Polygon_Substitution">
      <gml:Polygon rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Ring">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Ring"/>
         <xsl:call-template name="gml:AbstractRingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Ring_Substitution">
      <gml:_Ring rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:exterior">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:exterior"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:exterior_Substitution">
      <gml:exterior rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:interior">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:interior"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:interior_Substitution">
      <gml:interior rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:outerBoundaryIs">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:outerBoundaryIs"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:outerBoundaryIs_Substitution">
      <gml:outerBoundaryIs rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:innerBoundaryIs">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:innerBoundaryIs"/>
         <xsl:call-template name="gml:AbstractRingPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:innerBoundaryIs_Substitution">
      <gml:innerBoundaryIs rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LinearRing">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LinearRing"/>
         <xsl:call-template name="gml:LinearRingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LinearRing_Substitution">
      <gml:LinearRing rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:polygonProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polygonProperty"/>
         <xsl:call-template name="gml:PolygonPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:polygonProperty_Substitution">
      <gml:polygonProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Geometry">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Geometry"/>
         <xsl:call-template name="gml:AbstractGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Geometry_Substitution">
      <gml:_Geometry rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GeometricPrimitive">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeometricPrimitive"/>
         <xsl:call-template name="gml:AbstractGeometricPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GeometricPrimitive_Substitution">
      <gml:_GeometricPrimitive rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Point">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Point"/>
         <xsl:call-template name="gml:PointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Point_Substitution">
      <gml:Point rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pointProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointProperty"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pointProperty_Substitution">
      <gml:pointProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pointRep">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointRep"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pointRep_Substitution">
      <gml:pointRep rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pointArrayProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointArrayProperty"/>
         <xsl:call-template name="gml:PointArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pointArrayProperty_Substitution">
      <gml:pointArrayProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Curve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Curve"/>
         <xsl:call-template name="gml:AbstractCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Curve_Substitution">
      <gml:_Curve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:curveProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveProperty"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:curveProperty_Substitution">
      <gml:curveProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:curveArrayProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveArrayProperty"/>
         <xsl:call-template name="gml:CurveArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:curveArrayProperty_Substitution">
      <gml:curveArrayProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LineString">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LineString"/>
         <xsl:call-template name="gml:LineStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LineString_Substitution">
      <gml:LineString rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pos">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pos"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pos_Substitution">
      <gml:pos rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:posList">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:posList"/>
         <xsl:call-template name="gml:DirectPositionListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:posList_Substitution">
      <gml:posList rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:vector">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:vector"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:vector_Substitution">
      <gml:vector rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinates">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinates"/>
         <xsl:call-template name="gml:CoordinatesType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinates_Substitution">
      <gml:coordinates rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Envelope">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Envelope"/>
         <xsl:call-template name="gml:EnvelopeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Envelope_Substitution">
      <gml:Envelope rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coord">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coord"/>
         <xsl:call-template name="gml:CoordType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coord_Substitution">
      <gml:coord rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:lineStringProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:lineStringProperty"/>
         <xsl:call-template name="gml:LineStringPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:lineStringProperty_Substitution">
      <gml:lineStringProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:measure">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:measure"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:measure_Substitution">
      <gml:measure rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:angle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:angle"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:angle_Substitution">
      <gml:angle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:dmsAngle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dmsAngle"/>
         <xsl:call-template name="gml:DMSAngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:dmsAngle_Substitution">
      <gml:dmsAngle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:degrees">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:degrees"/>
         <xsl:call-template name="gml:DegreesType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:degrees_Substitution">
      <gml:degrees rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:unitOfMeasure">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:unitOfMeasure"/>
         <xsl:call-template name="gml:UnitOfMeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:unitOfMeasure_Substitution">
      <gml:unitOfMeasure rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:UnitDefinition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:UnitDefinition"/>
         <xsl:call-template name="gml:UnitDefinitionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:UnitDefinition_Substitution">
      <gml:UnitDefinition rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:BaseUnit">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:BaseUnit"/>
         <xsl:call-template name="gml:BaseUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:BaseUnit_Substitution">
      <gml:BaseUnit rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DerivedUnit">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DerivedUnit"/>
         <xsl:call-template name="gml:DerivedUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DerivedUnit_Substitution">
      <gml:DerivedUnit rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ConventionalUnit">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ConventionalUnit"/>
         <xsl:call-template name="gml:ConventionalUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ConventionalUnit_Substitution">
      <gml:ConventionalUnit rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:quantityType">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:quantityType"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:quantityType_Substitution">
      <gml:quantityType rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:catalogSymbol">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:catalogSymbol"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:catalogSymbol_Substitution">
      <gml:catalogSymbol rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:derivationUnitTerm">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:derivationUnitTerm"/>
         <xsl:call-template name="gml:DerivationUnitTermType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:derivationUnitTerm_Substitution">
      <gml:derivationUnitTerm rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:conversionToPreferredUnit">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:conversionToPreferredUnit"/>
         <xsl:call-template name="gml:ConversionToPreferredUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:conversionToPreferredUnit_Substitution">
      <gml:conversionToPreferredUnit rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:roughConversionToPreferredUnit">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:roughConversionToPreferredUnit"/>
         <xsl:call-template name="gml:ConversionToPreferredUnitType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:roughConversionToPreferredUnit_Substitution">
      <gml:roughConversionToPreferredUnit rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Definition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Definition"/>
         <xsl:call-template name="gml:DefinitionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Definition_Substitution">
      <gml:Definition rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Dictionary">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Dictionary"/>
         <xsl:call-template name="gml:DictionaryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Dictionary_Substitution">
      <gml:Dictionary rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DefinitionCollection">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DefinitionCollection"/>
         <xsl:call-template name="gml:DictionaryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DefinitionCollection_Substitution">
      <gml:DefinitionCollection rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:dictionaryEntry">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dictionaryEntry"/>
         <xsl:call-template name="gml:DictionaryEntryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:dictionaryEntry_Substitution">
      <gml:dictionaryEntry rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:definitionMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:definitionMember"/>
         <xsl:call-template name="gml:DictionaryEntryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:definitionMember_Substitution">
      <gml:definitionMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:indirectEntry">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:indirectEntry"/>
         <xsl:call-template name="gml:IndirectEntryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:indirectEntry_Substitution">
      <gml:indirectEntry rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DefinitionProxy">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DefinitionProxy"/>
         <xsl:call-template name="gml:DefinitionProxyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DefinitionProxy_Substitution">
      <gml:DefinitionProxy rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:definitionRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:definitionRef"/>
         <xsl:call-template name="gml:ReferenceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:definitionRef_Substitution">
      <gml:definitionRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GML">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GML"/>
         <xsl:call-template name="gml:AbstractGMLType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GML_Substitution">
      <gml:_GML rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Bag">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Bag"/>
         <xsl:call-template name="gml:BagType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Bag_Substitution">
      <gml:Bag rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Array">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Array"/>
         <xsl:call-template name="gml:ArrayType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Array_Substitution">
      <gml:Array rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_MetaData">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_MetaData"/>
         <xsl:call-template name="gml:AbstractMetaDataType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_MetaData_Substitution">
      <gml:_MetaData rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GenericMetaData">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GenericMetaData"/>
         <xsl:call-template name="gml:GenericMetaDataType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GenericMetaData_Substitution">
      <gml:GenericMetaData rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_association">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_association"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_association_Substitution">
      <gml:_association rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_strictAssociation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_strictAssociation"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_strictAssociation_Substitution">
      <gml:_strictAssociation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:member">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:member"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:member_Substitution">
      <gml:member rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_reference">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_reference"/>
         <xsl:call-template name="gml:ReferenceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_reference_Substitution">
      <gml:_reference rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:members">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:members"/>
         <xsl:call-template name="gml:ArrayAssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:members_Substitution">
      <gml:members rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:metaDataProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:metaDataProperty"/>
         <xsl:call-template name="gml:MetaDataPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:metaDataProperty_Substitution">
      <gml:metaDataProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:name">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:name"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:name_Substitution">
      <gml:name rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:description">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:description"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:description_Substitution">
      <gml:description rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimeObject">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeObject"/>
         <xsl:call-template name="gml:AbstractTimeObjectType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimeObject_Substitution">
      <gml:_TimeObject rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimePrimitive">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimePrimitive"/>
         <xsl:call-template name="gml:AbstractTimePrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimePrimitive_Substitution">
      <gml:_TimePrimitive rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimeComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeComplex"/>
         <xsl:call-template name="gml:AbstractTimeComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimeComplex_Substitution">
      <gml:_TimeComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimeGeometricPrimitive">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeGeometricPrimitive"/>
         <xsl:call-template name="gml:AbstractTimeGeometricPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimeGeometricPrimitive_Substitution">
      <gml:_TimeGeometricPrimitive rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeInstant">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeInstant"/>
         <xsl:call-template name="gml:TimeInstantType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeInstant_Substitution">
      <gml:TimeInstant rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimePeriod">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimePeriod"/>
         <xsl:call-template name="gml:TimePeriodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimePeriod_Substitution">
      <gml:TimePeriod rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:timeInterval">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:timeInterval"/>
         <xsl:call-template name="gml:TimeIntervalLengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:timeInterval_Substitution">
      <gml:timeInterval rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:timePosition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:timePosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:timePosition_Substitution">
      <gml:timePosition rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:validTime">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:validTime"/>
         <xsl:call-template name="gml:TimePrimitivePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:validTime_Substitution">
      <gml:validTime rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:direction">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:direction"/>
         <xsl:call-template name="gml:DirectionPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:direction_Substitution">
      <gml:direction rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectionVector">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectionVector"/>
         <xsl:call-template name="gml:DirectionVectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DirectionVector_Substitution">
      <gml:DirectionVector rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Topology">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Topology"/>
         <xsl:call-template name="gml:AbstractTopologyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Topology_Substitution">
      <gml:_Topology rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TopoPrimitive">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TopoPrimitive"/>
         <xsl:call-template name="gml:AbstractTopoPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TopoPrimitive_Substitution">
      <gml:_TopoPrimitive rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:isolated">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:isolated"/>
         <xsl:call-template name="gml:IsolatedPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:isolated_Substitution">
      <gml:isolated rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:container">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:container"/>
         <xsl:call-template name="gml:ContainerPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:container_Substitution">
      <gml:container rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Node">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Node"/>
         <xsl:call-template name="gml:NodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Node_Substitution">
      <gml:Node rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:directedNode">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedNode"/>
         <xsl:call-template name="gml:DirectedNodePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:directedNode_Substitution">
      <gml:directedNode rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Edge">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Edge"/>
         <xsl:call-template name="gml:EdgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Edge_Substitution">
      <gml:Edge rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:directedEdge">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedEdge"/>
         <xsl:call-template name="gml:DirectedEdgePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:directedEdge_Substitution">
      <gml:directedEdge rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Face">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Face"/>
         <xsl:call-template name="gml:FaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Face_Substitution">
      <gml:Face rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:directedFace">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedFace"/>
         <xsl:call-template name="gml:DirectedFacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:directedFace_Substitution">
      <gml:directedFace rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopoSolid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoSolid"/>
         <xsl:call-template name="gml:TopoSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopoSolid_Substitution">
      <gml:TopoSolid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:directedTopoSolid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:directedTopoSolid"/>
         <xsl:call-template name="gml:DirectedTopoSolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:directedTopoSolid_Substitution">
      <gml:directedTopoSolid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopoPoint">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoPoint"/>
         <xsl:call-template name="gml:TopoPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopoPoint_Substitution">
      <gml:TopoPoint rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoPointProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoPointProperty"/>
         <xsl:call-template name="gml:TopoPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoPointProperty_Substitution">
      <gml:topoPointProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopoCurve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoCurve"/>
         <xsl:call-template name="gml:TopoCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopoCurve_Substitution">
      <gml:TopoCurve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoCurveProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoCurveProperty"/>
         <xsl:call-template name="gml:TopoCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoCurveProperty_Substitution">
      <gml:topoCurveProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopoSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoSurface"/>
         <xsl:call-template name="gml:TopoSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopoSurface_Substitution">
      <gml:TopoSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoSurfaceProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoSurfaceProperty"/>
         <xsl:call-template name="gml:TopoSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoSurfaceProperty_Substitution">
      <gml:topoSurfaceProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopoVolume">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoVolume"/>
         <xsl:call-template name="gml:TopoVolumeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopoVolume_Substitution">
      <gml:TopoVolume rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoVolumeProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoVolumeProperty"/>
         <xsl:call-template name="gml:TopoVolumePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoVolumeProperty_Substitution">
      <gml:topoVolumeProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopoComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopoComplex"/>
         <xsl:call-template name="gml:TopoComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopoComplex_Substitution">
      <gml:TopoComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoComplexProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoComplexProperty"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoComplexProperty_Substitution">
      <gml:topoComplexProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:subComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:subComplex"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:subComplex_Substitution">
      <gml:subComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:superComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:superComplex"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:superComplex_Substitution">
      <gml:superComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:maximalComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:maximalComplex"/>
         <xsl:call-template name="gml:TopoComplexMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:maximalComplex_Substitution">
      <gml:maximalComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoPrimitiveMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoPrimitiveMember"/>
         <xsl:call-template name="gml:TopoPrimitiveMemberType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoPrimitiveMember_Substitution">
      <gml:topoPrimitiveMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topoPrimitiveMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topoPrimitiveMembers"/>
         <xsl:call-template name="gml:TopoPrimitiveArrayAssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topoPrimitiveMembers_Substitution">
      <gml:topoPrimitiveMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CompositeCurve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeCurve"/>
         <xsl:call-template name="gml:CompositeCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CompositeCurve_Substitution">
      <gml:CompositeCurve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CompositeSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeSurface"/>
         <xsl:call-template name="gml:CompositeSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CompositeSurface_Substitution">
      <gml:CompositeSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CompositeSolid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeSolid"/>
         <xsl:call-template name="gml:CompositeSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CompositeSolid_Substitution">
      <gml:CompositeSolid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GeometricComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeometricComplex"/>
         <xsl:call-template name="gml:GeometricComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GeometricComplex_Substitution">
      <gml:GeometricComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GeometricAggregate">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeometricAggregate"/>
         <xsl:call-template name="gml:AbstractGeometricAggregateType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GeometricAggregate_Substitution">
      <gml:_GeometricAggregate rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiGeometry">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiGeometry"/>
         <xsl:call-template name="gml:MultiGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiGeometry_Substitution">
      <gml:MultiGeometry rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiGeometryProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiGeometryProperty"/>
         <xsl:call-template name="gml:MultiGeometryPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiGeometryProperty_Substitution">
      <gml:multiGeometryProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiPoint">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiPoint"/>
         <xsl:call-template name="gml:MultiPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiPoint_Substitution">
      <gml:MultiPoint rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiPointProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiPointProperty"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiPointProperty_Substitution">
      <gml:multiPointProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiCurve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiCurve"/>
         <xsl:call-template name="gml:MultiCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiCurve_Substitution">
      <gml:MultiCurve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiCurveProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCurveProperty"/>
         <xsl:call-template name="gml:MultiCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiCurveProperty_Substitution">
      <gml:multiCurveProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSurface"/>
         <xsl:call-template name="gml:MultiSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiSurface_Substitution">
      <gml:MultiSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiSurfaceProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSurfaceProperty"/>
         <xsl:call-template name="gml:MultiSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiSurfaceProperty_Substitution">
      <gml:multiSurfaceProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiSolid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSolid"/>
         <xsl:call-template name="gml:MultiSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiSolid_Substitution">
      <gml:MultiSolid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiSolidProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSolidProperty"/>
         <xsl:call-template name="gml:MultiSolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiSolidProperty_Substitution">
      <gml:multiSolidProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiPolygon">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiPolygon"/>
         <xsl:call-template name="gml:MultiPolygonType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiPolygon_Substitution">
      <gml:MultiPolygon rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiLineString">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiLineString"/>
         <xsl:call-template name="gml:MultiLineStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiLineString_Substitution">
      <gml:MultiLineString rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:geometryMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geometryMember"/>
         <xsl:call-template name="gml:GeometryPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geometryMember_Substitution">
      <gml:geometryMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:geometryMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geometryMembers"/>
         <xsl:call-template name="gml:GeometryArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geometryMembers_Substitution">
      <gml:geometryMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pointMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointMember"/>
         <xsl:call-template name="gml:PointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pointMember_Substitution">
      <gml:pointMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pointMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pointMembers"/>
         <xsl:call-template name="gml:PointArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pointMembers_Substitution">
      <gml:pointMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:curveMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveMembers"/>
         <xsl:call-template name="gml:CurveArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:curveMembers_Substitution">
      <gml:curveMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:surfaceMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceMember"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:surfaceMember_Substitution">
      <gml:surfaceMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:surfaceMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:surfaceMembers"/>
         <xsl:call-template name="gml:SurfaceArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:surfaceMembers_Substitution">
      <gml:surfaceMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:solidMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidMember"/>
         <xsl:call-template name="gml:SolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:solidMember_Substitution">
      <gml:solidMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:solidMembers">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidMembers"/>
         <xsl:call-template name="gml:SolidArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:solidMembers_Substitution">
      <gml:solidMembers rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiCenterOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCenterOf"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiCenterOf_Substitution">
      <gml:multiCenterOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiPosition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiPosition"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiPosition_Substitution">
      <gml:multiPosition rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiCenterLineOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCenterLineOf"/>
         <xsl:call-template name="gml:MultiCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiCenterLineOf_Substitution">
      <gml:multiCenterLineOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiEdgeOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiEdgeOf"/>
         <xsl:call-template name="gml:MultiCurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiEdgeOf_Substitution">
      <gml:multiEdgeOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCoverage"/>
         <xsl:call-template name="gml:MultiSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiCoverage_Substitution">
      <gml:multiCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiExtentOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiExtentOf"/>
         <xsl:call-template name="gml:MultiSurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiExtentOf_Substitution">
      <gml:multiExtentOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiLocation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiLocation"/>
         <xsl:call-template name="gml:MultiPointPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiLocation_Substitution">
      <gml:multiLocation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:lineStringMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:lineStringMember"/>
         <xsl:call-template name="gml:LineStringPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:lineStringMember_Substitution">
      <gml:lineStringMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:polygonMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polygonMember"/>
         <xsl:call-template name="gml:PolygonPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:polygonMember_Substitution">
      <gml:polygonMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Curve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Curve"/>
         <xsl:call-template name="gml:CurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Curve_Substitution">
      <gml:Curve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:baseCurve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:baseCurve"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:baseCurve_Substitution">
      <gml:baseCurve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:OrientableCurve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OrientableCurve"/>
         <xsl:call-template name="gml:OrientableCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:OrientableCurve_Substitution">
      <gml:OrientableCurve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_CurveSegment">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CurveSegment"/>
         <xsl:call-template name="gml:AbstractCurveSegmentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_CurveSegment_Substitution">
      <gml:_CurveSegment rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:segments">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:segments"/>
         <xsl:call-template name="gml:CurveSegmentArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:segments_Substitution">
      <gml:segments rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LineStringSegment">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LineStringSegment"/>
         <xsl:call-template name="gml:LineStringSegmentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LineStringSegment_Substitution">
      <gml:LineStringSegment rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ArcString">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcString"/>
         <xsl:call-template name="gml:ArcStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ArcString_Substitution">
      <gml:ArcString rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Arc">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Arc"/>
         <xsl:call-template name="gml:ArcType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Arc_Substitution">
      <gml:Arc rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Circle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Circle"/>
         <xsl:call-template name="gml:CircleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Circle_Substitution">
      <gml:Circle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ArcStringByBulge">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcStringByBulge"/>
         <xsl:call-template name="gml:ArcStringByBulgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ArcStringByBulge_Substitution">
      <gml:ArcStringByBulge rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ArcByBulge">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcByBulge"/>
         <xsl:call-template name="gml:ArcByBulgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ArcByBulge_Substitution">
      <gml:ArcByBulge rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ArcByCenterPoint">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ArcByCenterPoint"/>
         <xsl:call-template name="gml:ArcByCenterPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ArcByCenterPoint_Substitution">
      <gml:ArcByCenterPoint rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CircleByCenterPoint">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CircleByCenterPoint"/>
         <xsl:call-template name="gml:CircleByCenterPointType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CircleByCenterPoint_Substitution">
      <gml:CircleByCenterPoint rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:OffsetCurve">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OffsetCurve"/>
         <xsl:call-template name="gml:OffsetCurveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:OffsetCurve_Substitution">
      <gml:OffsetCurve rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:AffinePlacement">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:AffinePlacement"/>
         <xsl:call-template name="gml:AffinePlacementType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:AffinePlacement_Substitution">
      <gml:AffinePlacement rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Clothoid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Clothoid"/>
         <xsl:call-template name="gml:ClothoidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Clothoid_Substitution">
      <gml:Clothoid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GeodesicString">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeodesicString"/>
         <xsl:call-template name="gml:GeodesicStringType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GeodesicString_Substitution">
      <gml:GeodesicString rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Geodesic">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Geodesic"/>
         <xsl:call-template name="gml:GeodesicType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Geodesic_Substitution">
      <gml:Geodesic rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CubicSpline">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CubicSpline"/>
         <xsl:call-template name="gml:CubicSplineType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CubicSpline_Substitution">
      <gml:CubicSpline rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:BSpline">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:BSpline"/>
         <xsl:call-template name="gml:BSplineType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:BSpline_Substitution">
      <gml:BSpline rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Bezier">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Bezier"/>
         <xsl:call-template name="gml:BezierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Bezier_Substitution">
      <gml:Bezier rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Surface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Surface"/>
         <xsl:call-template name="gml:SurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Surface_Substitution">
      <gml:Surface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:baseSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:baseSurface"/>
         <xsl:call-template name="gml:SurfacePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:baseSurface_Substitution">
      <gml:baseSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:OrientableSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OrientableSurface"/>
         <xsl:call-template name="gml:OrientableSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:OrientableSurface_Substitution">
      <gml:OrientableSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_SurfacePatch">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_SurfacePatch"/>
         <xsl:call-template name="gml:AbstractSurfacePatchType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_SurfacePatch_Substitution">
      <gml:_SurfacePatch rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:patches">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:patches"/>
         <xsl:call-template name="gml:SurfacePatchArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:patches_Substitution">
      <gml:patches rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:PolygonPatch">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PolygonPatch"/>
         <xsl:call-template name="gml:PolygonPatchType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:PolygonPatch_Substitution">
      <gml:PolygonPatch rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Triangle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Triangle"/>
         <xsl:call-template name="gml:TriangleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Triangle_Substitution">
      <gml:Triangle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Rectangle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Rectangle"/>
         <xsl:call-template name="gml:RectangleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Rectangle_Substitution">
      <gml:Rectangle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:curveMember">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:curveMember"/>
         <xsl:call-template name="gml:CurvePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:curveMember_Substitution">
      <gml:curveMember rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Ring">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Ring"/>
         <xsl:call-template name="gml:RingType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Ring_Substitution">
      <gml:Ring rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_ParametricCurveSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ParametricCurveSurface"/>
         <xsl:call-template name="gml:AbstractParametricCurveSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_ParametricCurveSurface_Substitution">
      <gml:_ParametricCurveSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GriddedSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GriddedSurface"/>
         <xsl:call-template name="gml:AbstractGriddedSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GriddedSurface_Substitution">
      <gml:_GriddedSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Cone">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Cone"/>
         <xsl:call-template name="gml:ConeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Cone_Substitution">
      <gml:Cone rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Cylinder">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Cylinder"/>
         <xsl:call-template name="gml:CylinderType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Cylinder_Substitution">
      <gml:Cylinder rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Sphere">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Sphere"/>
         <xsl:call-template name="gml:SphereType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Sphere_Substitution">
      <gml:Sphere rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:PolyhedralSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PolyhedralSurface"/>
         <xsl:call-template name="gml:PolyhedralSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:PolyhedralSurface_Substitution">
      <gml:PolyhedralSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:polygonPatches">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polygonPatches"/>
         <xsl:call-template name="gml:PolygonPatchArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:polygonPatches_Substitution">
      <gml:polygonPatches rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:trianglePatches">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:trianglePatches"/>
         <xsl:call-template name="gml:TrianglePatchArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:trianglePatches_Substitution">
      <gml:trianglePatches rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TriangulatedSurface">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TriangulatedSurface"/>
         <xsl:call-template name="gml:TriangulatedSurfaceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TriangulatedSurface_Substitution">
      <gml:TriangulatedSurface rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Tin">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Tin"/>
         <xsl:call-template name="gml:TinType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Tin_Substitution">
      <gml:Tin rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Solid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Solid"/>
         <xsl:call-template name="gml:AbstractSolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Solid_Substitution">
      <gml:_Solid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:solidProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidProperty"/>
         <xsl:call-template name="gml:SolidPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:solidProperty_Substitution">
      <gml:solidProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:solidArrayProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:solidArrayProperty"/>
         <xsl:call-template name="gml:SolidArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:solidArrayProperty_Substitution">
      <gml:solidArrayProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Solid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Solid"/>
         <xsl:call-template name="gml:SolidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Solid_Substitution">
      <gml:Solid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Coverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Coverage"/>
         <xsl:call-template name="gml:AbstractCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Coverage_Substitution">
      <gml:_Coverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_ContinuousCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ContinuousCoverage"/>
         <xsl:call-template name="gml:AbstractContinuousCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_ContinuousCoverage_Substitution">
      <gml:_ContinuousCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_DiscreteCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_DiscreteCoverage"/>
         <xsl:call-template name="gml:AbstractDiscreteCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_DiscreteCoverage_Substitution">
      <gml:_DiscreteCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:domainSet">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:domainSet"/>
         <xsl:call-template name="gml:DomainSetType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:domainSet_Substitution">
      <gml:domainSet rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:rangeSet">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:rangeSet"/>
         <xsl:call-template name="gml:RangeSetType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:rangeSet_Substitution">
      <gml:rangeSet rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coverageFunction">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coverageFunction"/>
         <xsl:call-template name="gml:CoverageFunctionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coverageFunction_Substitution">
      <gml:coverageFunction rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DataBlock">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DataBlock"/>
         <xsl:call-template name="gml:DataBlockType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DataBlock_Substitution">
      <gml:DataBlock rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:tupleList">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:tupleList"/>
         <xsl:call-template name="gml:CoordinatesType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:tupleList_Substitution">
      <gml:tupleList rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:File">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:File"/>
         <xsl:call-template name="gml:FileType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:File_Substitution">
      <gml:File rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:rangeParameters">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:rangeParameters"/>
         <xsl:call-template name="gml:RangeParametersType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:rangeParameters_Substitution">
      <gml:rangeParameters rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MappingRule">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MappingRule"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MappingRule_Substitution">
      <gml:MappingRule rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GridFunction">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GridFunction"/>
         <xsl:call-template name="gml:GridFunctionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GridFunction_Substitution">
      <gml:GridFunction rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:IndexMap">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:IndexMap"/>
         <xsl:call-template name="gml:IndexMapType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:IndexMap_Substitution">
      <gml:IndexMap rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiPointCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiPointCoverage"/>
         <xsl:call-template name="gml:MultiPointCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiPointCoverage_Substitution">
      <gml:MultiPointCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiPointDomain">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiPointDomain"/>
         <xsl:call-template name="gml:MultiPointDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiPointDomain_Substitution">
      <gml:multiPointDomain rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiCurveCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiCurveCoverage"/>
         <xsl:call-template name="gml:MultiCurveCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiCurveCoverage_Substitution">
      <gml:MultiCurveCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiCurveDomain">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiCurveDomain"/>
         <xsl:call-template name="gml:MultiCurveDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiCurveDomain_Substitution">
      <gml:multiCurveDomain rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiSurfaceCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSurfaceCoverage"/>
         <xsl:call-template name="gml:MultiSurfaceCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiSurfaceCoverage_Substitution">
      <gml:MultiSurfaceCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiSurfaceDomain">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSurfaceDomain"/>
         <xsl:call-template name="gml:MultiSurfaceDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiSurfaceDomain_Substitution">
      <gml:multiSurfaceDomain rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:MultiSolidCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:MultiSolidCoverage"/>
         <xsl:call-template name="gml:MultiSolidCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:MultiSolidCoverage_Substitution">
      <gml:MultiSolidCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:multiSolidDomain">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:multiSolidDomain"/>
         <xsl:call-template name="gml:MultiSolidDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:multiSolidDomain_Substitution">
      <gml:multiSolidDomain rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GridCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GridCoverage"/>
         <xsl:call-template name="gml:GridCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GridCoverage_Substitution">
      <gml:GridCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:gridDomain">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:gridDomain"/>
         <xsl:call-template name="gml:GridDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:gridDomain_Substitution">
      <gml:gridDomain rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:RectifiedGridCoverage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:RectifiedGridCoverage"/>
         <xsl:call-template name="gml:RectifiedGridCoverageType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:RectifiedGridCoverage_Substitution">
      <gml:RectifiedGridCoverage rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:rectifiedGridDomain">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:rectifiedGridDomain"/>
         <xsl:call-template name="gml:RectifiedGridDomainType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:rectifiedGridDomain_Substitution">
      <gml:rectifiedGridDomain rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Category">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Category"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Category_Substitution">
      <gml:Category rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CategoryList">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CategoryList"/>
         <xsl:call-template name="gml:CodeOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CategoryList_Substitution">
      <gml:CategoryList rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Quantity">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Quantity"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Quantity_Substitution">
      <gml:Quantity rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:QuantityList">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:QuantityList"/>
         <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:QuantityList_Substitution">
      <gml:QuantityList rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CompositeValue">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompositeValue"/>
         <xsl:call-template name="gml:CompositeValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CompositeValue_Substitution">
      <gml:CompositeValue rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ValueArray">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ValueArray"/>
         <xsl:call-template name="gml:ValueArrayType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ValueArray_Substitution">
      <gml:ValueArray rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:QuantityExtent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:QuantityExtent"/>
         <xsl:call-template name="gml:QuantityExtentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:QuantityExtent_Substitution">
      <gml:QuantityExtent rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CategoryExtent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CategoryExtent"/>
         <xsl:call-template name="gml:CategoryExtentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CategoryExtent_Substitution">
      <gml:CategoryExtent rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:valueProperty">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueProperty"/>
         <xsl:call-template name="gml:ValuePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:valueProperty_Substitution">
      <gml:valueProperty rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:valueComponent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueComponent"/>
         <xsl:call-template name="gml:ValuePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:valueComponent_Substitution">
      <gml:valueComponent rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:valueComponents">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueComponents"/>
         <xsl:call-template name="gml:ValueArrayPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:valueComponents_Substitution">
      <gml:valueComponents rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_ImplicitGeometry">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ImplicitGeometry"/>
         <xsl:call-template name="gml:AbstractGeometryType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_ImplicitGeometry_Substitution">
      <gml:_ImplicitGeometry rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Grid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Grid"/>
         <xsl:call-template name="gml:GridType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Grid_Substitution">
      <gml:Grid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:RectifiedGrid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:RectifiedGrid"/>
         <xsl:call-template name="gml:RectifiedGridType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:RectifiedGrid_Substitution">
      <gml:RectifiedGrid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_CoordinateReferenceSystem">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CoordinateReferenceSystem"/>
         <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_CoordinateReferenceSystem_Substitution">
      <gml:_CoordinateReferenceSystem rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinateReferenceSystemRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateReferenceSystemRef"/>
         <xsl:call-template name="gml:CoordinateReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinateReferenceSystemRef_Substitution">
      <gml:coordinateReferenceSystemRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CompoundCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CompoundCRS"/>
         <xsl:call-template name="gml:CompoundCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CompoundCRS_Substitution">
      <gml:CompoundCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:includesCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesCRS"/>
         <xsl:call-template name="gml:CoordinateReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:includesCRS_Substitution">
      <gml:includesCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:compoundCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:compoundCRSRef"/>
         <xsl:call-template name="gml:CompoundCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:compoundCRSRef_Substitution">
      <gml:compoundCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GeographicCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeographicCRS"/>
         <xsl:call-template name="gml:GeographicCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GeographicCRS_Substitution">
      <gml:GeographicCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesEllipsoidalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesEllipsoidalCS"/>
         <xsl:call-template name="gml:EllipsoidalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesEllipsoidalCS_Substitution">
      <gml:usesEllipsoidalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesGeodeticDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesGeodeticDatum"/>
         <xsl:call-template name="gml:GeodeticDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesGeodeticDatum_Substitution">
      <gml:usesGeodeticDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:geographicCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geographicCRSRef"/>
         <xsl:call-template name="gml:GeographicCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geographicCRSRef_Substitution">
      <gml:geographicCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:VerticalCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:VerticalCRS"/>
         <xsl:call-template name="gml:VerticalCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:VerticalCRS_Substitution">
      <gml:VerticalCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesVerticalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesVerticalCS"/>
         <xsl:call-template name="gml:VerticalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesVerticalCS_Substitution">
      <gml:usesVerticalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesVerticalDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesVerticalDatum"/>
         <xsl:call-template name="gml:VerticalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesVerticalDatum_Substitution">
      <gml:usesVerticalDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalCRSRef"/>
         <xsl:call-template name="gml:VerticalCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalCRSRef_Substitution">
      <gml:verticalCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GeocentricCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeocentricCRS"/>
         <xsl:call-template name="gml:GeocentricCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GeocentricCRS_Substitution">
      <gml:GeocentricCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesCartesianCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesCartesianCS"/>
         <xsl:call-template name="gml:CartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesCartesianCS_Substitution">
      <gml:usesCartesianCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesSphericalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesSphericalCS"/>
         <xsl:call-template name="gml:SphericalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesSphericalCS_Substitution">
      <gml:usesSphericalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:geocentricCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geocentricCRSRef"/>
         <xsl:call-template name="gml:GeocentricCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geocentricCRSRef_Substitution">
      <gml:geocentricCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GeneralDerivedCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralDerivedCRS"/>
         <xsl:call-template name="gml:AbstractGeneralDerivedCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GeneralDerivedCRS_Substitution">
      <gml:_GeneralDerivedCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:baseCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:baseCRS"/>
         <xsl:call-template name="gml:CoordinateReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:baseCRS_Substitution">
      <gml:baseCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:definedByConversion">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:definedByConversion"/>
         <xsl:call-template name="gml:GeneralConversionRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:definedByConversion_Substitution">
      <gml:definedByConversion rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ProjectedCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ProjectedCRS"/>
         <xsl:call-template name="gml:ProjectedCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ProjectedCRS_Substitution">
      <gml:ProjectedCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:projectedCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:projectedCRSRef"/>
         <xsl:call-template name="gml:ProjectedCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:projectedCRSRef_Substitution">
      <gml:projectedCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DerivedCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DerivedCRS"/>
         <xsl:call-template name="gml:DerivedCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DerivedCRS_Substitution">
      <gml:DerivedCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:derivedCRSType">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:derivedCRSType"/>
         <xsl:call-template name="gml:DerivedCRSTypeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:derivedCRSType_Substitution">
      <gml:derivedCRSType rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesCS"/>
         <xsl:call-template name="gml:CoordinateSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesCS_Substitution">
      <gml:usesCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:derivedCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:derivedCRSRef"/>
         <xsl:call-template name="gml:DerivedCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:derivedCRSRef_Substitution">
      <gml:derivedCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:EngineeringCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EngineeringCRS"/>
         <xsl:call-template name="gml:EngineeringCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:EngineeringCRS_Substitution">
      <gml:EngineeringCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesEngineeringDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesEngineeringDatum"/>
         <xsl:call-template name="gml:EngineeringDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesEngineeringDatum_Substitution">
      <gml:usesEngineeringDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:engineeringCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:engineeringCRSRef"/>
         <xsl:call-template name="gml:EngineeringCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:engineeringCRSRef_Substitution">
      <gml:engineeringCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ImageCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ImageCRS"/>
         <xsl:call-template name="gml:ImageCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ImageCRS_Substitution">
      <gml:ImageCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesObliqueCartesianCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesObliqueCartesianCS"/>
         <xsl:call-template name="gml:ObliqueCartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesObliqueCartesianCS_Substitution">
      <gml:usesObliqueCartesianCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesImageDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesImageDatum"/>
         <xsl:call-template name="gml:ImageDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesImageDatum_Substitution">
      <gml:usesImageDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:imageCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:imageCRSRef"/>
         <xsl:call-template name="gml:ImageCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:imageCRSRef_Substitution">
      <gml:imageCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TemporalCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TemporalCRS"/>
         <xsl:call-template name="gml:TemporalCRSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TemporalCRS_Substitution">
      <gml:TemporalCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesTemporalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesTemporalCS"/>
         <xsl:call-template name="gml:TemporalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesTemporalCS_Substitution">
      <gml:usesTemporalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesTemporalDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesTemporalDatum"/>
         <xsl:call-template name="gml:TemporalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesTemporalDatum_Substitution">
      <gml:usesTemporalDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:temporalCRSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalCRSRef"/>
         <xsl:call-template name="gml:TemporalCRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:temporalCRSRef_Substitution">
      <gml:temporalCRSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CoordinateSystemAxis">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CoordinateSystemAxis"/>
         <xsl:call-template name="gml:CoordinateSystemAxisType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemAxis_Substitution">
      <gml:CoordinateSystemAxis rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:axisID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:axisID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:axisID_Substitution">
      <gml:axisID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:axisAbbrev">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:axisAbbrev"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:axisAbbrev_Substitution">
      <gml:axisAbbrev rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:axisDirection">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:axisDirection"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:axisDirection_Substitution">
      <gml:axisDirection rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinateSystemAxisRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateSystemAxisRef"/>
         <xsl:call-template name="gml:CoordinateSystemAxisRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinateSystemAxisRef_Substitution">
      <gml:coordinateSystemAxisRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_CoordinateSystem">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CoordinateSystem"/>
         <xsl:call-template name="gml:AbstractCoordinateSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_CoordinateSystem_Substitution">
      <gml:_CoordinateSystem rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:csName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:csName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:csName_Substitution">
      <gml:csName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:csID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:csID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:csID_Substitution">
      <gml:csID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesAxis">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesAxis"/>
         <xsl:call-template name="gml:CoordinateSystemAxisRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesAxis_Substitution">
      <gml:usesAxis rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinateSystemRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateSystemRef"/>
         <xsl:call-template name="gml:CoordinateSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinateSystemRef_Substitution">
      <gml:coordinateSystemRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:EllipsoidalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EllipsoidalCS"/>
         <xsl:call-template name="gml:EllipsoidalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:EllipsoidalCS_Substitution">
      <gml:EllipsoidalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidalCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidalCSRef"/>
         <xsl:call-template name="gml:EllipsoidalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ellipsoidalCSRef_Substitution">
      <gml:ellipsoidalCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CartesianCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CartesianCS"/>
         <xsl:call-template name="gml:CartesianCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CartesianCS_Substitution">
      <gml:CartesianCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:cartesianCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:cartesianCSRef"/>
         <xsl:call-template name="gml:CartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:cartesianCSRef_Substitution">
      <gml:cartesianCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:VerticalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:VerticalCS"/>
         <xsl:call-template name="gml:VerticalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:VerticalCS_Substitution">
      <gml:VerticalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalCSRef"/>
         <xsl:call-template name="gml:VerticalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalCSRef_Substitution">
      <gml:verticalCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TemporalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TemporalCS"/>
         <xsl:call-template name="gml:TemporalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TemporalCS_Substitution">
      <gml:TemporalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:temporalCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalCSRef"/>
         <xsl:call-template name="gml:TemporalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:temporalCSRef_Substitution">
      <gml:temporalCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LinearCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LinearCS"/>
         <xsl:call-template name="gml:LinearCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LinearCS_Substitution">
      <gml:LinearCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:linearCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:linearCSRef"/>
         <xsl:call-template name="gml:LinearCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:linearCSRef_Substitution">
      <gml:linearCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:UserDefinedCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:UserDefinedCS"/>
         <xsl:call-template name="gml:UserDefinedCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:UserDefinedCS_Substitution">
      <gml:UserDefinedCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:userDefinedCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:userDefinedCSRef"/>
         <xsl:call-template name="gml:UserDefinedCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:userDefinedCSRef_Substitution">
      <gml:userDefinedCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:SphericalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:SphericalCS"/>
         <xsl:call-template name="gml:SphericalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:SphericalCS_Substitution">
      <gml:SphericalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:sphericalCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:sphericalCSRef"/>
         <xsl:call-template name="gml:SphericalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:sphericalCSRef_Substitution">
      <gml:sphericalCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:PolarCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PolarCS"/>
         <xsl:call-template name="gml:PolarCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:PolarCS_Substitution">
      <gml:PolarCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:polarCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:polarCSRef"/>
         <xsl:call-template name="gml:PolarCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:polarCSRef_Substitution">
      <gml:polarCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:CylindricalCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:CylindricalCS"/>
         <xsl:call-template name="gml:CylindricalCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:CylindricalCS_Substitution">
      <gml:CylindricalCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:cylindricalCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:cylindricalCSRef"/>
         <xsl:call-template name="gml:CylindricalCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:cylindricalCSRef_Substitution">
      <gml:cylindricalCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ObliqueCartesianCS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ObliqueCartesianCS"/>
         <xsl:call-template name="gml:ObliqueCartesianCSType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ObliqueCartesianCS_Substitution">
      <gml:ObliqueCartesianCS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:obliqueCartesianCSRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:obliqueCartesianCSRef"/>
         <xsl:call-template name="gml:ObliqueCartesianCSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:obliqueCartesianCSRef_Substitution">
      <gml:obliqueCartesianCSRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_ReferenceSystem">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_ReferenceSystem"/>
         <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_ReferenceSystem_Substitution">
      <gml:_ReferenceSystem rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:srsName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:srsName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:srsName_Substitution">
      <gml:srsName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:srsID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:srsID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:srsID_Substitution">
      <gml:srsID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:referenceSystemRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:referenceSystemRef"/>
         <xsl:call-template name="gml:ReferenceSystemRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:referenceSystemRef_Substitution">
      <gml:referenceSystemRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_CRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CRS"/>
         <xsl:call-template name="gml:AbstractReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_CRS_Substitution">
      <gml:_CRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:crsRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:crsRef"/>
         <xsl:call-template name="gml:CRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:crsRef_Substitution">
      <gml:crsRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:remarks">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:remarks"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:remarks_Substitution">
      <gml:remarks rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:validArea">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:validArea"/>
         <xsl:call-template name="gml:ExtentType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:validArea_Substitution">
      <gml:validArea rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:boundingBox">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:boundingBox"/>
         <xsl:call-template name="gml:EnvelopeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:boundingBox_Substitution">
      <gml:boundingBox rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:boundingPolygon">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:boundingPolygon"/>
         <xsl:call-template name="gml:PolygonType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:boundingPolygon_Substitution">
      <gml:boundingPolygon rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalExtent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalExtent"/>
         <xsl:call-template name="gml:EnvelopeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalExtent_Substitution">
      <gml:verticalExtent rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:temporalExtent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalExtent"/>
         <xsl:call-template name="gml:TimePeriodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:temporalExtent_Substitution">
      <gml:temporalExtent rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Datum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Datum"/>
         <xsl:call-template name="gml:AbstractDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Datum_Substitution">
      <gml:_Datum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:datumName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:datumName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:datumName_Substitution">
      <gml:datumName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:datumID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:datumID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:datumID_Substitution">
      <gml:datumID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:anchorPoint">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:anchorPoint"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:anchorPoint_Substitution">
      <gml:anchorPoint rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:datumRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:datumRef"/>
         <xsl:call-template name="gml:DatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:datumRef_Substitution">
      <gml:datumRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:EngineeringDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:EngineeringDatum"/>
         <xsl:call-template name="gml:EngineeringDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:EngineeringDatum_Substitution">
      <gml:EngineeringDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:engineeringDatumRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:engineeringDatumRef"/>
         <xsl:call-template name="gml:EngineeringDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:engineeringDatumRef_Substitution">
      <gml:engineeringDatumRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ImageDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ImageDatum"/>
         <xsl:call-template name="gml:ImageDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ImageDatum_Substitution">
      <gml:ImageDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:pixelInCell">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:pixelInCell"/>
         <xsl:call-template name="gml:PixelInCellType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:pixelInCell_Substitution">
      <gml:pixelInCell rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:imageDatumRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:imageDatumRef"/>
         <xsl:call-template name="gml:ImageDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:imageDatumRef_Substitution">
      <gml:imageDatumRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:VerticalDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:VerticalDatum"/>
         <xsl:call-template name="gml:VerticalDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:VerticalDatum_Substitution">
      <gml:VerticalDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalDatumType">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalDatumType"/>
         <xsl:call-template name="gml:VerticalDatumTypeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalDatumType_Substitution">
      <gml:verticalDatumType rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalDatumRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalDatumRef"/>
         <xsl:call-template name="gml:VerticalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalDatumRef_Substitution">
      <gml:verticalDatumRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TemporalDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TemporalDatum"/>
         <xsl:call-template name="gml:TemporalDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TemporalDatum_Substitution">
      <gml:TemporalDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:temporalDatumRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:temporalDatumRef"/>
         <xsl:call-template name="gml:TemporalDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:temporalDatumRef_Substitution">
      <gml:temporalDatumRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GeodeticDatum">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeodeticDatum"/>
         <xsl:call-template name="gml:GeodeticDatumType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GeodeticDatum_Substitution">
      <gml:GeodeticDatum rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesPrimeMeridian">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesPrimeMeridian"/>
         <xsl:call-template name="gml:PrimeMeridianRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesPrimeMeridian_Substitution">
      <gml:usesPrimeMeridian rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesEllipsoid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesEllipsoid"/>
         <xsl:call-template name="gml:EllipsoidRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesEllipsoid_Substitution">
      <gml:usesEllipsoid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:geodeticDatumRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geodeticDatumRef"/>
         <xsl:call-template name="gml:GeodeticDatumRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geodeticDatumRef_Substitution">
      <gml:geodeticDatumRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:PrimeMeridian">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PrimeMeridian"/>
         <xsl:call-template name="gml:PrimeMeridianType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:PrimeMeridian_Substitution">
      <gml:PrimeMeridian rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:meridianName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:meridianName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:meridianName_Substitution">
      <gml:meridianName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:meridianID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:meridianID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:meridianID_Substitution">
      <gml:meridianID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:greenwichLongitude">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:greenwichLongitude"/>
         <xsl:call-template name="gml:AngleChoiceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:greenwichLongitude_Substitution">
      <gml:greenwichLongitude rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:primeMeridianRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:primeMeridianRef"/>
         <xsl:call-template name="gml:PrimeMeridianRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:primeMeridianRef_Substitution">
      <gml:primeMeridianRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Ellipsoid">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Ellipsoid"/>
         <xsl:call-template name="gml:EllipsoidType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Ellipsoid_Substitution">
      <gml:Ellipsoid rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ellipsoidName_Substitution">
      <gml:ellipsoidName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ellipsoidID_Substitution">
      <gml:ellipsoidID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:semiMajorAxis">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:semiMajorAxis"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:semiMajorAxis_Substitution">
      <gml:semiMajorAxis rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ellipsoidRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ellipsoidRef"/>
         <xsl:call-template name="gml:EllipsoidRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ellipsoidRef_Substitution">
      <gml:ellipsoidRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:secondDefiningParameter">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:secondDefiningParameter"/>
         <xsl:call-template name="gml:SecondDefiningParameterType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:secondDefiningParameter_Substitution">
      <gml:secondDefiningParameter rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:inverseFlattening">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:inverseFlattening"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:inverseFlattening_Substitution">
      <gml:inverseFlattening rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:semiMinorAxis">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:semiMinorAxis"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:semiMinorAxis_Substitution">
      <gml:semiMinorAxis rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_CoordinateOperation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_CoordinateOperation"/>
         <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_CoordinateOperation_Substitution">
      <gml:_CoordinateOperation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinateOperationName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateOperationName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationName_Substitution">
      <gml:coordinateOperationName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinateOperationID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateOperationID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationID_Substitution">
      <gml:coordinateOperationID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:sourceCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:sourceCRS"/>
         <xsl:call-template name="gml:CRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:sourceCRS_Substitution">
      <gml:sourceCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:targetCRS">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:targetCRS"/>
         <xsl:call-template name="gml:CRSRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:targetCRS_Substitution">
      <gml:targetCRS rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:coordinateOperationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:coordinateOperationRef"/>
         <xsl:call-template name="gml:CoordinateOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationRef_Substitution">
      <gml:coordinateOperationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:ConcatenatedOperation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:ConcatenatedOperation"/>
         <xsl:call-template name="gml:ConcatenatedOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:ConcatenatedOperation_Substitution">
      <gml:ConcatenatedOperation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesSingleOperation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesSingleOperation"/>
         <xsl:call-template name="gml:SingleOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesSingleOperation_Substitution">
      <gml:usesSingleOperation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:concatenatedOperationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:concatenatedOperationRef"/>
         <xsl:call-template name="gml:ConcatenatedOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:concatenatedOperationRef_Substitution">
      <gml:concatenatedOperationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_SingleOperation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_SingleOperation"/>
         <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_SingleOperation_Substitution">
      <gml:_SingleOperation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:singleOperationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:singleOperationRef"/>
         <xsl:call-template name="gml:SingleOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:singleOperationRef_Substitution">
      <gml:singleOperationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:PassThroughOperation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:PassThroughOperation"/>
         <xsl:call-template name="gml:PassThroughOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:PassThroughOperation_Substitution">
      <gml:PassThroughOperation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesOperation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesOperation"/>
         <xsl:call-template name="gml:OperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesOperation_Substitution">
      <gml:usesOperation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:passThroughOperationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:passThroughOperationRef"/>
         <xsl:call-template name="gml:PassThroughOperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:passThroughOperationRef_Substitution">
      <gml:passThroughOperationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Operation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Operation"/>
         <xsl:call-template name="gml:AbstractCoordinateOperationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Operation_Substitution">
      <gml:_Operation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:operationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationRef"/>
         <xsl:call-template name="gml:OperationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:operationRef_Substitution">
      <gml:operationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GeneralConversion">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralConversion"/>
         <xsl:call-template name="gml:AbstractGeneralConversionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GeneralConversion_Substitution">
      <gml:_GeneralConversion rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:generalConversionRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:generalConversionRef"/>
         <xsl:call-template name="gml:GeneralConversionRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:generalConversionRef_Substitution">
      <gml:generalConversionRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Conversion">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Conversion"/>
         <xsl:call-template name="gml:ConversionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Conversion_Substitution">
      <gml:Conversion rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesMethod">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesMethod"/>
         <xsl:call-template name="gml:OperationMethodRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesMethod_Substitution">
      <gml:usesMethod rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesValue">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesValue"/>
         <xsl:call-template name="gml:ParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesValue_Substitution">
      <gml:usesValue rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:conversionRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:conversionRef"/>
         <xsl:call-template name="gml:ConversionRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:conversionRef_Substitution">
      <gml:conversionRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GeneralTransformation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralTransformation"/>
         <xsl:call-template name="gml:AbstractGeneralTransformationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GeneralTransformation_Substitution">
      <gml:_GeneralTransformation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:generalTransformationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:generalTransformationRef"/>
         <xsl:call-template name="gml:GeneralTransformationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:generalTransformationRef_Substitution">
      <gml:generalTransformationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Transformation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Transformation"/>
         <xsl:call-template name="gml:TransformationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Transformation_Substitution">
      <gml:Transformation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:transformationRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:transformationRef"/>
         <xsl:call-template name="gml:TransformationRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:transformationRef_Substitution">
      <gml:transformationRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_generalParameterValue">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_generalParameterValue"/>
         <xsl:call-template name="gml:AbstractGeneralParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_generalParameterValue_Substitution">
      <gml:_generalParameterValue rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:parameterValue">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterValue"/>
         <xsl:call-template name="gml:ParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:parameterValue_Substitution">
      <gml:parameterValue rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:value">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:value"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:value_Substitution">
      <gml:value rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:dmsAngleValue">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:dmsAngleValue"/>
         <xsl:call-template name="gml:DMSAngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:dmsAngleValue_Substitution">
      <gml:dmsAngleValue rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:valueList">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueList"/>
         <xsl:call-template name="gml:MeasureListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:valueList_Substitution">
      <gml:valueList rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:valueOfParameter">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valueOfParameter"/>
         <xsl:call-template name="gml:OperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:valueOfParameter_Substitution">
      <gml:valueOfParameter rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:parameterValueGroup">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterValueGroup"/>
         <xsl:call-template name="gml:ParameterValueGroupType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:parameterValueGroup_Substitution">
      <gml:parameterValueGroup rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:includesValue">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesValue"/>
         <xsl:call-template name="gml:AbstractGeneralParameterValueType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:includesValue_Substitution">
      <gml:includesValue rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:valuesOfGroup">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:valuesOfGroup"/>
         <xsl:call-template name="gml:OperationParameterGroupRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:valuesOfGroup_Substitution">
      <gml:valuesOfGroup rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:OperationMethod">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OperationMethod"/>
         <xsl:call-template name="gml:OperationMethodType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:OperationMethod_Substitution">
      <gml:OperationMethod rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:methodName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:methodName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:methodName_Substitution">
      <gml:methodName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:methodID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:methodID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:methodID_Substitution">
      <gml:methodID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:methodFormula">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:methodFormula"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:methodFormula_Substitution">
      <gml:methodFormula rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:usesParameter">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:usesParameter"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:usesParameter_Substitution">
      <gml:usesParameter rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:operationMethodRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationMethodRef"/>
         <xsl:call-template name="gml:OperationMethodRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:operationMethodRef_Substitution">
      <gml:operationMethodRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_GeneralOperationParameter">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_GeneralOperationParameter"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_GeneralOperationParameter_Substitution">
      <gml:_GeneralOperationParameter rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:abstractGeneralOperationParameterRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:abstractGeneralOperationParameterRef"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:abstractGeneralOperationParameterRef_Substitution">
      <gml:abstractGeneralOperationParameterRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:OperationParameter">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OperationParameter"/>
         <xsl:call-template name="gml:OperationParameterType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:OperationParameter_Substitution">
      <gml:OperationParameter rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:parameterName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:parameterName_Substitution">
      <gml:parameterName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:parameterID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:parameterID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:parameterID_Substitution">
      <gml:parameterID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:operationParameterRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationParameterRef"/>
         <xsl:call-template name="gml:OperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:operationParameterRef_Substitution">
      <gml:operationParameterRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:OperationParameterGroup">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:OperationParameterGroup"/>
         <xsl:call-template name="gml:OperationParameterGroupType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:OperationParameterGroup_Substitution">
      <gml:OperationParameterGroup rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:groupName">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:groupName"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:groupName_Substitution">
      <gml:groupName rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:groupID">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:groupID"/>
         <xsl:call-template name="gml:IdentifierType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:groupID_Substitution">
      <gml:groupID rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:includesParameter">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesParameter"/>
         <xsl:call-template name="gml:AbstractGeneralOperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:includesParameter_Substitution">
      <gml:includesParameter rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:operationParameterGroupRef">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:operationParameterGroupRef"/>
         <xsl:call-template name="gml:OperationParameterRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:operationParameterGroupRef_Substitution">
      <gml:operationParameterGroupRef rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_positionalAccuracy">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_positionalAccuracy"/>
         <xsl:call-template name="gml:AbstractPositionalAccuracyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_positionalAccuracy_Substitution">
      <gml:_positionalAccuracy rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:measureDescription">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:measureDescription"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:measureDescription_Substitution">
      <gml:measureDescription rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:absoluteExternalPositionalAccuracy">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:absoluteExternalPositionalAccuracy"/>
         <xsl:call-template name="gml:AbsoluteExternalPositionalAccuracyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:absoluteExternalPositionalAccuracy_Substitution">
      <gml:absoluteExternalPositionalAccuracy rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:relativeInternalPositionalAccuracy">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:relativeInternalPositionalAccuracy"/>
         <xsl:call-template name="gml:RelativeInternalPositionalAccuracyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:relativeInternalPositionalAccuracy_Substitution">
      <gml:relativeInternalPositionalAccuracy rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:result">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:result"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:result_Substitution">
      <gml:result rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:covarianceMatrix">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:covarianceMatrix"/>
         <xsl:call-template name="gml:CovarianceMatrixType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:covarianceMatrix_Substitution">
      <gml:covarianceMatrix rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:includesElement">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:includesElement"/>
         <xsl:call-template name="gml:CovarianceElementType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:includesElement_Substitution">
      <gml:includesElement rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:using">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:using"/>
         <xsl:call-template name="gml:FeaturePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:using_Substitution">
      <gml:using rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:target">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:target"/>
         <xsl:call-template name="gml:TargetPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:target_Substitution">
      <gml:target rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:subject">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:subject"/>
         <xsl:call-template name="gml:TargetPropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:subject_Substitution">
      <gml:subject rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:resultOf">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:resultOf"/>
         <xsl:call-template name="gml:AssociationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:resultOf_Substitution">
      <gml:resultOf rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Observation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Observation"/>
         <xsl:call-template name="gml:ObservationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Observation_Substitution">
      <gml:Observation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectedObservation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectedObservation"/>
         <xsl:call-template name="gml:DirectedObservationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DirectedObservation_Substitution">
      <gml:DirectedObservation rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectedObservationAtDistance">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectedObservationAtDistance"/>
         <xsl:call-template name="gml:DirectedObservationAtDistanceType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DirectedObservationAtDistance_Substitution">
      <gml:DirectedObservationAtDistance rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:defaultStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:defaultStyle"/>
         <xsl:call-template name="gml:DefaultStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:defaultStyle_Substitution">
      <gml:defaultStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_Style">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_Style"/>
         <xsl:call-template name="gml:AbstractStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Style_Substitution">
      <gml:_Style rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:Style">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:Style"/>
         <xsl:call-template name="gml:StyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:Style_Substitution">
      <gml:Style rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:featureStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:featureStyle"/>
         <xsl:call-template name="gml:FeatureStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:featureStyle_Substitution">
      <gml:featureStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:FeatureStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:FeatureStyle"/>
         <xsl:call-template name="gml:FeatureStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:FeatureStyle_Substitution">
      <gml:FeatureStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:geometryStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:geometryStyle"/>
         <xsl:call-template name="gml:GeometryStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:geometryStyle_Substitution">
      <gml:geometryStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GeometryStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GeometryStyle"/>
         <xsl:call-template name="gml:GeometryStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GeometryStyle_Substitution">
      <gml:GeometryStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:topologyStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:topologyStyle"/>
         <xsl:call-template name="gml:TopologyStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:topologyStyle_Substitution">
      <gml:topologyStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TopologyStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TopologyStyle"/>
         <xsl:call-template name="gml:TopologyStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TopologyStyle_Substitution">
      <gml:TopologyStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:labelStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:labelStyle"/>
         <xsl:call-template name="gml:LabelStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:labelStyle_Substitution">
      <gml:labelStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:LabelStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:LabelStyle"/>
         <xsl:call-template name="gml:LabelStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:LabelStyle_Substitution">
      <gml:LabelStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:graphStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:graphStyle"/>
         <xsl:call-template name="gml:GraphStylePropertyType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:graphStyle_Substitution">
      <gml:graphStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:GraphStyle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:GraphStyle"/>
         <xsl:call-template name="gml:GraphStyleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:GraphStyle_Substitution">
      <gml:GraphStyle rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:symbol">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:symbol"/>
         <xsl:call-template name="gml:SymbolType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:symbol_Substitution">
      <gml:symbol rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimeReferenceSystem">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeReferenceSystem"/>
         <xsl:call-template name="gml:AbstractTimeReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimeReferenceSystem_Substitution">
      <gml:_TimeReferenceSystem rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeCoordinateSystem">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeCoordinateSystem"/>
         <xsl:call-template name="gml:TimeCoordinateSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeCoordinateSystem_Substitution">
      <gml:TimeCoordinateSystem rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeOrdinalReferenceSystem">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeOrdinalReferenceSystem"/>
         <xsl:call-template name="gml:TimeOrdinalReferenceSystemType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalReferenceSystem_Substitution">
      <gml:TimeOrdinalReferenceSystem rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeOrdinalEra">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeOrdinalEra"/>
         <xsl:call-template name="gml:TimeOrdinalEraType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalEra_Substitution">
      <gml:TimeOrdinalEra rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeCalendar">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeCalendar"/>
         <xsl:call-template name="gml:TimeCalendarType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeCalendar_Substitution">
      <gml:TimeCalendar rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeCalendarEra">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeCalendarEra"/>
         <xsl:call-template name="gml:TimeCalendarEraType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarEra_Substitution">
      <gml:TimeCalendarEra rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeClock">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeClock"/>
         <xsl:call-template name="gml:TimeClockType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeClock_Substitution">
      <gml:TimeClock rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeTopologyComplex">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeTopologyComplex"/>
         <xsl:call-template name="gml:TimeTopologyComplexType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeTopologyComplex_Substitution">
      <gml:TimeTopologyComplex rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:_TimeTopologyPrimitive">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:_TimeTopologyPrimitive"/>
         <xsl:call-template name="gml:AbstractTimeTopologyPrimitiveType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_TimeTopologyPrimitive_Substitution">
      <gml:_TimeTopologyPrimitive rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeNode">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeNode"/>
         <xsl:call-template name="gml:TimeNodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeNode_Substitution">
      <gml:TimeNode rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:TimeEdge">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}">
         <rdf:type rdf:resource="gml:TimeEdge"/>
         <xsl:call-template name="gml:TimeEdgeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:TimeEdge_Substitution">
      <gml:TimeEdge rdf:resource="{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfCityModel_Property">
      <core:has_GenericApplicationPropertyOfCityModel rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
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
      <core:externalReference rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:generalizesTo_Property">
      <core:generalizesTo rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:relativeToTerrain_Property">
      <core:relativeToTerrain rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:relativeToWater_Property">
      <core:relativeToWater rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfCityObject_Property">
      <core:has_GenericApplicationPropertyOfCityObject rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfSite_Property">
      <core:has_GenericApplicationPropertyOfSite rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:_CityObject_Property">
      <core:has_CityObject rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:informationSystem_Property">
      <core:informationSystem>
         <xsl:value-of select="text()"/>
      </core:informationSystem>
   </xsl:template>
   <xsl:template name="core:externalObject_Property">
      <core:externalObject rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
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
      <core:hasAddress rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:xalAddress_Property">
      <core:xalAddress rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:multiPoint_Property">
      <core:multiPoint rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:_GenericApplicationPropertyOfAddress_Property">
      <core:has_GenericApplicationPropertyOfAddress rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="xAL:AddressDetails_Property">
      <xAL:hasAddressDetails rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="core:mimeType_Property">
      <core:mimeType rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//core:mimeType">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="core:mimeType"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="core:transformationMatrix_Property">
      <core:transformationMatrix rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:libraryObject_Property">
      <core:libraryObject>
         <xsl:value-of select="text()"/>
      </core:libraryObject>
   </xsl:template>
   <xsl:template name="core:relativeGMLGeometry_Property">
      <core:relativeGMLGeometry rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:referencePoint_Property">
      <core:referencePoint rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="core:ImplicitGeometry_Property">
      <core:hasImplicitGeometry rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:class_Property">
      <bldg:class rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:class">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:function_Property">
      <bldg:function rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:function">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:usage_Property">
      <bldg:usage rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:usage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
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
      <bldg:roofType rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:roofType">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:roofType"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:measuredHeight_Property">
      <bldg:measuredHeight rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:measuredHeight">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:LengthType', '_', generate-id() )}">
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
      <bldg:storeyHeightsAboveGround rdf:resource="{concat( 'gml:MeasureOrNullListType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:storeyHeightsAboveGround">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:MeasureOrNullListType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:storeyHeightsAboveGround"/>
         <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:storeyHeightsBelowGround_Property">
      <bldg:storeyHeightsBelowGround rdf:resource="{concat( 'gml:MeasureOrNullListType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:storeyHeightsBelowGround">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:MeasureOrNullListType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:storeyHeightsBelowGround"/>
         <xsl:call-template name="gml:MeasureOrNullListType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:lod0FootPrint_Property">
      <bldg:lod0FootPrint rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod0RoofEdge_Property">
      <bldg:lod0RoofEdge rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod1Solid_Property">
      <bldg:lod1Solid rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod1MultiSurface_Property">
      <bldg:lod1MultiSurface rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod1TerrainIntersection_Property">
      <bldg:lod1TerrainIntersection rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2Solid_Property">
      <bldg:lod2Solid rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2MultiSurface_Property">
      <bldg:lod2MultiSurface rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2MultiCurve_Property">
      <bldg:lod2MultiCurve rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2TerrainIntersection_Property">
      <bldg:lod2TerrainIntersection rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:outerBuildingInstallation_Property">
      <bldg:outerBuildingInstallation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:interiorBuildingInstallation_Property">
      <bldg:interiorBuildingInstallation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:boundedBy_Property">
      <bldg:boundedBy rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3Solid_Property">
      <bldg:lod3Solid rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3MultiSurface_Property">
      <bldg:lod3MultiSurface rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3MultiCurve_Property">
      <bldg:lod3MultiCurve rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3TerrainIntersection_Property">
      <bldg:lod3TerrainIntersection rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4Solid_Property">
      <bldg:lod4Solid rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4MultiSurface_Property">
      <bldg:lod4MultiSurface rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4MultiCurve_Property">
      <bldg:lod4MultiCurve rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4TerrainIntersection_Property">
      <bldg:lod4TerrainIntersection rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:interiorRoom_Property">
      <bldg:interiorRoom rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:consistsOfBuildingPart_Property">
      <bldg:consistsOfBuildingPart rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:address_Property">
      <bldg:address rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfAbstractBuilding_Property">
      <bldg:has_GenericApplicationPropertyOfAbstractBuilding rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuilding_Property">
      <bldg:has_GenericApplicationPropertyOfBuilding rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingPart_Property">
      <bldg:has_GenericApplicationPropertyOfBuildingPart rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingPart_Property">
      <bldg:hasBuildingPart rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:class">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:function">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:usage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:lod2Geometry_Property">
      <bldg:lod2Geometry rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3Geometry_Property">
      <bldg:lod3Geometry rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4Geometry_Property">
      <bldg:lod4Geometry rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod2ImplicitRepresentation_Property">
      <bldg:lod2ImplicitRepresentation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod3ImplicitRepresentation_Property">
      <bldg:lod3ImplicitRepresentation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:lod4ImplicitRepresentation_Property">
      <bldg:lod4ImplicitRepresentation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingInstallation_Property">
      <bldg:has_GenericApplicationPropertyOfBuildingInstallation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingInstallation_Property">
      <bldg:hasBuildingInstallation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:class">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:function">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:usage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfIntBuildingInstallation_Property">
      <bldg:has_GenericApplicationPropertyOfIntBuildingInstallation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:IntBuildingInstallation_Property">
      <bldg:hasIntBuildingInstallation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:opening_Property">
      <bldg:opening rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBoundarySurface_Property">
      <bldg:has_GenericApplicationPropertyOfBoundarySurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfRoofSurface_Property">
      <bldg:has_GenericApplicationPropertyOfRoofSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfWallSurface_Property">
      <bldg:has_GenericApplicationPropertyOfWallSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfGroundSurface_Property">
      <bldg:has_GenericApplicationPropertyOfGroundSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfClosureSurface_Property">
      <bldg:has_GenericApplicationPropertyOfClosureSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfFloorSurface_Property">
      <bldg:has_GenericApplicationPropertyOfFloorSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOuterFloorSurface_Property">
      <bldg:has_GenericApplicationPropertyOfOuterFloorSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfInteriorWallSurface_Property">
      <bldg:has_GenericApplicationPropertyOfInteriorWallSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfCeilingSurface_Property">
      <bldg:has_GenericApplicationPropertyOfCeilingSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOuterCeilingSurface_Property">
      <bldg:has_GenericApplicationPropertyOfOuterCeilingSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_BoundarySurface_Property">
      <bldg:has_BoundarySurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_Opening_Property">
      <bldg:has_Opening rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfOpening_Property">
      <bldg:has_GenericApplicationPropertyOfOpening rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfWindow_Property">
      <bldg:has_GenericApplicationPropertyOfWindow rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfDoor_Property">
      <bldg:has_GenericApplicationPropertyOfDoor rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:class">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:function">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:usage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:interiorFurniture_Property">
      <bldg:interiorFurniture rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:roomInstallation_Property">
      <bldg:roomInstallation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfRoom_Property">
      <bldg:has_GenericApplicationPropertyOfRoom rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//bldg:class">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:class"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:function">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:function"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//bldg:usage">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="bldg:usage"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="bldg:_GenericApplicationPropertyOfBuildingFurniture_Property">
      <bldg:has_GenericApplicationPropertyOfBuildingFurniture rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:Room_Property">
      <bldg:hasRoom rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="bldg:BuildingFurniture_Property">
      <bldg:hasBuildingFurniture rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:validTime_Property">
      <gml:hasvalidTime rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dataSource_Property">
      <gml:hasdataSource rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:location_Property">
      <gml:haslocation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:location rdf:resource="{concat( 'gml:DirectPositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:speed_Property">
      <gml:speed rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:speed">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:speed"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:bearing_Property">
      <gml:bearing rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:acceleration_Property">
      <gml:acceleration rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:acceleration">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:acceleration"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:elevation_Property">
      <gml:elevation rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:elevation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:elevation"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:status_Property">
      <gml:hasstatus rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeSlice_Property">
      <gml:has_TimeSlice rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MovingObjectStatus_Property">
      <gml:hasMovingObjectStatus rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:boundedBy_Property">
      <gml:hasboundedBy rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Envelope_Property">
      <gml:hasEnvelope rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Null_Property">
      <gml:hasNull rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:timePosition_Property">
      <gml:hastimePosition rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Feature_Property">
      <gml:has_Feature rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureMember_Property">
      <gml:hasfeatureMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureMembers_Property">
      <gml:hasfeatureMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Geometry_Property">
      <gml:has_Geometry rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LocationKeyWord_Property">
      <gml:hasLocationKeyWord rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LocationString_Property">
      <gml:hasLocationString rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Surface_Property">
      <gml:has_Surface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:exterior_Property">
      <gml:hasexterior rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:exterior rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:interior_Property">
      <gml:hasinterior rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:interior rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:_Ring_Property">
      <gml:has_Ring rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pos_Property">
      <gml:haspos rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointProperty_Property">
      <gml:haspointProperty rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointRep_Property">
      <gml:haspointRep rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:posList_Property">
      <gml:hasposList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coordinates_Property">
      <gml:hascoordinates rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coord_Property">
      <gml:hascoord rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LinearRing_Property">
      <gml:hasLinearRing rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Polygon_Property">
      <gml:hasPolygon rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeometricPrimitive_Property">
      <gml:has_GeometricPrimitive rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Point_Property">
      <gml:hasPoint rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Curve_Property">
      <gml:has_Curve rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:lowerCorner_Property">
      <gml:lowerCorner rdf:resource="{concat( 'gml:DirectPositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:lowerCorner">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:DirectPositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:lowerCorner"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:upperCorner_Property">
      <gml:upperCorner rdf:resource="{concat( 'gml:DirectPositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:upperCorner">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:DirectPositionType', '_', generate-id() )}">
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
      <gml:hasLineString rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:angle_Property">
      <gml:hasangle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dmsAngle_Property">
      <gml:hasdmsAngle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:degrees_Property">
      <gml:hasdegrees rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:decimalMinutes_Property">
      <gml:hasdecimalMinutes rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:minutes_Property">
      <gml:hasminutes rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:seconds_Property">
      <gml:hasseconds rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:quantityType_Property">
      <gml:hasquantityType rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:catalogSymbol_Property">
      <gml:hascatalogSymbol rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:unitsSystem_Property">
      <gml:unitsSystem rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:derivationUnitTerm_Property">
      <gml:hasderivationUnitTerm rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:conversionToPreferredUnit_Property">
      <gml:hasconversionToPreferredUnit rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:roughConversionToPreferredUnit_Property">
      <gml:hasroughConversionToPreferredUnit rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:factor_Property">
      <gml:factor>
         <xsl:value-of select="text()"/>
      </gml:factor>
   </xsl:template>
   <xsl:template name="gml:formula_Property">
      <gml:formula rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
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
   <xsl:template name="gml:metaDataProperty_Property">
      <gml:hasmetaDataProperty rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:description_Property">
      <gml:hasdescription rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:name_Property">
      <gml:hasname rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dictionaryEntry_Property">
      <gml:hasdictionaryEntry rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:indirectEntry_Property">
      <gml:hasindirectEntry rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Definition_Property">
      <gml:hasDefinition rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DefinitionProxy_Property">
      <gml:hasDefinitionProxy rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:definitionRef_Property">
      <gml:hasdefinitionRef rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:member_Property">
      <gml:hasmember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:member rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:members_Property">
      <gml:hasmembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Object_Property">
      <gml:has_Object rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:relatedTime_Property">
      <gml:relatedTime rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimePrimitive_Property">
      <gml:has_TimePrimitive rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeGeometricPrimitive_Property">
      <gml:has_TimeGeometricPrimitive rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeInstant_Property">
      <gml:hasTimeInstant rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:beginPosition_Property">
      <gml:beginPosition rdf:resource="{concat( 'gml:TimePositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:beginPosition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:TimePositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:beginPosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:begin_Property">
      <gml:begin rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:endPosition_Property">
      <gml:endPosition rdf:resource="{concat( 'gml:TimePositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:endPosition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:TimePositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:endPosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:end_Property">
      <gml:end rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimePeriod_Property">
      <gml:hasTimePeriod rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DirectionVector_Property">
      <gml:hasDirectionVector rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompassPoint_Property">
      <gml:hasCompassPoint rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DirectionKeyword_Property">
      <gml:DirectionKeyword rdf:resource="{concat( 'gml:CodeType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectionKeyword">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:CodeType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectionKeyword"/>
         <xsl:call-template name="gml:CodeType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:DirectionString_Property">
      <gml:DirectionString rdf:resource="{concat( 'gml:StringOrRefType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:DirectionString">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:StringOrRefType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:DirectionString"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:vector_Property">
      <gml:hasvector rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:horizontalAngle_Property">
      <gml:horizontalAngle rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:horizontalAngle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:horizontalAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:verticalAngle_Property">
      <gml:verticalAngle rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:verticalAngle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:verticalAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:isolated_Property">
      <gml:hasisolated rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:container_Property">
      <gml:hascontainer rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Node_Property">
      <gml:hasNode rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Edge_Property">
      <gml:hasEdge rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Face_Property">
      <gml:hasFace rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoSolid_Property">
      <gml:hasTopoSolid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedEdge_Property">
      <gml:hasdirectedEdge rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedNode_Property">
      <gml:hasdirectedNode rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedFace_Property">
      <gml:hasdirectedFace rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:curveProperty_Property">
      <gml:hascurveProperty rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:directedTopoSolid_Property">
      <gml:hasdirectedTopoSolid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:surfaceProperty_Property">
      <gml:hassurfaceProperty rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoPoint_Property">
      <gml:hasTopoPoint rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoCurve_Property">
      <gml:hasTopoCurve rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoSurface_Property">
      <gml:hasTopoSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoVolume_Property">
      <gml:hasTopoVolume rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:maximalComplex_Property">
      <gml:hasmaximalComplex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:superComplex_Property">
      <gml:hassuperComplex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:subComplex_Property">
      <gml:hassubComplex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:topoPrimitiveMember_Property">
      <gml:hastopoPrimitiveMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:topoPrimitiveMembers_Property">
      <gml:hastopoPrimitiveMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TopoComplex_Property">
      <gml:hasTopoComplex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TopoPrimitive_Property">
      <gml:has_TopoPrimitive rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:curveMember_Property">
      <gml:hascurveMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeCurve_Property">
      <gml:hasCompositeCurve rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:surfaceMember_Property">
      <gml:hassurfaceMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSurface_Property">
      <gml:hasCompositeSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:solidMember_Property">
      <gml:hassolidMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeSolid_Property">
      <gml:hasCompositeSolid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:element_Property">
      <gml:element rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:GeometricComplex_Property">
      <gml:hasGeometricComplex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:geometryMember_Property">
      <gml:hasgeometryMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:geometryMembers_Property">
      <gml:hasgeometryMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeometricAggregate_Property">
      <gml:has_GeometricAggregate rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointMember_Property">
      <gml:haspointMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pointMembers_Property">
      <gml:haspointMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiPoint_Property">
      <gml:hasMultiPoint rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:curveMembers_Property">
      <gml:hascurveMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiCurve_Property">
      <gml:hasMultiCurve rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:surfaceMembers_Property">
      <gml:hassurfaceMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiSurface_Property">
      <gml:hasMultiSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:solidMembers_Property">
      <gml:hassolidMembers rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiSolid_Property">
      <gml:hasMultiSolid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:lineStringMember_Property">
      <gml:haslineStringMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiLineString_Property">
      <gml:hasMultiLineString rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:polygonMember_Property">
      <gml:haspolygonMember rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MultiPolygon_Property">
      <gml:hasMultiPolygon rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:segments_Property">
      <gml:hassegments rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:baseCurve_Property">
      <gml:hasbaseCurve rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CurveSegment_Property">
      <gml:has_CurveSegment rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:bulge_Property">
      <gml:bulge>
         <xsl:value-of select="text()"/>
      </gml:bulge>
   </xsl:template>
   <xsl:template name="gml:normal_Property">
      <gml:normal rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:normal">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:normal"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:normal">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:normal"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:radius_Property">
      <gml:radius rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:radius">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:radius"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:startAngle_Property">
      <gml:startAngle rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:startAngle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:startAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:endAngle_Property">
      <gml:endAngle rdf:resource="{concat( 'gml:AngleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:endAngle">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:AngleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:endAngle"/>
         <xsl:call-template name="gml:AngleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:offsetBase_Property">
      <gml:offsetBase rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:distance_Property">
      <gml:distance rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   <gml:distance rdf:resource="{concat( 'gml:MeasureType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:distance">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:distance"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:refDirection_Property">
      <gml:refDirection rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:refDirection">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:refDirection"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:location">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:DirectPositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:location"/>
         <xsl:call-template name="gml:DirectPositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template match="//gml:refDirection">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
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
      <gml:refLocation rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:AffinePlacement_Property">
      <gml:hasAffinePlacement rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
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
      <gml:vectorAtStart rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:vectorAtStart">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:vectorAtStart"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:vectorAtEnd_Property">
      <gml:vectorAtEnd rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:vectorAtEnd">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:vectorAtEnd"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:value_Property">
      <gml:value>
         <xsl:value-of select="text()"/>
      </gml:value>
   <gml:hasvalue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
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
      <gml:Knot rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:degree_Property">
      <gml:degree>
         <xsl:value-of select="text()"/>
      </gml:degree>
   </xsl:template>
   <xsl:template name="gml:knot_Property">
      <gml:knot rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:patches_Property">
      <gml:haspatches rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:baseSurface_Property">
      <gml:hasbaseSurface rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_SurfacePatch_Property">
      <gml:has_SurfacePatch rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Ring_Property">
      <gml:hasRing rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
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
      <gml:haspolygonPatches rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PolygonPatch_Property">
      <gml:hasPolygonPatch rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Triangle_Property">
      <gml:hasTriangle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:trianglePatches_Property">
      <gml:hastrianglePatches rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:stopLines_Property">
      <gml:stopLines rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:breakLines_Property">
      <gml:breakLines rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:maxLength_Property">
      <gml:maxLength rdf:resource="{concat( 'gml:LengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:maxLength">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:LengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:maxLength"/>
         <xsl:call-template name="gml:LengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:controlPoint_Property">
      <gml:controlPoint rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:LineStringSegment_Property">
      <gml:hasLineStringSegment rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Solid_Property">
      <gml:has_Solid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:domainSet_Property">
      <gml:hasdomainSet rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rangeSet_Property">
      <gml:hasrangeSet rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coverageFunction_Property">
      <gml:hascoverageFunction rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeObject_Property">
      <gml:has_TimeObject rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ValueArray_Property">
      <gml:hasValueArray rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DataBlock_Property">
      <gml:hasDataBlock rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:File_Property">
      <gml:hasFile rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:MappingRule_Property">
      <gml:hasMappingRule rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GridFunction_Property">
      <gml:hasGridFunction rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rangeParameters_Property">
      <gml:hasrangeParameters rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:tupleList_Property">
      <gml:hastupleList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:doubleOrNullTupleList_Property">
      <gml:hasdoubleOrNullTupleList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:fileName_Property">
      <gml:fileName>
         <xsl:value-of select="text()"/>
      </gml:fileName>
   </xsl:template>
   <xsl:template name="gml:fileStructure_Property">
      <gml:fileStructure rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
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
      <gml:sequenceRule rdf:resource="{concat( 'gml:SequenceRuleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:sequenceRule">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:SequenceRuleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:sequenceRule"/>
         <xsl:call-template name="gml:SequenceRuleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:startPoint_Property">
      <gml:startPoint rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:lookUpTable_Property">
      <gml:lookUpTable rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:multiPointDomain_Property">
      <gml:hasmultiPointDomain rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiCurveDomain_Property">
      <gml:hasmultiCurveDomain rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiSurfaceDomain_Property">
      <gml:hasmultiSurfaceDomain rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:multiSolidDomain_Property">
      <gml:hasmultiSolidDomain rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:gridDomain_Property">
      <gml:hasgridDomain rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Grid_Property">
      <gml:hasGrid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rectifiedGridDomain_Property">
      <gml:hasrectifiedGridDomain rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:RectifiedGrid_Property">
      <gml:hasRectifiedGrid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueComponent_Property">
      <gml:hasvalueComponent rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueComponents_Property">
      <gml:hasvalueComponents rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Boolean_Property">
      <gml:hasBoolean rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Category_Property">
      <gml:hasCategory rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Quantity_Property">
      <gml:hasQuantity rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Count_Property">
      <gml:hasCount rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:limits_Property">
      <gml:limits rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:axisName_Property">
      <gml:axisName>
         <xsl:value-of select="text()"/>
      </gml:axisName>
   </xsl:template>
   <xsl:template name="gml:GridEnvelope_Property">
      <gml:GridEnvelope rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:low_Property">
      <gml:low rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:high_Property">
      <gml:high rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:origin_Property">
      <gml:origin rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   <gml:hasorigin rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:offsetVector_Property">
      <gml:offsetVector rdf:resource="{concat( 'gml:VectorType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:offsetVector">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:VectorType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:offsetVector"/>
         <xsl:call-template name="gml:VectorType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_CoordinateReferenceSystem_Property">
      <gml:has_CoordinateReferenceSystem rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesCRS_Property">
      <gml:hasincludesCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CompoundCRS_Property">
      <gml:hasCompoundCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesEllipsoidalCS_Property">
      <gml:hasusesEllipsoidalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesGeodeticDatum_Property">
      <gml:hasusesGeodeticDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeographicCRS_Property">
      <gml:hasGeographicCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesVerticalCS_Property">
      <gml:hasusesVerticalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesVerticalDatum_Property">
      <gml:hasusesVerticalDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCRS_Property">
      <gml:hasVerticalCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesCartesianCS_Property">
      <gml:hasusesCartesianCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesSphericalCS_Property">
      <gml:hasusesSphericalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeocentricCRS_Property">
      <gml:hasGeocentricCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:baseCRS_Property">
      <gml:hasbaseCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:definedByConversion_Property">
      <gml:hasdefinedByConversion rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ProjectedCRS_Property">
      <gml:hasProjectedCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:derivedCRSType_Property">
      <gml:hasderivedCRSType rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesCS_Property">
      <gml:hasusesCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:DerivedCRS_Property">
      <gml:hasDerivedCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesEngineeringDatum_Property">
      <gml:hasusesEngineeringDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringCRS_Property">
      <gml:hasEngineeringCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesObliqueCartesianCS_Property">
      <gml:hasusesObliqueCartesianCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesImageDatum_Property">
      <gml:hasusesImageDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ImageCRS_Property">
      <gml:hasImageCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesTemporalCS_Property">
      <gml:hasusesTemporalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesTemporalDatum_Property">
      <gml:hasusesTemporalDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCRS_Property">
      <gml:hasTemporalCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:axisID_Property">
      <gml:hasaxisID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:remarks_Property">
      <gml:hasremarks rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:axisAbbrev_Property">
      <gml:hasaxisAbbrev rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:axisDirection_Property">
      <gml:hasaxisDirection rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CoordinateSystemAxis_Property">
      <gml:hasCoordinateSystemAxis rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:csName_Property">
      <gml:hascsName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:csID_Property">
      <gml:hascsID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesAxis_Property">
      <gml:hasusesAxis rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CoordinateSystem_Property">
      <gml:has_CoordinateSystem rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:EllipsoidalCS_Property">
      <gml:hasEllipsoidalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CartesianCS_Property">
      <gml:hasCartesianCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:VerticalCS_Property">
      <gml:hasVerticalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TemporalCS_Property">
      <gml:hasTemporalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LinearCS_Property">
      <gml:hasLinearCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:UserDefinedCS_Property">
      <gml:hasUserDefinedCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:SphericalCS_Property">
      <gml:hasSphericalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PolarCS_Property">
      <gml:hasPolarCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CylindricalCS_Property">
      <gml:hasCylindricalCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ObliqueCartesianCS_Property">
      <gml:hasObliqueCartesianCS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:srsName_Property">
      <gml:hassrsName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:srsName>
         <xsl:value-of select="./@gml:srsName"/>
      </gml:srsName>
   </xsl:template>
   <xsl:template name="gml:srsID_Property">
      <gml:hassrsID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:validArea_Property">
      <gml:hasvalidArea rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:scope_Property">
      <gml:hasscope rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_ReferenceSystem_Property">
      <gml:has_ReferenceSystem rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CRS_Property">
      <gml:has_CRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:version_Property">
      <gml:hasversion rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:boundingBox_Property">
      <gml:hasboundingBox rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:boundingPolygon_Property">
      <gml:hasboundingPolygon rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:verticalExtent_Property">
      <gml:hasverticalExtent rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:temporalExtent_Property">
      <gml:hastemporalExtent rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:datumName_Property">
      <gml:hasdatumName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:datumID_Property">
      <gml:hasdatumID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:anchorPoint_Property">
      <gml:hasanchorPoint rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:realizationEpoch_Property">
      <gml:hasrealizationEpoch rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Datum_Property">
      <gml:has_Datum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:EngineeringDatum_Property">
      <gml:hasEngineeringDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:pixelInCell_Property">
      <gml:haspixelInCell rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ImageDatum_Property">
      <gml:hasImageDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:verticalDatumType_Property">
      <gml:hasverticalDatumType rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:VerticalDatum_Property">
      <gml:hasVerticalDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TemporalDatum_Property">
      <gml:hasTemporalDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesPrimeMeridian_Property">
      <gml:hasusesPrimeMeridian rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesEllipsoid_Property">
      <gml:hasusesEllipsoid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeodeticDatum_Property">
      <gml:hasGeodeticDatum rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:meridianName_Property">
      <gml:hasmeridianName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:meridianID_Property">
      <gml:hasmeridianID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:greenwichLongitude_Property">
      <gml:hasgreenwichLongitude rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PrimeMeridian_Property">
      <gml:hasPrimeMeridian rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ellipsoidName_Property">
      <gml:hasellipsoidName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ellipsoidID_Property">
      <gml:hasellipsoidID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:semiMajorAxis_Property">
      <gml:hassemiMajorAxis rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:secondDefiningParameter_Property">
      <gml:hassecondDefiningParameter rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Ellipsoid_Property">
      <gml:hasEllipsoid rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:inverseFlattening_Property">
      <gml:hasinverseFlattening rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:semiMinorAxis_Property">
      <gml:hassemiMinorAxis rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:isSphere_Property">
      <gml:hasisSphere rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationName_Property">
      <gml:hascoordinateOperationName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:coordinateOperationID_Property">
      <gml:hascoordinateOperationID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:operationVersion_Property">
      <gml:hasoperationVersion rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_positionalAccuracy_Property">
      <gml:has_positionalAccuracy rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:sourceCRS_Property">
      <gml:hassourceCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:targetCRS_Property">
      <gml:hastargetCRS rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_CoordinateOperation_Property">
      <gml:has_CoordinateOperation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesSingleOperation_Property">
      <gml:hasusesSingleOperation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:ConcatenatedOperation_Property">
      <gml:hasConcatenatedOperation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_SingleOperation_Property">
      <gml:has_SingleOperation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:modifiedCoordinate_Property">
      <gml:hasmodifiedCoordinate rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesOperation_Property">
      <gml:hasusesOperation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:PassThroughOperation_Property">
      <gml:hasPassThroughOperation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_Operation_Property">
      <gml:has_Operation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeneralConversion_Property">
      <gml:has_GeneralConversion rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesMethod_Property">
      <gml:hasusesMethod rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesValue_Property">
      <gml:hasusesValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Conversion_Property">
      <gml:hasConversion rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeneralTransformation_Property">
      <gml:has_GeneralTransformation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:Transformation_Property">
      <gml:hasTransformation rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:dmsAngleValue_Property">
      <gml:hasdmsAngleValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:stringValue_Property">
      <gml:hasstringValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:integerValue_Property">
      <gml:hasintegerValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:booleanValue_Property">
      <gml:hasbooleanValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueList_Property">
      <gml:hasvalueList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:integerValueList_Property">
      <gml:hasintegerValueList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueFile_Property">
      <gml:hasvalueFile rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valueOfParameter_Property">
      <gml:hasvalueOfParameter rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesValue_Property">
      <gml:hasincludesValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:valuesOfGroup_Property">
      <gml:hasvaluesOfGroup rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:methodName_Property">
      <gml:hasmethodName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:methodID_Property">
      <gml:hasmethodID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:methodFormula_Property">
      <gml:hasmethodFormula rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:sourceDimensions_Property">
      <gml:hassourceDimensions rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:targetDimensions_Property">
      <gml:hastargetDimensions rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:usesParameter_Property">
      <gml:hasusesParameter rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:OperationMethod_Property">
      <gml:hasOperationMethod rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:minimumOccurs_Property">
      <gml:hasminimumOccurs rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:_GeneralOperationParameter_Property">
      <gml:has_GeneralOperationParameter rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:parameterName_Property">
      <gml:hasparameterName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:parameterID_Property">
      <gml:hasparameterID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameter_Property">
      <gml:hasOperationParameter rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:groupName_Property">
      <gml:hasgroupName rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:groupID_Property">
      <gml:hasgroupID rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:maximumOccurs_Property">
      <gml:hasmaximumOccurs rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesParameter_Property">
      <gml:hasincludesParameter rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:OperationParameterGroup_Property">
      <gml:hasOperationParameterGroup rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:measureDescription_Property">
      <gml:hasmeasureDescription rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:result_Property">
      <gml:hasresult rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:unitOfMeasure_Property">
      <gml:hasunitOfMeasure rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:includesElement_Property">
      <gml:hasincludesElement rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:rowIndex_Property">
      <gml:hasrowIndex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:columnIndex_Property">
      <gml:hascolumnIndex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:covariance_Property">
      <gml:hascovariance rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:using_Property">
      <gml:hasusing rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:target_Property">
      <gml:hastarget rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:resultOf_Property">
      <gml:hasresultOf rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:direction_Property">
      <gml:hasdirection rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   <gml:direction>
         <xsl:value-of select="./@gml:direction"/>
      </gml:direction>
   </xsl:template>
   <xsl:template match="//gml:distance">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:MeasureType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:distance"/>
         <xsl:call-template name="gml:MeasureType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:_Style_Property">
      <gml:has_Style rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureStyle_Property">
      <gml:hasfeatureStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:graphStyle_Property">
      <gml:hasgraphStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:FeatureStyle_Property">
      <gml:hasFeatureStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:featureConstraint_Property">
      <gml:featureConstraint>
         <xsl:value-of select="text()"/>
      </gml:featureConstraint>
   </xsl:template>
   <xsl:template name="gml:geometryStyle_Property">
      <gml:hasgeometryStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:topologyStyle_Property">
      <gml:hastopologyStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:labelStyle_Property">
      <gml:haslabelStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:spatialResolution_Property">
      <gml:spatialResolution rdf:resource="{concat( 'gml:ScaleType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:spatialResolution">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:ScaleType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:spatialResolution"/>
         <xsl:call-template name="gml:ScaleType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:styleVariation_Property">
      <gml:styleVariation rdf:resource="{concat( 'gml:StyleVariationType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:styleVariation">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:StyleVariationType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:styleVariation"/>
         <xsl:call-template name="gml:StyleVariationType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="smil20:animate_Property">
      <smil20:hasanimate rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="smil20:animateMotion_Property">
      <smil20:hasanimateMotion rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="smil20:animateColor_Property">
      <smil20:hasanimateColor rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="smil20:set_Property">
      <smil20:hasset rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:GeometryStyle_Property">
      <gml:hasGeometryStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:symbol_Property">
      <gml:hassymbol rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:style_Property">
      <gml:style>
         <xsl:value-of select="text()"/>
      </gml:style>
   </xsl:template>
   <xsl:template name="gml:TopologyStyle_Property">
      <gml:hasTopologyStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:LabelStyle_Property">
      <gml:hasLabelStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:label_Property">
      <gml:label rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:GraphStyle_Property">
      <gml:hasGraphStyle rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
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
      <gml:graphType rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:drawingType_Property">
      <gml:drawingType rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:lineType_Property">
      <gml:lineType rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:aestheticCriteria_Property">
      <gml:aestheticCriteria rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:LabelExpression_Property">
      <gml:LabelExpression>
         <xsl:value-of select="text()"/>
      </gml:LabelExpression>
   </xsl:template>
   <xsl:template name="gml:domainOfValidity_Property">
      <gml:domainOfValidity>
         <xsl:value-of select="text()"/>
      </gml:domainOfValidity>
   </xsl:template>
   <xsl:template name="gml:originPosition_Property">
      <gml:originPosition rdf:resource="{concat( 'gml:TimePositionType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:originPosition">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:TimePositionType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:originPosition"/>
         <xsl:call-template name="gml:TimePositionType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:interval_Property">
      <gml:interval rdf:resource="{concat( 'gml:TimeIntervalLengthType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:interval">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:TimeIntervalLengthType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:interval"/>
         <xsl:call-template name="gml:TimeIntervalLengthType_Template"/>
      </owl:NamedIndividual>
   </xsl:template>
   <xsl:template name="gml:component_Property">
      <gml:component rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:start_Property">
      <gml:start rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:extent_Property">
      <gml:extent rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:group_Property">
      <gml:group rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeOrdinalEra_Property">
      <gml:hasTimeOrdinalEra rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:referenceFrame_Property">
      <gml:referenceFrame rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendar_Property">
      <gml:hasTimeCalendar rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:referenceEvent_Property">
      <gml:referenceEvent rdf:resource="{concat( 'gml:StringOrRefType', '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:referenceEvent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:StringOrRefType', '_', generate-id() )}">
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
      <gml:epochOfUse rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeCalendarEra_Property">
      <gml:hasTimeCalendarEra rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template match="//gml:referenceEvent">
      <owl:NamedIndividual xmlns:liris="https://liris.cnrs.fr/ontologies#" rdf:ID="{concat( 'gml:StringOrRefType', '_', generate-id() )}">
         <rdf:type rdf:resource="gml:referenceEvent"/>
         <xsl:call-template name="gml:StringOrRefType_Template"/>
      </owl:NamedIndividual>
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
      <gml:dateBasis rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeClock_Property">
      <gml:hasTimeClock rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:primitive_Property">
      <gml:primitive rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeTopologyComplex_Property">
      <gml:hasTimeTopologyComplex rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:complex_Property">
      <gml:complex rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:_TimeTopologyPrimitive_Property">
      <gml:has_TimeTopologyPrimitive rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:previousEdge_Property">
      <gml:previousEdge rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:nextEdge_Property">
      <gml:nextEdge rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:position_Property">
      <gml:position rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeNode_Property">
      <gml:hasTimeNode rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:TimeEdge_Property">
      <gml:hasTimeEdge rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:history_Property">
      <gml:hashistory rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:duration_Property">
      <gml:hasduration rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:timeInterval_Property">
      <gml:hastimeInterval rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:row_Property">
      <gml:row rdf:resource="{if (./*/@gml:id) then ./*/@gml:id else concat( local-name(./*), '_', generate-id(./*) )}"/>
   </xsl:template>
   <xsl:template name="gml:CompositeValue_Property">
      <gml:hasCompositeValue rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:BooleanList_Property">
      <gml:hasBooleanList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CategoryList_Property">
      <gml:hasCategoryList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:QuantityList_Property">
      <gml:hasQuantityList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CountList_Property">
      <gml:hasCountList rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CategoryExtent_Property">
      <gml:hasCategoryExtent rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:QuantityExtent_Property">
      <gml:hasQuantityExtent rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
   </xsl:template>
   <xsl:template name="gml:CountExtent_Property">
      <gml:hasCountExtent rdf:resource="{if (@gml:id) then @gml:id else concat( local-name(), '_', generate-id() )}"/>
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
   <xsl:template name="gml:uom_Property">
      <gml:uom>
         <xsl:value-of select="./@gml:uom"/>
      </gml:uom>
   </xsl:template>
   <xsl:template name="gml:exponent_Property">
      <gml:exponent>
         <xsl:value-of select="./@gml:exponent"/>
      </gml:exponent>
   </xsl:template>
   <xsl:template name="gml:id_Property">
      <gml:id>
         <xsl:value-of select="./@gml:id"/>
      </gml:id>
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
   </xsl:template>
   <xsl:template name="gml:codeSpace_Property">
      <gml:codeSpace>
         <xsl:value-of select="./@gml:codeSpace"/>
      </gml:codeSpace>
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
   <xsl:template name="gml:dynamicProperties_Template">
      <xsl:for-each select="./gml:validTime">
         <xsl:call-template name="gml:validTime_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:history">
         <xsl:call-template name="gml:history_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:track">
         <xsl:call-template name="gml:track_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:dataSource">
         <xsl:call-template name="gml:dataSource_Property"/>
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
   <xsl:template name="gml:StandardDefinitionProperties_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:csName">
         <xsl:call-template name="gml:csName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:meridianName">
         <xsl:call-template name="gml:meridianName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ellipsoidName">
         <xsl:call-template name="gml:ellipsoidName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodName">
         <xsl:call-template name="gml:methodName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:parameterName">
         <xsl:call-template name="gml:parameterName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:groupName">
         <xsl:call-template name="gml:groupName_Substitution"/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="gml:StandardObjectProperties_Template">
      <xsl:for-each select="./gml:metaDataProperty">
         <xsl:call-template name="gml:metaDataProperty_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:description">
         <xsl:call-template name="gml:description_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:name">
         <xsl:call-template name="gml:name_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:csName">
         <xsl:call-template name="gml:csName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:srsName">
         <xsl:call-template name="gml:srsName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:datumName">
         <xsl:call-template name="gml:datumName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:meridianName">
         <xsl:call-template name="gml:meridianName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ellipsoidName">
         <xsl:call-template name="gml:ellipsoidName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:coordinateOperationName">
         <xsl:call-template name="gml:coordinateOperationName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:methodName">
         <xsl:call-template name="gml:methodName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:parameterName">
         <xsl:call-template name="gml:parameterName_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:groupName">
         <xsl:call-template name="gml:groupName_Substitution"/>
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
   <xsl:template name="gml:Value_Template">
      <xsl:for-each select="./gml:_Object">
         <xsl:call-template name="gml:_Object_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GML">
         <xsl:call-template name="gml:_GML_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:ImplicitGeometry">
         <xsl:call-template name="core:ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeSlice">
         <xsl:call-template name="gml:_TimeSlice_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MovingObjectStatus">
         <xsl:call-template name="gml:MovingObjectStatus_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Feature">
         <xsl:call-template name="gml:_Feature_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_CityObject">
         <xsl:call-template name="core:_CityObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:_Site">
         <xsl:call-template name="core:_Site_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_AbstractBuilding">
         <xsl:call-template name="bldg:_AbstractBuilding_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Building">
         <xsl:call-template name="bldg:Building_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingPart">
         <xsl:call-template name="bldg:BuildingPart_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingInstallation">
         <xsl:call-template name="bldg:BuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:IntBuildingInstallation">
         <xsl:call-template name="bldg:IntBuildingInstallation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_BoundarySurface">
         <xsl:call-template name="bldg:_BoundarySurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:RoofSurface">
         <xsl:call-template name="bldg:RoofSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:WallSurface">
         <xsl:call-template name="bldg:WallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:GroundSurface">
         <xsl:call-template name="bldg:GroundSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:ClosureSurface">
         <xsl:call-template name="bldg:ClosureSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:FloorSurface">
         <xsl:call-template name="bldg:FloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterFloorSurface">
         <xsl:call-template name="bldg:OuterFloorSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:InteriorWallSurface">
         <xsl:call-template name="bldg:InteriorWallSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:CeilingSurface">
         <xsl:call-template name="bldg:CeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:OuterCeilingSurface">
         <xsl:call-template name="bldg:OuterCeilingSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:_Opening">
         <xsl:call-template name="bldg:_Opening_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Window">
         <xsl:call-template name="bldg:Window_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Door">
         <xsl:call-template name="bldg:Door_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:Room">
         <xsl:call-template name="bldg:Room_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./bldg:BuildingFurniture">
         <xsl:call-template name="bldg:BuildingFurniture_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:Address">
         <xsl:call-template name="core:Address_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_FeatureCollection">
         <xsl:call-template name="gml:_FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./core:CityModel">
         <xsl:call-template name="core:CityModel_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureCollection">
         <xsl:call-template name="gml:FeatureCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Coverage">
         <xsl:call-template name="gml:_Coverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ContinuousCoverage">
         <xsl:call-template name="gml:_ContinuousCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_DiscreteCoverage">
         <xsl:call-template name="gml:_DiscreteCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPointCoverage">
         <xsl:call-template name="gml:MultiPointCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurveCoverage">
         <xsl:call-template name="gml:MultiCurveCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurfaceCoverage">
         <xsl:call-template name="gml:MultiSurfaceCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolidCoverage">
         <xsl:call-template name="gml:MultiSolidCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GridCoverage">
         <xsl:call-template name="gml:GridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGridCoverage">
         <xsl:call-template name="gml:RectifiedGridCoverage_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Observation">
         <xsl:call-template name="gml:Observation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservation">
         <xsl:call-template name="gml:DirectedObservation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DirectedObservationAtDistance">
         <xsl:call-template name="gml:DirectedObservationAtDistance_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Geometry">
         <xsl:call-template name="gml:_Geometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Ring">
         <xsl:call-template name="gml:_Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearRing">
         <xsl:call-template name="gml:LinearRing_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ring">
         <xsl:call-template name="gml:Ring_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricPrimitive">
         <xsl:call-template name="gml:_GeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Surface">
         <xsl:call-template name="gml:_Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Polygon">
         <xsl:call-template name="gml:Polygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSurface">
         <xsl:call-template name="gml:CompositeSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Surface">
         <xsl:call-template name="gml:Surface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolyhedralSurface">
         <xsl:call-template name="gml:PolyhedralSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TriangulatedSurface">
         <xsl:call-template name="gml:TriangulatedSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Tin">
         <xsl:call-template name="gml:Tin_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableSurface">
         <xsl:call-template name="gml:OrientableSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Point">
         <xsl:call-template name="gml:Point_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Curve">
         <xsl:call-template name="gml:_Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LineString">
         <xsl:call-template name="gml:LineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeCurve">
         <xsl:call-template name="gml:CompositeCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Curve">
         <xsl:call-template name="gml:Curve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OrientableCurve">
         <xsl:call-template name="gml:OrientableCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Solid">
         <xsl:call-template name="gml:_Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompositeSolid">
         <xsl:call-template name="gml:CompositeSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Solid">
         <xsl:call-template name="gml:Solid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometricComplex">
         <xsl:call-template name="gml:GeometricComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeometricAggregate">
         <xsl:call-template name="gml:_GeometricAggregate_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiGeometry">
         <xsl:call-template name="gml:MultiGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPoint">
         <xsl:call-template name="gml:MultiPoint_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiCurve">
         <xsl:call-template name="gml:MultiCurve_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSurface">
         <xsl:call-template name="gml:MultiSurface_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiSolid">
         <xsl:call-template name="gml:MultiSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiPolygon">
         <xsl:call-template name="gml:MultiPolygon_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:MultiLineString">
         <xsl:call-template name="gml:MultiLineString_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ImplicitGeometry">
         <xsl:call-template name="gml:_ImplicitGeometry_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Grid">
         <xsl:call-template name="gml:Grid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:RectifiedGrid">
         <xsl:call-template name="gml:RectifiedGrid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Definition">
         <xsl:call-template name="gml:Definition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UnitDefinition">
         <xsl:call-template name="gml:UnitDefinition_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:BaseUnit">
         <xsl:call-template name="gml:BaseUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedUnit">
         <xsl:call-template name="gml:DerivedUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConventionalUnit">
         <xsl:call-template name="gml:ConventionalUnit_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Dictionary">
         <xsl:call-template name="gml:Dictionary_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionCollection">
         <xsl:call-template name="gml:DefinitionCollection_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DefinitionProxy">
         <xsl:call-template name="gml:DefinitionProxy_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CoordinateSystemAxis">
         <xsl:call-template name="gml:CoordinateSystemAxis_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateSystem">
         <xsl:call-template name="gml:_CoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EllipsoidalCS">
         <xsl:call-template name="gml:EllipsoidalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CartesianCS">
         <xsl:call-template name="gml:CartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCS">
         <xsl:call-template name="gml:VerticalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCS">
         <xsl:call-template name="gml:TemporalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LinearCS">
         <xsl:call-template name="gml:LinearCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:UserDefinedCS">
         <xsl:call-template name="gml:UserDefinedCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:SphericalCS">
         <xsl:call-template name="gml:SphericalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PolarCS">
         <xsl:call-template name="gml:PolarCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CylindricalCS">
         <xsl:call-template name="gml:CylindricalCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ObliqueCartesianCS">
         <xsl:call-template name="gml:ObliqueCartesianCS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_ReferenceSystem">
         <xsl:call-template name="gml:_ReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CRS">
         <xsl:call-template name="gml:_CRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateReferenceSystem">
         <xsl:call-template name="gml:_CoordinateReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeographicCRS">
         <xsl:call-template name="gml:GeographicCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalCRS">
         <xsl:call-template name="gml:VerticalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeocentricCRS">
         <xsl:call-template name="gml:GeocentricCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralDerivedCRS">
         <xsl:call-template name="gml:_GeneralDerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ProjectedCRS">
         <xsl:call-template name="gml:ProjectedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:DerivedCRS">
         <xsl:call-template name="gml:DerivedCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringCRS">
         <xsl:call-template name="gml:EngineeringCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageCRS">
         <xsl:call-template name="gml:ImageCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalCRS">
         <xsl:call-template name="gml:TemporalCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:CompoundCRS">
         <xsl:call-template name="gml:CompoundCRS_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Datum">
         <xsl:call-template name="gml:_Datum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:EngineeringDatum">
         <xsl:call-template name="gml:EngineeringDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ImageDatum">
         <xsl:call-template name="gml:ImageDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:VerticalDatum">
         <xsl:call-template name="gml:VerticalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TemporalDatum">
         <xsl:call-template name="gml:TemporalDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeodeticDatum">
         <xsl:call-template name="gml:GeodeticDatum_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PrimeMeridian">
         <xsl:call-template name="gml:PrimeMeridian_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Ellipsoid">
         <xsl:call-template name="gml:Ellipsoid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_CoordinateOperation">
         <xsl:call-template name="gml:_CoordinateOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ConcatenatedOperation">
         <xsl:call-template name="gml:ConcatenatedOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_SingleOperation">
         <xsl:call-template name="gml:_SingleOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:PassThroughOperation">
         <xsl:call-template name="gml:PassThroughOperation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Operation">
         <xsl:call-template name="gml:_Operation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralConversion">
         <xsl:call-template name="gml:_GeneralConversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Conversion">
         <xsl:call-template name="gml:Conversion_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralTransformation">
         <xsl:call-template name="gml:_GeneralTransformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Transformation">
         <xsl:call-template name="gml:Transformation_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationMethod">
         <xsl:call-template name="gml:OperationMethod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_GeneralOperationParameter">
         <xsl:call-template name="gml:_GeneralOperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameter">
         <xsl:call-template name="gml:OperationParameter_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:OperationParameterGroup">
         <xsl:call-template name="gml:OperationParameterGroup_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeReferenceSystem">
         <xsl:call-template name="gml:_TimeReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCoordinateSystem">
         <xsl:call-template name="gml:TimeCoordinateSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeOrdinalReferenceSystem">
         <xsl:call-template name="gml:TimeOrdinalReferenceSystem_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendar">
         <xsl:call-template name="gml:TimeCalendar_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeClock">
         <xsl:call-template name="gml:TimeClock_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeCalendarEra">
         <xsl:call-template name="gml:TimeCalendarEra_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Bag">
         <xsl:call-template name="gml:Bag_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Array">
         <xsl:call-template name="gml:Array_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeObject">
         <xsl:call-template name="gml:_TimeObject_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimePrimitive">
         <xsl:call-template name="gml:_TimePrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeGeometricPrimitive">
         <xsl:call-template name="gml:_TimeGeometricPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeInstant">
         <xsl:call-template name="gml:TimeInstant_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimePeriod">
         <xsl:call-template name="gml:TimePeriod_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeTopologyPrimitive">
         <xsl:call-template name="gml:_TimeTopologyPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeNode">
         <xsl:call-template name="gml:TimeNode_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeEdge">
         <xsl:call-template name="gml:TimeEdge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TimeComplex">
         <xsl:call-template name="gml:_TimeComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TimeTopologyComplex">
         <xsl:call-template name="gml:TimeTopologyComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Topology">
         <xsl:call-template name="gml:_Topology_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_TopoPrimitive">
         <xsl:call-template name="gml:_TopoPrimitive_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Node">
         <xsl:call-template name="gml:Node_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Edge">
         <xsl:call-template name="gml:Edge_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Face">
         <xsl:call-template name="gml:Face_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoSolid">
         <xsl:call-template name="gml:TopoSolid_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopoComplex">
         <xsl:call-template name="gml:TopoComplex_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_Style">
         <xsl:call-template name="gml:_Style_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Style">
         <xsl:call-template name="gml:Style_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:FeatureStyle">
         <xsl:call-template name="gml:FeatureStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GeometryStyle">
         <xsl:call-template name="gml:GeometryStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:TopologyStyle">
         <xsl:call-template name="gml:TopologyStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:LabelStyle">
         <xsl:call-template name="gml:LabelStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GraphStyle">
         <xsl:call-template name="gml:GraphStyle_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:_MetaData">
         <xsl:call-template name="gml:_MetaData_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:GenericMetaData">
         <xsl:call-template name="gml:GenericMetaData_Substitution"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:Null">
         <xsl:call-template name="gml:Null_Property"/>
      </xsl:for-each>
      <xsl:call-template name="gml:ValueObject_Template"/>
   </xsl:template>
   <xsl:template name="gml:ValueObject_Template">
      <xsl:for-each select="./gml:CompositeValue">
         <xsl:call-template name="gml:CompositeValue_Property"/>
      </xsl:for-each>
      <xsl:for-each select="./gml:ValueArray">
         <xsl:call-template name="gml:ValueArray_Substitution"/>
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
   <xsl:template match="text()">
      <xsl:if test="string(.) = ''"/>
   </xsl:template>
<xsl:template name="gml:_Object_Template"/><xsl:template name="xlink:simpleAttrs_Template"/></xsl:stylesheet>
