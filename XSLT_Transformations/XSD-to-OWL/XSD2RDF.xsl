<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
              xmlns:math="http://www.w3.org/2005/xpath-functions/math"
              xmlns:owl="http://www.w3.org/2002/07/owl#"
              xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
              xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
              xmlns:xs="http://www.w3.org/2001/XMLSchema"
              xmlns:xsd="http://www.w3.org/2001/XMLSchema"
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:variable name="namespace" select="//@targetNamespace"/>

<!-- ================================================================================================= -->
<!-- ==================================== Root Transformations ======================================= -->
<!-- ================================================================================================= -->

<!-- Create ontology elements from import elements and comments. Apply templates
for 1st depth elements, complex types, and simple types. -->
<xsl:template match="/">
  <rdf:RDF>
    <owl:Ontology rdf:about="{$namespace}">
      <xsl:apply-templates select="//xs:include"/>
      <xsl:apply-templates select="//xs:import"/>
      <!-- <xsl:apply-templates select="//xs:include"/> -->
      <xsl:apply-templates select="/xs:schema/xs:annotation"/>
    </owl:Ontology>
    <xsl:apply-templates select="//xs:complexType[@name or ../@name]"/>
    <xsl:apply-templates select="//xs:group[@name]"/>
    <xsl:apply-templates select="//xs:attributeGroup[@name]"/>
    <xsl:apply-templates select="//xs:simpleType[@name or ../@name]"/>
    <xsl:apply-templates select="//xs:attribute"/>
    <xsl:apply-templates select="/xs:schema/xs:element[@name and @type]"/>
    <xsl:apply-templates select="//xs:element[parent::xs:sequence or parent::xs:all or parent::xs:choice]"/>
  </rdf:RDF>
</xsl:template>

<!-- Imports are not handled in this stylesheet (yet). If one is declared, transform it into a warning. -->
<xsl:template match="xs:import|xs:include">
  <owl:imports rdf:resource="{@schemaLocation}"/>
</xsl:template>



<!-- ================================================================================================= -->
<!-- ==================================== Element Transformations ==================================== -->
<!-- ================================================================================================= -->

<!-- Elements are transformed into owl:Class, owl:ObjectProperty, or owl:DatatypeProperty based on whether
element is a child of the root schema or within a type, and if it's type is complex or simple. In addition,
substitutionGroup attributes are also referenced as subClassOf or subPropertyOf resources when applicable. -->

<!-- The elements with type declared outside the element: In order to determine if this element is a
class or property, its type must be evaluated to determine if the element is complex or simple. This
is done by storing the type as a variable (<xsl:variable name="thisType" select="attribute::type"/>)
and searching for it (for example: test="//xs:complexType[attribute::name = $thisType]"). The element's
complex or simple type will be referenced as an rdfs:subClassOf or rdfs:subPropertyOf resource after
transformation. -->
<!-- =========================================== # 15,16,21 =========================================== -->
<xsl:template match="/xs:schema/xs:element[@type]">
  <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
  <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                        else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                             then local-name-from-QName($thisTypeQName)
                                             else @type"/>
  <xsl:choose>
    <xsl:when test="starts-with( $thisType, 'xs:' ) and $thisType != 'xs:anyType'
                    or //xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
      <rdfs:Datatype rdf:about="{concat( $namespace, '#', @name )}">
        <owl:equivalentClass rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
      </rdfs:Datatype>
    </xsl:when>
    <xsl:when test="//xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
      <owl:Class rdf:about="{concat( $namespace, '#', @name )}">
        <xsl:apply-templates select="@substitutionGroup"/>
        <rdfs:subClassOf rdf:resource="{concat( $namespace, '#', $thisType )}"/>
      </owl:Class>
    </xsl:when>
    <xsl:otherwise><!-- Otherwise this element type is declared outside of the schema -->
      <owl:Class rdf:about="{concat( $namespace, '#', @name )}">
        <xsl:apply-templates select="@substitutionGroup"/>
        <rdfs:subClassOf rdf:resource="{$thisType}"/>
        <rdfs:comment>Warning: This class type was declared outside of its original schema. This class may be declared incorrectly.</rdfs:comment>
      </owl:Class>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- ============================================== # 25 ============================================== -->
<!-- substitution group attributes are transformed into subclasses -->
<xsl:template match="@substitutionGroup">
  <rdfs:subClassOf rdf:resource="{if (contains( . , ':' )) then . else concat( $namespace, '#', . )}"/>
</xsl:template>


