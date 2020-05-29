import sys
import re
from lxml import etree

if len(sys.argv) != 2:
   sys.exit('Incorrect number of arguments. Usage: postXSLT.py [path to original xsd]')

# Initialize variables
filename = sys.argv[1].split('/')[-1].split('.')[0]
filepath = 'Results/{}.rdf'.format( filename )
root     = etree.parse(filepath).getroot()

# Get namespaces
namespaces = root.nsmap
namespaces.update({'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns'})
namespaces.update({'rdfs': 'http://www.w3.org/2000/01/rdf-schema'})
namespaces.pop(None, None) # remove nil namespace prefixes

# Iterate through file line by line
new_file_content = ''
with open(filepath) as file:
   line = file.readline()
   while line != '':

      # update import statements with local naming conventions ontologies
      if re.match( '<owl:imports rdf:resource=".*?"/>', line.strip() ) != None:
         split_line = line.split('"')
         line = ( split_line[0] + '"http://liris.cnrs.fr/ontologies/{}"'.format( split_line[1].split('/')[-1].split('.')[0] ) +
            split_line[2] )

      # fully qualify namespace
      for prefix in namespaces.keys():
         line = line.replace( 'rdf:resource="{}:'.format(prefix), 'rdf:resource="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:datatype="{}:'.format(prefix), 'rdf:datatype="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:type="{}:'.format(prefix),     'rdf:type="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:about="{}:'.format(prefix),    'rdf:about="{}#'.format(namespaces[prefix]) )
      new_file_content += line
      line = file.readline()

# set ontology name
root          = etree.fromstring(new_file_content)
root[0].set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', 'http://liris.cnrs.fr/ontologies/' + filename )

with open(filepath, 'w') as file:
   file.write(etree.tostring( root, pretty_print=True ))

# sys.stdout.write('Namespaces Qualified: {}\r'.format(namespaces.keys()))
# sys.stdout.flush()