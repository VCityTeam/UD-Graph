import sys
from lxml import etree
from copy import deepcopy


def main():

   # initialize variables
   global ns
   global ontology_root
   global id_dictionary
   global class_description_cache
   global datatype_description_cache
   global objectproperty_description_cache
   global datatypeproperty_description_cache
   template = ('<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" ' +
               '         xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" ' + 
               '         xmlns:owl="http://www.w3.org/2002/07/owl#" ' + 
               '         xmlns:gml="http://www.opengis.net/gml#" ' + 
               '         xmlns:core="http://www.opengis.net/citygml/2.0#" ' + 
               '         xmlns:bldg="http://www.opengis.net/citygml/building/2.0#">' +
               '   <owl:Ontology rdf:about="{}">'.format( sys.argv[1].split('/')[-1].split('.')[0] ) +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/cityGMLBase"/>' +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/building"/>' +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/gml"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/basicTypes"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/gmlBase"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryPrimitives"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryBasic0d1d"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryBasic2d"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryAggregates"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryComplexes"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/measures"/>' +
               # '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/feature"/>' +
               '   </owl:Ontology>' +
               '</rdf:RDF>')
   input_root    = etree.parse(sys.argv[1]).getroot()
   output_root   = etree.fromstring(template)
   ontology_root = etree.fromstring(template)
   ns = { k: '{%s}' % v for k, v in output_root.nsmap.items() }
   id_dictionary = {}
   class_description_cache = {}
   datatype_description_cache = {}
   objectproperty_description_cache = {}
   datatypeproperty_description_cache = {}

   # compile ontology
   for child in etree.parse('../../Ontologies/cityGMLBase.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/building.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/compositegml.rdf').getroot():
      ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/gml.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/basicTypes.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/gmlBase.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/geometryPrimitives.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/geometryBasic0d1d.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/geometryBasic2d.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/geometryAggregates.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/geometryComplexes.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/measures.rdf').getroot():
   #    ontology_root.insert(0, child)
   # for child in etree.parse('../../Ontologies/GML/feature.rdf').getroot():
   #    ontology_root.insert(0, child)

   # clean ontologies
   for node in input_root.iter():
      if node.text is not None and not node.text.strip():
         node.text = None
   etree.indent(input_root)
   
   for node in ontology_root.iter():
      if node.text is not None and not node.text.strip():
         node.text = None
   etree.indent(ontology_root)

   # convert xml tree
   for input_node in input_root.iter():
      tag = qualifyTag(etree.QName(input_node))
      input_class_description = getClassDescription('{}{}'.format( tag.namespace, tag.localname ))

      if input_class_description is not None:
         # if node description is a class, create a named individual based on the description
         output_node = etree.SubElement( output_root, '{}NamedIndividual'.format( ns['owl'] ) )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ]  = '{}{}'.format( tag.namespace, tag.localname )
         output_node.attrib[ '{}about'.format( ns['rdf'] ) ] = generateID(tag.localname)
         child_ids = dict(id_dictionary)

         # if node has text, create a datatype property and datatypes from the text and the node description
         if input_node.text is not None:
            for restriction in input_class_description.findall( './/{}Restriction'.format( ns['owl'] )):
               restriction_property = restriction.find( './/{}onProperty'.format( ns['owl'] ))
               restriction_datatype = getRDFResource( restriction.find( './/{}someValuesFrom'.format(ns['owl']) ))
               if restriction_datatype is None:
                  restriction_datatype = getRDFResource( restriction.find( './/{}allValuesFrom'.format(ns['owl']) ))
               property_description = getDatatypePropertyDescription( getRDFResource(restriction_property) )

               if property_description is not None and property_description.find( './/{}range[@{}resource = "{}"]'.format(
                     ns['rdfs'], ns['rdf'], restriction_datatype )) is not None:
                  output_child_uri = getRDFResource(restriction_property).split('#')
                  output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                  output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = getRDFResource(property_description.find( './/{}range'.format( ns['rdfs'] )))
                  output_child.text = input_node.text
                  break

         # if node has attributes, create datatype property and datatype from the attribute
         for input_attribute in input_node.attrib.items():
            attribute_tag = etree.QName(input_attribute[0])
            if attribute_tag.namespace is None:
               attribute_tag = etree.QName( '{%s}%s' % ( tag.namespace, input_attribute[0]))
            attribute_tag = qualifyTag( attribute_tag )

            # if attribute is a datatype property directly create property and object
            attribute_descriptions = getAllDescriptions('{}{}'.format( attribute_tag.namespace, attribute_tag.localname ))
            if attribute_descriptions['datatypeproperty'] is not None:
               output_child = etree.SubElement(output_node, '{%s}%s' % ( attribute_tag.namespace, attribute_tag.localname ))
               output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = getRDFResource(attribute_descriptions['datatypeproperty'].find( './/{}range'.format( ns['rdfs'] )))
               output_child.text = input_attribute[1]
            # if attribute is a datatype find the corresponding datatype property description, then create the property and object
            elif attribute_descriptions['datatype'] is not None:
               # TODO: search class description instead of property description for datatype
               for property_description in ontology_root.findall( './/{}DatatypeProperty'.format( ns['owl'] )):
                  if property_description.find( './{}range[@{}resource = "{}{}"]'.format(
                        ns['rdfs'], ns['rdf'], attribute_tag.namespace, attribute_tag.localname )) is not None:
                     output_child_uri = getRDFAbout(property_description)
                     output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri.namespace, output_child_uri.localname ))
                     output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = '{}{}'.format( attribute_tag.namespace, attribute_tag.localname )
                     output_child.text = input_attribute[1]
                     break
            else:
            # if input node attribute has a no descriptions, create an unknown type
               output_child = etree.SubElement( output_node, 'UNKNOWN_ATTRIBUTE' )
               output_child.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( attribute_tag.namespace, attribute_tag.localname )

         # create corresponding property nodes from input children
         for input_child in input_node:
            child_tag = qualifyTag(etree.QName(input_child))
            if child_tag.localname in child_ids:
               child_ids[child_tag.localname] = child_ids[child_tag.localname] + 1
            else:
               child_ids[child_tag.localname] = 0
            child_descriptions = getAllDescriptions('{}{}'.format( child_tag.namespace, child_tag.localname ))

            # if child node description is an object property, create an object property between the node and its grandchildren, attributes, and text
            if child_descriptions['objectproperty'] is not None:

               # if child node has no children but has text or attributes, create property and grandchild object from the text or attributes
               if len(input_child) == 0 and ( input_child.text is not None or len(input_child.attrib) > 0 ):
                  # name grandchild
                  grandchild_uri = getRDFResource(child_descriptions['objectproperty'].find( './/{}range'.format( ns['rdfs'] ))).split('#')
                  grandchild_tag = qualifyTag(etree.QName( '{%s}%s' % ( grandchild_uri[0], grandchild_uri[1] ) ))
                  if grandchild_tag.localname in child_ids:
                     child_ids[grandchild_tag.localname] = child_ids[grandchild_tag.localname] + 1
                  else:
                     child_ids[grandchild_tag.localname] = 0
                  grandchild_description = getClassDescription( '{}{}'.format(grandchild_tag.namespace, grandchild_tag.localname ))

                  # create object property and grandchild
                  output_child = etree.SubElement(output_node, '{%s}%s' % ( child_tag.namespace, child_tag.localname ))
                  output_child.attrib[ '{}resource'.format( ns['rdf'] )] = '#{}_{}'.format( grandchild_tag.localname, child_ids[grandchild_tag.localname] )
                  output_grandchild = etree.SubElement(output_root, '{}NamedIndividual'.format( ns['owl'] ))
                  output_grandchild.attrib[ '{}type'.format( ns['rdf'] ) ]  = '{}{}'.format( grandchild_tag.namespace, grandchild_tag.localname )
                  output_grandchild.attrib[ '{}about'.format( ns['rdf'] ) ] = generateID(grandchild_tag.localname)

                  if grandchild_description is not None:
                     for restriction_property in grandchild_description.findall( './/{}Restriction/{}onProperty'.format( ns['owl'], ns['owl'] )):
                        property_description = getDatatypePropertyDescription( getRDFResource(restriction_property) )
                        output_greatgrandchild_uri = getRDFResource(restriction_property).split('#')

                        if property_description is not None and output_greatgrandchild_uri[1] in input_child.attrib:
                           output_greatgrandchild = etree.SubElement(output_grandchild, '{%s#}%s' % ( output_greatgrandchild_uri[0], output_greatgrandchild_uri[1] ))
                           output_greatgrandchild.attrib[ '{}datatype'.format( ns['rdf'] ) ] = getRDFResource(property_description.find( './/{}range'.format( ns['rdfs'] )))
                           output_greatgrandchild.text = input_child.attrib[output_greatgrandchild_uri[1]]
                        elif property_description is not None and '{%s}%s' % (output_greatgrandchild_uri[0], output_greatgrandchild_uri[1]) in input_child.attrib:
                           output_greatgrandchild = etree.SubElement(output_grandchild, '{%s#}%s' % ( output_greatgrandchild_uri[0], output_greatgrandchild_uri[1] ))
                           output_greatgrandchild.attrib[ '{}datatype'.format( ns['rdf'] ) ] = getRDFResource(property_description.find( './/{}range'.format( ns['rdfs'] )))
                           output_greatgrandchild.text = input_child.attrib[output_greatgrandchild_uri[1]]
                        elif property_description is not None and input_child.text is not None:
                           output_greatgrandchild_uri = getRDFResource(restriction_property).split('#')
                           output_greatgrandchild = etree.SubElement(output_grandchild, '{%s#}%s' % ( output_greatgrandchild_uri[0], output_greatgrandchild_uri[1] ))
                           output_greatgrandchild.attrib[ '{}datatype'.format( ns['rdf'] ) ] = getRDFResource(property_description.find( './/{}range'.format( ns['rdfs'] )))
                           output_greatgrandchild.text = input_child.text
               else:
                  # else create an object property with a reference for each grandchild
                  for grandchild_node in input_child:
                     grandchild_tag = qualifyTag(etree.QName(grandchild_node))
                     if grandchild_tag.localname in child_ids:
                        child_ids[grandchild_tag.localname] = child_ids[grandchild_tag.localname] + 1
                     else:
                        child_ids[grandchild_tag.localname] = 0
                     output_child = etree.SubElement(output_node, '{%s}%s' % ( child_tag.namespace, child_tag.localname ))
                     output_child.attrib[ '{}resource'.format( ns['rdf'] )] = '#{}_{}'.format( grandchild_tag.localname, child_ids[grandchild_tag.localname] )

            # if child node description is a datatype property, create an datatype property between the node and its grandchildren
            elif child_descriptions['datatypeproperty'] is not None:

               output_child = etree.SubElement(output_node, '{%s}%s' % ( child_tag.namespace, child_tag.localname ))
               output_child.attrib[ '{}datatype'.format( ns['rdf'] )] = '{}'.format( getRDFResource(
                  child_descriptions['datatypeproperty'].find('.//{}range'.format( ns['rdfs'] ))))
               output_child.text = input_child.text

            # if child node description is a class, create an object property between the node and child individuals
            elif child_descriptions['class'] is not None:

               # get all restrictions from input description
               for restriction in input_class_description.findall( './/{}Restriction'.format( ns['owl'] )):
                  if restriction.find( './*[@{}resource = "{}{}"]'.format( ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                     on_property = restriction.find( '{}onProperty'.format(ns['owl']) )
                     property_description = getObjectPropertyDescription( getRDFResource(on_property) )
                     if property_description is not None and property_description.find( './/{}range[@{}resource = "{}{}"]'.format(
                           ns['rdfs'], ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:

                        output_child_uri = getRDFResource(on_property).split('#')
                        output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                        output_child.attrib[ '{}resource'.format( ns['rdf'] )] = '#{}_{}'.format( child_tag.localname, child_ids[child_tag.localname] )
                        break
                  else:
                     # if no corresponding property exists for this class, check parent classes 
                     for subClass in child_descriptions['class'].findall( './/{}subClassOf[@{}resource]'.format( ns['rdfs'], ns['rdf'] ) ):
                        if restriction.find( './*[@{}resource = "{}"]'.format( ns['rdf'], getRDFResource(subClass) ) ) is not None:
                           on_property = restriction.find( '{}onProperty'.format(ns['owl']) )
                           property_description = getObjectPropertyDescription( getRDFResource(on_property) )
                           if property_description is not None and property_description.find( './/{}range[@{}resource = "{}{}"]'.format( ns['rdfs'], ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                              output_child_uri = getRDFResource(restriction.find( '{}onProperty'.format(ns['owl']) )).split('#')
                              output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                              output_child.attrib[ '{}resource'.format( ns['rdf'] )] = '#{}_{}'.format( child_tag.localname, child_ids[child_tag.localname] )
                              break

      # if input node has a no descriptions, create an unknown type
      elif getAllDescriptions('{}{}'.format( tag.namespace, tag.localname )) is [None, None, None, None]:
            output_node = etree.SubElement( output_root, 'UNKNOWN_TYPE' )
            output_node.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )

   # prune output individuals duplicate datatypeproperties
   for individual in output_root:
      for child_1 in individual:
         if child_1.text is not None:
            for child_2 in individual:
               if child_2.text is not None and child_2 is not child_1 and child_2.text == child_1.text:
                  individual.remove(child_2)

   etree.indent(output_root)
   with open('Results/{}.rdf'.format( sys.argv[1].split('/')[-1].split('.')[0] ), 'w') as file:
      file.write(etree.tostring( output_root, pretty_print=True ))


### utility functions ###

# update namespace uri with ontology naming conventions
def qualifyTag( tag ):
   if tag.namespace is not None and '#' not in tag.namespace:
      return etree.QName( tag.namespace + '#', tag.localname )
   else:
      return tag 


# create a new, unique id
def generateID( name ):
   if name in id_dictionary:
      id_dictionary[name] = id_dictionary[name] + 1
      return '#{}_{}'.format( name, id_dictionary[name] )
   else:
      id_dictionary[name] = 0
      return '#{}_0'.format( name )


# get rdf:about attribute of an node as a QName
def getRDFAbout( node ):
   if node is not None:
      about = node.attrib[ '{}about'.format(ns['rdf']) ].split('#')
      if len(about) < 2:
         return None
      return etree.QName( about[0], about[1] )
   return None


# get rdf:resource attribute of a node as a string
def getRDFResource( node ):
   if node is not None and '{}resource'.format(ns['rdf']) in node.attrib:
      return node.attrib[ '{}resource'.format( ns['rdf'] )]
   return ''


# get all descriptions from ontology with inherited axioms and return them as a dictionary organized by type of description
def getAllDescriptions( uri ):
   return { 'class': getClassDescription( uri ), 'datatype': getDatatypeDescription( uri ),
      'objectproperty': getObjectPropertyDescription( uri ), 'datatypeproperty': getDatatypePropertyDescription( uri ) }


# get class description from ontology with inherited axioms and return them as a node
def getClassDescription( uri ):
   if uri in class_description_cache:
      return class_description_cache[uri]

   description = deepcopy( ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], uri )))
   # compile description of parent types to represent inherited axioms 
   if description is not None:
      for parent_uri in listParentTypes( description ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], parent_uri ) )
            if parent_description is not None:
               for child in parent_description:
                  description.append( deepcopy(child) )
      etree.indent(description)
   class_description_cache[uri] = description
   return description