<!-- The element is a child of a xs:sequence, xs:all, or xs:choice node these elements are converted into
object and data properties. rdfs:domain axioms are set by the respective ancestor element name.
rdfs:range axioms are set by the type attribute -->
<!-- ===================================== # 17,18,22,23,24,29,31 ===================================== -->
<xsl:template match="xs:element[parent::xs:sequence or parent::xs:choice]">
  <xsl:variable name="thisTypeQName" select="if (@type) then resolve-QName( string(@type), . ) else ''"/>
  <xsl:variable name="thisType" select="if (@type and namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                        else if (@type and namespace-uri-from-QName($thisTypeQName) = $namespace)
                                             then local-name-from-QName($thisTypeQName)
                                             else @type"/>
  <xsl:choose>
    <xsl:when test="$thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
      <owl:ObjectProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', $thisType )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="starts-with( $thisType, 'xs:' ) and not( $thisType = 'xs:anyType' )">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{$thisType}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="//xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range rdf:resource="{concat( $namespace, '#', $thisType )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <!-- If the element has a type and it is not an XML primitive, we can assume it is an ObjectProperty -->
    <xsl:when test="@type">
      <owl:ObjectProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="contains( @ref, ':' )">
      <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
      <owl:ObjectProperty rdf:about="{concat( $thisReference[1], ':has', $thisReference[2] )}">
        <rdfs:comment>Warning: This ObjectProperty reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@ref}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:complexType">
      <owl:ObjectProperty rdf:about="{concat( $namespace, '#', 'has', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', @name )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:simpleType">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', 'has', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', @name )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <!-- element has a name and type but the type is declared outside of the schema. -->
    <xsl:otherwise><!-- Otherwise this element has a reference to another element within the schema.
    The referenced element is either a complex or simple type -->
      <xsl:variable name="thisReference" select="@ref"/>
      <xsl:variable name="thisType" select="//xs:element[@name = $thisReference]/@type"/>
      <!-- TODO: check if this type is instatiated correctly. Do we have to qualify the namespace? -->
      <xsl:element name="{if ( $thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisReference] )
                          then 'owl:ObjectProperty'
                          else 'owl:DatatypeProperty'}">
        <xsl:attribute name="rdf:about" select="concat( $namespace, '#', 'has', @ref )"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', @ref )}"/>
      </xsl:element>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- xs:all children should implement the owl:FunctionalProperty type -->
<!-- ============================================== # 30 ============================================== -->
<xsl:template match="xs:element[parent::xs:all]">
  <xsl:variable name="thisTypeQName" select="if (@type) then resolve-QName( string(@type), . ) else ''"/>
  <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                        else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                             then local-name-from-QName($thisTypeQName)
                                             else @type"/>
  <xsl:choose>
    <xsl:when test="$thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
      <owl:ObjectProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', $thisType )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="starts-with( $thisType, 'xs:' ) and not( $thisType = 'xs:anyType' )">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{$thisType}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="//xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', $thisType )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="contains( $thisType, ':' )">
      <owl:ObjectProperty rdf:about="{concat( $namespace, '#', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{$thisType}"/>
        <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="contains( @ref, ':' )">
      <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
      <owl:ObjectProperty rdf:about="{concat( $thisReference[1], ':has', $thisReference[2] )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@ref}"/>
        <rdfs:comment>Warning: This ObjectProperty reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:complexType">
      <owl:ObjectProperty rdf:about="{concat( $namespace, '#', 'has', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', @name )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:simpleType">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', 'has', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, '#', @name )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:otherwise><!-- Otherwise this element has a reference to another element within the schema.
    The referenced element is either a complex or simple type -->
      <xsl:variable name="thisReference" select="@ref"/>
      <xsl:variable name="thisType" select="//xs:element[@name = $thisReference]/@type"/>
      <xsl:element name="{if ( $thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisReference] )
                          then 'owl:ObjectProperty'
                          else 'owl:DatatypeProperty'}">
        <xsl:attribute name="rdf:about" select="concat( $namespace, '#', 'has', @ref )"/>
        <rdf:type      rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain   rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range    rdf:resource="{concat( $namespace, '#', @ref )}"/>
      </xsl:element>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>



<!-- ================================================================================================= -->
<!-- ================================== ComplexType Transformations ================================== -->
<!-- ================================================================================================= -->

<!-- These templates match xs:complexTypes and transform them into owl:Classes. If the complex type is
declared at 1st depth, it is transformed in to a class. If not, it must be declared as a child of an
element. In this case, the respective element will call the appropriate templates and only transform
the contents of the type.-->

