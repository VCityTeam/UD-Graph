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
<xsl:variable name="namespace" select="concat( //@targetNamespace, '#' )"/>



<!-- ================================================================================================= -->
<!-- ==================================== Root Transformations ======================================= -->
<!-- ================================================================================================= -->

<!-- Create ontology elements from import elements and comments. Apply templates
for 1st depth elements, complex types, and simple types. -->
<xsl:template match="/">
  <rdf:RDF>
    <owl:Ontology rdf:about="">
      <xsl:apply-templates select="//xs:import"/>
      <xsl:apply-templates select="/xs:schema/xs:annotation"/>
    </owl:Ontology>
    <xsl:apply-templates select="//xs:complexType"/>
    <xsl:apply-templates select="//xs:simpleType"/>
    <xsl:apply-templates select="//xs:attribute"/>
    <xsl:apply-templates select="/xs:schema/xs:element"/>
    <xsl:apply-templates select="//xs:element[parent::xs:sequence or parent::xs:all or parent::xs:choice]"/>
  </rdf:RDF>
</xsl:template>

<!-- Imports are not handled in this stylesheet (yet). If one is declared, transform it into a warning. -->
<!-- TODO: test document() function for resolving imports? -->
<xsl:template match="xs:import">
  <owl:import rdf:resource="{@schemaLocation}"/>
  <rdfs:comment>Warning: The schema <xsl:value-of select="@namespace"/> was not imported.</rdfs:comment>
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
  <xsl:variable name="thisType" select="@type"/>
  <xsl:choose>
    <xsl:when test="starts-with( @type, 'xs:' ) and @type != 'xs:anyType' or //xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
      <rdfs:Datatype rdf:about="concat( $namespace, @name )">
        <owl:equivalentClass rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
      </rdfs:Datatype>
    </xsl:when>
    <xsl:when test="//xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
      <owl:Class rdf:about="{concat( $namespace, @name )}">
        <xsl:apply-templates select="@substitutionGroup"/>
        <rdfs:subClassOf rdf:resource="{concat( $namespace, @type )}"/>
      </owl:Class>
    </xsl:when>
    <xsl:otherwise><!-- Otherwise this element type is declared outside of the schema -->
      <owl:Class rdf:about="{concat( $namespace, @name )}">
        <xsl:apply-templates select="@substitutionGroup"/>
        <rdfs:subClassOf rdf:resource="{@type}"/>
        <rdfs:comment>Warning: This class type was declared outside of its original schema. This class may be declared incorrectly.</rdfs:comment>
      </owl:Class>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- ============================================== # 25 ============================================== -->
<!-- substitution group attributes are transformed into subclasses -->
<xsl:template match="@substitutionGroup">
  <rdfs:subClassOf rdf:resource="{if (contains( . , ':' )) then . else concat( $namespace, . )}"/>
</xsl:template>


<!-- The element is a child of a xs:sequence, xs:all, or xs:choice node these elements are converted into
object and data properties. rdfs:domain axioms are set by the respective ancestor element name.
rdfs:range axioms are set by the type attribute -->
<!-- ===================================== # 17,18,22,23,24,29,31 ===================================== -->
<xsl:template match="xs:element[parent::xs:sequence or parent::xs:choice]">
  <xsl:variable name="thisType" select="@type"/>
  <xsl:choose>
    <xsl:when test="@type = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
      <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @type )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="starts-with( @type, 'xs:' ) and not( @type = 'xs:anyType' )">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@type}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="//xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range rdf:resource="{concat( $namespace, @type )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="contains( @type, ':' )">
      <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
        <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@type}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="contains( @ref, ':' )">
      <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
      <owl:ObjectProperty rdf:about="{concat( $thisReference[1], ':has', $thisReference[2] )}">
        <rdfs:comment>Warning: This ObjectProperty reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@ref}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:complexType">
      <owl:ObjectProperty rdf:about="{concat( $namespace, 'has', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @name )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:simpleType">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, 'has', @name )}">
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @name )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:otherwise><!-- Otherwise this element has a reference to another element within the schema.
    The referenced element is either a complex or simple type -->
      <xsl:variable name="thisReference" select="@ref"/>
      <xsl:variable name="thisType" select="//xs:element[@name = $thisReference]/@type"/>
      <xsl:element name="{if ( $thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisReference] )
                          then 'owl:ObjectProperty'
                          else 'owl:DatatypeProperty'}">
        <xsl:attribute name="rdf:about" select="concat( $namespace, 'has', @ref )"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @ref )}"/>
      </xsl:element>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================== # 30 ============================================== -->
