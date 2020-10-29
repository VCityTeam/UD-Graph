<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gml="http://www.opengis.net/gml"
  xmlns:core="http://www.opengis.net/citygml/2.0"
  xmlns:app="http://www.opengis.net/citygml/appearance/2.0"
  xmlns:brid="http://www.opengis.net/citygml/bridge/2.0"
  xmlns:bldg="http://www.opengis.net/citygml/building/2.0"
  xmlns:frn="http://www.opengis.net/citygml/cityfurniture/2.0"
  xmlns:grp="http://www.opengis.net/citygml/cityobjectgroup/2.0"
  xmlns:gen="http://www.opengis.net/citygml/generics/2.0"
  xmlns:luse="http://www.opengis.net/citygml/landuse/2.0"
  xmlns:dem="http://www.opengis.net/citygml/relief/2.0"
  xmlns:tran="http://www.opengis.net/citygml/transportation/2.0"
  xmlns:tun="http://www.opengis.net/citygml/tunnel/2.0"
  xmlns:tex="http://www.opengis.net/citygml/texturedsurface/2.0"
  xmlns:veg="http://www.opengis.net/citygml/vegetation/2.0"
  xmlns:wtr="http://www.opengis.net/citygml/waterbody/2.0"
  xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0"
  xmlns:smil20="http://www.w3.org/2001/SMIL20/"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:liris="https://liris.cnrs.fr/ontologies#">
<xsl:output indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- ================================================================================================= -->
<!-- ==================================== Root Transformations ======================================= -->
<!-- ================================================================================================= -->

<xsl:template match="/">
  <xsl:element name="xsl:stylesheet">

    <xsl:attribute name="version">2.0</xsl:attribute>
    <xsl:element name="xsl:output">
      <xsl:attribute name="indent">yes</xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:strip-space">
      <xsl:attribute name="elements">*</xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:variable">
      <xsl:attribute name="name" select="'namespace'"/>
      <xsl:attribute name="select">'https://liris.cnrs.fr/ontologies#'</xsl:attribute>
    </xsl:element>

    <xsl:element name="xsl:template">
      <xsl:attribute name="match">/</xsl:attribute>
      <rdf:RDF>
        <owl:Ontology rdf:about="https://liris.cnrs.fr/ontologies#"/>
        <xsl:element name="xsl:apply-templates">
          <xsl:attribute name="select">//*</xsl:attribute>
        </xsl:element>
      </rdf:RDF>
    </xsl:element>

    <xsl:apply-templates select="//xs:complexType"/>
    <xsl:apply-templates select="//xs:simpleType"/>
    <xsl:apply-templates select="/xs:schema/xs:element"/>
    <xsl:apply-templates select="//xs:element[ancestor::xs:complexType]"/>
    <xsl:apply-templates select="//xs:element[ancestor::xs:group]"/>
    <xsl:apply-templates select="//xs:attribute"/>
    <xsl:apply-templates select="/xs:schema/xs:group"/>
    <xsl:apply-templates select="/xs:schema/xs:attributeGroup"/>

    <xsl:element name="xsl:template">
      <xsl:attribute name="match">text()</xsl:attribute>
      <xsl:element name="xsl:if">
        <xsl:attribute name="test">string(.) = ''</xsl:attribute>
      </xsl:element>
    </xsl:element>

  </xsl:element>
</xsl:template>


<!-- ================================================================================================= -->
<!-- =================================== Element Transformations ===================================== -->
<!-- ================================================================================================= -->

