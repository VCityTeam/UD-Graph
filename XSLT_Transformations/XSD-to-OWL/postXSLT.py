import sys
from lxml import etree

if len(sys.argv) != 2:
   sys.exit('Incorrect number of arguments. Usage: postXSLT.py [xsd file]')


# initialize variables
filename      = sys.argv[1].split('/')[-1].split('.')[0]
filepath      = 'Results/{}.rdf'.format( filename )
ontology_name = 'http://liris.cnrs.fr/ontologies/' + filename
root          = etree.parse(sys.argv[1]).getroot()

# update recognized namespaces
namespaces = root.nsmap
namespaces.update({'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns'})
namespaces.update({'rdfs': 'http://www.w3.org/2000/01/rdf-schema'})
if namespaces.get(None) == 'http://www.w3.org/2001/XMLSchema':
   namespaces.update({'xs': 'http://www.w3.org/2001/XMLSchema'})
# print('Namespaces targeted: {}'.format(namespaces))


# iterate through file line by line
new_file_content = ''
with open(filepath) as file:
   line = file.readline()
   while line != '':
      # fully qualify namespaces
      for prefix in namespaces.keys():
         line = line.replace( 'rdf:type="{}:'.format(prefix),     'rdf:type="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:about="{}:'.format(prefix),    'rdf:about="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:resource="{}:'.format(prefix), 'rdf:resource="{}#'.format(namespaces[prefix]) )
         line = line.replace( 'rdf:datatype="{}:'.format(prefix), 'rdf:datatype="{}#'.format(namespaces[prefix]) )
      new_file_content += line
      line = file.readline()


# set ontology name
root = etree.fromstring(new_file_content)
root[0].set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', ontology_name )

# update import statements with local naming conventions ontologies
for child in root[0]:
   if child.tag == '{http://www.w3.org/2002/07/owl#}imports':
      resource = child.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource'].split('/')[-1].split('.')[0]
      child.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource'] = 'http://liris.cnrs.fr/ontologies/{}'.format(resource) 

# remove empty subclass declarations
for node in root.findall('.//{http://www.w3.org/2000/01/rdf-schema#}subClassOf/{http://www.w3.org/2002/07/owl#}Class/{http://www.w3.org/2002/07/owl#}intersectionOf'):
   if len(node) == 0:
      parent = node.getparent().getparent()
      parent.getparent().remove(parent)

# remove empty disjoint union declarations
# for node in root.findall('.//{http://www.w3.org/2002/07/owl#}disjointUnionOf'):
#    if len(node) == 0:
#       node.getparent().remove(node)

with open(filepath, 'w') as file:
   file.write(etree.tostring( root, pretty_print=True ))

# sys.stdout.write('Namespaces Qualified: {}\r'.format(namespaces.keys()))
# sys.stdout.flush()