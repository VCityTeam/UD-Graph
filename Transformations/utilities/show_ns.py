import sys
from lxml import etree
from copy import deepcopy

def main(filename):

	root = etree.parse(filename).getroot()

	if root.nsmap.get(None, None) != None and not root.nsmap.get(None, None) in root.nsmap.values():
		print('Enter namespace prefix for: {}'.format(root.nsmap.get(None, '')))
		prefix = input()
		new_nsmap = dict(root.nsmap).pop(None)
		new_nsmap.update({ prefix: root.nsmap.get(None) })
		new_tree = etree.Element( deepcopy(root), nsmap=new_nsmap )
		root = new_tree

	for node in root.iter():
		srsDimensions = node.attrib.get('srsDimensions', None)
		if srsDimensions != None:
			node.attrib.pop('srsDimensions')
			node.attrib['{http://www.opengis.net/gml}srsDimensions'] = srsDimensions
		srsName = node.attrib.get('srsName', None)
		if srsName != None:
			node.attrib.pop('srsName')
			node.attrib['{http://www.opengis.net/gml}srsName'] = srsName
		uom = node.attrib.get('uom', None)
		if uom != None:
			node.attrib.pop('uom')
			node.attrib['{http://www.opengis.net/gml}uom'] = uom
		ID = node.attrib.get('{http://www.w3.org/1999/02/22-rdf-syntax-ns#}ID', None)
		if ID != None and ':' in ID and not 'http' in ID:
			ID = ID.split(':')
			node.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}ID'] = root.nsmap.get(ID[0], '') + '#' + ID[1]
		elif ID != None and not ':' in ID and not '#' in ID:
			node.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}ID'] = root.nsmap.get('liris', '') + ID
		about = node.attrib.get('{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', None)
		if about != None and ':' in about and not 'http' in about:
			about = about.split(':')
			node.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about'] = root.nsmap.get(about[0], '') + '#' + about[1]
		elif about != None and not ':' in about and not '#' in about:
			node.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about'] = root.nsmap.get('liris', '') + about
		resource = node.attrib.get('{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', None)
		if resource != None and ':' in resource:
			resource = resource.split(':')
			node.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource'] = root.nsmap.get(resource[0], '') + '#' + resource[1]
		elif resource != None and not ':' in resource and not '#' in resource:
			node.attrib['{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource'] = root.nsmap.get('liris', '') + resource

	with open(sys.argv[1], 'wb') as file:
	   file.write(etree.tostring( root, pretty_print=True ))

if __name__ == "__main__":
	main(sys.argv[1])