<!-- # 3. complexType -->
<xsl:template match="xs:complexType">
  <xsl:variable name="thisName" select="if (parent::xs:element) then ../@name else @name"/>
  <owl:Class rdf:about="{concat( $namespace, '#', $thisName )}">
    <xsl:apply-templates select="@abstract"/>
    <xsl:apply-templates select="./xs:annotation|parent::xs:element/xs:annotation"/>
    <xsl:apply-templates select="./xs:sequence|./xs:complexContent/xs:restriction/xs:sequence|./xs:complexContent/xs:extension/xs:sequence"/>
    <xsl:apply-templates select="./xs:all|./xs:complexContent/xs:restriction/xs:all|./xs:complexContent/xs:extension/xs:all"/>
    <xsl:apply-templates select="./xs:choice|./xs:complexContent/xs:restriction/xs:choice|./xs:complexContent/xs:extension/xs:choice"/>
    <xsl:if test="./xs:attribute|./xs:complexContent/xs:restriction/xs:attribute|./xs:complexContent/xs:extension/xs:attribute
      |./xs:simpleContent/xs:extension/xs:attribute|./xs:simpleContent/xs:extension/xs:attribute">
      <xsl:call-template name="complextype-attributes"/>
    </xsl:if>
    <!-- If the class is an extension or restriction, this class is a subclass of or has properties for that class -->
    <!-- =================================== # 6,8,9,10,11,12,13,14 =================================== -->
    <xsl:if test="./xs:simpleContent/xs:restriction[@base]|./xs:complexContent/xs:restriction[@base]|
                  ./xs:simpleContent/xs:extension[@base]|./xs:complexContent/xs:extension[@base]">
      <xsl:call-template name="content-properties">
        <xsl:with-param name="thisName" select="$thisName"/>
      </xsl:call-template>
    </xsl:if>
  </owl:Class>
  <xsl:apply-templates select="./xs:simpleContent"/>
</xsl:template>

<!-- Abstract classes are denoted by an rdfs:comment -->
<xsl:template match="@abstract">
  <rdfs:comment>This is an abstract class</rdfs:comment>
</xsl:template>


<!-- ===================================== # 6,8,9,10,11,12,13,14 ===================================== -->
<xsl:template name="content-properties">
  <xsl:param name="thisName"/>
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(descendant::*[@base][position() = 1]/@base), . )"/>
  <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                        else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                             then local-name-from-QName($thisBaseQName)
                                             else descendant::*[@base][position() = 1]/@base"/>
  <xsl:choose>
    <xsl:when test="./xs:simpleContent/xs:extension and $thisBase != 'xs:anyType'">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty     rdf:resource="{concat( $namespace, '#', 'has', local-name-from-QName($thisBaseQName) )}"/>
          <owl:someValuesFrom rdf:resource="{if (contains( $thisBase, ':' )) then $thisBase else concat( $namespace, '#', $thisBase )}"/>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:when>
    <xsl:when test="./xs:simpleContent/xs:restriction and $thisBase != 'xs:anyType'">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty     rdf:resource="{concat( $namespace, '#', 'has', $thisName, 'Datatype' )}"/>
          <owl:someValuesFrom rdf:resource="{concat( $namespace, '#', $thisName, 'Datatype' )}"/>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:when>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="//xs:complexType[@name = $thisBase] or //xs:element[@name = $thisBase and xs:complexType]">
      <rdfs:subClassOf rdf:resource="{concat( $namespace, '#', $thisBase )}"/>
    </xsl:when>
    <xsl:when test="//xs:element[@name = $thisBase and @type]">
      <xsl:variable name="thisType" select="//xs:element[@name = $thisBase]/@type"/>
      <xsl:if test="//xs:complexType[@name = $thisType]">
        <rdfs:subClassOf rdf:resource="{concat( $namespace, '#', $thisBase )}"/>
      </xsl:if>
    </xsl:when>
    <xsl:when test="contains( $thisBase, ':') and not(starts-with( $thisBase, 'xs:' )) and
                    namespace-uri-from-QName($thisBaseQName) != $namespace or $thisBase = 'xs:anyType'">
      <rdfs:subClassOf rdf:resource="{$thisBase}"/>
      <rdfs:comment>Warning: The parent class '<xsl:value-of select="$thisBase"/>' is declared outside of this class' original schema. This class may be declared incorrectly.</rdfs:comment>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="complextype-attributes">
  <rdfs:subClassOf>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:attribute|./xs:simpleContent/xs:restriction/xs:attribute|./xs:simpleContent/xs:extension/xs:attribute|
          ./xs:complexContent/xs:restriction/xs:attribute|./xs:complexContent/xs:extension/xs:attribute">
          <owl:Restriction>
            <xsl:choose>
              <xsl:when test="@name and @type">
                <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
                <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                                      then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                                      else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                           then local-name-from-QName($thisTypeQName)
                                                           else @type"/>
                <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
                <owl:allValuesFrom rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
              </xsl:when>
              <xsl:when test="@name">
                <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
                <owl:allValuesFrom rdf:resource="xs:string"/>
              </xsl:when>
              <xsl:when test="@ref and not(contains( @ref, ':' ))">
                <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @ref )}"/>                  
                <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @ref )}"/>
              </xsl:when>
              <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
                <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
                <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                <owl:allValuesFrom rdf:resource="{@ref}"/>
              </xsl:otherwise>
            </xsl:choose>
          </owl:Restriction>
        </xsl:for-each>
      </owl:intersectionOf>
    </owl:Class>
  </rdfs:subClassOf>