<xsl:template match="xs:schema/xs:element">
  <xsl:variable name="thisType" select="@type"/>
  <xsl:if test="@type = 'xs:anyType'">
    <xsl:element name="xsl:template">
      <xsl:attribute name="name" select="concat( @name, '_Substitution' )"/>
    </xsl:element>
  </xsl:if>
  <xsl:if test="//xs:complexType[@name = $thisType or ../@name = $thisType] or ./xs:complexType">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match" select="concat( '//', @name)"/>
      <owl:NamedIndividual>
        <xsl:attribute name="rdf:ID">{if ( @gml:id ) then @gml:id else concat( local-name(), '_', generate-id() )}</xsl:attribute>
        <rdf:type rdf:resource="{@name}"/>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat( @type, '_Template' )"/>
        </xsl:element>
      </owl:NamedIndividual>
    </xsl:element>
<!--     <xsl:element name="xsl:template">
      <xsl:attribute name="name" select="concat( @name, '_Template' )"/>
      <xsl:if test="@type and not( namespace-uri-from-QName(resolve-QName( string(@type), . )) = 'http://www.w3.org/2001/XMLSchema' )">
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat( @type, '_Template' )"/>
        </xsl:element>
      </xsl:if>
    </xsl:element> -->
  </xsl:if>
  <xsl:if test="//xs:simpleType[@name = $thisType or ../@name = $thisType] or ./xs:simpleType">
    <xsl:element name="xsl:template">
      <xsl:attribute name="name" select="concat( @name, '_Substitution' )"/>
      <xsl:element name="xsl:call-template">
        <xsl:attribute name="name" select="concat( @type, '_Template' )"/>
      </xsl:element>
    </xsl:element>
  </xsl:if>
</xsl:template>


<xsl:template name="substitutionGroup">
  <xsl:param name="name"/>
  <xsl:value-of select="concat( '|./', $name )"/>
  <xsl:for-each select="//xs:element[@substitutionGroup = $name]">
    <xsl:call-template name="substitutionGroup">
      <xsl:with-param name="name" select="@name"/>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>


<!-- ================================================================================================= -->
<!-- ===================================== Type Transformations ====================================== -->
<!-- ================================================================================================= -->

<xsl:template match="xs:complexType|xs:element/xs:complexType">
  <xsl:element name="xsl:template">
    <xsl:attribute name="name" select="concat( if (@name) then @name else ../@name, '_Template' )"/>
    <xsl:for-each select="descendant::xs:element[count(ancestor::xs:complexType) = 1 and count(ancestor::xs:simpleType) = 0]">
      <xsl:variable name="thisName" select="if (@name) then @name else @ref"/>
      <xsl:element name="xsl:for-each">
        <xsl:attribute name="select">
          <xsl:value-of select="concat( './', $thisName )"/>
          <xsl:for-each select="//xs:element[@substitutionGroup = $thisName]">
            <xsl:call-template name="substitutionGroup">
              <xsl:with-param name="name" select="@name"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:attribute>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat($thisName, '_Property')"/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
    <xsl:for-each select="descendant::xs:attribute[count(ancestor::xs:complexType) = 1 and count(ancestor::xs:simpleType) = 0]">
      <xsl:element name="xsl:if">
        <xsl:attribute name="test">@<xsl:value-of select="if (@name) then @name else @ref"/></xsl:attribute>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat(if (@name) then @name else @ref, '_Property')"/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
    <xsl:for-each select="descendant::xs:group[count(ancestor::xs:complexType) = 1]">
      <xsl:element name="xsl:call-template">
        <xsl:attribute name="name" select="concat( if (@name) then @name else @ref, '_Template' )"/>
      </xsl:element>
    </xsl:for-each>
    <xsl:for-each select="descendant::xs:attributeGroup[count(ancestor::xs:complexType) = 1]">
      <xsl:element name="xsl:call-template">
        <xsl:attribute name="name" select="concat( if (@name) then @name else @ref, '_Template' )"/>
      </xsl:element>
    </xsl:for-each>
    <xsl:if test="./xs:complexContent/xs:extension[@base]|
                  ./xs:complexContent/xs:restriction[@base]|
                  ./xs:simpleContent/xs:extension[@base]|
                  ./xs:simpleContent/xs:restriction[@base]|
                  ./xs:extension[@base]|
                  ./xs:restriction[@base]">
      <xsl:variable name="thisBase" select="descendant::*[@base][position() = 1]/@base"/>
      <xsl:choose>
        <xsl:when test="namespace-uri-from-QName(resolve-QName( string($thisBase), . )) = 'http://www.w3.org/2001/XMLSchema' and not( local-name() = 'anyType' )">
          <xsl:element name="xs:has{local-name-from-QName(resolve-QName( string($thisBase), . ))}">
            <xsl:element name="xsl:value-of">
              <xsl:attribute name="select">text()</xsl:attribute>
            </xsl:element>
          </xsl:element>
        </xsl:when>
        <xsl:when test="not( namespace-uri-from-QName(resolve-QName( string($thisBase), . )) = 'http://www.w3.org/2001/XMLSchema' )">
          <xsl:element name="xsl:call-template">
            <xsl:attribute name="name" select="concat( $thisBase, '_Template' )"/>
          </xsl:element>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
  </xsl:element>
