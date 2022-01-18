import sys
from lxml import etree
from copy import deepcopy

input_root = etree.parse(sys.argv[1]).getroot()

for lod2Solid in input_root.findall(r'.//{http://www.opengis.net/citygml/3.0}lod2Solid'):
    parent = lod2Solid.getparent()
    i = parent.index(lod2Solid)
    # if the lod2Solid is declared before a boundary sibling move it to after the last boundary declaration sibling
    if parent[ i + 1 ].tag == r'{http://www.opengis.net/citygml/3.0}boundary':
        j = 0
        for element in parent:
            if element.tag == r'{http://www.opengis.net/citygml/3.0}boundary' and parent.index(element) > j:
                j = parent.index(element)
        parent.insert(j + 1, deepcopy(lod2Solid))
        parent.remove(lod2Solid)

with open(sys.argv[1], 'wb') as file:
    file.write(etree.tostring( input_root, pretty_print=True ))