</xsl:template>

<!-- xs:simpleContent will always be converted into a datatype property. 'has' is added to the beggining
of the property name to avoid conflicting intersection with it's parent complexType. If it contains
a child xs:restriction a datatype property will also be created with 'Datatype' appended to the name to avoid
conflicting intersections with it's parent complexType. If a @base attribute is declared the resulting
Datatypes and DatatypePropreties will inherit it as a superclass or superproperty. -->
<!-- xs:extensions are transformed into datatype properties with 'has' appended to
the name. The extension is declared as a datatype property as well and as the superclass of the initial
datatype property. Note that 'ancestor::*[@name][last()]/@name' is used to determine the name of the
original class. This is required because we cannot assume which parent node contains the @name attribute.
It could be the parent xs:element or xs:complexType. -->
<!-- ============================================ # 6,8,9 ============================================ -->
<xsl:template match="xs:simpleContent[xs:extension]">
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(./xs:extension/@base), . )"/>
  <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                        else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                             then local-name-from-QName($thisBaseQName)
                                             else ./xs:extension/@base"/>
  <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', 'has', local-name-from-QName($thisBaseQName) )}">
    <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range  rdf:resource="{if (contains( $thisBase, ':' )) then $thisBase else concat( $namespace, '#', $thisBase )}"/>
  </owl:DatatypeProperty>
</xsl:template>

<!-- ========================================== # 10,11,12 ========================================== -->
<xsl:template match="xs:simpleContent[xs:restriction]">
  <rdfs:Datatype rdf:about="{concat( $namespace, '#', ancestor::*[@name][last()]/@name, 'Datatype' )}">
    <xsl:apply-templates select="./xs:restriction"/>
  </rdfs:Datatype>
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(./xs:restriction/@base), . )"/>
  <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                        else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                             then local-name-from-QName($thisBaseQName)
                                             else ./xs:restriction/@base"/>
  <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', 'has', ancestor::*[@name][last()]/@name, 'Datatype' )}">
    <xsl:choose>
      <xsl:when test="//xs:simpleType[@name = $thisBase] or //xs:element[@name = $thisBase and xs:simpleType]">
        <rdfs:subPropertyOf rdf:resource="{concat( $namespace, '#', $thisBase )}"/>
      </xsl:when>
      <xsl:when test="//xs:element[@name = $thisBase and @type]">
        <xsl:variable name="thisType" select="//xs:element[@name = $thisBase]/@type"/>
        <xsl:if test="//xs:simpleType[@name = $thisType]">
          <rdfs:subPropertyOf rdf:resource="{concat( $namespace, '#', $thisBase )}"/>
        </xsl:if>
      </xsl:when>
    </xsl:choose>
    <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range  rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name, 'Datatype' )}"/>
  </owl:DatatypeProperty>
</xsl:template>


<!-- ================================================================================================== -->
<!-- =============================== Grouping Component Transformations =============================== -->
<!-- ================================================================================================== -->

<!-- xs:sequences and xs:all transform their children into subclass or subproperty restrictions. --> 
<xsl:template match="xs:sequence[count(child::*) > 0]|xs:all[count(child::*) > 0]">
<!-- TODO: add min/max occurs case when attribute is declared in parent of element -->
  <rdfs:subClassOf>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:element">
          <owl:Restriction>
            <xsl:choose>
              <xsl:when test="@name and @type">
                <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
                <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                                      then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                                      else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                           then local-name-from-QName($thisTypeQName)
                                                           else @type"/>
                <owl:onProperty rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
                <owl:allValuesFrom rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
              </xsl:when>
              <xsl:when test="@name and not(@type)">
                <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @name )}"/>
                <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @name )}"/>
              </xsl:when>
              <xsl:when test="@ref and not(contains( @ref, ':' ))">
                <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @ref )}"/>
                <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @ref )}"/>
              </xsl:when>
              <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
                <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
                <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                <owl:allValuesFrom rdf:resource="{@ref}"/>
              </xsl:otherwise>
            </xsl:choose>
          </owl:Restriction>
          <xsl:if test="@minOccurs or @maxOccurs and @maxOccurs != 'unbounded'">
            <xsl:call-template name="minOccurs-maxOccurs"/>
          </xsl:if>
        </xsl:for-each>
      </owl:intersectionOf>
    </owl:Class>
  </rdfs:subClassOf>
  <xsl:apply-templates select="./xs:choice"/>
  <xsl:apply-templates select="./xs:sequence"/>
  <xsl:apply-templates select="./xs:group[@ref]"/>
</xsl:template>

<!-- ============================================== # 31 ============================================== -->

<xsl:template match="xs:choice[count(child::*) > 0]">
  <!-- TODO add xs:group to choice -->
  <owl:disjointUnionOf rdf:parseType="Collection">
    <xsl:call-template name="choice-child"/>
  </owl:disjointUnionOf>
</xsl:template>

