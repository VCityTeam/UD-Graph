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
  <xsl:variable name="namespace" select="//attribute::targetNamespace"/>
  <xsl:namespace-alias stylesheet-prefix="xsd" result-prefix="xs"/>
  <xsl:template match="/">
    <rdf:RDF>
      <xsl:apply-templates select="//*[parent::xs:schema]"/>
    </rdf:RDF>
  </xsl:template>

  <xsl:template match="//*[parent::xs:schema and local-name() = 'element']">
    <xsl:choose>
      <xsl:when test="child::xs:complexType">
        <owl:Class>
          <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
          <rdfs:subClassOf>
            <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', ./xs:complexType/attribute::name )"/>
          </rdfs:subClassOf>
          <xsl:if test="attribute::substitutionGroup">
            <rdfs:subClassOf>
              <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', attribute::substitutionGroup )"/>
            </rdfs:subClassOf>
          </xsl:if>
        </owl:Class>  
      </xsl:when>
      <xsl:when test="attribute::type">
        <xsl:variable name="thisType" select="attribute::type"/>
        <xsl:choose>
          <xsl:when test="contains( $thisType, ':' )">
            <owl:Class>
              <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
              <rdfs:subClassOf>
                <xsl:attribute name="rdf:resource" select="$thisType"/>
              </rdfs:subClassOf>
            </owl:Class>
            <owl:DatatypeProperty>
              <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
              <rdfs:subPropertyOf>
                <xsl:attribute name="rdf:resource" select="$thisType"/>
              </rdfs:subPropertyOf>
            </owl:DatatypeProperty>
          </xsl:when>
          <xsl:when test="//*[attribute::name = $thisType and self::xs:complexType]">
            <owl:Class>
              <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
              <rdfs:subClassOf>
                <xsl:attribute name="rdf:resource" select="$thisType"/>
              </rdfs:subClassOf>
            </owl:Class>
          </xsl:when>
          <xsl:when test="//*[attribute::name = $thisType and self::xs:simpleType]">
            <owl:DatatypeProperty>
              <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
              <rdfs:subPropertyOf>
                <xsl:attribute name="rdf:resource" select="$thisType"/>
              </rdfs:subPropertyOf>
            </owl:DatatypeProperty>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

<!--   <xsl:template match="//*[parent::xs:schema and local-name() = 'element']">
    <owl:Class>
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
      <xsl:if test="child::xs:complexType">
        <rdfs:subClassOf>
          <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', ./xs:complexType/attribute::name )"/>
        </rdfs:subClassOf>
      </xsl:if>
      <xsl:if test="attribute::type">
        <rdfs:subClassOf>
          <xsl:attribute name="rdf:resource" select="attribute::type"/>
        </rdfs:subClassOf>
      </xsl:if>
      <xsl:if test="attribute::substitutionGroup">
        <rdfs:subClassOf>
          <xsl:attribute name="rdf:resource" select="attribute::substitutionGroup"/>
        </rdfs:subClassOf>
      </xsl:if>
    </owl:Class>
  </xsl:template> -->

  <xsl:template match="//*[parent::xs:schema and local-name() = 'complexType']">
    <owl:Class>
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
      <xsl:apply-templates select="child::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all"/>
    </owl:Class>
  </xsl:template>

  <xsl:template match="//*[parent::xs:schema and local-name() = 'simpleType']">
    <owl:DatatypeProperty>
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
    </owl:DatatypeProperty>
  </xsl:template>

  <xsl:template match="xs:sequence">
    <xsl:for-each select="child::xs:element">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty>
            <xsl:attribute name="rdf:resource" select="concat( $namespace, '#', attribute::name )"/>
          </owl:onProperty>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="xs:annotation">
    <xsl:element name="rdfs:comment">
      <xsl:value-of select="child::*"/>
    </xsl:element>
  </xsl:template>

  <!-- Match empty text nodes to nothing -->
  <xsl:template match="text()">
      <xsl:if test="string(.) = ''"/>
  </xsl:template>

</xsl:stylesheet>