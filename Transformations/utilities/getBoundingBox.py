import sys
from lxml import etree
import math

input_root = etree.parse(sys.argv[1]).getroot()

for building in input_root.findall('{http://www.opengis.net/citygml/3.0}cityObjectMember/{http://www.opengis.net/citygml/building/3.0}Building'):
    print(building.attrib.get('{http://www.opengis.net/gml/3.2}id'))
    points = []
    for pointlist in building.findall('.//*{http://www.opengis.net/gml/3.2}posList'):
        # print(pointlist.tag)
        points += [float(x) for x in pointlist.text.split(' ') if x != '']
    # print(points)
    print('max:', max(points[::3]), max(points[1::3]), max(points[2::3]))
    print('min:', min(points[::3]), min(points[1::3]), min(points[2::3]))