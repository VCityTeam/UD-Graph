import os

### transform CityGML 2 ###

command = (r'python ./XML2RDF.py '
    r'-v '
    r'--format ttl '
    r'--log output2009v2.log '
    r'"C:\Users\Diego Vinasco\Desktop\Datasets\GratteCiel_2009-2018v2\3-split\GratteCiel_2009_split.gml" '
    r'..\..\Ontologies\CityGML\2.0,'
    # r'../test-data/OWL/compositeCityGML2.0.rdf,'
    # r'../test-data/OWL/TC_211,'
    # r'../test-data/OWL/GeoSPARQL '
    r'https://www.w3.org/2009/08/skos-reference/skos.rdf,'
    r'http://www.opengis.net/ont/geosparql#,'
    r'http://www.opengis.net/ont/gml# '
    r'./citygml_2_mappings.json')

# print(command)
# os.system(command)

command = (r'python XML2RDF.py '
    r'-v '
    r'--format ttl '
    r'--log output2009v3.log '
    r'"C:\Users\Diego Vinasco\Desktop\Datasets\GratteCiel_2009-2018v2\v3.0\GratteCiel_2009_split_v3.gml" '
    r'..\..\Ontologies\CityGML\3.0,'
    # r'../test-data/OWL/compositeCityGML3.0.rdf,'
    # r'../test-data/OWL/TC_211,'
    # r'../test-data/OWL/GeoSPARQL '
    r'https://www.w3.org/2009/08/skos-reference/skos.rdf,'
    r'http://www.opengis.net/ont/geosparql#,'
    r'http://www.opengis.net/ont/gml# '
    r'citygml_3_mappings.json')

print(command)
os.system(command)