import sys
from os import system, walk
from lxml import etree
from copy import deepcopy

input_file = '../XSD-to-OWL/Schema/CityGML/cityGMLBase.xsd'
template = ('<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" ' +
						   'xmlns:math="http://www.w3.org/2005/xpath-functions/math" ' +
						   'xmlns:owl="http://www.w3.org/2002/07/owl#" ' +
						   'xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" ' +
						   'xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" ' +
						   'xmlns:xs="http://www.w3.org/2001/XMLSchema" ' +
						   'xmlns:gml="http://www.opengis.net/gml" ' +
						   'xmlns:base="http://www.opengis.net/citygml/base/2.0" ' +
						   'xmlns:bldg="http://www.opengis.net/citygml/building/2.0" ' +
						   'xmlns:core="http://www.opengis.net/citygml/2.0" ' +
						   'xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0" ' +
						   'xmlns:xlink="http://www.w3.org/1999/xlink" ' +
						   'xmlns:smil20="http://www.w3.org/2001/SMIL20/" version="2.0"/>')
output = etree.fromstring(template)

print('Creating XML to RDF transformation mapping...')
system('java -jar ../saxon9he.jar -s:../XSD-to-OWL/Schema/compositebuilding.xsd -xsl:Generate_XML2RDF.xsl > CityGML2RDF.xsl')

print('Cleaning mapping patterns...')
root = etree.parse('CityGML2RDF.xsl').getroot()
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


for node in root:
	output.append(deepcopy(node))

element = etree.SubElement(output, '{http://www.w3.org/1999/XSL/Transform}template')
element.attrib['name'] = 'gml:_Object_Template'
element = etree.SubElement(output, '{http://www.w3.org/1999/XSL/Transform}template')
element.attrib['name'] = 'xlink:simpleAttrs_Template'


with open('CityGML2RDF.xsl', 'w') as file:
   file.write(etree.tostring( output, pretty_print=True ))

# print('Transforming XML to RDF... LYON_1ER_BATI_2009-1_bldg.gml')
# system('java -jar ../saxon9he.jar -s:input-data/LYON_1ER_BATI_2009-1_bldg.gml -xsl:CityGML2RDF.xsl > Results/LYON_1ER_BATI_2009-1_bldg.rdf')
# print('Transforming XML to RDF... LYON_1ER_BATI_2009-153_bldg.gml')
# system('java -jar ../saxon9he.jar -s:input-data/LYON_1ER_BATI_2009-153_bldg.gml -xsl:CityGML2RDF.xsl > Results/LYON_1ER_BATI_2009-153_bldg.rdf')
# print('Transforming XML to RDF... LYON_1ER_BATI_2012-1_bldg.gml')
# system('java -jar ../saxon9he.jar -s:input-data/LYON_1ER_BATI_2012-1_bldg.gml -xsl:CityGML2RDF.xsl > Results/LYON_1ER_BATI_2012-1_bldg.rdf')
# print('Transforming XML to RDF... LYON_1ER_BATI_2012-153_bldg.gml')
# system('java -jar ../saxon9he.jar -s:input-data/LYON_1ER_BATI_2012-153_bldg.gml -xsl:CityGML2RDF.xsl > Results/LYON_1ER_BATI_2012-153_bldg.rdf')
print('Transforming XML to RDF... LYON_1ER_BATI_2015-1_bldg.gml')
system('java -jar ../saxon9he.jar -s:input-data/LYON_1ER_BATI_2015-1_bldg.gml -xsl:CityGML2RDF.xsl > Results/LYON_1ER_BATI_2015-1_bldg.rdf')
print('Transforming XML to RDF... LYON_1ER_BATI_2015-1711_bldg.gml')
system('java -jar ../saxon9he.jar -s:input-data/LYON_1ER_BATI_2015-1711_bldg.gml -xsl:CityGML2RDF.xsl > Results/LYON_1ER_BATI_2015-1711_bldg.rdf')

def cleanRDF(filename):
	print('Cleaning rdf duplicates... ' + filename)
	root = etree.parse(filename).getroot()
	for node_1 in root.findall('{http://www.w3.org/2002/07/owl#}NamedIndividual[{http://www.opengis.net/gml}id]'):
		index = root.index(node_1)
		print(str(index) + '/' + str(len(root)))
		if len(root) > index + 1 and root[index + 1].attrib == node_1.attrib:
			root.remove(root[index])

	with open(filename, 'w') as file:
	   file.write(etree.tostring( root, pretty_print=True ))

# cleanRDF('Results/LYON_1ER_BATI_2009-1_bldg.rdf')
# cleanRDF('Results/LYON_1ER_BATI_2009-153_bldg.rdf')
# cleanRDF('Results/LYON_1ER_BATI_2012-1_bldg.rdf')
# cleanRDF('Results/LYON_1ER_BATI_2012-153_bldg.rdf')
cleanRDF('Results/LYON_1ER_BATI_2015-1_bldg.rdf')
cleanRDF('Results/LYON_1ER_BATI_2015-1711_bldg.rdf')