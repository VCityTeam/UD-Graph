import sys, os
from copy import deepcopy
from lxml import etree

def main():

   if len(sys.argv) != 2:
      sys.exit('Incorrect number of arguments: {}\nUsage: compileXMLSchema.py [path to input folder]'.format(len(sys.argv)))
   
   # Initialize variables
   FILEPATH = sys.argv[1]
   global output_root
   global target_namespaces
   # all recognized namespaces for CityGML 2.0
   target_namespaces = {'xs'     : 'http://www.w3.org/2001/XMLSchema',
                        'core'   : 'http://www.opengis.net/citygml/2.0',
                        'app'    : 'http://www.opengis.net/citygml/appearance/2.0',
                        'brid'   : 'http://www.opengis.net/citygml/bridge/2.0',
                        'bldg'   : 'http://www.opengis.net/citygml/building/2.0',
                        'frn'    : 'http://www.opengis.net/citygml/cityfurniture/2.0',
                        'grp'    : 'http://www.opengis.net/citygml/cityobjectgroup/2.0',
                        'gen'    : 'http://www.opengis.net/citygml/generics/2.0',
                        'luse'   : 'http://www.opengis.net/citygml/landuse/2.0',
                        'dem'    : 'http://www.opengis.net/citygml/relief/2.0',
                        'tran'   : 'http://www.opengis.net/citygml/transportation/2.0',
                        'tun'    : 'http://www.opengis.net/citygml/tunnel/2.0',
                        'veg'    : 'http://www.opengis.net/citygml/vegetation/2.0',
                        'wtr'    : 'http://www.opengis.net/citygml/waterbody/2.0',
                        'tex'    : 'http://www.opengis.net/citygml/texturedsurface/2.0',
                        'xAL'    : 'urn:oasis:names:tc:ciq:xsdschema:xAL:2.0',
                        'sch'    : 'http://www.ascc.net/xml/schematron',
                        'smil20' : 'http://www.w3.org/2001/SMIL20/',
                        'gml'    : 'http://www.opengis.net/gml'}
   output_root = etree.Element('{http://www.w3.org/2001/XMLSchema}schema', nsmap=target_namespaces)

   # walk through selected directories and add schema xml trees to output tree
   for root, dirs, files in os.walk(FILEPATH):
      for file in files:
         compileSchema(os.path.join(root, file))

   # write output tree to a file
   with open('compositeSchema.xsd', 'w') as file:
      file.write(etree.tostring(output_root, encoding='utf-8', pretty_print=True))



def compileSchema(filepath):
   input_root = etree.parse(filepath).getroot()

   # determine local namespace prefix
   local_prefix           = ''
   local_namespace        = input_root.nsmap.get(None)
   local_targetnamespace  = input_root.attrib['targetNamespace']
   for key, value in target_namespaces.items():
      if local_targetnamespace == value:
         local_prefix = key

   # add prefix to unqualified attribute values
   for node in input_root.iter():
      for attribute, value in node.attrib.items():
         if attribute == 'memberTypes':
            type_list = []
            for memberType in value.split(' '):
               if ':' in memberType:
                  type_list.append(memberType)
               else:
                  if local_namespace == 'http://www.w3.org/2001/XMLSchema':
                     type_list.append( 'xs:{}'.format(memberType) )
                  else:
                     type_list.append( '{}:{}'.format(local_prefix, value) )
            node.attrib[attribute] = ' '.join(type_list)
         elif not ':' in value:
            if attribute == 'name':
               node.attrib['name'] = '{}:{}'.format(local_prefix, value)
            if attribute in ('type', 'ref', 'substitutionGroup', 'base', 'itemType'):
               if local_namespace == 'http://www.w3.org/2001/XMLSchema':
                  node.attrib[attribute] = 'xs:{}'.format(value)
               else:
                  node.attrib[attribute] = '{}:{}'.format(local_prefix, value)

   # copy input tree to output tree
   for node in input_root:
      output_root.append(deepcopy(node))



if __name__ == "__main__":
   main()