<xsl:template match="xs:element[parent::xs:all]">
  <xsl:variable name="thisType" select="@type"/>
  <xsl:choose>
    <xsl:when test="@type = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
      <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @type )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="starts-with( @type, 'xs:' ) and not( @type = 'xs:anyType' )">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@type}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="//xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @type )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:when test="contains( @type, ':' )">
      <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@type}"/>
        <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="contains( @ref, ':' )">
      <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
      <owl:ObjectProperty rdf:about="{concat( $thisReference[1], ':has', $thisReference[2] )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{@ref}"/>
        <rdfs:comment>Warning: This ObjectProperty reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:complexType">
      <owl:ObjectProperty rdf:about="{concat( $namespace, 'has', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @name )}"/>
      </owl:ObjectProperty>
    </xsl:when>
    <xsl:when test="./xs:simpleType">
      <owl:DatatypeProperty rdf:about="{concat( $namespace, 'has', @name )}">
        <rdf:type    rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range  rdf:resource="{concat( $namespace, @name )}"/>
      </owl:DatatypeProperty>
    </xsl:when>
    <xsl:otherwise><!-- Otherwise this element has a reference to another element within the schema.
    The referenced element is either a complex or simple type -->
      <xsl:variable name="thisReference" select="@ref"/>
      <xsl:variable name="thisType" select="//xs:element[@name = $thisReference]/@type"/>
      <xsl:element name="{if ( $thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisReference] )
                          then 'owl:ObjectProperty'
                          else 'owl:DatatypeProperty'}">
        <xsl:attribute name="rdf:about" select="concat( $namespace, 'has', @ref )"/>
        <rdf:type      rdf:resource="owl:FunctionalProperty"/>
        <rdfs:domain   rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
        <rdfs:range    rdf:resource="{concat( $namespace, @ref )}"/>
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

<!-- # 3. complexType is declared as a child of the root schema -->
<xsl:template match="xs:complexType">
  <xsl:variable name="thisName" select="if (parent::xs:element) then ../@name else @name"/>
  <owl:Class rdf:about="{concat( $namespace, $thisName )}">
    <xsl:apply-templates select="@abstract"/>
    <xsl:apply-templates select="descendant::xs:annotation"/>
    <xsl:apply-templates select="./xs:sequence|./xs:complexContent/*/xs:sequence"/>
    <xsl:apply-templates select="./xs:all|./xs:complexContent/*/xs:all"/>
    <xsl:apply-templates select="./xs:choice|./xs:complexContent/*/xs:choice"/>
    <xsl:if test="./xs:attribute|./*/*/xs:attribute"><xsl:call-template name="complextype-attributes"/></xsl:if>
    <!-- If the class is an extension of a complexType, this class is a subclass of that class -->
    <!-- ======================================== # 9,12,13,14 ======================================== -->
    <xsl:variable name="thisBase" select="descendant::*[@base][position() = 1]/@base"/>
    <xsl:choose>
      <xsl:when test="//xs:complexType[$thisName = $thisBase] or //xs:element[$thisName = @thisBase and xs:complexType]">
        <rdfs:subClassOf rdf:resource="{concat( $namespace, $thisBase )}"/>
      </xsl:when>
      <xsl:when test="//xs:element[$thisName = $thisBase and @type]">
        <xsl:variable name="thisType" select="//xs:element[$thisName = $thisBase]/@type"/>
        <xsl:if test="//xs:complexType[$thisName = $thisType]">
          <rdfs:subClassOf rdf:resource="{concat( $namespace, $thisBase )}"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="contains( $thisBase, ':') and not(starts-with( $thisBase, 'xs:' )) or $thisBase ='xs:anyType'">
        <rdfs:subClassOf rdf:resource="{$thisBase}"/>
        <rdfs:comment>Warning: The parent class '<xsl:value-of select="$thisBase"/>' is declared outside of this class' original schema. This class may be declared incorrectly.</rdfs:comment>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </owl:Class>
  <xsl:apply-templates select="./xs:simpleContent"/>
