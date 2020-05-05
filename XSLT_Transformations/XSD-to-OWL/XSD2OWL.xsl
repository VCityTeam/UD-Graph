<?xml version="1.0" encoding="UTF-8"?>
<!-- TODO: replace <xsl:if> nodes with <xsl:element name="{if}"> nodes for more and concise templates. --> 
<!-- TODO: replace attribute::* with @* when possible for more concise templates -->
<!-- TODO: add attribute support -->
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
      <owl:Ontology rdf:about="http://liris.cnrs.fr/ontologies">
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
        <xsl:element name="{if ( starts-with( @type, 'xs:' ) and not( @type = 'xs:anyType' ) ) then 'owl:DatatypeProperty' else 'owl:Class'}">
          <xsl:attribute name="rdf:about" select="@name"/>
          <rdfs:comment>Warning: This entity type is declared outside of its original schema. It may be declared incorrectly.</rdfs:comment>
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <xsl:element name="{if (starts-with( @type, 'xs:' ) and @type != 'xs:anyType') then 'rdfs:subPropertyOf' else 'rdfs:subClassOf'}">
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

  <!-- substitution group attributes are transformed into subclasses -->
  <xsl:template match="@substitutionGroup">
    <rdfs:subClassOf rdf:resource="{if (contains( . , ':' )) then . else concat( $namespace, . )}"/>
  </xsl:template>


  <!-- The element is a child of a xs:sequence, xs:all, or xs:choice node these elements are converted into
  object and data properties. rdfs:domain axioms are set by the respective ancestor element name.
  rdfs:range axioms are set by the type attribute -->
  <xsl:template match="//xs:element[parent::xs:sequence or parent::xs:all or parent::xs:choice]">
    <xsl:variable name="thisType" select="@type"/>
    <xsl:choose>
      <!-- elements with xs:* type prefixes are assumed to be datatype properties -->
      <!-- TODO: denote specific, commonly used xs properties -->
      <xsl:when test="starts-with( $thisType, 'xs:' )">
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

  <!-- # 3. complexType is declared as a child of the root schema -->
  <xsl:template match="/xs:schema/xs:complexType|/xs:schema/xs:element[xs:complexType]">
    <owl:Class rdf:about="{concat( $namespace, @name )}">
      <xsl:apply-templates select="@abstract"/>
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all|descendant::xs:choice"/>
      <!-- If the class is an extension of a complexType, this class is a subclass of that class -->
      <!-- =========================================== # 9,12 =========================================== -->
      <xsl:variable name="thisBase" select="descendant::*/@base"/>
      <xsl:choose>
        <xsl:when test="//xs:complexType[@name = $thisBase] or //xs:element[@name = @thisBase and xs:complexType]">
          <rdfs:subClassOf rdf:resource="{concat( $namespace, $thisBase )}"/>
        </xsl:when>
        <xsl:when test="//xs:element[@name = $thisBase and @type]">
          <xsl:variable name="thisType" select="//xs:element[@name = $thisBase]/@type"/>
          <xsl:if test="//xs:complexType[@name = $thisType]">
            <rdfs:subClassOf rdf:resource="{concat( $namespace, $thisBase )}"/>
          </xsl:if>
        </xsl:when>
        <xsl:when test="contains( $thisBase, ':') and not(starts-with( $thisBase, 'xs:' )) or $thisBase ='xs:anyType'">
          <rdfs:subClassOf rdf:resource="{$thisBase}"/>
          <rdfs:comment>Warning: The parent class '<xsl:value-of select="$thisBase"/>' is declared outside of this class' original schema. It may not be a class.</rdfs:comment>
        </xsl:when>
        <xsl:otherwise/>
      </xsl:choose>
    </owl:Class>
    <xsl:apply-templates select="descendant::xs:simpleContent"/>
    <!-- TODO: <xsl:apply-templates select="descendant::xs:complexContent"/> -->
  </xsl:template>

  <!-- Abstract classes are denoted by an rdfs:comment -->
  <xsl:template match="@abstract">
    <rdfs:comment>This is an abstract class</rdfs:comment>
  </xsl:template>

  <!-- xs:simpleContent will always be converted into a datatype property. 'has' is added to the beggining
  of the property name to avoid conflicting intersection with it's parent complexType. If it contains
  a child xs:restriction a datatype property will also be created with 'Datatype' appended to the name to avoid
  conflicting intersections with it's parent complexType. If a @base attribute is declared the resulting
  Datatypes and DatatypePropreties will inherit it as a superclass or superproperty. -->
  <!-- ============================================ # 6,8,9 ============================================ -->
  <xsl:template match="xs:simpleContent">
    <owl:DatatypeProperty rdf:about="{concat( $namespace, 'has' ,ancestor::*/@name )}">
      <xsl:call-template name="simpleContent-property"/>
    </owl:DatatypeProperty>
    <!-- ========================================== # 10,11,12 ========================================== -->
    <xsl:if test="./xs:restriction">
      <rdfs:Datatype rdf:about="{concat( $namespace, ancestor::*/@name, 'Datatype' )}">
        <xsl:apply-templates select="xs:restriction"/>
      </rdfs:Datatype>
    </xsl:if>
  </xsl:template>

  <!-- xs:extensions are transformed into datatype properties with 'has' appended to
  the name. The extension is declared as a datatype property as well and as the superclass of the initial
  datatype property. Note that 'ancestor::*/@name' is used to determine the name of the
  original class. This is required because we cannot assume which parent node contains the @name attribute.
  It could be the parent xs:element or xs:complexType. -->
  <xsl:template name="simpleContent-property">
    <rdfs:domain rdf:resource="{ancestor::*/@name}"/>
    <rdfs:range rdf:resource="{./*/@base}"/>
    <xsl:if test="not(starts-with( ./*/@base, 'xs:' )) or ./*/@base = 'xs:anyType'">
      <rdfs:subPropertyOf rdf:resource="{concat( 'has', ./*/@base )}"/>
      <xsl:if test="contains( ./*/@base, ':')">
        <rdfs:comment>Warning: The parent property '<xsl:value-of select="concat( 'has', ./*/@base )"/>' is declared outside of this property's original schema. It may not be a property.</rdfs:comment>
      </xsl:if>
    </xsl:if>
    <!-- TODO: add attribute cases 26-28 for @base of a complexType -->
  </xsl:template>

  <!-- xs:sequences and xs:all transform their children into subclass or subproperty restrictions. --> 
  <xsl:template match="xs:sequence|xs:all">
  <!-- TODO: add min/max occurs case when attribute is declared in parent of element -->
    <rdfs:subClassOf>
      <owl:Class>
        <owl:intersectionOf rdf:parseType="Collection">
          <xsl:for-each select="child::xs:element">
            <owl:Restriction>
              <xsl:choose>
                <xsl:when test="@name">
                    <owl:onProperty rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, @name )}"/>
                    <owl:allValuesFrom rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
                </xsl:when>
                <xsl:when test="@ref and not(contains( @ref, ':' ))">
                  <owl:onProperty rdf:resource="{concat( $namespace, 'has', @ref )}"/>                  
                  <owl:allValuesFrom rdf:resource="{concat( $namespace, @ref )}"/>
                </xsl:when>
                <xsl:otherwise><!-- Otherwise element/@ref refers to an object outside of the specified schema -->
                  <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
                  <owl:onProperty rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                  <owl:allValuesFrom rdf:resource="{@ref}"/>
                </xsl:otherwise>
              </xsl:choose>
            </owl:Restriction>
            <xsl:apply-templates select="@maxOccurs"/>
            <xsl:apply-templates select="@minOccurs"/>
          </xsl:for-each>
        </owl:intersectionOf>
      </owl:Class>
    </rdfs:subClassOf>
  </xsl:template>

  <xsl:template match="xs:choice">
    <rdfs:subClassOf>
      <owl:Class>
        <owl:intersectionOf rdf:parseType="Collection">
          <owl:Class>
            <owl:unionOf rdf:parseType="Collection">
              <xsl:for-each select="child::xs:element">
                <xsl:variable name="thisName" select="if (@name) then @name else @ref"/>
                <owl:Restriction>
                  <owl:onProperty rdf:resource="{if (contains( $thisName, ':' )) then $thisName else concat( $namespace, $thisName )}"/>
                  <owl:allValuesFrom>
                    <xsl:choose>
                      <xsl:when test="@name">
                        <xsl:attribute name="rdf:resource" select="if (contains( @type, ':' )) then @type else concat( $namespace, @type )"/>
                      </xsl:when>
                      <xsl:when test="@ref and not(contains( @ref, ':' ))">
                        <xsl:variable name="thisType" select="//xs:element[@name = $thisName]/@type"/>
                        <xsl:attribute name="rdf:resource" select="if (contains( $thisType, ':' )) then $thisType else concat( $namespace, $thisType )"/>
                      </xsl:when>
                      <xsl:otherwise><xsl:attribute name="rdf:resource" select="concat( substring-before( @ref, ':' ), ':UNKNOWN_TYPE' )"/></xsl:otherwise>
                    </xsl:choose>
                  </owl:allValuesFrom>
                </owl:Restriction>
              </xsl:for-each>
            </owl:unionOf>
          </owl:Class>
          <owl:Class>
            <owl:complementOf>
              <owl:Class>
                <owl:intersectionOf rdf:parseType="Collection">
                  <xsl:for-each select="child::xs:element">
                    <xsl:variable name="thisName" select="if (@name) then @name else @ref"/>
                    <owl:Restriction>
                      <owl:onProperty rdf:resource="{if (contains( $thisName, ':' )) then $thisName else concat( $namespace, $thisName )}"/>
                      <owl:allValuesFrom>
                        <xsl:choose>
                          <xsl:when test="@name">
                            <xsl:attribute name="rdf:resource" select="if (contains( @type, ':' )) then @type else concat( $namespace, @type )"/>
                          </xsl:when>
                          <xsl:when test="@ref and not(contains( @ref, ':' ))">
                            <xsl:variable name="thisType" select="//xs:element[@name = $thisName]/@type"/>
                            <xsl:attribute name="rdf:resource" select="if (contains( $thisType, ':' )) then $thisType else concat( $namespace, $thisType )"/>
                          </xsl:when>
                          <xsl:otherwise><xsl:attribute name="rdf:resource" select="concat( substring-before( @ref, ':' ), ':UNKNOWN_TYPE' )"/></xsl:otherwise>
                        </xsl:choose>
                      </owl:allValuesFrom>
                    </owl:Restriction>
                  </xsl:for-each>
                </owl:intersectionOf>
              </owl:Class>
            </owl:complementOf>
          </owl:Class>
        </owl:intersectionOf>
      </owl:Class>
    </rdfs:subClassOf>
  </xsl:template>

  <!-- Cardinality is preserved by transforming xs:minOccurs into owl:minCardinality unless the value is 0 -->
  <xsl:template match="@minOccurs">
    <xsl:if test=". != 0">
      <owl:Restriction>
        <owl:onProperty rdf:resource="{concat( $namespace, if (../@name) then ../@name else ../@ref )}"/>
        <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
          <xsl:value-of select="."/>
        </owl:minCardinality>
      </owl:Restriction>
    </xsl:if>
  </xsl:template>

  <!-- Cardinality is preserved by transforming xs:maxOccurs into owl:maxCardinality unless the value is
  unbounded, in which case it is ignored -->
  <xsl:template match="@maxOccurs">
    <xsl:if test=". != 'unbounded'">
      <owl:Restriction>
        <owl:onProperty rdf:resource="{concat( $namespace, if (../@name) then ../@name else ../@ref )}"/>
        <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
          <xsl:value-of select="."/>
        </owl:minCardinality>
      </owl:Restriction>
    </xsl:if>
  </xsl:template>


  <!-- ================================================================================================= -->
  <!-- ================================== SimpleType Transformations =================================== -->
  <!-- ================================================================================================= -->

  <!-- # 1 -->
  <xsl:template match="/xs:schema/xs:simpleType[@name]">
    <rdfs:Datatype rdf:about="{concat( $namespace, @name )}">
      <xsl:apply-templates select="./xs:restriction"/>
      <xsl:apply-templates select="./xs:union"/>
      <!-- TODO: <xsl:apply-templates select="./xs:list"/> -->
    </rdfs:Datatype>
  </xsl:template>

  <!-- ============================================== # 2 ============================================== -->
  <xsl:template match="/xs:schema/xs:simpleType[@name]/xs:union">
      <rdfs:comment>TODO: implement xsd:union</rdfs:comment>
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