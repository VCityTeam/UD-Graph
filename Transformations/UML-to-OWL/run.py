from os import system

config_file = 'CityGML2.0_config.xml'
# config_file = 'CityGML3.0_config.xml'

system('java -jar ../lib/ShapeChange-2.9.1.jar -Dfile.encoding=UTF-8 -c {}'.format(config_file))