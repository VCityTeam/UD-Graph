import sys
from lxml import etree

if len(sys.argv) != 2:
   sys.exit('Incorrect number of arguments. Usage: preXSLT.py [path to xsd]')

# Initialize variables
filename      = sys.argv[1].split('/')[-1].split('.')[0]
root          = etree.parse(sys.argv[1]).getroot()


# Add xsd prefixes when not listed
if None in root.nsmap and root.nsmap[None] == 'http://www.w3.org/2001/XMLSchema':
   for element in root.iter('*'):
      if etree.QName(element).namespace == None:
         element.tag = '/{{}/}{}'.format( 'http://www.w3.org/2001/XMLSchema', etree.QName(element).localname )

with open('Results/{}.rdf'.format(filename), 'w') as file:
   file.write(etree.tostring( root, pretty_print=True ))