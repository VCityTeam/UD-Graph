<?xml version="1.0" encoding="UTF-8"?>
<!-- TODO: implement complexType subclasses template -->
<!-- TODO: implement element subclasses template -->
<!-- TODO: implement minOccurs, maxOccurs template -->
<!-- TODO: implement choice template -->
<xsl:stylesheet exclude-result-prefixes="xs"
                version="2.0"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                xmlns:owl="http://www.w3.org/2002/07/owl#"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:namespace-alias stylesheet-prefix="xsd" result-prefix="xs"/>
  <xsl:variable name="namespace" select="//attribute::targetNamespace"/>

  <!-- Root template: Create ontology elements from import elements and comments. Apply templates
  for 1st depth elements, complex types, and simple types. -->
  <xsl:template match="/">
    <rdf:RDF>
      <owl:Ontology rdf:about="http://liris.cnrs.fr/citygml_2.0.owl">
        <xsl:apply-templates select="//*[name() = 'xs:import']"/>
        <xsl:apply-templates select="//*[parent::xs:schema and name() = 'xs:annotation']"/>
      </owl:Ontology>
      <xsl:apply-templates select="//*[parent::xs:schema and name() = 'xs:element']"/>
      <xsl:apply-templates select="//*[parent::xs:schema and name() = 'xs:complexType']"/>
      <xsl:apply-templates select="//*[parent::xs:schema and name() = 'xs:simpleType']"/>
    </rdf:RDF>
  </xsl:template>


  <!-- Imports are not handled in this stylesheet. If one is declared, transform it into a warning. -->
  <xsl:template match="xs:import">
    <rdfs:comment>Warning: The schema <xsl:value-of select="attribute::namespace"/> was not imported.</rdfs:comment>
  </xsl:template>


  <!-- 1st depth element templates: Create owl:Class or owl:DatatypeProperty based on whether element is
  complex or simple ('child::xs:complexType' or 'child::xs:simpleType'). If an element type is not declared
  as a child of the element, the type must be matched to determine if the element is complex or simple.
  This is done by setting the type as a variable (<xsl:variable name="thisType" select="attribute::type"/>)
  and searching for it (for example: test="//*[attribute::name = $thisType and self::xs:complexType]").
  If the element has a complex or simple datatype declared outside it's hierarchy, it will be referenced
  as an rdfs:subClassOf/rdfs:subPropertyOf resource. In addition, substitutionGroup attributes are also referenced as
  rdfs:subClassOf/rdfs:subPropertyOf resources. -->


  <!-- The elemement type is declared outside the element. It's name is stored in $thisType -->
  <xsl:template match="//*[parent::xs:schema and name() = 'xs:element' and attribute::type]">
    <xsl:variable name="thisType" select="attribute::type"/>
    <xsl:choose>
      <!-- The element type is declared outside the schema so we do not know if the element is simple
      or complex. 'xs' prefixed types are assumed to be subproperties. -->
      <xsl:when test="contains( $thisType, 'xs:' )">
        <owl:DatatypeProperty>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <xsl:apply-templates select="child::xs:annotation"/>
          <rdfs:subPropertyOf>
            <xsl:attribute name="rdf:resource" select="$thisType"/>
          </rdfs:subPropertyOf>
        </owl:DatatypeProperty>
      </xsl:when>
      <!-- The element type is declared outside the schema so we do not know if the element is simple
      or complex. Prefixed types are assumed to be subclasses. -->
      <xsl:when test="contains( $thisType, ':' )">
        <owl:Class>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <rdfs:comment>Warning: This Class type is declared outside of the original schema. It may not be a Class.</rdfs:comment>
          <xsl:apply-templates select="child::xs:annotation"/>
          <rdfs:subClassOf>
            <xsl:attribute name="rdf:resource" select="$thisType"/>
          </rdfs:subClassOf>
        </owl:Class>
      </xsl:when>
      <!-- The element type is a complex type. Transform element into a sub class of the type -->
      <xsl:when test="//*[self::xs:complexType and name() = $thisType]">
        <owl:Class>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <xsl:apply-templates select="child::xs:annotation"/>
          <rdfs:subClassOf>
            <xsl:attribute name="rdf:resource" select="$thisType"/>
          </rdfs:subClassOf>
        </owl:Class>
      </xsl:when>
      <xsl:when test="//*[self::xs:simpleType and name() = $thisType]">
        <owl:DatatypeProperty>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <xsl:apply-templates select="child::xs:annotation"/>
          <rdfs:subPropertyOf>
            <xsl:attribute name="rdf:resource" select="$thisType"/>
          </rdfs:subPropertyOf>
        </owl:DatatypeProperty>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- The element has child elements -->
  <xsl:template match="//*[parent::xs:schema and name() = 'xs:element' and count(child::*) > 0]">
    <xsl:choose>
      <!-- A complex type is declared within the element, therefore transform element into owl:Class.
      complex content is transformed through the xs:complexType template -->
      <xsl:when test="child::xs:complexType">
        <owl:Class>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <xsl:apply-templates select="child::xs:annotation"/>
          <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all"/>
          <xsl:if test="attribute::substitutionGroup">
            <rdfs:subClassOf>
              <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', attribute::substitutionGroup )"/>
            </rdfs:subClassOf>
          </xsl:if>
        </owl:Class>
      </xsl:when>
      <!-- A simple type is declared within the element, therefore transform element into owl:DatetypeProperty -->
      <xsl:when test="child::xs:simpleType">
        <owl:DatatypeProperty>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <xsl:apply-templates select="child::xs:annotation"/>
          <xsl:if test="attribute::substitutionGroup">
            <rdfs:subPropertyOf>
              <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', attribute::substitutionGroup )"/>
            </rdfs:subPropertyOf>
          </xsl:if>
        </owl:DatatypeProperty>  
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <!-- ComplexType Template: This template matches complexTypes in the schema. If the complex type is declared
  at 1st depth, it is transformed in to a class. If not, it must be declared as a child of an element.
  In this case, only the contents of the type are transformed so they can be nested within the parent
  element. --> 
  <xsl:template match="//*[name() = 'xs:complexType' and parent::xs:schema]">
    <owl:Class>
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
      <xsl:apply-templates select="child::xs:annotation"/>
<!-- TODO:<xsl:apply-templates select="descendant::xs:extension"> -->
      <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all"/>
    </owl:Class>
  </xsl:template>


  <xsl:template match="//*[name() = 'xs:simpleType' and parent::xs:schema]">
    <owl:DatatypeProperty>
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
<!-- TODO:<xsl:apply-templates select="descendant::xs:restriction"> -->
    </owl:DatatypeProperty>
  </xsl:template>


  <xsl:template match="xs:sequence|xs:all">
    <owl:intersectionOf rdf:parseType="Collection">
      <xsl:for-each select="child::xs:element">
        <xsl:element name="owl:Thing">
          <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', attribute::name )"/>
        </xsl:element>
      </xsl:for-each>
    </owl:intersectionOf>
  </xsl:template>


  <xsl:template match="xs:annotation">
    <xsl:for-each select="child::*">
      <rdfs:comment>
        <xsl:value-of select="text()"/>
      </rdfs:comment>
    </xsl:for-each>
  </xsl:template>


  <!-- Match empty text nodes to nothing -->
  <xsl:template match="text()">
      <xsl:if test="string(.) = ''"/>
  </xsl:template>

</xsl:stylesheet>