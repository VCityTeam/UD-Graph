<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
              xmlns:math="http://www.w3.org/2005/xpath-functions/math"
              xmlns:owl="http://www.w3.org/2002/07/owl#"
              xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
              xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
              xmlns:xs="http://www.w3.org/2001/XMLSchema"

              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              xmlns:vcity="http://github.com/VCityTeam/UD-Graph#">

<xsl:output indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:variable name="namespace" select="//@targetNamespace"/>

<xsl:function name="vcity:qualifyQName" as="xs:string">
  <xsl:param name="thisQName" as="xs:QName"/>
  <xsl:sequence select="concat( namespace-uri-from-QName($thisQName), '#', local-name-from-QName($thisQName))"/>
</xsl:function>

<xsl:function name="vcity:qualifyHasQName" as="xs:string">
  <xsl:param name="thisQName" as="xs:QName"/>
  <xsl:sequence select="concat( namespace-uri-from-QName($thisQName), '#has', local-name-from-QName($thisQName))"/>
</xsl:function>

<!-- ================================================================================================= -->
<!-- ==================================== Root Transformations ======================================= -->
<!-- ================================================================================================= -->

<!-- Create ontology elements from import elements and comments. Apply templates
for 1st depth elements, complex types, and simple types. -->
<xsl:template match="/">
  <rdf:RDF>
    <owl:Ontology rdf:about="">
      <!-- <xsl:apply-templates select="//xs:include"/>
      <xsl:apply-templates select="//xs:import"/> -->
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

<!-- Imports -->
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
<xsl:template match="/xs:schema/xs:element[@name and @type]">
  <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), /xs:schema )"/>
  <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
  <xsl:variable name="thisType" select="@type"/>
  <xsl:choose>
    <xsl:when test="(namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema' and local-name-from-QName($thisTypeQName) != 'anyType')
                    or //xs:simpleType[@name = $thisType]
                    or //xs:element[xs:simpleType and @name = $thisType]">
      <rdfs:Datatype rdf:about="{vcity:qualifyQName( $thisNameQName )}">
        <owl:equivalentClass rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
      </rdfs:Datatype>
    </xsl:when>
    <xsl:when test="(namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema' and local-name-from-QName($thisTypeQName) != 'anyType')
                    or //xs:complexType[@name = $thisType]
                    or //xs:element[xs:complexType and @name = $thisType]">
      <owl:Class rdf:about="{vcity:qualifyQName( $thisNameQName )}">
        <xsl:apply-templates select="@substitutionGroup"/>
        <rdfs:subClassOf rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
      </owl:Class>
    </xsl:when>
    <xsl:otherwise><!-- Otherwise this element type is declared outside of the schema -->
      <owl:Class rdf:about="{vcity:qualifyQName( $thisNameQName )}">
        <rdfs:comment>Warning: This a type [<xsl:value-of select="@type"/>] was declared outside of its original schema. This class may be declared incorrectly.</rdfs:comment>
        <xsl:apply-templates select="@substitutionGroup"/>
        <rdfs:subClassOf rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
      </owl:Class>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- ============================================== # 25 ============================================== -->
<!-- substitution group attributes are transformed into subclasses -->
<xsl:template match="@substitutionGroup">
  <rdfs:subClassOf rdf:resource="{vcity:qualifyQName(resolve-QName( string(.), /xs:schema ))}"/>
</xsl:template>


