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
   ns = output_root.nsmap


   # compile ontology
   for child in etree.parse('../../Ontologies/building.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/cityGMLBase.rdf').getroot():
      ontology_root.insert(0, child)
   for child in etree.parse('../../Ontologies/GML/feature.rdf').getroot():
      ontology_root.insert(0, child)

   # for child in ontology_root:
   #    if getRDFAbout(child) and getRDFAbout(child).localname == 'CityModel':
   #       print(getRDFAbout(child))

   # thisType = getOWLTypes(input_root)[0]
   # if str(thisType) == '{%s}Class' % ( ns['owl'] ):
   #    node = etree.SubElement(output_root, '{%s}NamedIndividual' % ns['owl'])
   #    node.attrib['{%s}type' % ns['rdf']] = '{}{}'.format(thisType.namespace, thisType.localname)

   for node in input_root.iter():
      # print(node.tag)
      # thisType = getOWLTypes(node)
      # print(thisType)
      if len(thisType) > 0 and str(thisType[0]) == '{%s}Class' % ( ns['owl'] ):
         node = etree.SubElement(output_root, '{%s}NamedIndividual' % ns['owl'])
         node.attrib['{%s}type' % ns['rdf']] = '{}{}'.format(thisType[0].namespace, thisType[0].localname)

   with open('Results/{}.rdf'.format( sys.argv[1].split('/')[-1].split('.')[0] ), 'w') as file:
      file.write(etree.tostring( output_root, pretty_print=True ))


### utility functions ###

# get rdf:about attribute of an element as a QName
def getRDFAbout( element ):
   about = element.attrib['{%s}about' % ns['rdf']].split('#')
   if len(about) < 2:
      return None
   return etree.QName( about[0], about[1] )

# get element "type" as a class, object property, datatype property, or datatype
def getOWLTypes( element ):
   tag = etree.QName(element)
   definitions = [ etree.QName(node) for node in ontology_root.findall('.//*[@{%s}about = "%s#%s"]' % ( ns['rdf'], tag.namespace, tag.localname )) ]
   return definitions

   # TODO: gethasparentclass/subclass

if __name__ == "__main__":
   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments. Usage: run.py [gml file]')

   main()