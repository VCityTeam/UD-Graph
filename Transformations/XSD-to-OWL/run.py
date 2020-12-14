import sys
from os import system, path

def main():

   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments: {}\nUsage: python run.py [xsd to convert]'.format(len(sys.argv)))

   OUTPUT = '../Data-IO/OWL'
   FILEPATH = sys.argv[1]
   print('Transforming {} ...'.format(FILEPATH))
   FILENAME = '.'.join(path.split(FILEPATH)[1].split('.')[:-1])
   system('java -jar ../lib/saxon9he.jar -s:{} -xsl:XSD2RDF.xsl > {}/{}.rdf'.format( FILEPATH, OUTPUT, FILENAME ))
   print('Postprocessing {}/{}.rdf ...'.format(OUTPUT, FILENAME))
   system('python postXSLT.py {}/{}.rdf'.format(OUTPUT, FILENAME))
   print('done!')


if __name__ == "__main__":
   main()