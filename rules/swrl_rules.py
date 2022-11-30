import json
from owlready2 import sync_reasoner_pellet, World, Ontology, Imp, Nothing
import logging
from rdflib import Graph, Namespace


def load_ontologies(ontology_list, world):
    """
    Load the ontologies in the list `ontology_list` into the `world`. Additionally,
    an `ontology network` is created by importing all of the ontologies in the list
    into the first ontology in the list through imports. Return the ontology
    network
    
    :param ontology_list: a list of ontology locations
    :param world: The world object that contains the ontology
    :return: The ontology network is being returned.
    """
    ontology_network = world.get_ontology(ontology_list[0]).load()
    logging.debug(ontology_network)
    for ontology_location in ontology_list[1:]:
        ontology = world.get_ontology(ontology_location).load()
        logging.debug(ontology)
        ontology_network.imported_ontologies.append(ontology)
    return ontology_network

def log_rules(ontology):
    """
    Log all the rules in an ontology and its imported ontologies
    
    :param ontology: the ontology to be used
    """
    logging.debug('rules:')
    for rule in ontology.rules():
        logging.debug(f'  {rule}')
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for rule in _ontology.rules():
                logging.debug(f'  {rule}')

def log_individuals(ontology):
    """
    Log the IRI of each individual in the ontology and its imported ontologies
    
    :param ontology: the ontology to be logged
    """
    logging.debug('individuals:')
    for individual in ontology.individuals():
        logging.debug(f'  {individual.iri}')
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for individual in _ontology.individuals():
                logging.debug(f'  {individual.iri}')

def log_classes(ontology):
    """
    Log the IRI of every class in the ontology and its imported ontologies
    
    :param ontology: the ontology to be processed
    """
    logging.debug('classes:')
    for _class in ontology.classes():
        logging.debug(f'  {_class.iri}')
    if type(ontology) is Ontology:
        for _ontology in ontology.imported_ontologies:
            for _class in _ontology.classes():
                logging.debug(f'  {_class.iri}')

def get_classes(ontology):
    """
    Return a list of all classes in an ontology and its imported ontologies
    
    :param ontology: The ontology to be used
    :return: A list of classes in the ontology.
    """
    classes = [_class for _class in ontology.classes()]
    if type(ontology) is Ontology:
        classes += [_class for _class in ontology.imported_ontologies]
    return classes

def add_rules(ontology, config):
    """
    It takes a list of rules and adds them to an ontology
    
    :param ontology: the ontology object
    :param config: a dictionary of the form:
        {
            "ontologies": [], # a list of ontology location strings in the forms "file://..." or "http://..."
            "prefixes": {
                "string": "string",   # where the prefix and namespace uri could be for example: "owl": "http://www.w3.org/2002/07/owl#"; these prefixes can be used in the defined rules
            },
            "rules": [  # a list of objects for configuring rules formed as:
                {
                    "ignore": "boolean",
                    "rule": "atom1(?a), atom2(?b) -> atom3(?a, ?b)"     # prefixes declared in the "prefixes" object will be replaced with their namespace uri
                },
            ]
        }
    """
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
    ns = ontology.get_namespace('http://www.w3.org/2000/01/rdf-schema#')
    for rule in rules:
        logging.info(f'loading rule: {rule}')
        implication = Imp(namespace=ns)
        implication.set_as_rule(rule)

def export_graph(world, test, rules, output_format='ttl'):
    """
    Take the world, the test, the rules, and the output format, and exports RDF triples 
    THAT START WITH A PREDEFINED NAMESPACE to a file
    
    :param world: the world object that contains the graph
    :param test: list in the form:
        [       # a list of objects for configuring tests formed as:
            {
                "ignore": "boolean",
                "ontologies": [], # a list of ontology location strings in the forms "file://..." or "http://..."
                "output": {
                    "namespace": "string",          # the namespace uri to be used when exporting the results of inferencing after a test 
                    "filename": "string",           # the name of the output file to be exported to
                    "expected-result": "boolean"    # the expected result of the test, true meaning passed and false meaning failed
                }
            },
        ]
    :param rules: the ruleset to use
    :param output_format: (optional) the format of the output file. Defaults to 'ttl' (Turtle); format must be RDFlib compliant
    """
    graph = world.as_rdflib_graph()
    output = Graph()
    output.bind( '', Namespace(test.get('output').get('namespace')) )
    for prefix, namespace in rules.get('prefixes').items():
        output.bind(prefix, Namespace(namespace), override=True )
    # output only triples that are part of the input dataset namespace
    for triple in graph.query("""
        SELECT DISTINCT ?s ?p ?o
        WHERE {
            ?s ?p ?o .
            FILTER( STRSTARTS(STR(?s), "%s") )
        }""" % test.get('output').get('namespace')):
        output.add(triple)
    output_file = 'output.ttl'
    if test.get('output').get('filename'):
        output_file = test.get('output').get('filename')
    output.serialize(destination=output_file, format=output_format)
    # graph.serialize(destination=output_file, format=output_format)
    logging.info(f'graph exported to {output_file}')



##############################
### Main test suite script ###
##############################


### init logging
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

expected_results = []
test_results = []

### run tests
for test in tests:
    if test.get('ignore'):
        continue

    logging.info(f'=== Running Test {len(test_results)} ===')
    test_results.append(True)
    expected_results.append(test.get('output').get('expected-result'))
    world = World()
    ### load ontologies and rules
    ontology_list = test.get('ontologies') + rules.get('ontologies')
    ontology_network = load_ontologies(ontology_list, world)
    add_rules(ontology_network, rules)

    ### log potentially useful information
    log_classes(world)
    # log_rules(world)
    log_individuals(world)

    ### check inconsistency
    try:
        sync_reasoner_pellet(world, infer_property_values=True, infer_data_property_values=True, debug=2)
    except Exception as e:
        logging.error(e)
        test_results[-1] = False
    logging.warning(f'Inconsistent classes: {list(world.inconsistent_classes())}')
    for _class in get_classes(world):
        if Nothing in _class.equivalent_to:
            logging.warning(f'{_class.iri} is inconsistent')

    # export graph and finish
    logging.info('Exporting Graph...')
    export_graph(world, test, rules)
    # try:
    #     export_graph(world, test, rules)
    # except Exception as e:
    #     logging.error('Unable to export graph:')
    #     logging.error(e)
    print('Done!')

logging.info(f'==== Test Results ====')
print(f'==== Test Results ====')
for i in range(len(test_results)):
    result = bool(test_results[i] == expected_results[i])
    logging.info(f'Test {i} passed: {result}')
    print(f'Test {i} passed: {result}')
    i += 1