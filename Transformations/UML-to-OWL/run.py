from os import system
import sys

def main():

  if len(sys.argv) != 2:
    sys.exit('Incorrect number of arguments: {}\nUsage: run.py [ShapeChange configuration file]'.format(len(sys.argv)))

  config_file = sys.argv[1]
  # config_file = 'CityGML2.0_config.xml'
  # config_file = 'CityGML3.0_config.xml'

  system('java -jar ../lib/ShapeChange-2.9.1.jar -Dfile.encoding=UTF-8 -c {}'.format(config_file))

if __name__ == "__main__":
  main()