</xsl:template>

<!-- Abstract classes are denoted by an rdfs:comment -->
<xsl:template match="@abstract">
  <rdfs:comment>This is an abstract class</rdfs:comment>
</xsl:template>

<xsl:template name="complextype-attributes">
    <owl:equivalentClass>
      <owl:Class>
        <owl:intersectionOf rdf:parseType="Collection">
          <xsl:for-each select="./xs:attribute|./*/*/xs:attribute">
            <owl:Restriction>
              <xsl:choose>
                <xsl:when test="@name and @type">
                  <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, @name )}"/>
                  <owl:allValuesFrom rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
                </xsl:when>
                <xsl:when test="@ref and not(contains( @ref, ':' ))">
                  <owl:onProperty    rdf:resource="{concat( $namespace, 'has', @ref )}"/>                  
                  <owl:allValuesFrom rdf:resource="{concat( $namespace, @ref )}"/>
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
    </owl:equivalentClass>
</xsl:template>

<!-- xs:simpleContent will always be converted into a datatype property. 'has' is added to the beggining
of the property name to avoid conflicting intersection with it's parent complexType. If it contains
a child xs:restriction a datatype property will also be created with 'Datatype' appended to the name to avoid
conflicting intersections with it's parent complexType. If a @base attribute is declared the resulting
Datatypes and DatatypePropreties will inherit it as a superclass or superproperty. -->
<!-- ============================================ # 6,8,9 ============================================ -->
<xsl:template match="xs:simpleContent">
  <owl:DatatypeProperty rdf:about="{concat( $namespace, 'has' ,ancestor::*[@name][last()]/@name )}">
    <xsl:call-template name="simpleContent-property"/>
  </owl:DatatypeProperty>
  <!-- ========================================== # 10,11,12 ========================================== -->
  <xsl:if test="./xs:restriction">
    <rdfs:Datatype rdf:about="{concat( $namespace, ancestor::*[@name][last()]/@name, 'Datatype' )}">
      <xsl:apply-templates select="xs:restriction"/>
    </rdfs:Datatype>
  </xsl:if>
</xsl:template>

<!-- xs:extensions are transformed into datatype properties with 'has' appended to
the name. The extension is declared as a datatype property as well and as the superclass of the initial
datatype property. Note that 'ancestor::*[@name][last()]/@name' is used to determine the name of the
original class. This is required because we cannot assume which parent node contains the @name attribute.
It could be the parent xs:element or xs:complexType. -->
<xsl:template name="simpleContent-property">
  <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
  <rdfs:range  rdf:resource="{if (contains( ./*/@base, ':' )) then ./*/@base else concat( $namespace, ./*/@base )}"/>
  <xsl:choose>
    <xsl:when test="contains( ./*/@base, ':' ) and not(starts-with( ./*/@base, 'xs:' ))">
      <xsl:variable name="thisBase" select="tokenize( ./*/@base, ':' )"/>
      <rdfs:subPropertyOf rdf:resource="{concat( $thisBase[1], ':has', $thisBase[2] )}"/>
      <rdfs:comment>Warning: The parent property '<xsl:value-of select="concat( $thisBase[1], ':has', $thisBase[2] )"/>' is declared outside of this property's original schema. This property may be declared incorrectly.</rdfs:comment>
    </xsl:when>
    <xsl:when test="not(contains( ./*/@base, ':' ))">
      <rdfs:subPropertyOf rdf:resource="{concat( $namespace, 'has', ./*/@base )}"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>



<!-- ================================================================================================== -->
<!-- =============================== Grouping Component Transformations =============================== -->
<!-- ================================================================================================== -->

