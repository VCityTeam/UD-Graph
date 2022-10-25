import json
from owlready2 import get_ontology, default_world, sync_reasoner_pellet, World, Ontology, Imp, Nothing
import logging
from rdflib import Graph, Namespace


def load_ontologies(config, world):
    ontology_list = config.get('ontologies')
    ontology_network = world.get_ontology(ontology_list[0]).load()
    logging.debug(ontology_network)
    for ontology_location in ontology_list[1:]:
        ontology = world.get_ontology(ontology_location).load()
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

def add_rules(ontology, config):
    rules = format_rules(config)
    ns = ontology.get_namespace('http://www.w3.org/2000/01/rdf-schema#')
    for rule in rules:
        implication = Imp(namespace=ns)
        implication.set_as_rule(rule)

def format_rules(config):
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

def export_graph(test, rules, output_format='ttl'):
    graph = default_world.as_rdflib_graph()
    output = Graph()
    output.bind( 'swrl', Namespace('http://www.w3.org/2003/11/swrl#') )
    output.bind( '', Namespace(test.get('output').get('namespace')) )
    for prefix, namespace in rules.get('prefixes').items():
        output.bind(prefix, Namespace(namespace))
    for triple in graph.query("""
        SELECT DISTINCT ?s ?p ?o
        WHERE {
            ?s ?p ?o ;
              a <http://www.w3.org/2002/07/owl#NamedIndividual> .
        }"""):
        output.add(triple)
    output_file = 'output.ttl'
    if test.get('output').get('filename'):
        output_file = test.get('output').get('filename')
    output.serialize(destination=output_file, format=output_format)
    logging.info(f'graph exported to {output_file}')


logging.basicConfig(format='%(asctime)s %(levelname)-8s %(message)s',
                    filename='output.log',
                    # level=logging.INFO)
                    level=logging.DEBUG)


### init configuration
rule_config_file = 'rules.json'
test_config_file = 'tests.json'
rules = None
tests = None

### load configuration files
with open(rule_config_file, 'r') as file:
    rules = json.loads(file.read())
with open(test_config_file, 'r') as file:
    tests = json.loads(file.read())
i = 0

for test in tests:
    i += 1
    logging.info(f'=== Running Test {i} ===')
    world = World()
    ### load ontologies and rules
    ontology_network = load_ontologies(test, world)
    add_rules(ontology_network, rules)

    ### log potentially useful information
    log_classes(world)
    log_rules(world)
    log_individuals(world)

    ### check inconsistency
    sync_reasoner_pellet(world ,infer_property_values=True, infer_data_property_values=True, debug=2)
    logging.info(f'Inconsistent classes: {list(world.inconsistent_classes())}')
    for _class in get_classes(world):
        if Nothing in _class.equivalent_to:
            logging.warning(f'{_class.iri} is inconsistent')

    # export graph and finish
    export_graph(test, rules)
    print('Done!')