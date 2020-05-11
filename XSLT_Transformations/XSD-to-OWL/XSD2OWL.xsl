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
        <xsl:apply-templates select="/xs:schema/xs:annotation"/>
      </owl:Ontology>
      <xsl:apply-templates select="/xs:schema/xs:complexType"/>
      <xsl:apply-templates select="/xs:schema/xs:simpleType"/>
      <xsl:apply-templates select="/xs:schema/xs:element"/>
      <xsl:apply-templates select="//xs:attribute"/>
      <xsl:apply-templates select="//xs:element[parent::xs:sequence or parent::xs:all or parent::xs:choice]"/>
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
  <!-- =========================================== # 15,16,21 =========================================== -->
  <xsl:template match="/xs:schema/xs:element[@type]">
    <xsl:variable name="thisType" select="@type"/>
    <xsl:choose>
      <xsl:when test="starts-with( @type, 'xs:' ) and @type != 'xs:anyType' or //xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
        <rdfs:Datatype rdf:about="concat( $namespace, @name )">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <owl:equivalentClass rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
        </rdfs:Datatype>
      </xsl:when>
      <xsl:when test="//xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisType]">
        <owl:Class rdf:about="{concat( $namespace, @name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
          <xsl:apply-templates select="@substitutionGroup"/>
          <rdfs:subClassOf rdf:resource="{concat( $namespace, @type )}"/>
        </owl:Class>
      </xsl:when>
      <xsl:otherwise><!-- Otherwise this element type is declared outside of the schema -->
        <owl:Class rdf:about="{concat( $namespace, @name )}">
          <xsl:apply-templates select="descendant::xs:annotation"/>
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
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{concat( $namespace, @type )}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <xsl:when test="starts-with( @type, 'xs:' ) and not( @type = 'xs:anyType' )">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{@type}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <xsl:when test="//xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range rdf:resource="{concat( $namespace, @type )}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <xsl:when test="contains( @type, ':' )">
        <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
          <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{@type}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <xsl:when test="contains( @ref, ':' )">
        <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
        <owl:ObjectProperty rdf:about="{concat( $thisReference[1], ':has', $thisReference[2] )}">
          <rdfs:comment>Warning: This ObjectProperty reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{@ref}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <xsl:otherwise><!-- Otherwise this element has a reference to another element within the schema.
      The referenced element is either a complex or simple type -->
        <xsl:variable name="thisReference" select="@ref"/>
        <xsl:variable name="thisType" select="//xs:element[@name = $thisReference]/@type"/>
        <xsl:element name="{if ( $thisType = 'xs:anyType' or //xs:complexType[@name = $thisType] or //xs:element[xs:complexType and @name = $thisReference] )
                            then 'owl:ObjectProperty'
                            else 'owl:DatatypeProperty'}">
          <xsl:attribute name="rdf:about" select="concat( $namespace, 'has', @ref )"/>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
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
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{concat( $namespace, @type )}"/>
        </owl:ObjectProperty>
      </xsl:when>
      <xsl:when test="starts-with( @type, 'xs:' ) and not( @type = 'xs:anyType' )">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
          <rdf:type    rdf:resource="owl:FunctionalProperty"/>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{@type}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <xsl:when test="//xs:simpleType[@name = $thisType] or //xs:element[xs:simpleType and @name = $thisType]">
        <owl:DatatypeProperty rdf:about="{concat( $namespace, @name )}">
          <rdf:type    rdf:resource="owl:FunctionalProperty"/>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{concat( $namespace, @type )}"/>
        </owl:DatatypeProperty>
      </xsl:when>
      <xsl:when test="contains( @type, ':' )">
        <owl:ObjectProperty rdf:about="{concat( $namespace, @name )}">
          <rdf:type    rdf:resource="owl:FunctionalProperty"/>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{@type}"/>
          <rdfs:comment>Warning: This ObjectProperty type was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        </owl:ObjectProperty>
      </xsl:when>
      <xsl:when test="contains( @ref, ':' )">
        <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
        <owl:ObjectProperty rdf:about="{concat( $thisReference[1], ':has', $thisReference[2] )}">
          <rdf:type    rdf:resource="owl:FunctionalProperty"/>
          <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
          <rdfs:range  rdf:resource="{@ref}"/>
          <rdfs:comment>Warning: This ObjectProperty reference was declared outside of its original schema. This ObjectProperty may be declared incorrectly.</rdfs:comment>
        </owl:ObjectProperty>
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
          <rdfs:domain   rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
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
  <xsl:template match="/xs:schema/xs:complexType|/xs:schema/xs:element[xs:complexType]">
    <owl:Class rdf:about="{concat( $namespace, @name )}">
      <xsl:apply-templates select="@abstract"/>
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:sequence|descendant::xs:all|descendant::xs:choice"/>
      <xsl:apply-templates select="descendant::xs:attribute"/>
      <!-- If the class is an extension of a complexType, this class is a subclass of that class -->
      <!-- ======================================== # 9,12,13,14 ======================================== -->
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
          <rdfs:comment>Warning: The parent class '<xsl:value-of select="$thisBase"/>' is declared outside of this class' original schema. This class may be declared incorrectly.</rdfs:comment>
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
    <rdfs:range  rdf:resource="{./*/@base}"/>
    <xsl:if test="not(starts-with( ./*/@base, 'xs:' )) or ./*/@base = 'xs:anyType'">
      <rdfs:subPropertyOf rdf:resource="{concat( 'has', ./*/@base )}"/>
      <xsl:if test="contains( ./*/@base, ':')">
        <rdfs:comment>Warning: The parent property '<xsl:value-of select="concat( 'has', ./*/@base )"/>' is declared outside of this property's original schema. This property may be declared incorrectly.</rdfs:comment>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <!-- xs:sequences and xs:all transform their children into subclass or subproperty restrictions. --> 
  <xsl:template match="xs:sequence|xs:all">
  <!-- TODO: add min/max occurs case when attribute is declared in parent of element -->
    <owl:equivalentClass>
      <owl:Class>
        <owl:intersectionOf rdf:parseType="Collection">
          <xsl:for-each select="./xs:element">
            <owl:Restriction>
              <xsl:choose>
                <xsl:when test="@name">
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
            <xsl:apply-templates select="@maxOccurs"/>
            <xsl:apply-templates select="@minOccurs"/>
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
            <owl:Class rdf:about="{concat( $namespace, ancestor::*/@name, if (contains( @name, ':')) then $thisName[2] else @name )}">
              <owl:equivalentClass>
                <owl:Restriction>
                  <owl:onProperty    rdf:resource="{if (contains( @name, ':' )) then @name else concat( $namespace, @name )}"/>
                  <owl:allValuesFrom rdf:resource="{if (contains( @type, ':' )) then @type else concat( $namespace, @type )}"/>
                </owl:Restriction>
              </owl:equivalentClass>
              <rdfs:subClassOf rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
            </owl:Class>
          </xsl:when>
          <xsl:when test="contains( @ref, ':' )">
            <owl:Class rdf:about="{concat( $namespace, ancestor::*/@name, if (contains( @ref, ':')) then $thisReference[2] else @ref )}">
              <owl:equivalentClass>
                <owl:Restriction>
                  <owl:onProperty    rdf:resource="{concat( $thisReference[1], ':has', $thisReference[2] )}"/>
                  <owl:allValuesFrom rdf:resource="{@ref}"/>
                </owl:Restriction>
              </owl:equivalentClass>
              <rdfs:subClassOf rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
            </owl:Class>
          </xsl:when>
          <xsl:otherwise><!-- @ref reference is declared in the schema -->
            <owl:Class rdf:about="{concat( $namespace, ancestor::*/@name, if (contains( @ref, ':')) then $thisReference[2] else @ref )}">
              <owl:equivalentClass>
                <owl:Restriction>
                  <owl:onProperty    rdf:resource="{concat( $namespace, 'has', @ref )}"/>
                  <owl:allValuesFrom rdf:resource="{@ref}"/>
                </owl:Restriction>
              </owl:equivalentClass>
              <rdfs:subClassOf rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
            </owl:Class>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </owl:disjointUnionOf>
  </xsl:template>



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
        <owl:onProperty     rdf:resource="{concat( $namespace, if (../@name) then ../@name else ../@ref )}"/>
        <owl:minCardinality rdf:datatype="xs:nonNegativeInteger">
          <xsl:value-of     select="."/>
        </owl:minCardinality>
      </owl:Restriction>
    </xsl:if>
  </xsl:template>



  <!-- ================================================================================================= -->
  <!-- ================================== SimpleType Transformations =================================== -->
  <!-- ================================================================================================= -->

  <!-- ============================================== # 1 ============================================== -->
  <xsl:template match="/xs:schema/xs:simpleType">
    <rdfs:Datatype rdf:about="{concat( $namespace, @name )}">
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:restriction"/>
      <xsl:apply-templates select="descendant::xs:union"/>
      <!-- TODO: <xsl:apply-templates select="./xs:list"/> -->
    </rdfs:Datatype>
  </xsl:template>

  <!-- ============================================ # 19,20 ============================================ -->
  <xsl:template match="/xs:schema/xs:element[xs:simpleType]">
    <rdfs:Datatype rdf:about="{concat( $namespace, @name )}">
      <xsl:apply-templates select="descendant::xs:annotation"/>
      <xsl:apply-templates select="descendant::xs:restriction"/>
      <xsl:apply-templates select="descendant::xs:union"/>
      <!-- TODO: <xsl:apply-templates select="./xs:list"/> -->
    </rdfs:Datatype>
    <owl:DatatypeProperty rdf:about="{concat( $namespace, 'has', @name )}">
      <rdfs:range rdf:resource="{concat( $namespace, @name )}"/>
      <xsl:variable name="thisBase" select="./xs:restriction/@base"/>
      <xsl:choose>
        <xsl:when test="//xs:simpleType[@name = $thisBase]">
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
      <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
      <rdfs:range rdf:resource="{concat( $namespace, @type )}"/>
    </owl:DatatypeProperty>
  </xsl:template>

  <!-- ============================================ # 28 ============================================ -->
  <xsl:template match="xs:attribute[ancestor::xs:complexType and @ref]">
    <xsl:variable name="thisReference" select="tokenize( @ref, ':' )"/>
    <owl:DatatypeProperty rdf:about="{if (contains( @ref, ':')) then concat( $thisReference[1], ':has', $thisReference[2] ) else concat( $namespace, 'has', @ref )}">
      <rdfs:domain rdf:resource="{concat( $namespace, ancestor::*/@name )}"/>
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