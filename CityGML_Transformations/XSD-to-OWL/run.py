import sys
from os import system, path

def main():

   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments: {}\nUsage: python run.py [xsd to convert]'.format(len(sys.argv)))

   FILEPATH = sys.argv[1]
   print('Transforming {} ...'.format(FILEPATH))
   FILENAME = '.'.join(path.split(FILEPATH)[1].split('.')[:-1])
   system('java -jar ../saxon9he.jar -s:{} -xsl:XSD2RDF.xsl > ./Results/{}.rdf'.format( FILEPATH, FILENAME ))
   print('Postprocessing ./Results/{}.rdf ...'.format(FILENAME))
   system('python postXSLT.py ./Results/{}.rdf'.format(FILENAME))
   print('done!')


if __name__ == "__main__":
   main()