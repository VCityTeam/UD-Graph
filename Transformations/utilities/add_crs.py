import sys
from lxml import etree

def main():
    if len(sys.argv) != 4:
        sys.exit(f'''Incorrect number of arguments: {len(sys.argv)}
            Usage: python add_crs.py [input datafile] [CRS] [output datafile]
            Add a Coordinate Reference System attribute to CityGML files''')

    root = etree.parse(sys.argv[1]).getroot()
    CRS = sys.argv[2]
    # CRS = 'EPSG:3946'

    for node in root.iter():
        # skip comment nodes
        if not isinstance(node.tag, str):
            continue
        if node.attrib.get('{http://www.opengis.net/gml}id') is not None:
            # if a gml:id is specified, add the CRS to the geometry.
            if CRS != '':
                node.attrib['srsName'] = CRS

    with open(sys.argv[3], 'wb') as file:
       file.write(etree.tostring( root, pretty_print=True ))

if __name__ == "__main__":
    main()