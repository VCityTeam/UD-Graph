import sys
from os import system

def main():

   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments: {}\nUsage: run.py [xsd to convert]'.format(len(sys.argv)))

   FILEPATH = sys.argv[1]
   
   print('Transforming {} ...'.format(FILEPATH))
   FILENAME = FILEPATH.split('/')[-1].split('.')[0]
   system('java -jar ../saxon9he.jar -s:{} -xsl:XSD2RDF.xsl > ./Results/{}.rdf'.format( FILEPATH, FILENAME ))
   print('Postprocessing ./Results/{}.rdf ...'.format(FILENAME))
   system('python postXSLT.py ./Results/{}.rdf'.format(FILENAME))
   print('done!')


if __name__ == "__main__":
   main()