<!-- xs:sequences and xs:all transform their children into subclass or subproperty restrictions. --> 
<xsl:template match="xs:sequence|xs:all">
<!-- TODO: add min/max occurs case when attribute is declared in parent of element -->
  <owl:equivalentClass>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <xsl:for-each select="./xs:element">
          <owl:Restriction>
            <xsl:choose>
              <xsl:when test="@name and @type">
                <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, @name )}"/>
                <owl:allValuesFrom rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
              </xsl:when>
              <xsl:when test="./xs:complexType or ./xs:simpleType">
                <xsl:variable name="thisName" select="tokenize( @name, ':' )"/>
                <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then concat( $thisName[1], ':has', $thisName[2] ) else concat( $namespace, 'has', @name )}"/>
                <owl:allValuesFrom rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, @name )}"/>
              </xsl:when>
              <xsl:when test="@ref and not(contains( @ref, ':' ))">
                <owl:onProperty    rdf:resource="{concat( $namespace, 'has', @ref )}"/>                  
                <owl:allValuesFrom rdf:resource="{concat( $namespace, @ref )}"/>
              </xsl:when>
              <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
                <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
                <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                <owl:allValuesFrom rdf:resource="{@ref}"/>
              </xsl:otherwise>
            </xsl:choose>
          </owl:Restriction>
          <xsl:call-template name="minOccurs-maxOccurs"/>
        </xsl:for-each>
      </owl:intersectionOf>
    </owl:Class>
  </owl:equivalentClass>
</xsl:template>

<!-- ============================================== # 31 ============================================== -->
<xsl:template match="xs:choice"> 
  <owl:disjointUnionOf rdf:parseType="Collection">
    <xsl:for-each select="./xs:element">
      <xsl:variable name="thisName" select="tokenize( @name, ':' )"/>
      <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
      <xsl:choose>
        <xsl:when test="@name">
          <owl:Restriction>
            <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, @name )}"/>
            <owl:allValuesFrom rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
          </owl:Restriction>
          <xsl:call-template name="minOccurs-maxOccurs"/>
        </xsl:when>
        <xsl:when test="contains( @ref, ':' )">
          <owl:Restriction>
            <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
            <owl:allValuesFrom rdf:resource="{@ref}"/>
          </owl:Restriction>
          <xsl:call-template name="minOccurs-maxOccurs"/>
        </xsl:when>
        <xsl:otherwise><!-- @ref reference is declared in the schema -->
          <owl:Restriction>
            <owl:onProperty    rdf:resource="{concat( $namespace, 'has', @ref )}"/>
            <owl:allValuesFrom rdf:resource="{@ref}"/>
          </owl:Restriction>
          <xsl:call-template name="minOccurs-maxOccurs"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </owl:disjointUnionOf>
</xsl:template>


<!-- ============================================ # 32,34 ============================================ -->
<xsl:template match="xs:group[@name]|xs:attributeGroup[@name]">
  <owl:Class rdf:about="{concat( $namespace, @name )}">
    <xsl:apply-templates select="descendant::xs:annotation"/>
    <xsl:apply-templates select="./xs:sequence"/>
    <xsl:apply-templates select="./xs:all"/>
    <xsl:apply-templates select="./xs:choice"/>
    <xsl:apply-templates select="./xs:attribute"/>
  </owl:Class>
</xsl:template>

<!-- ============================================ # 33,35 ============================================ -->
<xsl:template match="xs:group[@ref]|xs:attributeGroup[@ref]">
  <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
  <owl:ObjectProperty rdf:about="{if (contains( @ref, ':' )) then concat( $thisReference[1], ':has', $thisReference[2] ) else concat( $namespace, 'has', @ref )}">
    <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range  rdf:resource="{if (contains( @ref, ':')) then @ref else concat( $namespace, @ref )}"/>
  </owl:ObjectProperty>
</xsl:template>

<!-- ============================================== # 38 ============================================== -->
<xsl:template name="minOccurs-maxOccurs">
  <xsl:choose>
    <xsl:when test="@minOccurs and @maxOccurs and @minOccurs = @maxOccurs">
      <owl:Restriction>
        <owl:onProperty>
          <xsl:if test="../@name">
            <xsl:attribute name="rdf:resource" select="concat( $namespace, ../@name)"/>
          </xsl:if>
          <xsl:if test="../@ref">
            <xsl:variable  name="thisReference" select="tokenize( ../@ref, ':' )"/>
            <xsl:attribute name="rdf:resource" select="if ( count($thisReference) = 1 ) then concat( $namespace, 'has', $thisReference[1] ) else concat( $thisReference[1], ':has', $thisReference[2] )"/>
          </xsl:if>
        </owl:onProperty>
        <owl:cardinality rdf:datatype="xs:nonNegativeInteger"><xsl:value-of select="@minOccurs"/></owl:cardinality>
      </owl:Restriction>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="@minOccurs"/>
      <xsl:apply-templates select="@maxOccurs"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ============================================== # 36 ============================================== -->
