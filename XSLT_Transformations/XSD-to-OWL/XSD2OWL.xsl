<?xml version="1.0" encoding="UTF-8"?>
<!-- TODO: replace <xsl:if> nodes with <xsl:element name="{if}"> nodes for more and concise templates. --> 
<!-- TODO: replace attribute::* with @* when possible for more concise templates -->
<!-- TODO: add attribute support -->
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
  <xsl:variable name="namespace" select="concat( //@targetNamespace, '#' )"/>

  <!-- ================================================================================================= -->
  <!-- ==================================== Root Transformations ======================================= -->
  <!-- ================================================================================================= -->
  <!-- Create ontology elements from import elements and comments. Apply templates
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

  <!-- Imports are not handled in this stylesheet (yet). If one is declared, transform it into a warning. -->
  <!-- TODO: test document() function for resolving imports? -->
  <xsl:template match="xs:import">
    <rdfs:comment>Warning: The schema <xsl:value-of select="@namespace"/> was not imported.</rdfs:comment>
  </xsl:template>


  <!-- ================================================================================================= -->
  <!-- ==================================== Element Transformations ==================================== -->
  <!-- ================================================================================================= -->
  <!-- Elements are transformed into owl:Class, owl:ObjectProperty, or owl:DatatypeProperty based on whether
  element is a child of the root schema or within a type, and if it's type is complex or simple. In addition,
  substitutionGroup attributes are also referenced as subClassOf or subPropertyOf resources when applicable. -->

  <!-- The element is a child of the root schema and has its type declared as a sub node -->
  <xsl:template match="//xs:element[parent::xs:schema and count(child::*) > 0]">
    <xsl:element name="{if (child::xs:complexType) then 'owl:Class' else 'owl:DatatypeProperty'}">
      <xsl:attribute name="rdf:about" select="concat( $namespace, @name )"/>
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <xsl:apply-templates select="@substitutionGroup"/>
    </xsl:element>
  </xsl:template>

  <!-- substitution group attributes that belong to elements with children are transformed into subclasses or subproperties -->
  <xsl:template match="@substitutionGroup[count(../child::*) > 0]">
    <xsl:element name="{if (../child::xs:complexType) then 'rdfs:subClassOf' else 'rdfs:subPropertyOf'}">
      <xsl:attribute name="rdf:resource" select="if (contains( . , ':' )) then . else concat( $namespace, . )"/>
    </xsl:element>
  </xsl:template>

  <!-- The elements with type declared outside the element: In order to determine if this element is a
  class or property, its type must be evaluated to determine if the element is complex or simple. This
  is done by storing the type as a variable (<xsl:variable name="thisType" select="attribute::type"/>)
  and searching for it (for example: test="//xs:complexType[attribute::name = $thisType]"). The element's
  complex or simple type will be referenced as an rdfs:subClassOf or rdfs:subPropertyOf resource after
  transformation. -->
  <xsl:template match="//xs:element[parent::xs:schema and @type]">
    <xsl:choose>
      <!-- If the element type contains a prefix, it must be declared outside of this schema. In this case
      if the element type is of a common xs datatype, it will be transformed into a Datatype property.
      Otherwise it will be assumed to be a class.-->
      <xsl:when test="contains( @type, ':' )">
        <xsl:element name="{if (contains( 'xs:string xs:decimal xs:integer xs:boolean xs:date xs:time', @type )) then 'owl:DatatypeProperty' else 'owl:Class'}">
          <xsl:attribute name="rdf:about" select="@name"/>
          <rdfs:comment>Warning: This entity is declared outside of its original schema. It may be declared incorrectly.</rdfs:comment>
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <xsl:element name="{if (contains( 'xs:string xs:decimal xs:integer xs:boolean xs:date xs:time', @type )) then 'rdfs:subPropertyOf' else 'rdfs:subClassOf'}">
            <xsl:attribute name="rdf:resource" select="@type"/>
          </xsl:element>
          <xsl:apply-templates select="@substitutionGroup"/>
        </xsl:element>
      </xsl:when>
      <!-- Otherwise the element type must be declared in the schema. If the type is a complexType create a
      Class as a subclass of the type. If the type is not complex, it must be a simpleType. In this case
      create a DatatypeProperty as a subproperty of the type. -->
      <xsl:otherwise>
        <xsl:variable name="thisType" select="@type"/>
        <xsl:element name="{if ( //xs:complexType[@name = $thisType] ) then 'owl:Class' else 'owl:DatatypeProperty'}">
          <xsl:attribute name="rdf:about" select="concat( $namespace, @name )"/>
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <xsl:element name="{if ( //xs:complexType[@name = $thisType] ) then 'rdfs:subClassOf' else 'rdfs:subPropertyOf'}">
            <xsl:attribute name="rdf:resource" select="concat( $namespace, @type )"/>
          </xsl:element>
          <xsl:apply-templates select="@substitutionGroup"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="@substitutionGroup[../@type]">
    <xsl:choose>
      <!-- substitution group attributes that belong to elements with types declared outside the schema are transformed into subclasses or subproperties -->
      <xsl:when test="contains( ../@type, ':' )">
        <xsl:element name="{if (contains( 'xs:string xs:decimal xs:integer xs:boolean xs:date xs:time', ../@type )) then 'rdfs:subPropertyOf' else 'rdfs:subClassOf'}">
          <xsl:attribute name="rdf:resource" select="."/>
        </xsl:element>
      </xsl:when>
        <!-- substitution group attributes that belong to elements with declared types are transformed into subclasses or subproperties -->
      <xsl:otherwise>
        <xsl:variable name="parentType" select="../@type"/>
        <xsl:element name="{if (//xs:complexType[@name = $parentType]) then 'rdfs:subClassOf' else 'rdfs:subPropertyOf'}">
          <xsl:attribute name="rdf:resource" select="concat( $namespace, . )"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!-- The element is a child of a xs:sequence xs:all or xs:choice node these elements are converted into
  object and data properties. rdfs:domain axioms are set by the respective ancestor element name.
  rdfs:range axioms are set by the type attribute -->
  <xsl:template match="//xs:element[parent::xs:sequence or parent::xs:all]">
    <xsl:variable name="thisType" select="@type"/>
    <xsl:choose>
      <!-- elements with xs:* type prefixes are assumed to be datatype properties -->
      <!-- TODO: denote specific, commonly used xs properties -->
      <xsl:when test="contains( $thisType, 'xs:' )">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::xs:complexType/@name )}"/>
          <rdfs:range rdf:resource="{$thisType}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <!-- elements with other type prefixes are declared outside of the schema and are assumed to be
      object properties. -->
      <xsl:when test="contains( $thisType, ':' )">
        <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:comment>Warning: This ObjectProperty type is declared outside of its original schema. It may not be an ObjectProperty.</rdfs:comment>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::xs:complexType/@name )}"/>
          <rdfs:range rdf:resource="{$thisType}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <!-- element type is a complexType. The element is transformed into an object property -->
      <xsl:when test="//xs:complexType[@name = $thisType]">
        <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::xs:complexType/@name )}"/>
          <rdfs:range rdf:resource="{concat( $namespace, $thisType )}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <!-- element type is a simpleType. The element is transformed into an data property -->
      <xsl:when test="//xs:simpleType[@name = $thisType]">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::xs:complexType/@name )}"/>
          <rdfs:range rdf:resource="{concat( $namespace, $thisType )}"/>
        </owl:DatatypeProperty>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <!-- ================================================================================================= -->
  <!-- ================================== ComplexType Transformations ================================== -->
  <!-- ================================================================================================= -->
  <!-- These templates match xs:complexTypes and transform them into owl:Classes. If the complex type is
  declared at 1st depth, it is transformed in to a class. If not, it must be declared as a child of an
  element. In this case, the respective element will call the appropriate templates and only transform
  the contents of the type.-->

  <!-- complexType is declared as a child of the root schema -->
  <xsl:template match="//xs:complexType[parent::xs:schema]">
    <owl:Class rdf:about="{concat( $namespace, attribute::name )}">
      <xsl:apply-templates select="attribute::abstract"/>
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:extension"/>
      <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all"/>
    </owl:Class>
  </xsl:template>

  <!-- Abstract classes are denoted by an rdfs:comment -->
  <xsl:template match="@abstract">
    <rdfs:comment>This is an abstract class</rdfs:comment>
  </xsl:template>

  <!-- xs:extensions are treated as parent classes of the respective class. -->
  <xsl:template match="xs:extension">
    <xsl:element name="{if (ancestor::xs:complexType) then 'rdfs:subClassOf' else 'rdfs:subPropertyOf'}">
      <xsl:attribute name="rdf:resource" select="if (contains( @base, ':' )) then @base else concat( $namespace, @base )"/>
    </xsl:element>
  </xsl:template>

  <!-- xs:sequences and xs:all transform their children into subclass or subproperty restrictions. --> 
  <xsl:template match="xs:sequence|xs:all">
  <!-- TODO: add min/max occurs case when attribute is declared in parent of element -->
    <xsl:for-each select="child::xs:element">
      <xsl:variable name="thisName" select="if (@name) then @name else @ref"/>
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty rdf:resource="{concat( $namespace, $thisName )}"/>
          <owl:allValuesFrom>
            <xsl:choose>
              <xsl:when test="@name">
                <xsl:attribute name="rdf:resource" select="if (contains( @type, ':'))
                                                           then @type
                                                           else concat( $namespace, @type )"/>
              </xsl:when>
              <xsl:when test="@ref">
                <xsl:variable name="thisType" select="//xs:element[@name = $thisName]/@type"/>
                <xsl:attribute name="rdf:resource" select="if (contains( $thisType, ':'))
                                                           then $thisType
                                                           else concat( $namespace, $thisType )"/>
              </xsl:when>
            </xsl:choose>
          </owl:allValuesFrom>
        </owl:Restriction>
      </rdfs:subClassOf>
      <xsl:apply-templates select="attribute::maxOccurs"/>
      <xsl:apply-templates select="attribute::minOccurs"/>
    </xsl:for-each>
  </xsl:template>

  <!-- TODO: implement choice template -->

  <!-- Cardinality is preserved by transforming xs:minOccurs into owl:minCardinality unless the value is 0 -->
  <xsl:template match="@minOccurs">
    <xsl:if test=". != 0">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty rdf:resource="{concat( $namespace, if (../@name)
                                                                     then ../@name
                                                                     else ../@ref )}"/>
          <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
            <xsl:value-of select="."/>
          </owl:minCardinality>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:if>
  </xsl:template>

  <!-- Cardinality is preserved by transforming xs:maxOccurs into owl:maxCardinality unless the value is
  unbounded, in which case it is ignored -->
  <xsl:template match="@maxOccurs">
    <xsl:if test=". != 'unbounded'">
      <rdfs:subClassOf>
        <owl:Restriction>
          <owl:onProperty rdf:resource="{concat( $namespace, if (../@name)
                                                                     then ../@name
                                                                     else ../@ref )}"/>
          <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
            <xsl:value-of select="."/>
          </owl:minCardinality>
        </owl:Restriction>
      </rdfs:subClassOf>
    </xsl:if>
  </xsl:template>


  <!-- ================================================================================================= -->
  <!-- ================================== SimpleType Transformations =================================== -->
  <!-- ================================================================================================= -->
  <xsl:template match="//xs:simpleType[parent::xs:schema]">
    <owl:DatatypeProperty rdf:about="{concat( $namespace, attribute::name )}">
      <xsl:apply-templates select="descendant::xs:restriction|descendant::xs:list|descendant::xs:union"/>
      <!-- TODO: add enumeration support -->
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


  <!-- ================================================================================================= -->
  <!-- ================================= Miscellaneous Transformations ================================= -->
  <!-- ================================================================================================= -->
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