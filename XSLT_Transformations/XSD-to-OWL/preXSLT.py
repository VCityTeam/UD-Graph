import sys
from copy import deepcopy
from lxml import etree

if len(sys.argv) != 2:
   sys.exit('Incorrect number of arguments. Usage: preXSLT.py [path to xsd]')

# Initialize variables
global root
global filepath
root             = etree.parse(sys.argv[1]).getroot()
filename         = sys.argv[1].split('/')[-1]
filepath         = '/'.join(sys.argv[1].split('/')[:-1])
included_list    = [filename]
target_prefix    = ''

for prefix in root.nsmap.items():
   if prefix[1] == root.attrib['targetNamespace']:
      target_prefix = prefix[0]


# recursive include
def includeFile( filename ):
   if filename in included_list:
      return
   included_list.append(filename)
   included_file = etree.parse('{}/{}'.format( filepath, filename )).getroot()
   for node in included_file:
      root.append( deepcopy(node) )

   # add elements from other included schema 
   for include in included_file.findall( './{http://www.w3.org/2001/XMLSchema}include' ):
      includeFile( include.attrib['schemaLocation'] )

# add elements from other included schema 
for node in root.findall( './{http://www.w3.org/2001/XMLSchema}include' ):
   includeFile( node.attrib['schemaLocation'] )

# remove included schema statements 
for node in root.findall( './{http://www.w3.org/2001/XMLSchema}include' ):
   root.remove(node)

with open('Schema/composite{}'.format(filename), 'w') as file:
   file.write(etree.tostring( root, pretty_print=True ))