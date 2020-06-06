import sys
from lxml import etree


def main():

   # initialize variables
   global ns
   global ontology_root
   template = ('<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" ' +
               '         xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" ' + 
               '         xmlns:owl="http://www.w3.org/2002/07/owl#" ' + 
               '         xmlns:gml="http://www.opengis.net/gml#" ' + 
               '         xmlns:core="http://www.opengis.net/citygml/2.0#" ' + 
               '         xmlns:bldg="http://www.opengis.net/citygml/building/2.0#" />')
   input_root    = etree.parse(sys.argv[1]).getroot()
   output_root   = etree.fromstring(template)
   ontology_root = etree.fromstring(template)
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
   for child in etree.parse('../../Ontologies/GML/geometryBasic0d1d.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryBasic2d.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryAggregates.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/geometryComplexes.rdf').getroot():
      ontology_root.insert(0, child)

   # for child in ontology_root:
   #    if getRDFAbout(child) and getRDFAbout(child).localname == 'CityModel':
   #       print(getRDFAbout(child))

   # thisType = getType(input_root)[0]
   # if str(thisType) == '{%s}Class' % ( ns['owl'] ):
   #    node = etree.SubElement(output_root, '{%s}NamedIndividual' % ns['owl'])
   #    node.attrib['{%s}type' % ns['rdf']] = '{}{}'.format(thisType.namespace, thisType.localname)

   # convert xml tree
   for input_node in input_root.iter():
      tag = qualifyTag(etree.QName(input_node))
      # print(tag)
      thisType = getType(input_node)

      # if input node has a class definition create an object output node
      if thisType is None:
         output_node = etree.SubElement( output_root, 'UNKNOWN_TYPE' )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )
      elif thisType.tag == '{}Class'.format( ns['owl'] ):
         output_node = etree.SubElement( output_root, '{}NamedIndividual'.format( ns['owl'] ) )
         output_node.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )

         # create corresponding property nodes 
         for input_child in input_node:
            tag = qualifyTag(etree.QName(input_child))
            thisType = getType(input_child)
            getClasses(input_child)

            if thisType is None:
               output_child = etree.SubElement( output_node, 'UNKNOWN_PROPERTY' )
               output_child.attrib[ '{}type'.format( ns['rdf'] ) ] = '{}{}'.format( tag.namespace, tag.localname )
            elif thisType.tag == '{}Class'.format( ns['owl'] ):
               # TODO: determine true property name from ontology (match domain and range or class description)
               output_child = etree.SubElement( output_node, '{%s}%s' % ( tag.namespace, tag.localname ) )
               # TODO: deterine child name
               output_child.attrib[ '{}resource'.format( ns['rdf'] ) ] = '#{}'.format( '[link-to-child]' )




      # elif len(thisType) > 0 and str( thisType[0] ) == '{}ObjectProperty'( ns['owl'] ):

      # elif len(thisType) > 0 and str( thisType[0] ) == '{}Class'.format( ns['owl'] ):

      # elif len(thisType) > 0 and str( thisType[0] ) == '{}Class'.format( ns['owl'] ):



   with open('Results/{}.rdf'.format( sys.argv[1].split('/')[-1].split('.')[0] ), 'w') as file:
      file.write(etree.tostring( output_root, pretty_print=True ))


### utility functions ###

# update namespace uri with ontology naming conventions
def qualifyTag( tag ):
   if '#' not in tag.namespace:
      return etree.QName( tag.namespace + '#', tag.localname )
   else:
      return etree.QName( tag.namespace, tag.localname ) 


# get rdf:about attribute of an element as a QName
def getRDFAbout( element ):
   about = element.attrib[ '{}about'.format(ns['rdf']) ].split('#')
   if len(about) < 2:
      return None
   return etree.QName( about[0], about[1] )

# get element "type" as a class, object property, datatype property, or datatype
def getType( element ):
   tag = etree.QName(element)
   return ontology_root.find( './/*[@{}about = "{}#{}"]'.format( ns['rdf'], tag.namespace, tag.localname ) )

# get element class and parent classes
def getClasses( element ):
   tag = etree.QName(element)
   classes = [ node.attrib[ '{}resource'.format( ns['rdf'] ) ] for node in ontology_root.findall(
      './/{}Class[@{}about = "{}#{}"]/{}subClassOf'.format(
         ns['owl'], ns['rdf'], tag.namespace, tag.localname, ns['rdfs'] )) ]
   classes.append('{}#{}'.format( tag.namespace, tag.localname ))
   print(classes)


if __name__ == "__main__":
   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments. Usage: run.py [gml file to convert]')

   main()