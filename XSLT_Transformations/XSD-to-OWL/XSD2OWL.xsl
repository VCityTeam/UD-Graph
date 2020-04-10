<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs"
                version="2.0"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                xmlns:owl="http://www.w3.org/2002/07/owl#"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:variable name="namespace" select="//attribute::targetNamespace"/>

  <xsl:template match="/">
    <rdf:RDF>
      <xsl:apply-templates select="//*[parent::xs:schema]"/>
    </rdf:RDF>
  </xsl:template>

  <xsl:template match="//*[parent::xs:schema and local-name() = 'complexType']">
    <xsl:element name="owl:class">
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
      <xsl:apply-templates select="child::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:sequence"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="//*[parent::xs:schema and local-name() = 'element']">
    <owl:class>
      <xsl:attribute name="rdf:about" select="concat( $namespace, '#', attribute::name )"/>
<!--       <xsl:apply-templates select="attribute::*"/> -->
    </owl:class>
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

<!-- TODO: implement element subclasses -->
<!--   <xsl:template match="//*[parent::xs:element and self::type]">
    <xsl:element name="rdfs:subClassOf" -->

  <!-- Match empty text nodes to nothing -->
  <xsl:template match="text()">
      <xsl:if test="string(.) = ''"/>
  </xsl:template>

</xsl:stylesheet>