import sys
from lxml import etree

def main():
    if len(sys.argv) != 3:
        sys.exit(f'''Incorrect number of arguments: {len(sys.argv)}
        	Usage: python flatten_geometry.py [input datafile] [output datafile]
        	Convert CityGML file geometry from 3D to 2D''')

    root = etree.parse(sys.argv[1]).getroot()

    for node in root.iter():
        # skip comment nodes
        if not isinstance(node.tag, str):
            continue
        if node.attrib.get('srsDimension') == '3':
            node.attrib['srsDimension'] = '2'
        if etree.QName(node).namespace == 'http://www.opengis.net/gml' and node.text is not None:
            # tokenize text and remove empty tokens
            point_list = list(filter( lambda a: a != '' and a != '\n', node.text.split(' ') ))
            # check if text is a point list and remove every 3rd element
            if len(point_list) > 0 and point_list[0].replace('.', '', 1).isdigit():
                del point_list[2::3]
                node.text = ' '.join(point_list)

    with open(sys.argv[2], 'wb') as file:
       file.write(etree.tostring( root, pretty_print=True ))

if __name__ == "__main__":
    main()