<xsl:template name="choice-child">
  <xsl:for-each select="./xs:element">
    <owl:Restriction>
      <xsl:choose>
        <xsl:when test="@name and @type">
          <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
          <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                                then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                                else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                     then local-name-from-QName($thisTypeQName)
                                                     else @type"/>
          <owl:onProperty     rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
          <owl:someValuesFrom rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
        </xsl:when>
        <xsl:when test="@name and not(@type)">
          <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @name )}"/>
          <owl:someValuesFrom rdf:resource="{concat( $namespace, '#', @name )}"/>
        </xsl:when>
        <xsl:when test="contains( @ref, ':' )">
          <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
          <owl:onProperty     rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
          <owl:someValuesFrom rdf:resource="{@ref}"/>
        </xsl:when>
        <xsl:otherwise><!-- @ref reference is declared in the schema -->
          <owl:onProperty     rdf:resource="{concat( $namespace, '#', 'has', @ref )}"/>
          <owl:someValuesFrom rdf:resource="{concat( $namespace, '#', @ref )}"/>
        </xsl:otherwise>
      </xsl:choose>
    </owl:Restriction>
  </xsl:for-each>
  <xsl:for-each select="./xs:choice">
    <xsl:call-template name="choice-child"/>
  </xsl:for-each>
  <xsl:for-each select="./xs:group">
    <owl:Restriction>
      <xsl:choose>
        <xsl:when test="@name and @type">
          <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
          <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                                then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                                else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                     then local-name-from-QName($thisTypeQName)
                                                     else @type"/>
          <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
          <owl:allValuesFrom rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
        </xsl:when>
        <xsl:when test="@name">
          <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
          <owl:allValuesFrom rdf:resource="xs:string"/>
        </xsl:when>
        <xsl:when test="@ref and not(contains( @ref, ':' ))">
          <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @ref )}"/>                  
          <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @ref )}"/>
        </xsl:when>
        <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
          <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
          <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
          <owl:allValuesFrom rdf:resource="{@ref}"/>
        </xsl:otherwise>
      </xsl:choose>
    </owl:Restriction>
  </xsl:for-each>
  <xsl:for-each select="./xs:sequence">
    <owl:Restriction>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:element">
          <owl:Restriction>
            <xsl:choose>
              <xsl:when test="@name and @type">
                <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
                <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                                      then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                                      else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                           then local-name-from-QName($thisTypeQName)
                                                           else @type"/>
                <owl:onProperty rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
                <owl:allValuesFrom rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
              </xsl:when>
              <xsl:when test="@name and not(@type)">
                <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @name )}"/>
                <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @name )}"/>
              </xsl:when>
              <xsl:when test="@ref and not(contains( @ref, ':' ))">
                <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @ref )}"/>
                <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @ref )}"/>
              </xsl:when>
              <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
                <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
                <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                <owl:allValuesFrom rdf:resource="{@ref}"/>
              </xsl:otherwise>
            </xsl:choose>
          </owl:Restriction>
        </xsl:for-each>
      </owl:intersectionOf>
    </owl:Restriction>
  </xsl:for-each>
</xsl:template>

<!-- ============================================ # 32,34 ============================================ -->
<xsl:template match="xs:group[@name]|xs:attributeGroup[@name]">
  <owl:Class rdf:about="{concat( $namespace, '#', @name )}">
    <xsl:call-template name="group-attributes"/>
    <xsl:apply-templates select="./xs:sequence"/>
    <xsl:apply-templates select="./xs:all"/>
    <xsl:apply-templates select="./xs:choice"/>
    <xsl:apply-templates select="./xs:annotation"/>
  </owl:Class>
</xsl:template>

<!-- ============================================ # 33,35 ============================================ -->
<xsl:template match="xs:group[@ref]|xs:attributeGroup[@ref]">
  <rdfs:subClassOf rdf:resource="{if (contains( @ref, ':' )) then @ref else concat( $namespace, '#', @ref )}"/>
</xsl:template>

<xsl:template name="group-attributes">
  <rdfs:subClassOf>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:attribute">
          <owl:Restriction>
            <xsl:choose>
              <xsl:when test="@name and @type">
                <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
                <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                                      then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                                      else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                           then local-name-from-QName($thisTypeQName)
                                                           else @type"/>
                <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
                <owl:allValuesFrom rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
              </xsl:when>
              <xsl:when test="@name">
                <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, '#', @name )}"/>
                <owl:allValuesFrom rdf:resource="xs:string"/>
              </xsl:when>
              <xsl:when test="@ref and not(contains( @ref, ':' ))">
                <owl:onProperty    rdf:resource="{concat( $namespace, '#', 'has', @ref )}"/>                  
                <owl:allValuesFrom rdf:resource="{concat( $namespace, '#', @ref )}"/>
              </xsl:when>
              <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
                <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
                <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                <owl:allValuesFrom rdf:resource="{@ref}"/>
              </xsl:otherwise>
            </xsl:choose>
          </owl:Restriction>
        </xsl:for-each>
      </owl:intersectionOf>
    </owl:Class>
  </rdfs:subClassOf>
