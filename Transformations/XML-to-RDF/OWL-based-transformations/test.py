import os

### test CityGML 2 ###

# command = (r'python ./CityGML2RDF.py '
#     r'../../test-data/GML/LYON_1ER_BATI_2015-20_bldg-patched.gml '
#     r'../../test-data/OWL/CityGML_2.0_Conceptual_Model,'
#     r'../../test-data/OWL/compositeCityGML2.0.rdf,'
#     r'../../test-data/OWL/TC_211,'
#     r'../../test-data/OWL/GeoSPARQL '
#     r'./citygml_2_namespace_mappings.json')


### test CityGML 3 ###

command = (r'python CityGML2RDF.py '
           r'../../test-data/GML/historicalSuccession_CityGML_3.0_LOD2_Versioning_patched.gml '
           r'../../test-data/OWL/CityGML_3.0_Conceptual_Model,'
           # r'../../test-data/OWL/compositeCityGML3.0.rdf,'
           r'../../test-data/OWL/TC_211,'
           r'../../test-data/OWL/GeoSPARQL '
           r'citygml_3_namespace_mappings.json')

print(command)
os.system(command)