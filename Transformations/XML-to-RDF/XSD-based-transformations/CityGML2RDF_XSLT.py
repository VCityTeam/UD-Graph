import sys
from os import system, walk, path
from lxml import etree
from copy import deepcopy

def main():

  global CRS       
  CRS                  = 'http://www.opengis.net/def/crs/EPSG/0/4326'
  schema_file          = 'compositeCityGML2.0.xsd'
  generator_file       = 'Generate_CityGML2ToRDF.xsl'
  transformation_file  = 'CityGML2ToRDF.xsl'
  input_file           = 'LYON_1ER_BATI_2015-1_bldg.gml'
  output_file          = 'LYON_1ER_BATI_2015-1_bldg.rdf'

  # schema_file          = 'compositeCityGML3.0.xsd'
  # generator_file       = 'Generate_CityGML3ToRDF.xsl'
  # transformation_file  = 'CityGML3ToRDF.xsl'
  # input_file           = 'Building_CityGML3.0_with_Dynamizer_and_SensorConnection_V2.gml'
  # output_file          = 'Building_CityGML3.0_with_Dynamizer_and_SensorConnection_V2.rdf'
  
  convert3Dto2D        = True

  print('Creating XML to RDF transformation mapping...')
  system('java -jar ../saxon9he.jar -s:../../Input-Models/XMLSchema/{} -xsl:{} > {}'.format(schema_file, generator_file, transformation_file))

  namespaces = dict(etree.parse(schema_file).getroot().nsmap)
  namespaces.update( dict(etree.parse( 'input-data/{}'.format(input_file) ).getroot().nsmap) )

  cleanXSLT(transformation_file, namespaces)
  print('Transforming XML to RDF... {}'.format(input_file))
  system('java -jar ../saxon9he.jar -s:input-data/{} -xsl:{} > Results/{}'.format(input_file, transformation_file, output_file))
  cleanRDF('Results/{}'.format(output_file))
  system('python ../utilities/show_ns.py Results/{}'.format(output_file))
  if convert3Dto2D:
    convertGML3Dto2D('Results/{}'.format(output_file))


def cleanXSLT(filename, namespaces):
  print('Cleaning mapping patterns...')
  xsl_root = etree.Element('{http://www.w3.org/1999/XSL/Transform}stylesheet', nsmap=namespaces)
  xsl_root.attrib.update({'version' : '2.0'})
  root = etree.parse(filename).getroot()

  done_list = []
  for node_1 in root.findall('{http://www.w3.org/1999/XSL/Transform}template[@name]'):
    name = node_1.attrib.get('name')
    if name in done_list:
      continue
    for node_2 in root.findall('{http://www.w3.org/1999/XSL/Transform}template[@name = "%s"]' % name):
      if node_1 is node_2:
        continue
      for child_2 in node_2:
        isCopy = False
        for child_1 in node_1:
          if child_2.tag == child_1.tag and child_2.text == child_1.text and child_2.attrib == child_1.attrib:
            isCopy = True
        if isCopy:
          continue
        node_1.append(deepcopy(child_2))
      root.remove(node_2)
    done_list.append(name)
  done_list = []
  for node_1 in root.findall('{http://www.w3.org/1999/XSL/Transform}template[@match]'):
    match = node_1.attrib.get('match')
    if match in done_list:
      continue
    for node_2 in root.findall('{http://www.w3.org/1999/XSL/Transform}template[@match = "%s"]' % match):
      if node_1 is node_2:
        continue
      for child_2 in node_2:
        isCopy = False
        for child_1 in node_1:
          if child_2.tag == child_1.tag and child_2.text == child_1.text and child_2.attrib == child_1.attrib:
            isCopy = True
        if isCopy:
          continue
        node_1.append(deepcopy(child_2))
      root.remove(node_2)
    done_list.append(match)

  for node in root:
    xsl_root.append(deepcopy(node))

  element = etree.SubElement(xsl_root, '{http://www.w3.org/1999/XSL/Transform}template')
  element.attrib['name'] = 'gml:_Object_Template'
  element = etree.SubElement(xsl_root, '{http://www.w3.org/1999/XSL/Transform}template')
  element.attrib['name'] = 'xlink:simpleAttrs_Template'
  with open(filename, 'wb') as file:
    file.write(etree.tostring( xsl_root, pretty_print=True ))


def cleanRDF(filename):
  print('Cleaning rdf duplicates... ' + filename)
  root = etree.parse(filename).getroot()
  for node in root.findall('{http://www.w3.org/2002/07/owl#}NamedIndividual[{http://www.opengis.net/gml}hasid]'):
    index = root.index(node)
    updateProgressBar( index, len(root), node.attrib.get('{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about') )
    if len(root) > index + 1 and root[index + 1].attrib == node.attrib:
      root.remove(root[index])

  with open(filename, 'wb') as file:
     file.write(etree.tostring( root, pretty_print=True ))


def convertGML3Dto2D(filename):
  sys.stdout.write('\033[K')
  print('Converting 3D GML coordinates to 2D... ')
  root = etree.parse(filename).getroot()
  for node in root.findall('{http://www.w3.org/2002/07/owl#}NamedIndividual/{http://www.opengis.net/ont/geosparql#}asGML'):    
    gmlLiteral = node.text.replace('>', '> ').split(' ')
    count = 0
    for token in gmlLiteral:
      if token.startswith('srsD'):
        gmlLiteral[gmlLiteral.index(token)] = token.replace('3', '2')
      elif not token.replace('.', '', 1).isdigit():
        continue
      else:
        count += 1
        if count >= 3:
          gmlLiteral.pop(gmlLiteral.index(token))
          count = 1
    # Add coordinate reference system
    gmlLiteral[0] = gmlLiteral[0] + ' srsName="' + CRS + '"'
    node.text = ' '.join(gmlLiteral).replace('> ', '>')
  with open(filename, 'wb') as file:
     file.write(etree.tostring( root, pretty_print=True ))


def updateProgressBar( count, total, status='' ):
   bar_length    = 20
   buffer_size   = 127
   filled_length = int(round(bar_length * count / float(total)))

   percent = round(100.0 * count / float(total), 1)
   bar = '#' * filled_length + '-' * (bar_length - filled_length)
   output = '[%s] %s%s,%i/%i ...%s' % (bar, percent, '%', count, total, status)

   sys.stdout.write('\033[K')
   sys.stdout.write( output[0:buffer_size] + '\r' )
   sys.stdout.flush()


if __name__ == "__main__":
  main()