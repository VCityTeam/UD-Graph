from owlready2 import *


def load_ontology():
    onto = get_ontology("file://../Ontologies/Workspace/3.0/workspace.owl").load()
    return (onto)

def get_classes(onto):
    for i in onto.classes():
        print(i.iri)

def add_rules(onto):
    ns = onto.get_namespace("https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Ontologies/Workspace/3.0/workspace")
    rule = Imp(namespace=ns)
    rule.set_as_rule("""ConcensusSpace(?c), Space.scenarioMember(?c, ?s) -> Scenario(?s)""")
    print(str(rule))


onto = load_ontology()
get_classes(onto)
add_rules(onto)