</xsl:template>

<!-- ============================================== # 38 ============================================== -->
<xsl:template name="minOccurs-maxOccurs">
  <owl:Restriction>
    <xsl:choose>
      <xsl:when test="@minOccurs and @maxOccurs and @minOccurs = @maxOccurs">
          <owl:onProperty>
            <xsl:if test="@name">
              <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', @name)"/>
            </xsl:if>
            <xsl:if test="@ref">
              <xsl:variable  name="thisReference" select="tokenize( @ref, ':' )"/>
              <xsl:attribute name="rdf:resource" select="if ( count($thisReference) = 1 ) then concat( $namespace, '#', 'has', $thisReference[1] ) else concat( $thisReference[1], ':has', $thisReference[2] )"/>
            </xsl:if>
          </owl:onProperty>
          <owl:cardinality rdf:datatype="xs:nonNegativeInteger"><xsl:value-of select="@minOccurs"/></owl:cardinality>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="@minOccurs"/>
        <xsl:apply-templates select="@maxOccurs"/>
      </xsl:otherwise>
    </xsl:choose>
  </owl:Restriction>
</xsl:template>

<!-- ============================================== # 36 ============================================== -->
<!-- Cardinality is preserved by transforming xs:minOccurs into owl:minCardinality unless the value is 0 -->
<xsl:template match="@minOccurs">
  <owl:onProperty>
    <xsl:choose>
      <xsl:when test="../@name and ../@type">
        <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', ../@name)"/>
      </xsl:when>
      <xsl:when test="../@name">
        <xsl:variable  name="thisName" select="tokenize( ../@name, ':' )"/>
        <xsl:attribute name="rdf:resource" select="if ( count($thisName) = 1 ) then concat( $namespace, '#', 'has', $thisName[1] ) else concat( $thisName[1], ':has', $thisName[2] )"/>
      </xsl:when>
      <xsl:when test="../@ref">
        <xsl:variable  name="thisReference" select="tokenize( ../@ref, ':' )"/>
        <xsl:attribute name="rdf:resource" select="if ( count($thisReference) = 1 ) then concat( $namespace, '#', 'has', $thisReference[1] ) else concat( $thisReference[1], ':has', $thisReference[2] )"/>
      </xsl:when>
    </xsl:choose>
  </owl:onProperty>
  <owl:minCardinality rdf:datatype="xs:nonNegativeInteger"><xsl:value-of select="."/></owl:minCardinality>
</xsl:template>

<!-- ============================================== # 37 ============================================== -->
<!-- Cardinality is preserved by transforming xs:maxOccurs into owl:maxCardinality unless the value is
unbounded, in which case it is ignored -->
<xsl:template match="@maxOccurs">
  <xsl:if test=". != 'unbounded'">
    <owl:onProperty>
      <xsl:choose>
        <xsl:when test="../@name and ../@type">
          <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', ../@name)"/>
        </xsl:when>
        <xsl:when test="../@name">
          <xsl:variable  name="thisName" select="tokenize( ../@name, ':' )"/>
          <xsl:attribute name="rdf:resource" select="if ( count($thisName) = 1 ) then concat( $namespace, '#', 'has', $thisName[1] ) else concat( $thisName[1], ':has', $thisName[2] )"/>
        </xsl:when>
        <xsl:when test="../@ref">
          <xsl:variable  name="thisReference" select="tokenize( ../@ref, ':' )"/>
          <xsl:attribute name="rdf:resource" select="if ( count($thisReference) = 1 ) then concat( $namespace, '#', 'has', $thisReference[1] ) else concat( $thisReference[1], ':has', $thisReference[2] )"/>
        </xsl:when>
      </xsl:choose>
    </owl:onProperty>
    <owl:minCardinality rdf:datatype="xs:nonNegativeInteger"><xsl:value-of select="."/></owl:minCardinality>
  </xsl:if>
</xsl:template>


<!-- ================================================================================================= -->
<!-- ================================== SimpleType Transformations =================================== -->
<!-- ================================================================================================= -->

<!-- ============================================== # 1 ============================================== -->
<xsl:template match="xs:simpleType[@name and not( parent::xs:element ) and not( parent::xs:attribute )]">
  <rdfs:Datatype rdf:about="{concat( $namespace, '#', @name )}">
    <xsl:apply-templates select="./xs:annotation"/>
    <xsl:apply-templates select="./xs:restriction"/>
    <xsl:apply-templates select="./xs:union"/>
    <xsl:apply-templates select="./xs:list"/>
  </rdfs:Datatype>
</xsl:template>