<!-- The element is a child of a xs:sequence, xs:all, or xs:choice node these elements are converted into
object and data properties. rdfs:domain axioms are set by the respective ancestor element name.
rdfs:range axioms are set by the type attribute -->
<!-- If the element has a type and it is not an XML primitive, we can assume it is an ObjectProperty -->
<!-- ===================================== # 17,18,22,23,24,29,31 ===================================== -->
<xsl:template match="xs:element[@name and @type and (parent::xs:sequence or parent::xs:choice or parent::xs:all)]">
  <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
  <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), /xs:schema )"/>
  <xsl:variable name="thisType" select="@type"/>
  <xsl:choose>
    <xsl:when test="(namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema' and local-name-from-QName($thisTypeQName) != 'anyType')
                    or //xs:simpleType[@name = $thisType]
                    or //xs:element[xs:simpleType and @name = $thisType]">
      <owl:DatatypeProperty rdf:about="{vcity:qualifyQName( $thisNameQName )}">
        <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
        <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="(namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema' and local-name-from-QName($thisTypeQName) = 'anyType')
                    or //xs:complexType[@name = $thisType]
                    or //xs:element[xs:complexType and @name = $thisType]">
      <owl:ObjectProperty rdf:about="{vcity:qualifyQName( $thisNameQName )}">
        <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
        <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <!-- element has a name and type but the type is declared outside of the schema. -->
    <xsl:otherwise>
      <owl:ObjectProperty rdf:about="{vcity:qualifyQName( $thisNameQName )}">
        <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
        <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
      </owl:ObjectProperty>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="xs:element[@name and ./simpleType and (parent::xs:sequence or parent::xs:choice or parent::xs:all)]">
  <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
  <owl:ObjectProperty rdf:about="{vcity:qualifyHasQName( $thisNameQName )}">
    <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
    <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
  </owl:ObjectProperty>
</xsl:template>

<xsl:template match="xs:element[@name and ./complexType and (parent::xs:sequence or parent::xs:choice)]">
  <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
  <owl:DatatypeProperty rdf:about="{vcity:qualifyHasQName( $thisNameQName )}">
    <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
    <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
  </owl:DatatypeProperty>
</xsl:template>

<xsl:template match="xs:element[@ref and (parent::xs:sequence or parent::xs:choice or parent::xs:all)]">
  <xsl:variable name="thisReference" select="@ref"/>
  <xsl:variable name="thisRefQName" select="resolve-QName( string(@ref), /xs:schema )"/>
  <xsl:choose>
    <xsl:when test="//xs:element[@name = $thisReference and ./simpleType]">
      <owl:DatatypeProperty rdf:about="{vcity:qualifyHasQName( $thisRefQName )}">
        <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
        <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="//xs:element[@name = $thisReference and ./complexType]">
      <owl:ObjectProperty rdf:about="{vcity:qualifyHasQName( $thisRefQName )}">
        <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
        <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="//xs:element[@name = $thisReference and @type]">
      <xsl:variable name="thisType" select="/xs:schema/xs:element[@name = $thisReference and @type]/@type"/>
      <xsl:variable name="thisTypeQName" select="resolve-QName( string($thisType), /xs:schema )"/>
      <xsl:choose>
        <xsl:when test="(namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema' and local-name-from-QName($thisTypeQName) != 'anyType')
                        or //xs:simpleType[@name = $thisType]
                        or //xs:element[xs:simpleType and @name = $thisType]">
          <owl:DatatypeProperty rdf:about="{vcity:qualifyHasQName( $thisRefQName )}">
            <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
            <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
          </owl:DatatypeProperty>
        </xsl:when>
        <xsl:when test="(namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema' and local-name-from-QName($thisTypeQName) = 'anyType')
                        or //xs:complexType[@name = $thisType]
                        or //xs:element[xs:complexType and @name = $thisType]">
          <owl:ObjectProperty rdf:about="{vcity:qualifyHasQName( $thisRefQName )}">
            <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
            <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
          </owl:ObjectProperty>
        </xsl:when>
        <xsl:otherwise>
          <owl:ObjectProperty rdf:about="{vcity:qualifyHasQName( $thisRefQName )}">
            <rdfs:comment>Warning: This ObjectProperty type reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
            <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
            <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
          </owl:ObjectProperty>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <owl:ObjectProperty rdf:about="{vcity:qualifyHasQName( $thisRefQName )}">
        <rdfs:comment>Warning: This ObjectProperty type reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
        <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
      </owl:ObjectProperty>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- xs:all children should implement the owl:FunctionalProperty type -->
