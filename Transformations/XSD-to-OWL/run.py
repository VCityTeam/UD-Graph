import sys
from os import system, path

def main():

   if len(sys.argv) != 3:
      sys.exit('Incorrect number of arguments: {}\nUsage: python run.py [xsd to convert] [output folder]'.format(len(sys.argv)))

   OUTPUT = sys.argv[2]
   FILEPATH = sys.argv[1]
   print('Transforming {} ...'.format(FILEPATH))
   FILENAME = '.'.join(path.split(FILEPATH)[1].split('.')[:-1])
   system('java -jar ../lib/saxon9he.jar -s:{} -xsl:XSD2RDF.xsl > {}/{}.rdf'.format( FILEPATH, OUTPUT, FILENAME ))
   print('Postprocessing {}/{}.rdf ...'.format(OUTPUT, FILENAME))
   system('python postXSLT.py {}/{}.rdf'.format(OUTPUT, FILENAME))
   print('done!')


if __name__ == "__main__":
   main()