<!-- Cardinality is preserved by transforming xs:minOccurs into owl:minCardinality unless the value is 0 -->
<xsl:template match="@minOccurs">
  <xsl:if test=". >= 0">
    <owl:Restriction>
      <owl:onProperty>
        <xsl:if test="../@name">
          <xsl:attribute name="rdf:resource" select="concat( $namespace, ../@name)"/>
        </xsl:if>
        <xsl:if test="../@ref">
          <xsl:variable  name="thisReference" select="tokenize( ../@ref, ':' )"/>
          <xsl:attribute name="rdf:resource" select="if ( count($thisReference) = 1 ) then concat( $namespace, 'has', $thisReference[1] ) else concat( $thisReference[1], ':has', $thisReference[2] )"/>
        </xsl:if>
      </owl:onProperty>
      <owl:minCardinality rdf:datatype="xs:nonNegativeInteger"><xsl:value-of select="."/></owl:minCardinality>
    </owl:Restriction>
  </xsl:if>
</xsl:template>

<!-- ============================================== # 37 ============================================== -->
<!-- Cardinality is preserved by transforming xs:maxOccurs into owl:maxCardinality unless the value is
unbounded, in which case it is ignored -->
<xsl:template match="@maxOccurs">
  <xsl:if test=". != 'unbounded'">
    <owl:Restriction>
      <owl:onProperty>
        <xsl:if test="../@name">
          <xsl:attribute name="rdf:resource" select="concat( $namespace, ../@name)"/>
        </xsl:if>
        <xsl:if test="../@ref">
          <xsl:variable  name="thisReference" select="tokenize( ../@ref, ':' )"/>
          <xsl:attribute name="rdf:resource" select="if ( count($thisReference) = 1 ) then concat( $namespace, 'has', $thisReference[1] ) else concat( $thisReference[1], ':has', $thisReference[2] )"/>
        </xsl:if>
      </owl:onProperty>
      <owl:minCardinality rdf:datatype="xs:nonNegativeInteger"><xsl:value-of select="."/></owl:minCardinality>
    </owl:Restriction>
  </xsl:if>
</xsl:template>



<!-- ================================================================================================= -->
<!-- ================================== SimpleType Transformations =================================== -->
<!-- ================================================================================================= -->

<!-- ============================================== # 1 ============================================== -->
<xsl:template match="xs:simpleType[not( parent::xs:element )]">
  <rdfs:Datatype rdf:about="{concat( $namespace, @name )}">
    <xsl:apply-templates select="descendant::xs:annotation"/>
    <xsl:apply-templates select="./xs:restriction"/>
    <xsl:apply-templates select="./xs:union"/>
    <!-- TODO: <xsl:apply-templates select="./xs:list"/> -->
  </rdfs:Datatype>
</xsl:template>

<!-- ============================================ # 19,20 ============================================ -->
<xsl:template match="xs:simpleType[parent::xs:element]">
  <rdfs:Datatype rdf:about="{concat( $namespace, ../@name )}">
    <xsl:apply-templates select="descendant::xs:annotation"/>
    <xsl:apply-templates select="./xs:restriction"/>
    <xsl:apply-templates select="./xs:union"/>
    <!-- TODO: <xsl:apply-templates select="./xs:list"/> -->
  </rdfs:Datatype>
  <owl:DatatypeProperty rdf:about="{concat( $namespace, 'has', ../@name )}">
    <rdfs:range rdf:resource="{concat( $namespace, ../@name )}"/>
    <xsl:variable name="thisBase" select="./xs:restriction/@base"/>
    <xsl:choose>
      <xsl:when test="//xs:simpleType[../@name = $thisBase]">
        <rdfs:subPropertyOf rdf:resource="{concat( $namespace, 'has', $thisBase )}"/>
      </xsl:when>
      <xsl:when test="contains( $thisBase, ':' ) and not(starts-with( $thisBase, 'xs:' ))">
        <xsl:variable name="thisBase" select="tokenize( $thisBase, ':' )"/>
        <rdfs:subPropertyOf rdf:resource="{concat( $thisBase[1], ':has', $thisBase[2] )}"/>
      </xsl:when>
    </xsl:choose>
  </owl:DatatypeProperty>
</xsl:template>

