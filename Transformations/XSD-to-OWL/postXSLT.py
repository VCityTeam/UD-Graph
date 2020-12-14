import sys
from os   import path
from lxml import etree

def main( FILEPATH = '' ):

   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments. Usage: python postXSLT.py [original xsd file]')
   
   # initialize variables
   FILEPATH        = sys.argv[1]
   FILENAME        = path.split(FILEPATH)[1]
   ONTOLOGY_NAME   = 'http://liris.cnrs.fr/ontologies/' + FILENAME
   root            = etree.parse(FILEPATH).getroot()
   
   # set ontology name
   root[0].set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', ONTOLOGY_NAME )

   # remove empty subclass declarations
   for node in root.findall('.//{http://www.w3.org/2000/01/rdf-schema#}subClassOf/{http://www.w3.org/2002/07/owl#}Class/{http://www.w3.org/2002/07/owl#}intersectionOf'):
      if len(node) == 0:
         parent = node.getparent().getparent()
         parent.getparent().remove(parent)

   # remove erroneous comment declarations
   for node in root.findall('./{http://www.w3.org/2000/01/rdf-schema#}comment'):
      root.remove(node)

   # write to file
   with open(FILEPATH, 'wb') as file:
      file.write(etree.tostring( root, pretty_print=True ))


if __name__ == "__main__":
   main()