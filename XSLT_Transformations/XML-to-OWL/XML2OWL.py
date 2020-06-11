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
               '         xmlns:bldg="http://www.opengis.net/citygml/building/2.0#">' +
               '   <owl:Ontology rdf:about="">' +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/cityGMLBase"/>' +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/building"/>' +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/gml"/>' +
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/basicTypes"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/gmlBase"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryPrimitives"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryBasic0d1d"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryBasic2d"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryAggregates"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/geometryComplexes"/>' + 
               '      <owl:imports rdf:resource="http://liris.cnrs.fr/ontologies/feature"/>' + 
               '   </owl:Ontology>' +
               '</rdf:RDF>')
   input_root    = etree.parse(sys.argv[1]).getroot()
   output_root   = etree.fromstring(template)
   ontology_root = etree.fromstring(template)
   id_dictionary = {}
   ns = { k: '{%s}' % v for k, v in output_root.nsmap.items() }

   # compile ontology
   for child in etree.parse('../../Ontologies/cityGMLBase.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/building.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/basicTypes.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/gmlBase.rdf').getroot():
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
   for child in etree.parse('../../Ontologies/GML/feature.rdf').getroot():
      ontology_root.insert(0, child)

   # strip text whitespace
   for node in input_root.iter():
      if node.text is not None and not node.text.strip():
         node.text = None

   # name output ontology
   output_root[0].attrib['{}about'.format(ns['rdf'])] = sys.argv[1].split('/')[-1].split('.')[0]

   # convert xml tree
   for input_node in input_root.iter():
      tag = qualifyTag(etree.QName(input_node))
      input_definition = getNodeDescription(input_node)
      output_node_id = generateID(tag.localname)

      # if input node has a class input_definition create an output node
      if input_definition is None:
         output_node = etree.SubElement( output_root, 'UNKNOWN_TYPE' )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )
      elif input_definition.tag == '{}Class'.format( ns['owl'] ):
         # if node description is a class, create a named individual based on the description
         output_node = etree.SubElement( output_root, '{}NamedIndividual'.format( ns['owl'] ) )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ]  = '{}{}'.format( tag.namespace, tag.localname )
         output_node.attrib[ '{}about'.format( ns['rdf'] ) ] = output_node_id
         child_ids = deepcopy(id_dictionary)

         # if child node has text, create an datatype property between the node and the text
         if input_node.text is not None:
            print(input_node.text)
            # get all restrictions from input description
            # for restriction_property in input_definition.findall( './/{}onProperty'.format( ns['owl'] )):
               # if get restriction_property.attrib['{}resource'.format( ns['rdf'] )]:

         # create corresponding property nodes
         for input_child in input_node:
            child_tag = qualifyTag(etree.QName(input_child))
            if child_tag.localname in child_ids:
               child_ids[child_tag.localname] = child_ids[child_tag.localname] + 1
            else:
               child_ids[child_tag.localname] = 0
            child_definition = getNodeDescription(input_child)

            if child_definition is None:
               output_child = etree.SubElement( output_node, 'UNKNOWN_PROPERTY' )
               output_child.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( child_tag.namespace, child_tag.localname )
               output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( child_tag.localname, child_ids[child_tag.localname] )

            elif child_definition.tag == '{}ObjectProperty'.format( ns['owl'] ):
               # if child node description is an object property, create an object property between the node and its grandchildren

               if input_child.text is not None:
                  output_child = etree.SubElement(output_node, '{%s}%s' % ( child_tag.namespace, child_tag.localname ))
                  output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = '{}'.format(
                     child_definition.find('.//{}range'.format( ns['rdfs'] )).attrib['{}resource'.format( ns['rdf'] )] )
                  output_child.text = input_child.text

               for grandchild_node in input_child:
                  grandchild_tag = qualifyTag(etree.QName(grandchild_node))
                  if grandchild_tag.localname in child_ids:
                     child_ids[grandchild_tag.localname] = child_ids[grandchild_tag.localname] + 1
                  else:
                     child_ids[grandchild_tag.localname] = 0
                  output_child = etree.SubElement(output_node, '{%s}%s' % ( child_tag.namespace, child_tag.localname ))
                  output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( grandchild_tag.localname, child_ids[grandchild_tag.localname] )

            elif child_definition.tag == '{}DatatypeProperty'.format( ns['owl'] ):
               # if child node description is a datatype property, create an datatype property between the node and its grandchildren

               output_child = etree.SubElement(output_node, '{%s}%s' % ( child_tag.namespace, child_tag.localname ))
               output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = '{}'.format(
                  child_definition.find('.//{}range'.format( ns['rdfs'] )).attrib['{}resource'.format( ns['rdf'] )] )
               output_child.text = input_child.text

            elif child_definition.tag == '{}Class'.format( ns['owl'] ):
               # if child node description is a class, create an object property between the node and child individuals

               # get all restrictions from input description
               for restriction in input_definition.findall( './/{}Restriction'.format( ns['owl'] )):
                  if restriction.find( './*[@{}resource = "{}{}"]'.format( ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                     on_property = restriction.find( '{}onProperty'.format(ns['owl']) )
                     property_definition = getURIDescription( on_property.attrib[ '{}resource'.format(ns['rdf']) ] )
                     if property_definition.find( './/{}range[@{}resource = "{}{}"]'.format( ns['rdfs'], ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                        output_child_uri = on_property.attrib[ '{}resource'.format(ns['rdf']) ].split('#')
                        output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                        output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( child_tag.localname, child_ids[child_tag.localname] )
                        break
                  else:
                     # if no corresponding property exists for this class, check parent classes 
                     for subClass in child_definition.findall( './/{}subClassOf[@{}resource]'.format( ns['rdfs'], ns['rdf'] ) ):
                        if restriction.find( './*[@{}resource = "{}"]'.format( ns['rdf'], subClass.attrib['{}resource'.format(ns['rdf'])] ) ) is not None:
                           on_property = restriction.find( '{}onProperty'.format(ns['owl']) )
                           property_definition = getURIDescription( on_property.attrib[ '{}resource'.format(ns['rdf']) ] )
                           if property_definition.find( './/{}range[@{}resource = "{}{}"]'.format( ns['rdfs'], ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                              output_child_uri = restriction.find( '{}onProperty'.format(ns['owl']) ).attrib[ '{}resource'.format(ns['rdf']) ].split('#')
                              output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                              output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}_{}'.format( child_tag.localname, child_ids[child_tag.localname] )
                              break

            elif child_definition.tag == '{}Datatype'.format( ns['owl'] ):
               # if child node description is a Datatype, create an datatype property between the node and child individuals

               # get all restrictions from input description
               for restriction in input_definition.findall( './/{}Restriction'.format( ns['owl'] )):
                  if restriction.find( './*[@{}resource = "{}{}"]'.format( ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                     on_property = restriction.find( '{}onProperty'.format(ns['owl']) )
                     property_definition = getURIDescription( on_property.attrib[ '{}resource'.format(ns['rdf']) ] )
                     if property_definition.find( './/{}range[@{}resource = "{}{}"]'.format( ns['rdfs'], ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                        output_child_uri = on_property.attrib[ '{}resource'.format(ns['rdf']) ].split('#')
                        output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                        output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = '{}{}'.format( child_tag.namespace, child_tag.localname )
                        output_child.text = input_child.text
                        break
                  else:
                     # if no corresponding property exists for this class, check parent classes 
                     for subClass in child_definition.findall( './/{}equivalentClass[@{}resource]'.format( ns['rdfs'], ns['rdf'] ) ):
                        if restriction.find( './*[@{}resource = "{}"]'.format( ns['rdf'], subClass.attrib['{}resource'.format(ns['rdf'])] ) ) is not None:
                           on_property = restriction.find( '{}onProperty'.format(ns['owl']) )
                           property_definition = getURIDescription( on_property.attrib[ '{}resource'.format(ns['rdf']) ] )
                           if property_definition.find( './/{}range[@{}resource = "{}{}"]'.format( ns['rdfs'], ns['rdf'], child_tag.namespace, child_tag.localname ) ) is not None:
                              output_child_uri = restriction.find( '{}onProperty'.format(ns['owl']) ).attrib[ '{}resource'.format(ns['rdf']) ].split('#')
                              output_child = etree.SubElement(output_node, '{%s#}%s' % ( output_child_uri[0], output_child_uri[1] ))
                              output_child.attrib[ '{}datatype'.format( ns['rdf'] ) ] = '{}{}'.format( child_tag.namespace, child_tag.localname )
                              output_child.text = input_child.text
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

# get rdf:about attribute of an node as a QName
def getNodeRDFAbout( node ):
   if node is not None:
      about = node.attrib[ '{}about'.format(ns['rdf']) ].split('#')
      if len(about) < 2:
         return None
      return etree.QName( about[0], about[1] )
   return None

# get rdf:resource attribute of a node as a string
def getNodeRDFResource( node ):
   if node is not None and '{}resource'.format(ns['rdf']) in node.attrib:
      return node.attrib[ '{}resource'.format(ns['rdf']) ]
   return ''

# get node description from ontology with inherited axioms
def getNodeDescription( node ):
   tag = qualifyTag(etree.QName(node))
   description = deepcopy( ontology_root.find( './/*[@{}about = "{}{}"]'.format( ns['rdf'], tag.namespace, tag.localname ) ) )
   if description is None:
      return None
   if description.tag == '{}Class'.format( ns['owl'] ):
      for class_uri in listTypes( description ):
         if class_uri != '{}{}'.format(tag.namespace, tag.localname):
            parent_description = ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], class_uri ) )
            for child in parent_description:
               description.append( deepcopy(child) )
   # TODO add subproperty support
   etree.indent(description)
   return description

# get node description from ontology with inherited axioms
def getURIDescription( uri ):
   description = deepcopy( ontology_root.find( './/*[@{}about = "{}"]'.format( ns['rdf'], uri ) ) )
   if description is None:
      return None
   if description.tag == '{}Class'.format( ns['owl'] ):
      for class_uri in listTypes( description ):
         if class_uri != uri:
            parent_description = ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], class_uri ) )
            for child in parent_description:
               description.append( deepcopy(child) )
   # TODO add subproperty support
   etree.indent(description)
   return description

# get all descriptions from ontology with inherited axioms and return them as a dictionary organized by type of description
def getDescription( uri ):
   descriptions = {'class': None, 'datatype': None,
      'objectproperty': None, 'datatypeproperty': None }
   
   # add class descriptions into a dictionary for each possible type of description of the uri
   descriptions['class'] = deepcopy( ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], uri )))
   descriptions['datatype'] = deepcopy( ontology_root.find( './/{}Datatype[@{}about = "{}"]'.format( ns['rdfs'], ns['rdf'], uri )))
   descriptions['objectproperty'] = deepcopy( ontology_root.find( './/{}ObjectProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], uri )))
   descriptions['datatypeproperty'] = deepcopy( ontology_root.find( './/{}DatatypeProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], uri )))

   # compile descriptions of parent types to represent inherited axioms 
   if descriptions['class'] is not None:
      for parent_uri in listTypes( descriptions['class'] ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}Class[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], parent_uri ) )
            for child in parent_description:
               descriptions['class'].append( deepcopy(child) )
      etree.indent(descriptions['class'])
   if descriptions['datatype'] is not None:
      for parent_uri in listTypes( descriptions['datatype'] ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}Datatype[@{}about = "{}"]'.format( ns['rdfs'], ns['rdf'], parent_uri ) )
            for child in parent_description:
               descriptions['datatype'].append( deepcopy(child) )
      etree.indent(descriptions['datatype'])
   if descriptions['objectproperty'] is not None:
      for parent_uri in listTypes( descriptions['objectproperty'] ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}ObjectProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], parent_uri ) )
            for child in parent_description:
               descriptions['objectproperty'].append( deepcopy(child) )
      etree.indent(descriptions['objectproperty'])
   if descriptions['datatypeproperty'] is not None:
      for parent_uri in listTypes( descriptions['datatypeproperty'] ):
         if parent_uri != uri:
            parent_description = ontology_root.find( './/{}DatatypeProperty[@{}about = "{}"]'.format( ns['owl'], ns['rdf'], parent_uri ) )
            for child in parent_description:
               descriptions['datatypeproperty'].append( deepcopy(child) )
      etree.indent(descriptions['datatypeproperty'])
   return descriptions

# list node type and parent types as uri strings
def listTypes( node ):
   if node is None:
      return []

   tag = getNodeRDFAbout( node )
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
         for parent_uri in listTypes( parent_node ):
            classes.append( parent_uri )

   classes.append('{}#{}'.format( tag.namespace, tag.localname ))
   return set(classes)


if __name__ == "__main__":
   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments. Usage: run.py [gml file to convert]')

   main()