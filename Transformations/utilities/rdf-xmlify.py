import os
import argparse

def main():
    parser = argparse.ArgumentParser(description='A simple script for converting Turtle RDF files to the XML/RDF format')
    parser.add_argument('files', nargs='*', help='A space separated list of files, directories, or URLs to convert. Files'
            ' found in specified directories will be converted, however subdirectories will be ignored.')
    args = parser.parse_args()

    path_to_reformat_graph = './reformat_graph.py'

    for path in args.files:
            if path.startswith('http://') or path.startswith('https://'):
                os.system(f'python {path_to_reformat_graph} {path} ttl {path.replace(".ttl", ".rdf")} xml')
                continue
            for root, dirs, files in os.walk(path):
                for file in files:
                    if file.endswith('.ttl'):
                        os.system(f'python {path_to_reformat_graph} {os.path.join(root, file)} ttl {file.replace(".ttl", ".rdf")} xml')

if __name__ == "__main__":
    main()