# get datatype description from ontology with inherited axioms and return them as a node
def getDatatypeDescription( uri ):
   if uri in datatype_description_cache:
      return datatype_description_cache[uri]
   description = deepcopy( ontology_root.find( './/{}Datatype[@{}about = "{}"]'.format( ns['rdfs'], ns['rdf'], uri )))
   # compile description of parent types to represent inherited axioms 
   if description is not None:
      for parent_uri in listParentTypes( description ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}Datatype[@{}about = "{}"]'.format( ns['rdfs'], ns['rdf'], parent_uri ) )
            if parent_description is not None:
               for child in parent_description:
                  description.append( deepcopy(child) )
      etree.indent(description)
   datatype_description_cache[uri] = description
   return description


# get ObjectProperty description from ontology with inherited axioms and return them as a node
def getObjectPropertyDescription( uri ):
   if uri in objectproperty_description_cache:
      return objectproperty_description_cache[uri]
   description = deepcopy( ontology_root.find( './/{}ObjectProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], uri )))
   # compile description of parent types to represent inherited axioms 
   if description is not None:
      for parent_uri in listParentTypes( description ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}ObjectProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], parent_uri ) )
            if parent_description is not None:
               for child in parent_description:
                  description.append( deepcopy(child) )
      etree.indent(description)
   objectproperty_description_cache[uri] = description
   return description


