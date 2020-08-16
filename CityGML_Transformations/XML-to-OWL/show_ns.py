import sys
from lxml import etree
from copy import deepcopy

root = etree.parse(sys.argv[1]).getroot()

for node in root.iter():
	srsDimensions = node.attrib.get('srsDimensions', None)
	if srsDimensions is not None:
		node.attrib.pop('srsDimensions')
		node.attrib['{http://www.opengis.net/gml}srsDimensions'] = srsDimensions
	srsName = node.attrib.get('srsName', None)
	if srsName is not None:
		node.attrib.pop('srsName')
		node.attrib['{http://www.opengis.net/gml}srsName'] = srsName
	uom = node.attrib.get('uom', None)
	if uom is not None:
		node.attrib.pop('uom')
		node.attrib['{http://www.opengis.net/gml}uom'] = uom

with open(sys.argv[1], 'w') as file:
   file.write(etree.tostring( root, pretty_print=True ))