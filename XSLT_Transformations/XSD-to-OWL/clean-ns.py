import sys
from lxml import etree

if len(sys.argv) != 3:
   sys.exit('Incorrect number of arguments. Usage: prefix-to-ns [file with namespaces] [file to clean]')
 
namespaces = etree.parse(sys.argv[1]).getroot().nsmap
namespaces.pop(None, None)
new_file_content = ''

with open(sys.argv[2]) as file:
   line = file.readline()
   while line != '':
      line = line.replace( '<owl:Ontology rdf:about="http://liris.cnrs.fr/ontologies">', '<owl:Ontology rdf:about="http://liris.cnrs.fr/ontologies">' + sys.argv[1] )
      for prefix in namespaces.keys():
         line = line.replace( 'rdf:resource="{}:'.format(prefix), 'rdf:resource="{}#'.format(namespaces[prefix]) )
      new_file_content += line
      line = file.readline()

with open('cleaned_' + sys.argv[2], 'w') as new_file:
   new_file.write(new_file_content)

print('{} namespaces qualified'.format(namespaces.keys()))