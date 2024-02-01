import sys
from os import system
from lxml import etree
from copy import deepcopy

def main():

  if len(sys.argv) != 4:
      sys.exit(
        'Incorrect number of arguments: {}\nUsage: python run.py [XSL stylesheet] [input XML Schema] [input datafile]'.format(
          len(sys.argv)))

  global CRS
  CRS                  = 'EPSG:3946'
  transformation_file  = 'XMLToRDF.xsl'
  output_directory     = '../../test-data/RDF/XSLT-based-transformations'
  cleanGeometry        = True
  generator_file       = sys.argv[1]
  schema_file          = sys.argv[2]
  input_file           = sys.argv[3]
  output_filename      = input_file.split('/')[-1].split('.')[0] + '.rdf'

  print('Creating XML to RDF transformation mapping...')
  system('java -jar ../../lib/saxon9he.jar -s:{} -xsl:{} > {}'.format(schema_file, generator_file, transformation_file))

  namespaces = dict(etree.parse(schema_file).getroot().nsmap)
  namespaces.update( dict(etree.parse( '{}'.format(input_file) ).getroot().nsmap) )
  namespaces.pop(None)

  cleanXSLT(transformation_file, namespaces)
  print('Transforming XML to RDF... {}'.format(input_file))
  system('java -jar ../../lib/saxon9he.jar -s:{} -xsl:{} > {}/{}'.format(input_file, transformation_file,output_directory, output_filename))
  cleanRDF('{}/{}'.format(output_directory, output_filename))
  system('python ../../utilities/show_ns.py {}/{}'.format(output_directory, output_filename))
  if cleanGeometry:
    cleanGeometrySerializations('{}/{}'.format(output_directory, output_filename))


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


def cleanGeometrySerializations(filename):
  sys.stdout.write('\033[K')
  print('Cleaning gml serializations... ')
  root = etree.parse(filename).getroot()
  for node in root.findall('{http://www.w3.org/2002/07/owl#}NamedIndividual/{http://www.opengis.net/ont/geosparql#}asGML'):
    if 'xlink:href' in node.text:
      parent = node.getparent()
      parent.remove(node)
      continue
    gmlLiteral = node.text.replace('\n', '').replace('>', '> ').split(' ')
    gmlLiteral = list(filter(lambda a: a != '', gmlLiteral))
    count = 0
    for token in gmlLiteral:
      if token.startswith('srsD'):
        gmlLiteral[gmlLiteral.index(token)] = token.replace('3', '2')
      elif token.startswith('xmlns') and not token.startswith('xmlns:gml') and not token.startswith('xmlns:xAL'):
        gmlLiteral.pop(gmlLiteral.index(token))
      elif not token.replace('.', '', 1).isdigit():
        count = 0
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