<!-- ============================================ # 19,20 ============================================ -->
<xsl:template match="xs:simpleType[parent::xs:element or parent::xs:attribute]">
  <rdfs:Datatype rdf:about="{concat( $namespace, '#', ../@name )}">
    <xsl:apply-templates select="./xs:annotation"/>
    <xsl:apply-templates select="./xs:restriction"/>
    <xsl:apply-templates select="./xs:union"/>
    <xsl:apply-templates select="./xs:list"/>
  </rdfs:Datatype>
  <xsl:if test="./xs:restriction">
    <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', 'has', ../@name )}">
      <rdfs:range rdf:resource="{concat( $namespace, '#', ../@name )}"/>
      <xsl:variable name="thisBaseQName" select="resolve-QName( string(./xs:restriction/@base), . )"/>
      <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                            then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                            else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                                 then local-name-from-QName($thisBaseQName)
                                                 else ./xs:restriction/@base"/>
      <xsl:choose>
        <xsl:when test="//xs:simpleType[../@name = $thisBase]">
          <rdfs:subPropertyOf rdf:resource="{concat( $namespace, '#', 'has', $thisBase )}"/>
        </xsl:when>
        <xsl:when test="contains( $thisBase, ':' ) and not(starts-with( $thisBase, 'xs:' ))">
          <xsl:variable name="thisBase" select="tokenize( $thisBase, ':' )"/>
          <rdfs:subPropertyOf rdf:resource="{concat( $thisBase[1], ':has', $thisBase[2] )}"/>
        </xsl:when>
      </xsl:choose>
    </owl:DatatypeProperty>
  </xsl:if>
</xsl:template>

<!-- ============================================== # 2 ============================================== -->
<xsl:template match="xs:union">
  <xsl:choose>
    <xsl:when test="@memberTypes">
      <xsl:variable name="memberTypes" select="tokenize( @memberTypes, ' ' )"/>
      <xsl:variable name="context" select="."/>
      <xsl:for-each select="$memberTypes">
        <xsl:variable name="thisTypeQName" select="resolve-QName( string(.), $context )"/>
        <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                              then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                              else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                   then local-name-from-QName($thisTypeQName)
                                                   else ."/>
        <owl:equivalentClass rdf:resource="{if (contains( $thisType , ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
      </xsl:for-each>
    </xsl:when>
    <xsl:when test="./xs:simpleType">
      <xsl:for-each select="./xs:simpleType">
        <xsl:apply-templates select="./xs:annotation"/>
        <xsl:apply-templates select="./xs:restriction"/>
        <xsl:apply-templates select="./xs:union"/>
        <xsl:apply-templates select="./xs:list"/>
      </xsl:for-each>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<!-- xs:lists are transformed into rdfs:Literals -->
<xsl:template match="xs:list">
  <owl:equivalentClass rdf:resource="xs:string"/>
</xsl:template>

<!-- ============================================== # 4 ============================================== -->
<xsl:template match="xs:restriction[xs:enumeration]">
  <owl:equivalentClass>
    <rdfs:Datatype>
      <owl:oneOf>
        <xsl:variable name="thisBaseQName" select="resolve-QName( string(@base), . )"/>
        <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                              then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                              else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                                   then local-name-from-QName($thisBaseQName)
                                                   else @base"/>
        <xsl:call-template name="enumeration">
          <xsl:with-param name="pos" select="1"/>
          <xsl:with-param name="base" select="$thisBase"/>
        </xsl:call-template>
      </owl:oneOf>
    </rdfs:Datatype>
  </owl:equivalentClass>
</xsl:template>

<xsl:template name="enumeration">
  <xsl:param name="pos"/>
  <xsl:param name="base"/>
  <rdf:Description rdf:type="rdf:List">
    <rdf:first rdf:datatype="{$base}"><xsl:value-of select="./xs:enumeration[position() = $pos]/@value"/></rdf:first>
    <xsl:choose>
      <xsl:when test="$pos = count(./xs:enumeration)">
        <rdf:rest rdf:resource="rdf:nil"/>
      </xsl:when>
      <xsl:otherwise>
        <rdf:rest>
          <xsl:call-template name="enumeration">
            <xsl:with-param name="pos" select="$pos + 1"/>
            <xsl:with-param name="base" select="$base"/>
          </xsl:call-template>
        </rdf:rest>
      </xsl:otherwise>
    </xsl:choose>
  </rdf:Description>
</xsl:template>

<!-- ============================================= # 5,7 ============================================= -->
<xsl:template match="xs:restriction[xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive]">
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(@base), . )"/>
  <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                        else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                             then local-name-from-QName($thisBaseQName)
                                             else @base"/>
  <owl:equivalentClass>
    <rdfs:Datatype>
      <owl:onDatatype rdf:resource="{$thisBase}"/>
      <owl:withRestrictions rdf:parseType="Collection">
        <xsl:for-each select="xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive">
          <rdf:Description>
            <xsl:element name="{concat( 'xs:', local-name())}">
              <xsl:attribute name="rdf:datatype" select="$thisBase"/>
              <xsl:value-of select="@value"/>
            </xsl:element>
          </rdf:Description>
        </xsl:for-each>
      </owl:withRestrictions>
    </rdfs:Datatype>
  </owl:equivalentClass>