<!-- TODO: call functional property template -->
<!-- ============================================== # 30 ============================================== -->
<xsl:template name="isFunctionalProperty">
  <xsl:if test="parent::xs:all">
    <rdf:type rdf:resource="owl:FunctionalProperty"/>
  </xsl:if>
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
  <xsl:variable name="thisNameQName" select="resolve-QName( string($thisName), /xs:schema )"/>
  <owl:Class rdf:about="{vcity:qualifyQName( $thisNameQName )}">
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
  <xsl:param    name="thisName"/>
  <xsl:variable name="thisBase" select="descendant::*[@base][position() = 1]/@base"/>
  <xsl:variable name="thisNameQName" select="resolve-QName( string($thisName), /xs:schema )"/>
  <xsl:variable name="thisBaseQName" select="resolve-QName( string($thisBase), /xs:schema )"/>
  <xsl:choose>
    <xsl:when test="./xs:simpleContent/xs:extension
                    and not (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema'
                             and local-name-from-QName($thisBaseQName) != 'anyType')">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty    rdf:resource="{vcity:qualifyHasQName( $thisBaseQName )}"/>
          <owl:allValuesFrom rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:when>
    <xsl:when test="./xs:simpleContent/xs:restriction
                    and not (namespace-uri-from-QName($thisBaseQName) = 'http://www.w3.org/2001/XMLSchema'
                             and local-name-from-QName($thisBaseQName) != 'anyType')">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty    rdf:resource="{concat( vcity:qualifyHasQName( $thisNameQName ), 'Datatype' )}"/>
          <owl:allValuesFrom rdf:resource="{concat( vcity:qualifyQName( $thisNameQName ), 'Datatype' )}"/>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:when>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="./xs:complexContent and //xs:complexType[@name = $thisBase] or //xs:element[@name = $thisBase and xs:complexType]">
      <rdfs:subClassOf rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
    </xsl:when>
    <xsl:when test="./xs:complexContent and //xs:element[@name = $thisBase and @type]">
      <xsl:variable name="thisType" select="//xs:element[@name = $thisBase and @type]/@type"/>
      <xsl:if test="//xs:complexType[@name = $thisType]">
        <rdfs:subClassOf rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
      </xsl:if>
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
                <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
                <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), /xs:schema )"/>
                <owl:onProperty    rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
                <owl:allValuesFrom rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
              </xsl:when>
              <xsl:when test="@name">
                <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
                <owl:onProperty    rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
                <owl:allValuesFrom rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
              </xsl:when>
              <xsl:when test="@ref">
                <xsl:variable name="thisRefQName" select="resolve-QName( string(@ref), /xs:schema )"/>
                <owl:onProperty    rdf:resource="{vcity:qualifyHasQName( $thisRefQName )}"/>                  
                <owl:allValuesFrom rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
              </xsl:when>
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
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(./xs:extension/@base), /xs:schema )"/>
  <owl:DatatypeProperty rdf:about="{vcity:qualifyHasQName( $thisBaseQName )}">
    <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema ))}"/>
    <rdfs:range  rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
  </owl:DatatypeProperty>
</xsl:template>

<!-- ========================================== # 10,11,12 ========================================== -->
<xsl:template match="xs:simpleContent[xs:restriction]">
  <xsl:variable name="thisNameQName" select="resolve-QName( string( ancestor::*[@name][last()]/@name ), /xs:schema )"/>
  <rdfs:Datatype rdf:about="{concat( vcity:qualifyQName( $thisNameQName ), 'Datatype' )}">
    <xsl:apply-templates select="./xs:restriction"/>
  </rdfs:Datatype>
  <owl:DatatypeProperty rdf:about="{concat( vcity:qualifyHasQName( $thisNameQName ), 'Datatype' )}">
    <xsl:variable name="thisBaseQName" select="resolve-QName( string(./xs:restriction/@base), /xs:schema )"/>
    <xsl:variable name="thisBase" select="./xs:restriction/@base"/>
    <xsl:choose>
      <xsl:when test="//xs:simpleType[@name = $thisBase] or //xs:element[@name = $thisBase and xs:simpleType]">
        <rdfs:subPropertyOf rdf:resource="{vcity:qualifyHasQName( $thisBaseQName )}"/>
      </xsl:when>
      <xsl:when test="//xs:element[@name = $thisBase and @type]">
        <xsl:variable name="thisType" select="//xs:element[@name = $thisBase]/@type"/>
        <xsl:if test="//xs:simpleType[@name = $thisType]">
          <rdfs:subPropertyOf rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
        </xsl:if>
      </xsl:when>
    </xsl:choose>
    <rdfs:domain rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
    <rdfs:range  rdf:resource="{concat( vcity:qualifyQName( $thisNameQName ), 'Datatype' )}"/>
  </owl:DatatypeProperty>
</xsl:template>


