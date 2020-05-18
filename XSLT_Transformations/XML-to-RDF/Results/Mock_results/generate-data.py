# generate mock results
import sys
import random
import string
from lxml import etree


### Utility functions ###
def randomString(length=6):
   return ''.join(random.choice( string.ascii_letters + string.digits ) for c in range(length))

def randomDate():
   return '-'.join([str(random.randint( 1900, 2020 )), str(random.randint( 1, 12 )), str(random.randint(1, 31))])

def randomCoordinates(dimension=3):
   return ' '.join(str(random.randint( 0,100000 ) + random.random()) for n in range(dimension))


xml_template = ('<?xml version="1.0"?>' +
               '<rdf:RDF xmlns="http://www.example.org/ontologies/CityGML#" ' +
                     'xml:base="http://www.example.org/ontologies/CityGML" ' +
                     'xmlns:owl="http://www.w3.org/2002/07/owl#" ' +
                     'xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" ' +
                     'xmlns:www="http://www.w3.org/2001/" ' +
                     'xmlns:xml="http://www.w3.org/XML/1998/namespace" ' +
                     'xmlns:xsd="http://www.w3.org/2001/XMLSchema#" ' +
                     'xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" ' +
                     'xmlns:gml="http://www.opengis.net/gml#" ' +
                     'xmlns:core="http://www.opengis.net/citygml/2.0#" ' +
                     'xmlns:app="http://www.opengis.net/citygml/appearance/2.0/appearance#" ' +
                     'xmlns:bldg="http://www.opengis.net/citygml/building/2.0/building#" ' +
                     'xmlns:gen="http://www.opengis.net/citygml/generics/2.0/generics#">' +
                  '<owl:Ontology rdf:about="http://www.example.org/ontologies/CityGML">' +
                     '<rdfs:comment>This is a mock ontology. The structure of this data is subject to change.</rdfs:comment>' +
                  '</owl:Ontology>' +
                  '<owl:NamedIndividual rdf:about="http://www.example.org/ontologies/CityGML#TestModel" ' +
                        'rdf:type="http://www.opengis.net/citygml/2.0#CityModel">' +
                     '<rdfs:label>Example City</rdfs:label>' +
                  '</owl:NamedIndividual>' +
               '</rdf:RDF>')


print('begin xml tree generation...')
root = etree.fromstring(xml_template)

# generate model individuals
for i in range(100):
   # generate CityModel reference to cityObjectMember 
   element = etree.SubElement( root[1], '{http://www.opengis.net/gml#}hasfeatureMember' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#cityObjectMember_' + str(i) )

   # generate cityObjectMember
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#cityObjectMember_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/citygml/2.0#cityObjectMember' )
   # generate cityObjectMember reference to building
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}has_Feature' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#building_' + str(i) )

   # generate building
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#building_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/citygml/building/2.0/building#Building' )
   # generate building children
   sub_element = etree.SubElement( element, '{http://www.w3.org/2000/01/rdf-schema#}label' )
   sub_element.text = randomString(8)
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/2.0#}creationDate' )
   sub_element.text = randomDate()
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hasboundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}consistsOfBuildingPart' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#consistsOfBuildingPart_' + str(i) )

   # generate building boundedBy
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#boundedBy_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/gml#boundedBy' )
   # generate boundedBy reference to envelope
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hasEnvelope' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#envelope_' + str(i) )

   # generate boundedBy envelope
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#envelope_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/gml#Envelope' )
   # generate envelope corners
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}srsDimension' )
   sub_element.text = '3'
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}lowerCorner' )
   sub_element.text = randomCoordinates()
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}upperCorner' )
   sub_element.text = randomCoordinates()

   # generate building consistsOfBuildingPart
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#consistsOfBuildingPart_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/citygml/building/2.0/building#consistsOfBuildingPart' )
   # generate consistsOfBuildingPart reference to buildingPart
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}hasBuildingPart' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#BuildingPart_' + str(i) )

   # generate building BuildingPart
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#BuildingPart_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/citygml/building/2.0/building#BuildingPart' )
   # generate BuildingPart child geometry
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}lod2Solid' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#lod2Solid_' + str(i) )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}boundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) + '_roof')
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}boundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) + '_ground')
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}boundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) + '_wall0')
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}boundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) + '_wall1')
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}boundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) + '_wall2')
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}boundedBy' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#boundedBy_' + str(i) + '_wall3')

   # generate buildingpart lod2Solid
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#lod2Solid_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/citygml/building/2.0/building#lod2Solid' )
   # generate lod2solid reference to solid
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}has_Solid' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Solid_' + str(i) )

   # generate solid
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#Solid_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/gml#Solid' )
   # generate solid reference to exterior
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}exterior' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#exterior_' + str(i) )

   # generate exterior
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#exterior_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/gml#SurfacePropertyType' )
   # generate exterior reference to composite surface
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}has_Surface' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#compositeSurface_' + str(i) )

   # generate composite surface
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#compositeSurface_' + str(i) )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/gml#CompositeSurface' )
   # generate compositesurface reference to surface members
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hassurfaceMember' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Polygon_' + str(i) + '_roof' )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hassurfaceMember' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Polygon_' + str(i) + '_ground' )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hassurfaceMember' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Polygon_' + str(i) + '_wall0' )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hassurfaceMember' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Polygon_' + str(i) + '_wall1' )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hassurfaceMember' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Polygon_' + str(i) + '_wall2' )
   sub_element = etree.SubElement( element, '{http://www.opengis.net/gml#}hassurfaceMember' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#Polygon_' + str(i) + '_wall3' )

   # generate roof boundary
   element = etree.SubElement( root, '{http://www.w3.org/2002/07/owl#}NamedIndividual' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}about', '#boundedBy_' + str(i) + '_roof' )
   element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}type', 'http://www.opengis.net/citygml/building/2.0/building#BoundarySurfacePropertyType' )
   # generate boundary reference to surface
   sub_element = etree.SubElement( element, '{http://www.opengis.net/citygml/building/2.0/building#}has_BoundarySurface' )
   sub_element.set( '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource', '#RoofSurface_' + str(i) )

   #TODO: complete roof geometry generation
   #TODO: begin ground geometry generation
   #TODO: begin wall geometry generation





with open('output.gml', 'w') as file:
   file.write(etree.tostring(root, pretty_print=True))

print('generation complete')





