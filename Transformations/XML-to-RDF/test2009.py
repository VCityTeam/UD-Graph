import os

### transform CityGML 2 ###

command = (r'python ./CityGML2RDF.py '
    r'-v '
    r'--format rdf '
    r'--log output2012v2.log '
    r'..\..\..\citygml2-to-citygml3\input\GratteCiel_2009_split.gml '
    r'..\..\Ontologies\CityGML\2.0,'
    # r'../test-data/OWL/compositeCityGML2.0.rdf,'
    # r'../test-data/OWL/TC_211,'
    # r'../test-data/OWL/GeoSPARQL '
    r'https://www.w3.org/2009/08/skos-reference/skos.rdf,'
    r'http://www.opengis.net/ont/geosparql#,'
    r'http://www.opengis.net/ont/gml# '
    r'./citygml_2_mappings.json')

print(command)
os.system(command)

command = (r'python CityGML2RDF.py '
    r'-v '
    r'--format rdf '
    r'--log output2012v3.log '
    r'..\..\..\citygml2-to-citygml3\output\GratteCiel_2009_split_v3.gml '
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