<!-- ================================================================================================== -->
<!-- =============================== Grouping Component Transformations =============================== -->
<!-- ================================================================================================== -->

<xsl:template name="aggregate-child">
  <owl:Restriction>
    <xsl:choose>
      <xsl:when test="@name and @type">
        <owl:onProperty     rdf:resource="{vcity:qualifyQName( resolve-QName( string(@name), /xs:schema ) )}"/>
        <owl:allValuesFrom rdf:resource="{vcity:qualifyQName( resolve-QName( string(@type), /xs:schema ) )}"/>
      </xsl:when>
      <xsl:when test="@name">
        <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
        <owl:onProperty     rdf:resource="{vcity:qualifyHasQName( $thisNameQName )}"/>
        <owl:allValuesFrom rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
      </xsl:when>
      <xsl:when test="@ref">
        <xsl:variable name="thisRefQName" select="resolve-QName( string(@ref), /xs:schema )"/>
        <owl:onProperty     rdf:resource="{vcity:qualifyHasQName( $thisRefQName )}"/>
        <owl:allValuesFrom rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
      </xsl:when>
    </xsl:choose>
  </owl:Restriction>
</xsl:template>

<!-- xs:sequences and xs:all transform their children into subclass or subproperty restrictions. --> 
<xsl:template match="xs:sequence[count(child::*) > 0]|xs:all[count(child::*) > 0]">
<!-- TODO: add min/max occurs case when attribute is declared in parent of element -->
  <rdfs:subClassOf>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:element">
          <xsl:call-template name="aggregate-child"/>
          <xsl:if test="(@minOccurs and @minOccurs > 0) or (@maxOccurs and @maxOccurs != 'unbounded')">
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
    <xsl:for-each select="./xs:element|./xs:group">
      <xsl:call-template name="choice-child"/>
    </xsl:for-each>
    <xsl:for-each select="./xs:sequence|./xs:choice">
      <xsl:call-template name="choice-aggregate"/>
    </xsl:for-each>
  </owl:disjointUnionOf>
</xsl:template>

<xsl:template name="choice-child">
  <owl:Restriction>
    <xsl:choose>
      <xsl:when test="@name and @type">
        <owl:onProperty     rdf:resource="{vcity:qualifyQName( resolve-QName( string(@name), /xs:schema ) )}"/>
        <owl:someValuesFrom rdf:resource="{vcity:qualifyQName( resolve-QName( string(@type), /xs:schema ) )}"/>
      </xsl:when>
      <xsl:when test="@name">
        <xsl:variable name="thisNameQName" select="resolve-QName( string(@name), /xs:schema )"/>
        <owl:onProperty     rdf:resource="{vcity:qualifyHasQName( $thisNameQName )}"/>
        <owl:someValuesFrom rdf:resource="{vcity:qualifyQName( $thisNameQName )}"/>
      </xsl:when>
      <xsl:when test="@ref">
        <xsl:variable name="thisRefQName" select="resolve-QName( string(@ref), /xs:schema )"/>
        <owl:onProperty     rdf:resource="{vcity:qualifyHasQName( $thisRefQName )}"/>
        <owl:someValuesFrom rdf:resource="{vcity:qualifyQName( $thisRefQName )}"/>
      </xsl:when>
    </xsl:choose>
  </owl:Restriction>
</xsl:template>

<xsl:template name="choice-aggregate">
  <xsl:for-each select="./xs:choice">
    <xsl:for-each select="./xs:element|./xs:group">
      <xsl:call-template name="choice-child"/>
    </xsl:for-each>
    <xsl:for-each select="./xs:sequence|./xs:choice">
      <xsl:call-template name="choice-aggregate"/>
    </xsl:for-each>
  </xsl:for-each>
  <xsl:for-each select="./xs:sequence">
    <owl:Restriction>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:element|./xs:group">
          <xsl:call-template name="choice-child"/>
        </xsl:for-each>
        <xsl:for-each select="./xs:sequence|./xs:choice">
          <xsl:call-template name="choice-aggregate"/>
        </xsl:for-each>
      </owl:intersectionOf>
    </owl:Restriction>
  </xsl:for-each>
</xsl:template>