# get DatatypeProperty description from ontology with inherited axioms and return them as a node
def getDatatypePropertyDescription( uri ):
   if uri in datatypeproperty_description_cache:
      return datatypeproperty_description_cache[uri]
   description = deepcopy( ontology_root.find( './/{}DatatypeProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], uri )))
   # compile description of parent types to represent inherited axioms 
   if description is not None:
      for parent_uri in listParentTypes( description ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}DatatypeProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], parent_uri ) )
            if parent_description is not None:
               for child in parent_description:
                  description.append( deepcopy(child) )
      etree.indent(description)
   datatypeproperty_description_cache[uri] = description
   return description


# list node parent types as uri strings
def listParentTypes( node ):
   if node is None:
      return []

   tag = getRDFAbout( node )
   parent_types = []
   # search for parent parent_types
   if node.tag == '{}Class'.format(ns['owl']):
      for parent_resource in node.findall( './/{}subClassOf[@{}resource]'.format( ns['rdfs'], ns['rdf'] )):

         # get parent class node
         parent_uri = parent_resource.attrib['{}resource'.format(ns['rdf'])]
         parent_types.append( parent_uri )
         parent_node = ontology_root.find( './/{}Class[@{}about = "{}"]'.format(
            ns['owl'], ns['rdf'], parent_uri ))

         # get class list of parents
         for parent_uri in listParentTypes( parent_node ):
            parent_types.append( parent_uri )

   # search for equivalent datatypes
   if node.tag == '{}Datatype'.format(ns['rdfs']):
      for parent_resource in node.findall( './/{}equivalentClass[@{}resource]'.format( ns['owl'], ns['rdf'] )):

         # get parent class node
         parent_uri = parent_resource.attrib['{}resource'.format(ns['rdf'])]
         parent_types.append( parent_uri )
         parent_node = ontology_root.find( './/{}Datatype[@{}about = "{}"]'.format(
            ns['rdfs'], ns['rdf'], parent_uri ))

         # get class list of parents
         for parent_uri in listParentTypes( parent_node ):
            parent_types.append( parent_uri )

   # search for parent object properties
   if node.tag == '{}ObjectProperty'.format(ns['owl']):
      for parent_resource in node.findall( './/{}subPropertyOf[@{}resource]'.format( ns['rdfs'], ns['rdf'] )):

         # get parent class node
         parent_uri = parent_resource.attrib['{}resource'.format(ns['rdf'])]
         parent_types.append( parent_uri )
         parent_node = ontology_root.find( './/{}ObjectProperty[@{}about = "{}"]'.format(
            ns['owl'], ns['rdf'], parent_uri ))

         # get class list of parents
         for parent_uri in listParentTypes( parent_node ):
            parent_types.append( parent_uri )

   # search for parent datatype properties
   if node.tag == '{}DatatypeProperty'.format(ns['owl']):
      for parent_resource in node.findall( './/{}subPropertyOf[@{}resource]'.format( ns['rdfs'], ns['rdf'] )): 

         # get parent class node
         parent_uri = parent_resource.attrib['{}resource'.format(ns['rdf'])]
         parent_types.append( parent_uri )
         parent_node = ontology_root.find( './/{}DatatypeProperty[@{}about = "{}"]'.format(
            ns['owl'], ns['rdf'], parent_uri ))

         # get class list of parents
         for parent_uri in listParentTypes( parent_node ):
            parent_types.append( parent_uri )
   return set(parent_types)



if __name__ == "__main__":
   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments. Usage: XML2OWL.py [gml file to convert]')

   main()