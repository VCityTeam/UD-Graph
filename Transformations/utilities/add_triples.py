import os
import sys
import rdflib
import argparse


def main():

    parser = argparse.ArgumentParser(description='Read a primary and secondary RDF graph in turtle syntax. Add triples from secondary graph to primary graph and output the new primary graph')
    parser.add_argument('primary_graph',
                         help='Specify the primary RDF graph')
    parser.add_argument('secondary_graph',
                         help='Specify the secondary RDF graph')
    parser.add_argument('output_file',
                         help='Specify the output graph')

    args = parser.parse_args()

    print('Reading files...')
    # read graphs
    primary_graph, secondary_graph = rdflib.Graph(), rdflib.Graph()
    primary_graph.parse(os.path.normpath(args.primary_graph), format='turtle')
    secondary_graph.parse(os.path.normpath(args.secondary_graph), format='turtle')

    print('Merging triples...')
    for triple in secondary_graph:
        primary_graph.add(triple)

    primary_graph.serialize(destination=args.output_file, format='turtle')
    print('Writing complete!')

if __name__ == "__main__":
    main()
