import os
import rdflib
import argparse


def main():

    parser = argparse.ArgumentParser(
        description="""Update an RDF graph using a SPARQL update query.""")
    parser.add_argument('input_file', help='Specify the input RDF file')
    parser.add_argument('output_file', help='Specify the output graph')
    parser.add_argument('query', help='Specify the update query')
    parser.add_argument('-v', '--verbose',
                        action='store_true',
                        help='Toggle verbose printing')

    args = parser.parse_args()

    if args.verbose:
        print('Reading files...')
    # read graphs
    graph = rdflib.Graph()
    path = os.path.normpath(args.input_file)
    graph.parse(path, format='turtle')

    if args.verbose:
        print('Executing query: \n{args.query}')
    graph.update(args.query)

    graph.serialize(destination=args.output_file, format='turtle')
    print('Writing complete!')


if __name__ == "__main__":
    main()
