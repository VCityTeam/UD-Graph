import os
import json
import logging
import argparse
import json
from copy import deepcopy
from rdflib import Graph, URIRef
from rdflib.namespace import RDF, OWL, XSD, NamespaceManager, Namespace

def main():
    # initialize command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('input_file', help='specify the input CityGML datafile')
    parser.add_argument('--output_dir', default='.', help='specify the output directory')
    parser.add_argument('-u', '--uri', default='https://github.com/VCityTeam/UD-Graph/data#', help='specify the URI prefix for output individuals')
    parser.add_argument('-f', '--format', default='ttl', choices=['ttl', 'xml'], help='specify the output RDF format [xml, ttl]')
    parser.add_argument('-l', '--log', default='output.log', help='specify the logging file')
    parser.add_argument('-d', '--debug', action='store_true', help='enable debug level logging')
    args = parser.parse_args()

    # initialize logging
    if args.debug:
        logging.basicConfig(filename=args.log, level=logging.DEBUG)
    else:
        logging.basicConfig(filename=args.log, level=logging.WARNING)

    # read input file
    logging.info(f'loading input file: {args.input_file}...')
    with open(args.input_file, "r") as file:
        print("Starting to convert json decoding")
        input_graph = json.load(file)

    output_graph = Graph()
    isConnected = lambda edge : edge.get('source') == node.get('id')
    for node in input_graph.get('nodes'):
        subject = URIRef(f'{args.uri}{node.get("globalid")}')
        for edge in filter(isConnected, input_graph.get('edges')):
            target_node = input_graph.get('nodes')[edge.get('target')]
            # if for whatever reason the target node is not at the same index as
            # its id search to see if it exists at all for it
            if target_node.id != edge.get('target'):
                for n in input_graph.get('nodes'):
                    if n.id == edge.get('target'):
                        target_node == n
                    else:
                        logging.ERROR(f'target node {edge.get("target")} not found!')
            # create the triple and add it to the output graph
            predicate = URIRef(f'{args.uri}{edge.get("type")}.{edge.get("tags")}')
            object = URIRef(f'{args.uri}{target_node.globalid}')
            output_graph.add(subject, predicate, object)

    logging.info(f'conversion complete, writing output to {args.output_dir}')
    output_file_base = f'{args.output_dir}/{os.path.basename(args.input_file).split(".")[:-1]}'
    if args.format == 'xml':
        output_file = f'{output_file_base}.rdf'
        logging.DEBUG(f'output file: {output_file}')
        with open(output_file, 'wb') as file:
            file.write(output_graph.serialize(format='xml'))
    else:
        output_file = f'{output_file_base}.ttl'
        logging.DEBUG(f'output file: {output_file}')
        with open(output_file, 'wb') as file:
            file.write(output_graph.serialize(format='turtle'))
    logging.info('Done!')

if __name__ == "__main__":
    main()
