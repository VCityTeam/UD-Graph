import sys
from lxml import etree
from copy import deepcopy

root = etree.parse(sys.argv[1]).getroot()

if root.nsmap.get(None, None) != None:
	print('Enter namespace prefix for: {}'.format(root.nsmap.get(None)))
	prefix = input()
	new_nsmap = dict(root.nsmap).pop(None)
	new_nsmap.update({ prefix: root.nsmap.get(None) })
	new_tree = etree.Element( deepcopy(root), nsmap=new_nsmap )
	root = new_tree

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