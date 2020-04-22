<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.opengis.net/citygml/2.0/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2000/10/XMLSchema-instance"
                xmlns:imro="http://www.geonovum.nl/imro/2008/1"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:gml="http://www.opengis.net/gml/"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:owl="http://www.w3.org/2002/07/owl#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:gen="http://www.opengis.net/citygml/generics/2.0/"
                xmlns:app="http://www.opengis.net/citygml/appearance/2.0/"
                xmlns:bldg="http://www.opengis.net/citygml/building/2.0/"
                xmlns:brid="http://www.opengis.net/citygml/bridge/2.0/"
                xmlns:core="http://www.opengis.net/citygml/2.0/"
                xmlns:dem="http://www.opengis.net/citygml/relief/2.0/"
                xmlns:luse="http://www.opengis.net/citygml/landuse/2.0/"
                xmlns:tex="http://www.opengis.net/citygml/textures/2.0/"
                xmlns:tran="http://www.opengis.net/citygml/transportation/2.0/"
                xmlns:tun="http://www.opengis.net/citygml/tunnel/2.0/"
                xmlns:veg="http://www.opengis.net/citygml/vegetation/2.0/"
                xmlns:wtr="http://www.opengis.net/citygml/waterbody/2.0/"
                xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0/"
                exclude-result-prefixes="xs"
                version="2.0">

   <xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <!-- root template This template matches the root ("/") of the GML file and includes an apply-templates instructions which causes all elements present in the GML file ("//*") that have an even number of ancestors (the filter count(ancestor::*) mod 2 = 0), to be processed. Those elements that have an even number of ancestors (levels in the XML hierarchy) are the Classes (this follows from the GML Object-property pattern). -->

   <xsl:template match="/">
      <rdf:RDF>
         <xsl:apply-templates select="//*[count(ancestor::*) mod 2 = 0]"/>
      </rdf:RDF>
   </xsl:template>


   <!-- template for features / resources. This template matches all elements that have children and an even number of ancestors: the Classes. These are transformed to rdf:Description. The rdf:about attribute is filled with gml:id if it's present; if not, an id is generated. Attributes (@*) and the properties are then processed (apply-templates). -->
   <xsl:template match="*[count(ancestor::*) mod 2 = 0 and child::*]">
      <rdf:Description rdf:about="{concat('#', if (@*:id) then @*:id else generate-id(.))}" rdf:type="{concat(namespace-uri(), '#', local-name())}">
         <xsl:apply-templates select="@*[not(local-name() = 'id' or local-name() = 'schemaLocation')]"/>
         <xsl:apply-templates/>
      </rdf:Description>
   </xsl:template>

   <!-- template for features / resources. This template matches all elements that have an even number of ancestors: the Classes. These are transformed to rdf:Description. The rdf:about attribute is filled with gml:id if it's present; if not, an id is generated. Attributes (@*) and the properties are then processed (apply-templates). This template is important for avoiding matching even level leaf nodes of only text against default templates -->
   <xsl:template match="*[count(ancestor::*) mod 2 = 0 and not(child::*)]">
      <rdf:Description rdf:about="{concat('#', if (@*:id) then @*:id else generate-id(.))}" rdf:type="{concat(namespace-uri(), '#', local-name())}" rdf:value="{text()}">
         <xsl:apply-templates select="@*[not(local-name() = 'id' or local-name() = 'schemaLocation')]"/>
      </rdf:Description>
   </xsl:template>

   <!-- template for description GML property This template matches the gml:description element and transforms this to rdfs:comment. -->
   <xsl:template match="*:description" priority="1">
      <rdfs:comment>
         <xsl:value-of select="text()"/>
      </rdfs:comment>
   </xsl:template>

   <!-- template for name any name property. This template matches the gml:name element and transforms this to rdfs:label. -->
   <xsl:template match="*:name" priority="1">
      <rdfs:label>
         <xsl:value-of select="text()"/>
      </rdfs:label>
   </xsl:template>

   <!-- catch-all template for all other CityGML attributes except 'id' and 'schemaLocation'. This template matches all attributes @*[not(local-name() = 'id' or local-name() = 'schemaLocation')] and transforms them into an RDF property of the same name and value. If the attribute name does not have an associated namespace, identified by contains(name(),':'), then its parent namespace will be associated with it instead with concat( substring-before(name(parent::*),':'), ':' , local-name() ) -->
   <xsl:template match="@*[not(local-name() = 'id' or local-name() = 'schemaLocation')]">
      <xsl:element name="{if ( contains(name(),':') )
                          then name()
                          else concat( substring-before(name(parent::*),':'), ':' , local-name() )}">
         <xsl:value-of select="."/>
      </xsl:element>
   </xsl:template>

   <!-- template for properties with simple values This template matches all elements (*) that have an uneven number of hierarchy levels/ancestors (ancestor::*) mod 2 != 0) and no further hierarchy levels nested inside (not(child::*)). These are the simple properties with attributes in rare cases. They are transformed to RDF properties. If these properties have attributes, they will be transformed into an rdf:Bag container with the attributes and values nested within. -->
   <xsl:template match="*[count(ancestor::*) mod 2 != 0 and not(child::*)]">
      <xsl:element name="{name()}">
         <xsl:choose>
            <xsl:when test="count(attribute::*) > 0">
               <rdf:Bag>
                  <xsl:element name="rdf:value">
                     <xsl:value-of select="."/>
                  </xsl:element>
                  <xsl:for-each select="@*">
                     <xsl:element name="{if ( contains(name(),':') )
                                         then name()
                                         else concat( substring-before( name(parent::*),':' ), ':' , local-name() )}">
                        <xsl:value-of select="."/>
                     </xsl:element>
                  </xsl:for-each>
               </rdf:Bag>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="text()"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:element>
   </xsl:template>


   <!-- template for properties with nested object as content This template matches all elements (*) that have an uneven number of hierarchy levels/ancestors (ancestor::*) mod 2 != 0) but DO have further hierarchy levels nested inside (child::*). These nested children are GML Objects (as follows from the Object-property pattern) and are therefore transformed to Classes as child of rdf:RDF by the Class Template. This template creates a property for each of these nested Objects (xsl:element name="{parent::*/name()}") and an rdf:resource attribute (xsl:attribute name="rdf:resource") which points to the Class representing the Object either using its gml:id or a generated id (concat('#', if (@gml:id) then @gml:id else generate-id(.))). If the property contains attributes (../@*), they are passed down to the referenced element. If the attribute does not contain a namespace, one is added (if ( contains(name(),':') ) then name() else concat( substring-before(name(parent::*),':'), ':' , local-name() )) -->
   <xsl:template match="*[count(ancestor::*) mod 2 != 0 and child::*]">
      <xsl:for-each select="*">
         <xsl:element name="{parent::*/name()}">
            <xsl:attribute name="rdf:resource" select="concat('#', if (@*:id) then @*:id else generate-id(.))"/>
            <xsl:for-each select="../@*">
               <xsl:attribute name="{if ( contains(name(),':') )
                                     then name()
                                     else concat( substring-before(name(parent::*),':'), ':' , local-name() )}" select="."/>
            </xsl:for-each>
         </xsl:element>
      </xsl:for-each>
   </xsl:template>

   <!-- template for properties with links to other objects This template matches all elements (*) that have an uneven number of hierarchy levels/ancestors (ancestor::*) mod 2 != 0) and contain an xlink reference to another element in the GML file (normalize-space(@xlink:href)). These are transformed to an RDF property with an rdf:resource attribute containing the reference (xsl:attribute name="rdf:resource" select="@xlink:href"). -->
   <xsl:template match="*[count(ancestor::*) mod 2 != 0 and normalize-space(@xlink:href)]" priority="1">
      <xsl:element name="{name()}">
         <xsl:attribute name="rdf:resource" select="@xlink:href"/>
      </xsl:element> 
   </xsl:template>

</xsl:stylesheet>
