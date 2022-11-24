import os
import argparse

def main():
    parser = argparse.ArgumentParser(description='A simple script for converting all Turtle RDF files in the current directory to the N-triples RDF format')
    parser.add_argument('--list', '-l', nargs='*', help='specify files to convert')
    args = parser.parse_args()

    path_to_reformat_graph = '../Transformations/utilities/reformat_graph.py'

    if args.list is not None:
        for file in args.list:
            os.system(f'python {path_to_reformat_graph} {file} ttl {file.replace(".ttl", ".nt")} nt')
    else:
        for file in [file for file in os.listdir(os.getcwd()) if file.endswith('.ttl')]:
            os.system(f'python {path_to_reformat_graph} {file} ttl {file.replace(".ttl", ".nt")} nt')

if __name__ == "__main__":
    main()