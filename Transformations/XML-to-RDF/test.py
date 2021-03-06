import os

### test CityGML 2 ###

command = (r'python ./CityGML2RDF.py '
    r'-v '
    r'--format rdf '
    r'../test-data/GML/LYON_1ER_BATI_2015-1_bldg-patched.gml '
    r'../test-data/OWL/CityGML_2.0_Conceptual_Model,'
    # r'../test-data/OWL/compositeCityGML2.0.rdf,'
    # r'../test-data/OWL/TC_211,'
    # r'../test-data/OWL/GeoSPARQL '
    r'https://www.w3.org/2009/08/skos-reference/skos.rdf,'
    r'http://www.opengis.net/ont/geosparql#,'
    r'http://www.opengis.net/ont/gml# '
    r'./citygml_2_mappings.json')

print(command)
os.system(command)

### test CityGML 3 ###

command = (r'python CityGML2RDF.py '
    r'-v '
    r'--format rdf '
    r'../test-data/GML/historicalSuccession_CityGML_3.0_LOD2_Versioning_patched.gml '
    r'../test-data/OWL/CityGML_3.0_Conceptual_Model,'
    # r'../test-data/OWL/compositeCityGML3.0.rdf,'
    # r'../test-data/OWL/TC_211,'
    # r'../test-data/OWL/GeoSPARQL '
    r'https://www.w3.org/2009/08/skos-reference/skos.rdf,'
    r'http://www.opengis.net/ont/geosparql#,'
    r'http://www.opengis.net/ont/gml# '
    r'citygml_3_mappings.json')

print(command)
os.system(command)