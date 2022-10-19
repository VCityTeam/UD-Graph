import json
from owlready2 import get_ontology, default_world, sync_reasoner_pellet, Ontology, Imp, Nothing
import logging
from rdflib import Namespace

def load_ontology(file):
    ontology = get_ontology(file).load()
    logging.debug(ontology)
    return ontology

def load_ontologies(ontology_list):
    ontology_network = get_ontology(ontology_list[0]).load()
    logging.debug(ontology_network)
    for ontology_location in ontology_list[1:]:
        ontology = get_ontology(ontology_location).load()
        logging.debug(ontology)
        ontology_network.imported_ontologies.append(ontology)
    return ontology_network

def log_rules(ontology):
    logging.debug('rules:')
    for rule in ontology.rules():
        logging.debug(f'  {rule}')
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for rule in _ontology.rules():
                logging.debug(f'  {rule}')

def log_individuals(ontology):
    logging.debug('individuals:')
    for individual in ontology.individuals():
        logging.debug(f'  {individual.iri}')
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for individual in _ontology.individuals():
                logging.debug(f'  {individual.iri}')

def log_classes(ontology):
    logging.debug('classes:')
    for _class in ontology.classes():
        logging.debug(f'  {_class.iri}')
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for _class in _ontology.classes():
                logging.debug(f'  {_class.iri}')

def get_classes(ontology):
    classes = [_class for _class in ontology.classes()]
    if type(ontology) is Ontology:
        classes += [_class for _class in ontology.imported_ontologies]
    return classes

def add_rules(ontology, config_file):
    rules = format_rules(config_file)
    ns = ontology.get_namespace('http://www.w3.org/2000/01/rdf-schema#')
    for rule in rules:
        implication = Imp(namespace=ns)
        implication.set_as_rule(rule)

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

def export_graph(config_file, output_file='output.ttl', output_format='ttl'):
    graph = default_world.as_rdflib_graph()
    with open(config_file, 'r') as file:
        config = json.loads(file.read())
        graph.bind('swrl', Namespace('http://www.w3.org/2003/11/swrl#'))
        for prefix, namespace in config['prefixes'].items():
            graph.bind(prefix, Namespace(namespace))
    graph.serialize(output_file, format=output_format)
    logging.info(f'graph exported to {output_file}')

logging.basicConfig(format='%(asctime)s %(levelname)-8s %(message)s',
                    filename='output.log',
                    # level=logging.INFO)
                    level=logging.DEBUG)

ontology_list = [
    'https://raw.githubusercontent.com/w3c/sdw/gh-pages/time/rdf/time.nt',
    # 'file://../Ontologies/CityGML/3.0/core.owl',
    # 'file://../Ontologies/CityGML/3.0/versioning.owl',
    # 'file://../Ontologies/Workspace/3.0/workspace.owl',
    # 'file://../Ontologies/Workspace/3.0/transactiontype.owl',
    # 'file://../Ontologies/Document/3.0/document.owl',
    # 'file://../Datasets/GratteCiel_2009-2018_Workspace_v3.owl',
    # 'file://../Datasets/GratteCiel_2018_split_v3.owl',
    # 'file://../Datasets/GratteCiel_2015_split_v3.owl',
    # 'file://../Datasets/GratteCiel_2012_split_v3.owl',
    # 'file://../Datasets/GratteCiel_2009_split_v3.owl'
    'file://test_0.owl',
    # 'file://test_1.owl',
    # 'file://test_2.owl'
]
# config = 'workspace_rules.json'
config = 'test_rules.json'

### load ontologies
ontology_network = load_ontologies(ontology_list)
add_rules(ontology_network, config)

log_classes(default_world)
log_rules(default_world)
log_individuals(default_world)

### check inconsistency
sync_reasoner_pellet(infer_property_values=True, infer_data_property_values=True)
logging.info(f'Inconsistent classes: {list(default_world.inconsistent_classes())}')
for _class in get_classes(default_world):
    if Nothing in _class.equivalent_to:
        logging.warning(f'{_class.iri} is inconsistent')

# export graph and finish
# export_graph(config)
print('Done!')