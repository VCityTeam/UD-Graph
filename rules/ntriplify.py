### A simple script for converting all Turtle RDF files in the current directory to the N-triples RDF format

import os

def main():
    path_to_reformat_graph = '../Transformations/utilities/reformat_graph.py'
    for file in [file for file in os.listdir(os.getcwd()) if file.endswith('.ttl')]:
        os.system(f'python {path_to_reformat_graph} {file} ttl {file.replace(".ttl", ".nt")} nt')

if __name__ == "__main__":
    main()