import sys
from lxml import etree

if len(sys.argv) != 3:
   sys.exit('Incorrect number of arguments. Usage: qualify-ns.py [xsd with namespaces] [rdf to clean]')

# Get namespaces
namespaces = etree.parse(sys.argv[1]).getroot().nsmap
namespaces.update({'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns'})
namespaces.pop(None, None) # remove nil namespace prefixes

# Iterate through file line by line. When a prefixed namespace is found 
new_file_content = ''
with open(sys.argv[2]) as file:
   line = file.readline()
   while line != '':
      # update ontology uri to reference xsd filename
      line = line.replace( 'http://liris.cnrs.fr/ontologies', 'http://liris.cnrs.fr/ontologies/' + sys.argv[1].split('.')[0] )
      for prefix in namespaces.keys():
         # update resource uri with fully qualified namespace
         line = line.replace( 'rdf:resource="{}:'.format(prefix), 'rdf:resource="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:datatype="{}:'.format(prefix), 'rdf:datatype="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:type="{}:'.format(prefix), 'rdf:type="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:about="{}:'.format(prefix), 'rdf:about="{}#'.format(namespaces[prefix]) )
         line = line.replace( '<xs:', '<xsd:' )
         line = line.replace( '</xs:', '</xsd:' )
      new_file_content += line
      line = file.readline()

with open(sys.argv[2], 'w') as file:
   file.write(new_file_content)

print('Namespaces Qualified: {}'.format(namespaces.keys()))