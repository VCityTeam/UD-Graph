import sys
from lxml import etree

if len(sys.argv) != 3:
   sys.exit('Incorrect number of arguments. Usage: qualify-ns [xsd with namespaces] [rdf to clean]')

# Get namespaces
namespaces = etree.parse(sys.argv[1]).getroot().nsmap
namespaces.pop(None, None)

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
      new_file_content += line
      line = file.readline()

with open('cleaned_' + sys.argv[2], 'w') as new_file:
   new_file.write(new_file_content)

print('Namespaces Qualified: {}'.format(namespaces.keys()))