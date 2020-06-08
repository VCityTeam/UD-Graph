import sys
from lxml import etree
from copy import deepcopy


def main():

   # initialize variables
   global ns
   global ontology_root
   global id_dictionary
   template = ('<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" ' +
               '         xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" ' + 
               '         xmlns:owl="http://www.w3.org/2002/07/owl#" ' + 
               '         xmlns:gml="http://www.opengis.net/gml#" ' + 
               '         xmlns:core="http://www.opengis.net/citygml/2.0#" ' + 
               '         xmlns:bldg="http://www.opengis.net/citygml/building/2.0#" />')
   input_root    = etree.parse(sys.argv[1]).getroot()
   output_root   = etree.fromstring(template)
   ontology_root = etree.fromstring(template)
   id_dictionary = {}
   ns = { k: '{%s}' % v for k, v in output_root.nsmap.items() }

   # compile ontology
   for child in etree.parse('../../Ontologies/building.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/cityGMLBase.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/basicTypes.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/feature.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryPrimitives.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryBasic0d1d.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryBasic2d.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryAggregates.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryComplexes.rdf').getroot():
      ontology_root.insert(0, child)

   # convert xml tree
   for input_node in input_root.iter():
      tag = qualifyTag(etree.QName(input_node))
      input_description = getDescription(input_node)
      output_node_id = generateID(tag.localname)

      # if input node has a class input_description create an output node
      if input_description is None:
         output_node = etree.SubElement( output_root, 'UNKNOWN_TYPE' )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )
      elif input_description.tag == '{}Class'.format( ns['owl'] ):
         # if node description is a class, create a named individual based on the description
         output_node = etree.SubElement( output_root, '{}NamedIndividual'.format( ns['owl'] ) )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ]  = '{}{}'.format( tag.namespace, tag.localname )
         output_node.attrib[ '{}about'.format( ns['rdf'] ) ] = output_node_id
         child_ids = deepcopy(id_dictionary)

         # create corresponding property nodes 
         for input_child in input_node:
            tag = qualifyTag(etree.QName(input_child))
            if tag.localname in child_ids:
               child_ids[tag.localname] = child_ids[tag.localname] + 1
            else:
               child_ids[tag.localname] = 0
            child_definition = getDescription(input_child)

            if child_definition is None:
               output_child = etree.SubElement( output_node, 'UNKNOWN_PROPERTY' )
               output_child.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )
               output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( tag.localname, child_ids[tag.localname] )

            elif child_definition.tag == '{}ObjectProperty'.format( ns['owl'] ):
               # if child node description is an object property, create an object property between the node and its grandchildren

               for grandchild_node in input_child:
                  grandchild_tag = qualifyTag(etree.QName(grandchild_node))
                  if grandchild_tag.localname in child_ids:
                     child_ids[grandchild_tag.localname] = child_ids[grandchild_tag.localname] + 1
                  else:
                     child_ids[grandchild_tag.localname] = 0
                  output_child = etree.SubElement(output_node, '{%s}%s' % ( tag.namespace, tag.localname ))
                  output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( grandchild_tag.localname, child_ids[grandchild_tag.localname] )

            elif child_definition.tag == '{}DatatypeProperty'.format( ns['owl'] ):
               # if child node description is a datatype property, create an datatype property between the node and its grandchildren

               # if input_child.text() is not None:
               output_child = etree.SubElement(output_node, '{%s}%s' % ( tag.namespace, tag.localname ))
               output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = '{}'.format(
                  child_definition.find('.//{}range'.format( ns['rdfs'] )).attrib['{}resource'.format( ns['rdf'] )] )
               output_child.text = input_child.text

            elif child_definition.tag == '{}Class'.format( ns['owl'] ):
               # if child node description is a class, create an object property between the node and child individuals

               # get all restrictions from input description
               for restriction in input_description.findall( './/{}Restriction'.format( ns['owl'] )):
                  if restriction.find( './*[@{}resource = "{}{}"]'.format( ns['rdf'], tag.namespace, tag.localname ) ) is not None:
                     output_child_uri = restriction.find( '{}onProperty'.format(ns['owl']) ).attrib[ '{}resource'.format(ns['rdf']) ].split('#')
                     output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                     output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( tag.localname, child_ids[tag.localname] )
                     break
                  else:
                     for subClass in child_definition.findall( './/{}subClassOf[@{}resource]'.format( ns['rdfs'], ns['rdf'] ) ):
                        if restriction.find( './*[@{}resource = "{}"]'.format( ns['rdf'], subClass.attrib['{}resource'.format(ns['rdf'])] ) ) is not None:
                           output_child_uri = restriction.find( '{}onProperty'.format(ns['owl']) ).attrib[ '{}resource'.format(ns['rdf']) ].split('#')
                           output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                           output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( tag.localname, child_ids[tag.localname] )
                           break


   with open('Results/{}.rdf'.format( sys.argv[1].split('/')[-1].split('.')[0] ), 'w') as file:
      file.write(etree.tostring( output_root, pretty_print=True ))


### utility functions ###

# update namespace uri with ontology naming conventions
def qualifyTag( tag ):
   if '#' not in tag.namespace:
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

# get rdf:about attribute of an element as a QName
def getRDFAboutOf( element ):
   if element is not None:
      about = element.attrib[ '{}about'.format(ns['rdf']) ].split('#')
      if len(about) < 2:
         return None
      return etree.QName( about[0], about[1] )
   return None

# get rdf:resource attribute of an element as a string
def getRDFResourceOf( element ):
   if element is not None and '{}resource'.format(ns['rdf']) in element.attrib:
      return element.attrib[ '{}resource'.format(ns['rdf']) ]
   return ''

# get element description from ontology with inherited axioms
def getDescription( element ):
   tag = qualifyTag(etree.QName(element))
   description = deepcopy( ontology_root.find( './/*[@{}about = "{}{}"]'.format( ns['rdf'], tag.namespace, tag.localname ) ) )
   if description is None:
      return None
   if description.tag == '{}Class'.format( ns['owl'] ):
      for class_uri in listClasses( description ):
         if class_uri != '{}{}'.format(tag.namespace, tag.localname):
            parent_description = ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], class_uri ) )
            for child in parent_description:
               description.append( deepcopy(child) )
   etree.indent(description)
   return description

# list element class and parent classes as uri strings
def listClasses( thisClass ):
   if thisClass is None:
      return []

   tag = getRDFAboutOf( thisClass )
   classes = []
   # search for parent classes
   for parent_resource in ontology_root.findall( './/{}Class[@{}about = "{}#{}"]/{}subClassOf'.format(
         ns['owl'], ns['rdf'], tag.namespace, tag.localname, ns['rdfs'] )):

      # get parent class node
      if '{}resource'.format(ns['rdf']) in parent_resource.attrib:
         parent_uri = parent_resource.attrib[ '{}resource'.format(ns['rdf']) ].split('#')
         parent_node = ontology_root.find( './/{}Class[@{}about = "{}#{}"]'.format(
            ns['owl'], ns['rdf'], parent_uri[0], parent_uri[1] ))

         # get class list of parents
         for parent_uri in listClasses( parent_node ):
            classes.append( parent_uri )

   classes.append('{}#{}'.format( tag.namespace, tag.localname ))
   return set(classes)


if __name__ == "__main__":
   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments. Usage: run.py [gml file to convert]')

   main()