import rdflib
import argparse


def main():
    RDFLIB_SUPPORTED_FORMATS = ['turtle','ttl','turtle2','xml','pretty-xml','json-ld','ntriples','nt','nt11','n3','trig','trix']
    parser = argparse.ArgumentParser(description='Convert RDF graph formats')
    parser.add_argument('input_file', help='Specify the input datafile, folder, or URL')
    parser.add_argument('input_format', choices=RDFLIB_SUPPORTED_FORMATS, help='Specify the input data format (only RDFLib supported formats)')
    parser.add_argument('output_file', default='', help='Specify the output datafile')
    parser.add_argument('output_format', choices=RDFLIB_SUPPORTED_FORMATS, help='Specify the output data format (only RDFLib supported formats)')
    args = parser.parse_args()

    print(f'converting input file: {args.input_file}')
    converter = RdfConverter()
    converter.convert(args.input_file, args.input_format, args.output_file, args.output_format)
    print('done')


class RdfConverter():
    def __init__(self):
        self.graph = rdflib.Graph()

    def convert(self, input_file, input_format, output_file, output_format):
        self.graph.parse(input_file, format=input_format)
        self.graph.serialize(destination=output_file, format=output_format)


if __name__ == "__main__":
    main()
