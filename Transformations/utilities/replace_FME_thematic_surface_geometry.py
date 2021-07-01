import sys
from copy import deepcopy
from lxml import etree
from progress.bar import Bar

def main():
   if len(sys.argv) != 4:
      sys.exit(f'''Incorrect number of arguments: {len(sys.argv)}
Usage: python replace_FME_thematic_surface_geometry.py [base datafile] [replacement datafile] [output file]
Replace CityGML buiding thematic surface geometry from an FME generated GML file''')

   base_root = etree.parse(sys.argv[1]).getroot()
   replacement_root = etree.parse(sys.argv[2]).getroot()

   with Bar('Replacing geometry...', max=len(replacement_root)) as bar:
      # iterate through all replacement features with gml:ids
      for replacement_feature in replacement_root.findall(
            './{http://www.opengis.net/gml}featureMember/{http://www.safe.com/gml/fme}*[@{http://www.opengis.net/gml}id]'):
         # if feature also exists in the base datafile, attempt to replace its geometry
         feature_id = replacement_feature.attrib.get('{http://www.opengis.net/gml}id')
         base_feature = base_root.find( './/*[@{http://www.opengis.net/gml}id = "%s"]'% feature_id )
         if base_root is None:
            print( f'warning, feature not found: {feature_id}' )
            continue
         # skip buildings for now
         elif replacement_feature.tag == '{http://www.safe.com/gml/fme}Building':
            continue
         # else extract replacement geometry and replace the base feature geometry with it
         else:
            replacement_geometry = replacement_feature.find('.//{http://www.opengis.net/gml}posList')
            base_feature.find('.//{http://www.opengis.net/gml}posList').text = replacement_geometry.text
            for node in base_feature.findall('.//*[srsDimension = "3"]'):
               node.attrib['srsDimension'] = 2
         bar.next()


   print('Writing to output file...')
   with open(sys.argv[3], 'wb') as file:
      file.write( etree.tostring(base_root, pretty_print=True) )
   print('Done!')

if __name__ == "__main__":
    main()