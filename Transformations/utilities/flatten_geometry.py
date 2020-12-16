import sys
from lxml import etree

def main():
    if len(sys.argv) != 3:
        sys.exit(
            'Incorrect number of arguments: {}\nUsage: python flatten_geometry.py [input datafile] [output datafile]'.format(
                len(sys.argv)))

    root = etree.parse(sys.argv[1]).getroot()
    CRS = 'EPSG:3946'

    for node in root.iter():
        if node.attrib.get('srsDimension') == '3':
            node.attrib['srsDimension'] = '2'
            # if a coordinate reference system is specified, add it to the geometry 
            # serialization.
            if CRS != '':
                node.attrib['srsName'] = CRS
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