<!-- ============================================ # 32,34 ============================================ -->
<xsl:template match="xs:group[@name]|xs:attributeGroup[@name]">
  <owl:Class rdf:about="{vcity:qualifyQName( resolve-QName( string(@name), /xs:schema ) )}">
    <xsl:call-template name="group-attributes"/>
    <xsl:apply-templates select="./xs:sequence"/>
    <xsl:apply-templates select="./xs:all"/>
    <xsl:apply-templates select="./xs:choice"/>
    <xsl:apply-templates select="./xs:annotation"/>
  </owl:Class>
</xsl:template>

<!-- ============================================ # 33,35 ============================================ -->
<xsl:template match="xs:group[@ref]|xs:attributeGroup[@ref]">
  <rdfs:subClassOf rdf:resource="{vcity:qualifyQName( resolve-QName( string(@ref), /xs:schema ) )}"/>
</xsl:template>

<xsl:template name="group-attributes">
  <rdfs:subClassOf>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:attribute">
          <xsl:call-template name="aggregate-child"/>
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
        <xsl:choose>
          <xsl:when test="@name and @type">
            <owl:onProperty rdf:resource="{vcity:qualifyQName(resolve-QName( string(@name), /xs:schema ))}"/>
          </xsl:when>
          <xsl:when test="@name">
            <owl:onProperty rdf:resource="{vcity:qualifyHasQName(resolve-QName( string(@name), /xs:schema ))}"/>
          </xsl:when>
          <xsl:when test="@ref">
            <owl:onProperty rdf:resource="{vcity:qualifyHasQName(resolve-QName( string(@ref), /xs:schema ))}"/>
          </xsl:when>
        </xsl:choose>
        <owl:cardinality rdf:datatype="http://www.w3.org/2001/XMLSchema#nonNegativeInteger"><xsl:value-of select="@minOccurs"/></owl:cardinality>
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
  <xsl:if test=". > 0">
    <xsl:choose>
      <xsl:when test="../@name and ../@type">
        <owl:onProperty rdf:resource="{vcity:qualifyQName(resolve-QName( string(../@name), /xs:schema ))}"/>
      </xsl:when>
      <xsl:when test="../@name">
        <owl:onProperty rdf:resource="{vcity:qualifyHasQName(resolve-QName( string(../@name), /xs:schema ))}"/>
      </xsl:when>
      <xsl:when test="../@ref">
        <owl:onProperty rdf:resource="{vcity:qualifyHasQName(resolve-QName( string(../@ref), /xs:schema ))}"/>
      </xsl:when>
    </xsl:choose>
    <owl:minCardinality rdf:datatype="http://www.w3.org/2001/XMLSchema#nonNegativeInteger"><xsl:value-of select="."/></owl:minCardinality>
  </xsl:if>
</xsl:template>

<!-- ============================================== # 37 ============================================== -->
<!-- Cardinality is preserved by transforming xs:maxOccurs into owl:maxCardinality unless the value is
unbounded, in which case it is ignored -->
<xsl:template match="@maxOccurs">
  <xsl:if test=". != 'unbounded'">
    <xsl:choose>
      <xsl:when test="../@name and ../@type">
        <owl:onProperty rdf:resource="{vcity:qualifyQName(resolve-QName( string(../@name), /xs:schema ))}"/>
      </xsl:when>
      <xsl:when test="../@name">
        <owl:onProperty rdf:resource="{vcity:qualifyHasQName(resolve-QName( string(../@name), /xs:schema ))}"/>
      </xsl:when>
      <xsl:when test="../@ref">
        <owl:onProperty rdf:resource="{vcity:qualifyHasQName(resolve-QName( string(../@ref), /xs:schema ))}"/>
      </xsl:when>
    </xsl:choose>
    <owl:maxCardinality rdf:datatype="http://www.w3.org/2001/XMLSchema#nonNegativeInteger"><xsl:value-of select="."/></owl:maxCardinality>
  </xsl:if>
</xsl:template>


<!-- ================================================================================================= -->
<!-- ================================== SimpleType Transformations =================================== -->
<!-- ================================================================================================= -->

<!-- ============================================== # 1 ============================================== -->
<xsl:template match="xs:simpleType[@name and not( parent::xs:element ) and not( parent::xs:attribute )]">
  <rdfs:Datatype rdf:about="{vcity:qualifyQName(resolve-QName( string(@name), /xs:schema ))}">
    <xsl:apply-templates select="./xs:annotation"/>
    <xsl:apply-templates select="./xs:restriction"/>
    <xsl:apply-templates select="./xs:union"/>
    <xsl:apply-templates select="./xs:list"/>
  </rdfs:Datatype>
