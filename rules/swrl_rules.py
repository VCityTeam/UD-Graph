from owlready2 import *

def load_ontology(file):
    ontology = get_ontology(file).load()
    print(ontology)
    return ontology

def load_ontologies(ontology_list):
    ontology_network = get_ontology(ontology_list[0]).load()
    print(ontology_network)
    for ontology_location in ontology_list[1:]:
        ontology = get_ontology(ontology_location).load()
        print(ontology)
        ontology_network.imported_ontologies.append(ontology)
    return ontology_network

def get_classes(ontology):
    for _class in ontology.classes():
        print(_class.iri)

def add_rules(ontology, namespace_list, rule_file):
    ns = ontology.get_namespace(namespace_list[0])
    print(ns)
    with open(rule_file, 'r') as rules:
        rule = Imp(namespace=ns)
        for line in rules:
            rule.set_as_rule(line, namespaces=[ns])
            print(str(rule))



ontology_list = [
    'file://../Ontologies/Workspace/3.0/workspace.owl',
    'file://../Ontologies/CityGML/3.0/core.owl',
    'file://../Ontologies/CityGML/3.0/versioning.owl',
    'file://../Ontologies/Document/3.0/document.owl'
]
namespace_list = [
    'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/Workspace/3.0/workspace',
    'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/CityGML/3.0/core',
    'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/CityGML/3.0/versioning',
    'https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/Document/3.0/document'
]

ontology_network = load_ontologies(ontology_list)
get_classes(ontology_network)
add_rules(ontology_network, namespace_list, 'workspace_rules.txt')