</xsl:template>

<xsl:template match="xs:restriction[not(xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive|xs:enumeration) and @base]">
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(@base), . )"/>
  <xsl:variable name="thisBase" select="if (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisBaseQName) )
                                        else if (namespace-uri-from-QName($thisBaseQName) = $namespace)
                                             then local-name-from-QName($thisBaseQName)
                                             else @base"/>
  <xsl:choose>
    <xsl:when test="//xs:complexType[@name = $thisBase]/xs:simpleContent or //xs:element[@name = $thisBase]/xs:complexType/xs:simpleContent">
      <owl:equivalentClass rdf:resource="{concat( $namespace, '#', $thisBase, 'Datatype' )}"/>
    </xsl:when>
    <xsl:when test="//xs:element[@name = $thisBase and @type]">
      <xsl:variable name="thisTypeQName" select="resolve-QName( string(//xs:element[@name = $thisBase and @type]/@type), . )"/>
      <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                            then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                            else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                                 then local-name-from-QName($thisTypeQName)
                                                 else //xs:element[@name = $thisBase and @type]/@type"/>
      <xsl:if test="//xs:complexType[@name = $thisType]/xs:simpleContent or //xs:element[@name = $thisType]/xs:complexType/xs:simpleContent">
        <owl:equivalentClass rdf:resource="{concat( $namespace, '#', $thisType, 'Datatype' )}"/>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <owl:equivalentClass rdf:resource="{if (contains( $thisBase, ':' )) then $thisBase else concat( $namespace, '#', $thisBase )}"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ================================================================================================= -->
<!-- =================================== Attribute Transformations =================================== -->
<!-- ================================================================================================= -->

<!-- ============================================== # 26 ============================================== -->
<xsl:template match="/xs:schema/xs:attribute">
  <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
  <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                        else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                             then local-name-from-QName($thisTypeQName)
                                             else @type"/>
  <xsl:if test="starts-with( $thisType, 'xs:' )">
    <rdfs:Datatype rdf:about="{concat( $namespace, '#', @name )}">
      <xsl:apply-templates select="./xs:annotation"/>
      <owl:equivalentClass rdf:resource="{$thisType}"/>
    </rdfs:Datatype>
  </xsl:if>
</xsl:template>

<!-- ============================================ # 27 ============================================ -->
<xsl:template match="xs:attribute[not(parent::xs:schema) and @name and @type]">
  <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), . )"/>
  <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                        else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                             then local-name-from-QName($thisTypeQName)
                                             else @type"/>
  <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', @name )}">
    <!-- <xsl:apply-templates select="./xs:annotation"/> -->
    <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range rdf:resource="{if (contains( $thisType, ':' )) then $thisType else concat( $namespace, '#', $thisType )}"/>
  </owl:DatatypeProperty>
</xsl:template>

<xsl:template match="xs:attribute[not(parent::xs:schema) and @name and not(@type)]">
  <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', @name )}">
    <!-- <xsl:apply-templates select="./xs:annotation"/> -->
    <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range rdf:resource="xs:string"/>
  </owl:DatatypeProperty>
</xsl:template>

<!-- ============================================ # 28 ============================================ -->
<xsl:template match="xs:attribute[not(parent::xs:schema) and @ref]">
  <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
  <owl:DatatypeProperty rdf:about="{if (contains( @ref, ':')) then concat( $thisReference[1], ':has', $thisReference[2] ) else concat( $namespace, '#', 'has', @ref )}">
    <xsl:apply-templates select="./xs:annotation"/>
    <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range rdf:resource="{if (contains( @ref, ':' )) then @ref else concat( $namespace, '#', @ref )}"/>
  </owl:DatatypeProperty>
</xsl:template>



<!-- ================================================================================================= -->
<!-- ================================= Miscellaneous Transformations ================================= -->
<!-- ================================================================================================= -->

<!-- ============================================ # 39,40 ============================================ -->
<xsl:template match="//xs:annotation">
  <xsl:for-each select="./xs:documentation|./xs:appinfo">
    <xsl:if test="text()">
      <rdfs:comment>
        <xsl:if test="@xml:lang"><xsl:attribute name="xml:lang" select="@xml:lang"/></xsl:if><xsl:value-of select="text()"/>
      </rdfs:comment>
    </xsl:if>
    <xsl:if test="@source">
      <rdfs:seeAlso><xsl:value-of select="@source"/></rdfs:seeAlso>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<!-- Match empty text nodes to nothing -->
<xsl:template match="text()">
    <xsl:if test="string(.) = ''"/>
</xsl:template>


</xsl:stylesheet>