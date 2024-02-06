import os
import rdflib
import argparse


def main():

    parser = argparse.ArgumentParser(
        description="""Read a primary and secondary RDF graph in turtle syntax.
        Add triples from secondary graph to primary graph and output the new
        primary graph""")
    parser.add_argument('primary_graph', help='Specify the primary RDF graph')
    parser.add_argument('secondary_graph', help="""Specify the secondary RDF
                        graph""")
    parser.add_argument('output_file', help='Specify the output graph')
    parser.add_argument('-v', '--verbose',
                        action='store_true',
                        help='Toggle verbose printing')

    args = parser.parse_args()

    if args.verbose:
        print('Reading files...')
    # read graphs
    primary_graph, secondary_graph = rdflib.Graph(), rdflib.Graph()
    path = os.path.normpath(args.primary_graph)
    primary_graph.parse(path, format='turtle')
    path = os.path.normpath(args.secondary_graph)
    secondary_graph.parse(path, format='turtle')

    if args.verbose:
        print('Binding namespaces...')
    for binding in secondary_graph.namespace_manager.namespaces():
        primary_graph.bind(binding[0], binding[1])

    if args.verbose:
        print('Merging triples...')
    for triple in secondary_graph:
        primary_graph.add(triple)

    primary_graph.serialize(destination=args.output_file, format='turtle')
    if args.verbose:
        print('Writing complete!')


if __name__ == "__main__":
    main()
