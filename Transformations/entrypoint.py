import os, argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('COMMAND', choices=['uml2owl', 'xml2rdf', 'xsd2owl'])
    parser.add_argument('--input', help='specify the input file')
    parser.add_argument('--model', help='specify the input model, input model path, or url. Can be a comma separated list.')
    parser.add_argument('--output', help='specify output directory')
    args = parser.parse_args()

    command = ''
    if args.COMMAND == 'uml2owl':
        command = f"java -jar lib/ShapeChange-2.9.1.jar -Dfile.encoding=UTF-8 -c {args.input} -x '$input$' '{args.model}' -x '$output$' '{args.output}'"
    elif args.COMMAND == 'xml2rdf':
        command = f'python XML-to-RDF/OWL-based-transformations/CityGML2RDF.py {args.input} {args.model} {args.output}'
    elif args.COMMAND == 'xsd2owl':
        command = f'python XSD-to-OWL/run.py {args.input}'


    print(command)
    os.system(command)


if __name__ == "__main__":
    main()