<!-- ============================================== # 2 ============================================== -->
<xsl:template match="xs:union">
  <xsl:variable name="memberTypes" select="tokenize( @memberTypes, ' ' )"/>
  <xsl:for-each select="$memberTypes">
    <owl:equivalentClass rdf:resource="{if (contains( . , ':' )) then . else concat( $namespace, . )}"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="xs:list">
  <owl:equivalentClass rdf:resource="{rdfs:Literal}"/>
</xsl:template>

<!-- ============================================== # 4 ============================================== -->
<xsl:template match="xs:restriction[xs:enumeration]">
  <owl:equivalentClass>
    <rdfs:Datatype>
      <owl:oneOf>
        <xsl:call-template name="enumeration">
          <xsl:with-param name="pos" select="1"/>
        </xsl:call-template>
      </owl:oneOf>
    </rdfs:Datatype>
  </owl:equivalentClass>
</xsl:template>

<xsl:template name="enumeration">
  <xsl:param name="pos"/>
  <rdf:Description rdf:type="rdf:List">
    <rdf:first rdf:datatype="{@base}"><xsl:value-of select="./xs:enumeration[position() = $pos]/@value"/></rdf:first>
    <xsl:choose>
      <xsl:when test="$pos = count(./xs:enumeration)">
        <rdf:rest rdf:resource="rdf:nil"/>
      </xsl:when>
      <xsl:otherwise>
        <rdf:rest>
          <xsl:call-template name="enumeration">
            <xsl:with-param name="pos" select="$pos + 1"/>
          </xsl:call-template>
        </rdf:rest>
      </xsl:otherwise>
    </xsl:choose>
  </rdf:Description>
</xsl:template>

<!-- ============================================= # 5,7 ============================================= -->
<xsl:template match="xs:restriction[xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive]">
  <owl:equivalentClass>
    <rdfs:Datatype>
      <owl:onDatatype rdf:resource="{@base}"/>
      <owl:withRestrictions rdf:parseType="Collection">
        <xsl:for-each select="xs:minInclusive|xs:maxInclusive|xs:minExclusive|xs:maxExclusive">
          <rdf:Description>
            <xsl:element name="{name()}">
              <xsl:attribute name="rdf:datatype" select="../@base"/>
              <xsl:value-of select="@value"/>
            </xsl:element>
          </rdf:Description>
        </xsl:for-each>
      </owl:withRestrictions>
    </rdfs:Datatype>
  </owl:equivalentClass>
</xsl:template>




<!-- ================================================================================================= -->
<!-- =================================== Attribute Transformations =================================== -->
<!-- ================================================================================================= -->

<!-- ============================================== # 26 ============================================== -->
<xsl:template match="/xs:schema/xs:attribute">
  <xsl:if test="starts-with( @type, 'xs:' )">
    <rdfs:Datatype rdf:about="{concat( $namespace, @name )}">
      <owl:equivalentClass rdf:resource="{@type}"/>
    </rdfs:Datatype>
  </xsl:if>
</xsl:template>

<!-- ============================================ # 27 ============================================ -->
<xsl:template match="xs:attribute[ancestor::xs:complexType and @name]">
  <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
    <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
  </owl:DatatypeProperty>
</xsl:template>

<!-- ============================================ # 28 ============================================ -->
<xsl:template match="xs:attribute[ancestor::xs:complexType and @ref]">
  <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
  <owl:DatatypeProperty rdf:about="{if (contains( @ref, ':')) then concat( $thisReference[1], ':has', $thisReference[2] ) else concat( $namespace, 'has', @ref )}">
    <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*[@name][last()]/@name )}"/>
    <rdfs:range rdf:resource="{if (contains( @ref, ':' )) then @ref else concat( $namespace, @ref )}"/>
  </owl:DatatypeProperty>
</xsl:template>



<!-- ================================================================================================= -->
<!-- ================================= Miscellaneous Transformations ================================= -->
<!-- ================================================================================================= -->

<!-- ============================================ # 39,40 ============================================ -->
<xsl:template match="xs:annotation">
  <xsl:for-each select="child::*">
    <rdfs:comment><xsl:if test="@xml:lang"><xsl:attribute name="xml:lang" select="@xml:lang"/></xsl:if><xsl:value-of select="text()"/></rdfs:comment>
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