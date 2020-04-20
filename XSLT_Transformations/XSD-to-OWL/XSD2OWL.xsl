<?xml version="1.0" encoding="UTF-8"?>
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
      <xsl:apply-templates select="//xs:element[parent::xs:schema]"/>
      <xsl:apply-templates select="//xs:element[parent::xs:sequence or parent::xs:all]"/>
      <xsl:apply-templates select="//xs:complexType[parent::xs:schema]"/>
      <xsl:apply-templates select="//xs:simpleType[parent::xs:schema]"/>
    </rdf:RDF>
  </xsl:template>


  <!-- Imports are not handled in this stylesheet. If one is declared, transform it into a warning. -->
  <xsl:template match="xs:import">
    <rdfs:comment>Warning: The schema <xsl:value-of select="attribute::namespace"/> was not imported.</rdfs:comment>
  </xsl:template>

  <!-- ==================================== Element Transformations ==================================== -->
  <!-- 1st depth element templates: Create owl:Class or owl:DatatypeProperty based on whether element is
  complex or simple ('child::xs:complexType' or 'child::xs:simpleType'). If an element type is not declared
  as a child of the element, the type must be matched to determine if the element is complex or simple.
  This is done by setting the type as a variable (<xsl:variable name="thisType" select="attribute::type"/>)
  and searching for it (for example: test="//*[attribute::name = $thisType and self::xs:complexType]").
  If the element has a complex or simple datatype declared outside it's hierarchy, it will be referenced
  as an rdfs:subClassOf/rdfs:subPropertyOf resource. In addition, substitutionGroup attributes are also
  referenced as rdfs:subClassOf/rdfs:subPropertyOf resources. -->
  <!-- ================================================================================================= -->

  <!-- The element has child elements -->
  <xsl:template match="//xs:element[parent::xs:schema and count(child::*) > 0]">
    <xsl:choose>
      <!-- A complex type is declared within the element, therefore transform element into owl:Class.
      complex content is transformed through the xs:complexType template -->
      <xsl:when test="child::xs:complexType">
        <owl:Class rdf:about="{concat( $namespace, '#', attribute::name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all"/>
          <xsl:apply-templates select="attribute::substitutionGroup"/>
        </owl:Class>
      </xsl:when>
      <!-- A simple type is declared within the element, therefore transform element into owl:DatetypeProperty -->
      <xsl:when test="child::xs:simpleType">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', attribute::name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <xsl:apply-templates select="attribute::substitutionGroup"/>
        </owl:DatatypeProperty>  
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="attribute::substitutionGroup">
    <rdfs:subClassOf rdf:resource="{concat( $namespace, '#', attribute::substitutionGroup )}"/>
  </xsl:template>

  <!-- The element's type is declared outside the element. In order to determine if this element is a
  class or property, it's type must be evaluated. It's type identifier is stored in $thisType -->
  <xsl:template match="//xs:element[parent::xs:schema and attribute::type]">
    <xsl:variable name="thisType" select="attribute::type"/>
    <xsl:choose>
      <!-- The element type has an 'xs' or 'xsd' prefix. Most of these types are assumed to be datatype properties. -->
      <!-- TODO: add type exceptions for xs:anyType and xs:anyAttribute -->
      <xsl:when test="contains( 'xs:string xs:decimal xs:integer xs:boolean xs:date xs:time', $thisType )">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', attribute::name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <rdfs:subPropertyOf rdf:resource="{$thisType}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <!-- The element type is declared outside the schema so it cannot be evaluated, we do not know
      if the element is simple or complex. Unevaluated prefixed types are assumed to be classes. -->
      <xsl:when test="contains( $thisType, ':' )">
        <owl:Class rdf:about="{concat( $namespace, '#', attribute::name )}">
          <rdfs:comment>Warning: This Class is declared outside of the original schema. It may not be a Class.</rdfs:comment>
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <rdfs:subClassOf rdf:resource="{$thisType}"/>
        </owl:Class>
      </xsl:when>
      <!-- The element type is a complex type. Transform element into a subclass of the type -->
      <xsl:when test="//*[self::xs:complexType and name() = $thisType]">
        <owl:Class rdf:about="{concat( $namespace, '#', attribute::name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <rdfs:subClassOf rdf:resource="{$thisType}"/>
        </owl:Class>
      </xsl:when>
      <!-- The element type is a simple type. Transform element into a subproperty of the type -->
      <xsl:when test="//*[self::xs:simpleType and name() = $thisType]">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', attribute::name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <rdfs:subPropertyOf rdf:resource="{$thisType}"/>
        </owl:DatatypeProperty>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="//xs:element[parent::xs:sequence or parent::xs:all]">
    <xsl:choose>
      <xsl:when test="contains( attribute::type, 'xs:' )">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, '#has', attribute::name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::xs:complexType/attribute::name )}"/>
          <rdfs:range rdf:resource="{attribute::type}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <xsl:when test="contains( attribute::type, ':' )">
        <owl:ObjectProperty rdf:about="{concat( $namespace, '#has', attribute::name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::xs:complexType/attribute::name )}"/>
          <rdfs:range rdf:resource="{attribute::type}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <xsl:otherwise>
        <owl:ObjectProperty rdf:about="{concat( $namespace, '#has', attribute::name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, '#', ancestor::xs:complexType/attribute::name )}"/>
          <rdfs:range rdf:resource="{concat( $namespace, '#', attribute::type )}"/>
        </owl:ObjectProperty>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ================================ ComplexType Transformations ================================ -->
  <!-- ComplexType Template: This template matches complexTypes in the schema. If the complex type is
  declared at 1st depth, it is transformed in to a class. If not, it must be declared as a child of an
  element. In this case, only the contents of the type are transformed so they can be nested within the
  parent element. --> 
  <!-- ============================================================================================= -->

  <xsl:template match="//xs:complexType[parent::xs:schema]">
    <owl:Class rdf:about="{concat( $namespace, '#', attribute::name )}">
      <xsl:apply-templates select="attribute::abstract"/>
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <!-- <xsl:apply-templates select="descendant::xs:extension"> -->
      <!-- <xsl:apply-templates select="descendant::xs:restriction"> -->
      <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all"/>
    </owl:Class>
  </xsl:template>

  <xsl:template match="@abstract">
    <rdfs:comment>This is an abstract class</rdfs:comment>
  </xsl:template>

  <xsl:template match="xs:sequence|xs:all">
    <xsl:for-each select="child::xs:element">
      <xsl:apply-templates select="attribute::minOccurs|attribute::maxOccurs"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="@minOccurs">
    <rdfs:subClassOf>
      <owl:Restriction>
        <owl:onProperty rdf:resource="{concat( $namespace, '#has', if (../@name)
                                                                     then ../@name
                                                                   else if (../@ref)
                                                                     then ../@ref
                                                                   else 'error:noURI' )}"/>
        <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
          <xsl:value-of select="."/>
        </owl:minCardinality>
      </owl:Restriction>
    </rdfs:subClassOf>
  </xsl:template>

  <xsl:template match="@maxOccurs">
    <xsl:if test=". != 'unbounded'">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty rdf:resource="{concat( $namespace, '#has', if (../@name)
                                                                       then ../@name
                                                                     else if (../@ref)
                                                                       then ../@ref
                                                                     else 'error:noURI' )}"/>
          <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
            <xsl:value-of select="."/>
          </owl:minCardinality>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:if>
  </xsl:template>

  <!-- ============================== SimpleType Transformations ============================== -->
  <xsl:template match="//xs:simpleType[parent::xs:schema]">
    <owl:DatatypeProperty rdf:about="{concat( $namespace, '#', attribute::name )}">
      <xsl:apply-templates select="descendant::xs:restriction|descendant::xs:list|descendant::xs:union"/>
    </owl:DatatypeProperty>
  </xsl:template>

  <xsl:template match="xs:restriction">
    <rdfs:range rdf:resource="{attribute::base}"/>
  </xsl:template>

  <xsl:template match="xs:list">
    <rdfs:range rdf:resource="{attribute::itemType}"/>
  </xsl:template>

  <xsl:template match="xs:union">
    <rdfs:range rdf:resource="{attribute::memberTypes}"/>
  </xsl:template>


  <!-- ============================= Miscellaneous Transformations ============================= -->
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


  <!-- TODO: implement object property from leaf elements template -->

  <!-- TODO: implement minOccurs, maxOccurs template -->

  <!-- TODO: implement choice template -->

</xsl:stylesheet>