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

def print_rules(ontology):
    for rule in ontology.rules():
        print(rule)
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for rule in _ontology.rules():
                print(rule)

def print_individuals(ontology):
    for individual in ontology.individuals():
        print(individual.iri)
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for individual in _ontology.individuals():
                print(individual.iri)

def print_classes(ontology):
    for _class in ontology.classes():
        print(_class.iri)
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for _class in _ontology.classes():
                print(_class.iri)

def get_classes(ontology):
    classes = [_class for _class in ontology.classes()]
    if type(ontology) is Ontology:
        classes += [_class for _class in ontology.imported_ontologies]
    return classes

def add_rules(ontology, config_file):
    rules = format_rules(config_file)
    ns = ontology.get_namespace('http://www.w3.org/2000/01/rdf-schema#')
    print(ontology)
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
    # 'file://../Ontologies/Document/3.0/document.owl',
    # 'file://../Datasets/GratteCiel_2009-2018_Workspace_v3.owl',
    # 'file://../Datasets/GratteCiel_2018_split_v3.owl',
    # 'file://../Datasets/GratteCiel_2015_split_v3.owl',
    # 'file://../Datasets/GratteCiel_2012_split_v3.owl',
    # 'file://../Datasets/GratteCiel_2009_split_v3.owl'
    # 'file://test_1.owl',
    'file://test_2.owl'
]

### load ontologies
ontology_network = load_ontologies(ontology_list)
add_rules(ontology_network, 'workspace_rules.json')

# print('classes:')
# print_classes(default_world)
# print('rules:')
# print_rules(default_world)
# print('individuals:')
# print_individuals(default_world)

### check inconsistency
sync_reasoner_pellet(infer_property_values = True, infer_data_property_values = True)
print(f'Inconsistent classes: {list(default_world.inconsistent_classes())}')
for _class in get_classes(default_world):
    if Nothing in _class.equivalent_to:
        print(f'{_class.iri} is inconsistent')

graph = default_world.as_rdflib_graph()
graph.serialize('./output.ttl', format='ttl')

print('Done!')