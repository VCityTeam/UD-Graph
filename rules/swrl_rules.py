import json
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

def add_rules(ontology, config_file):
    rules = format_rules(config_file)
    ns = ontology.get_namespace('http://www.w3.org/2000/01/rdf-schema#')
    for rule in rules:
        implication = Imp(namespace=ns)
        implication.set_as_rule(rule)
        print(str(implication))

def format_rules(config_file):
    with open(config_file, 'r') as file:
        config = json.loads(file.read())
        prefixes = config.get('prefixes')
        rules = []
        for rule in config.get('rules'):
            if rule.get('ignore'):
                continue
            for prefix in prefixes.keys():
                rule.update({
                    'rule': rule.get('rule').replace(prefix + ':', prefixes.get(prefix))
                })
            rules.append(rule.get('rule'))
        return rules

ontology_list = [
    'file://../Ontologies/CityGML/3.0/core.owl',
    'file://../Ontologies/CityGML/3.0/versioning.owl',
    'file://../Ontologies/Workspace/3.0/workspace.owl',
    'file://../Ontologies/Workspace/3.0/transactiontype.owl',
    'file://../Ontologies/Document/3.0/document.owl'
]

ontology_network = load_ontologies(ontology_list)
# get_classes(ontology_network)
add_rules(ontology_network, 'workspace_rules.json')