</xsl:template>


<xsl:template match="xs:simpleType">
  <xsl:element name="xsl:template">
    <xsl:attribute name="name" select="concat( if (@name) then @name else ../@name, '_Template' )"/>
    <xsl:variable name="thisBase" select="descendant::*[@base][position() = 1]/@base"/>
    <xsl:choose>
      <xsl:when test="./xs:simpleContent/xs:extension[@base]|
                      ./xs:simpleContent/xs:restriction[@base]|
                      ./xs:extension[@base]|
                      ./xs:restriction[@base]">
        <xsl:choose>
          <xsl:when test="namespace-uri-from-QName(resolve-QName( string($thisBase), . )) = 'http://www.w3.org/2001/XMLSchema' and not(local-name() = 'anyType')">
            <xsl:element name="{concat( 'xs:has', tokenize($thisBase, ':')[2] )}">
              <xsl:element name="xsl:value-of">
                <xsl:attribute name="select">text()</xsl:attribute>
              </xsl:element>
            </xsl:element>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="xsl:call-template">
              <xsl:attribute name="name" select="concat( $thisBase, '_Template' )"/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="./xs:list">
        <xsl:element name="{concat( tokenize(@name, ':')[1], ':has', tokenize(@name, ':')[2] )}">
          <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">text()</xsl:attribute>
          </xsl:element>
        </xsl:element>
      </xsl:when>
    </xsl:choose>
  </xsl:element>
</xsl:template>


<!-- ================================================================================================= -->
<!-- ================================== Property Transformations ===================================== -->
<!-- ================================================================================================= -->

<xsl:template match="xs:element[ancestor::xs:complexType]|xs:element[ancestor::xs:group]">
  <xsl:variable name="thisType" select="if (@ref) then @ref else @type"/>
  <xsl:element name="xsl:template">
    <xsl:attribute name="name" select="concat(if (@name) then @name else @ref, '_Property')"/>
    <xsl:element name="{if (@name) then @name else concat( tokenize(@ref, ':')[1], ':has', tokenize(@ref, ':')[2] )}">
      <xsl:choose>
        <xsl:when test="@type and namespace-uri-from-QName(resolve-QName( string(@type), . )) = 'http://www.w3.org/2001/XMLSchema' and not( local-name() = 'anyType' )">
          <xsl:element name="xsl:value-of">
            <xsl:attribute name="select">text()</xsl:attribute>
          </xsl:element>
        </xsl:when>
        <xsl:when test="//xs:complexType[@name = $thisType or ../@name = $thisType]/xs:simpleContent">
          <xsl:attribute name="rdf:resource">{concat( '<xsl:value-of select="$thisType"/>', '_', generate-id() )}</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="rdf:resource">{if (<xsl:value-of select="if (@name) then './*/' else ''"/>@gml:id) then <xsl:value-of select="if (@name) then './*/' else ''"/>@gml:id else concat( local-name(<xsl:value-of select="if (@name) then './*' else ''"/>), '_', generate-id(<xsl:value-of select="if (@name) then './*' else ''"/>) )}</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:element>
  <xsl:if test="//xs:complexType[@name = $thisType or ../@name = $thisType]/xs:simpleContent">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match" select="concat( '//', if (@name) then @name else @ref )"/>
      <owl:NamedIndividual>
        <xsl:attribute name="rdf:ID">{concat( '<xsl:value-of select="$thisType"/>', '_', generate-id() )}</xsl:attribute>
        <rdf:type rdf:resource="{@name}"/>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat( $thisType, '_Template' )"/>
        </xsl:element>
      </owl:NamedIndividual>
    </xsl:element>
  </xsl:if>