</xsl:template>

<!-- ============================================ # 19,20 ============================================ -->
<xsl:template match="xs:simpleType[parent::xs:element or parent::xs:attribute]">
  <rdfs:Datatype rdf:about="{vcity:qualifyQName(resolve-QName( string(../@name), /xs:schema ))}">
    <xsl:apply-templates select="./xs:annotation"/>
    <xsl:apply-templates select="./xs:restriction"/>
    <xsl:apply-templates select="./xs:union"/>
    <xsl:apply-templates select="./xs:list"/>
  </rdfs:Datatype>
  <xsl:if test="./xs:restriction">
    <owl:DatatypeProperty rdf:about="{vcity:qualifyHasQName(resolve-QName( string(../@name), /xs:schema ))}">
      <rdfs:range rdf:resource="{vcity:qualifyQName(resolve-QName( string(../@name), /xs:schema ))}"/>
      <xsl:variable name="thisBaseQName" select="resolve-QName( string(./xs:restriction/@base), . )"/>
      <xsl:variable name="thisBase" select="./xs:restriction/@base"/>
      <xsl:choose>
        <xsl:when test="//xs:simpleType[../@name = $thisBase]">
          <rdfs:subPropertyOf rdf:resource="{vcity:qualifyHasQName( $thisBaseQName )}"/>
        </xsl:when>
        <xsl:when test="namespace-uri-from-QName($thisBaseQName) != 'http://www.w3.org/2001/XMLSchema'">
          <rdfs:subPropertyOf rdf:resource="{vcity:qualifyHasQName( $thisBaseQName )}"/>
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
      <xsl:variable name="context" select="/xs:schema"/>
      <xsl:for-each select="$memberTypes">
        <xsl:variable name="thisTypeQName" select="resolve-QName( string(.), $context )"/>
        <owl:equivalentClass rdf:resource="{vcity:qualifyQName( $thisTypeQName )}"/>
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

<!-- xs:lists are not yet handled  -->
<xsl:template match="xs:list">
  <!-- <owl:equivalentClass rdf:resource="xs:string"/> -->
</xsl:template>

<!-- ============================================== # 4 ============================================== -->
<xsl:template match="xs:restriction[xs:enumeration]">
  <owl:equivalentClass>
    <rdfs:Datatype>
      <owl:oneOf>
        <xsl:variable name="thisBaseQName" select="resolve-QName( string(@base), /xs:schema )"/>
        <xsl:call-template name="enumeration">
          <xsl:with-param name="pos" select="1"/>
          <xsl:with-param name="base" select="vcity:qualifyQName( $thisBaseQName )"/>
        </xsl:call-template>
      </owl:oneOf>
    </rdfs:Datatype>
  </owl:equivalentClass>
</xsl:template>

<xsl:template name="enumeration">
  <xsl:param name="pos"/>
  <xsl:param name="base"/>
  <rdf:Description rdf:type="http://www.w3.org/1999/02/22-rdf-syntax-ns#List">
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
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(@base), /xs:schema )"/>
  <owl:equivalentClass>
    <rdfs:Datatype>
      <owl:onDatatype rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
      <owl:withRestrictions rdf:parseType="Collection">
        <xsl:for-each select="xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive">
          <rdf:Description>
            <xsl:element name="{concat( 'xs:', local-name())}">
              <xsl:attribute name="rdf:datatype" select="vcity:qualifyQName( $thisBaseQName )"/>
              <xsl:value-of select="@value"/>
            </xsl:element>
          </rdf:Description>
        </xsl:for-each>
      </owl:withRestrictions>
    </rdfs:Datatype>
  </owl:equivalentClass>
</xsl:template>

