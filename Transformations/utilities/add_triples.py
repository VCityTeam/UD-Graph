import os
import sys
import rdflib


def main():

    if len(sys.argv) != 3:
        sys.exit(f'''Incorrect number of arguments: {len(sys.argv)}
        Usage: python add_triples.py [primary graph] [secondary graph]
        Add triples from secondary graph to primary graph''')

    print('Reading files...')
    # read graphs
    primary_graph, secondary_graph = rdflib.Graph(), rdflib.Graph()
    primary_graph.parse(os.path.normpath(sys.argv[1]), format='turtle')
    secondary_graph.parse(os.path.normpath(sys.argv[2]), format='turtle')

    print('Merging triples...')
    for triple in secondary_graph:
        primary_graph.add(triple)

    with open(sys.argv[1], 'wb') as file:
        file.write(primary_graph.serialize(format='turtle'))
    print('Writing complete!')

if __name__ == "__main__":
    main()