</xsl:template>


<xsl:template match="xs:group[@name]">
  <xsl:element name="xsl:template">
    <xsl:attribute name="name" select="concat( @name, '_Template' )"/>
    <xsl:for-each select="descendant::xs:element[count(ancestor::xs:group) = 1]">
      <xsl:variable name="thisName" select="if (@name) then @name else @ref"/>
      <xsl:element name="xsl:for-each">
        <xsl:attribute name="select">
          <xsl:value-of select="concat( './', $thisName )"/>
          <xsl:for-each select="//xs:element[@substitutionGroup = $thisName]">
            <xsl:call-template name="substitutionGroup">
              <xsl:with-param name="name" select="@name"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:attribute>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat($thisName, '_Property')"/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
    <xsl:for-each select="descendant::xs:group[count(ancestor::xs:group) = 1]">
      <xsl:element name="xsl:call-template">
        <xsl:attribute name="name" select="concat( if (@name) then @name else @ref, '_Template' )"/>
      </xsl:element>
    </xsl:for-each>
  </xsl:element>
</xsl:template>


<!-- ================================================================================================= -->
<!-- ================================= Attribute Transformations ===================================== -->
<!-- ================================================================================================= -->

<xsl:template match="xs:attribute">
  <xsl:variable name="thisRef" select="tokenize( @ref,':' )"/>
  <xsl:variable name="thisType" select="@type"/>
  <xsl:element name="xsl:template">
    <xsl:attribute name="name" select="concat(if (@name) then @name else @ref, '_Property')"/>
    <xsl:element name="{if (@name) then @name else concat( $thisRef[1],':has', $thisRef[2])}">
      <xsl:element name="xsl:value-of">
        <xsl:attribute name="select">./@<xsl:value-of select="if (@name) then @name else @ref"/></xsl:attribute>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:template>


<xsl:template match="xs:attributeGroup[@name]">
  <xsl:element name="xsl:template">
    <xsl:attribute name="name" select="concat( @name, '_Template' )"/>
    <xsl:for-each select="descendant::xs:attribute[count(ancestor::xs:attributeGroup) = 1]">
      <xsl:variable name="thisName" select="if (@name) then @name else @ref"/>
      <xsl:element name="xsl:for-each">
        <xsl:attribute name="select">./<xsl:value-of select="$thisName"/></xsl:attribute>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name" select="concat($thisName, '_Property')"/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
    <xsl:for-each select="descendant::xs:attributeGroup[count(ancestor::xs:attributeGroup) = 1]">
      <xsl:element name="xsl:call-template">
        <xsl:attribute name="name" select="concat( if (@name) then @name else @ref, '_Template' )"/>
      </xsl:element>
    </xsl:for-each>
  </xsl:element>
</xsl:template>


<!-- ================================================================================================= -->
<!-- =============================== Miscellaneous Transformations =================================== -->
<!-- ================================================================================================= -->


<!-- Match empty text nodes to nothing -->
<xsl:template match="text()">
    <xsl:if test="string(.) = ''"/>
</xsl:template>

</xsl:stylesheet>