<xsl:template match="xs:restriction[not(xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive|xs:enumeration) and @base]">
  <xsl:variable name="thisBaseQName" select="resolve-QName( string(@base), /xs:schema )"/>
  <xsl:variable name="thisBase" select="@base"/>
  <xsl:choose>
    <xsl:when test="//xs:complexType[@name = $thisBase]/xs:simpleContent or //xs:element[@name = $thisBase]/xs:complexType/xs:simpleContent">
      <owl:equivalentClass rdf:resource="{concat( vcity:qualifyQName( $thisBaseQName ), 'Datatype' )}"/>
    </xsl:when>
    <xsl:when test="//xs:element[@name = $thisBase and @type]">
      <xsl:variable name="thisTypeQName" select="resolve-QName( string(//xs:element[@name = $thisBase and @type]/@type), . )"/>
      <xsl:variable name="thisType" select="//xs:element[@name = $thisBase and @type]/@type"/>
      <xsl:if test="//xs:complexType[@name = $thisType]/xs:simpleContent or //xs:element[@name = $thisType]/xs:complexType/xs:simpleContent">
        <owl:equivalentClass rdf:resource="{concat( vcity:qualifyQName( $thisTypeQName ), 'Datatype' )}"/>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <owl:equivalentClass rdf:resource="{vcity:qualifyQName( $thisBaseQName )}"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ================================================================================================= -->
<!-- =================================== Attribute Transformations =================================== -->
<!-- ================================================================================================= -->

<!-- ============================================== # 26 ============================================== -->
<xsl:template match="/xs:schema/xs:attribute">
  <xsl:variable name="thisTypeQName" select="resolve-QName( string(@type), /xs:schema )"/>
  <xsl:variable name="thisType" select="if (namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema')
                                        then concat( 'xs:', local-name-from-QName($thisTypeQName) )
                                        else if (namespace-uri-from-QName($thisTypeQName) = $namespace)
                                             then local-name-from-QName($thisTypeQName)
                                             else @type"/>
  <xsl:if test="namespace-uri-from-QName($thisTypeQName) = 'http://www.w3.org/2001/XMLSchema'">
    <rdfs:Datatype rdf:about="{vcity:qualifyQName( resolve-QName( string(@name), /xs:schema ) )}">
      <xsl:apply-templates select="./xs:annotation"/>
      <owl:equivalentClass rdf:resource="{vcity:qualifyQName($thisTypeQName)}"/>
    </rdfs:Datatype>
  </xsl:if>
</xsl:template>

<!-- ============================================ # 27 ============================================ -->
<xsl:template match="xs:attribute[not(parent::xs:schema) and @name and @type]">
  <owl:DatatypeProperty rdf:about="{vcity:qualifyQName(resolve-QName( string(@name), /xs:schema ))}">
    <xsl:apply-templates select="./xs:annotation"/>
    <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string(ancestor::*[@name][last()]/@name), /xs:schema ))}"/>
    <rdfs:range rdf:resource="{vcity:qualifyQName(resolve-QName( string(@type), /xs:schema ))}"/>
  </owl:DatatypeProperty>
</xsl:template>

<xsl:template match="xs:attribute[not(parent::xs:schema) and @name and not(@type)]">
  <owl:DatatypeProperty rdf:about="{vcity:qualifyQName(resolve-QName( string(@name), /xs:schema ))}">
    <xsl:apply-templates select="./xs:annotation"/>
    <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string(ancestor::*[@name][last()]/@name), /xs:schema ))}"/>
    <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#string"/>
  </owl:DatatypeProperty>
</xsl:template>

<!-- ============================================ # 28 ============================================ -->
<xsl:template match="xs:attribute[not(parent::xs:schema) and @ref]">
  <xsl:variable name="thisRefQName" select="resolve-QName( string(@ref), /xs:schema )"/>
  <owl:DatatypeProperty rdf:about="{vcity:qualifyHasQName($thisRefQName)}">
    <xsl:apply-templates select="./xs:annotation"/>
    <rdfs:domain rdf:resource="{vcity:qualifyQName(resolve-QName( string(ancestor::*[@name][last()]/@name), /xs:schema ))}"/>
    <rdfs:range rdf:resource="{vcity:qualifyQName($thisRefQName)}"/>
  </owl:DatatypeProperty>
</xsl:template>



<!-- ================================================================================================= -->
<!-- ================================= Miscellaneous Transformations ================================= -->
<!-- ================================================================================================= -->

<!-- ============================================ # 39,40 ============================================ -->
<xsl:template match="xs:annotation">
<!-- TODO: fix bug where duplicate comments are generated outside of class declarations -->
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