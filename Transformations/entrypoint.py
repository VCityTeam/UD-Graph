import os
import argparse


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='transformation', help='select transformation pipeline')
    uml2owl_parser = subparsers.add_parser('uml2owl', help='transform a uml model to an owl ontology via shapechange')
    uml2owl_parser.add_argument('--config', required=True, help='required, specify the shapechange configuration file')
    uml2owl_parser.add_argument('--model', help='specify the uml file to transform')
    uml2owl_parser.add_argument('--output', help='specify the output directory')
    xml2rdf_parser = subparsers.add_parser('xml2rdf', help='transform an xml file into a rdf graph')
    xml2rdf_parser.add_argument('--input', required=True, help='specify the input file to transform')
    xml2rdf_parser.add_argument('--model', required=True, help='specify the ontology to base the transformation on')
    xml2rdf_parser.add_argument('--output', default='./xml2rdf_output', help='specify the output directory')
    xsd2owl_parser = subparsers.add_parser('xsd2owl', help='transform an xsd file into an owl ontology')
    xsd2owl_parser.add_argument('--input', required=True, help='specify the input xsd file to transform')
    xsd2owl_parser.add_argument('--output', default='./xsd2owl_output', help='specify the output directory')
    args = parser.parse_args()

    command = ''
    if args.transformation == 'uml2owl':
        command = f"java -jar lib/ShapeChange-2.9.1.jar -Dfile.encoding=UTF-8 -c {args.input} -x '$input$' '{args.model}' -x '$output$' '{args.output}'"
    elif args.transformation == 'xml2rdf':
        command = f'python XML-to-RDF/OWL-based-transformations/CityGML2RDF.py {args.input} {args.model} {args.output}'
    elif args.transformation == 'xsd2owl':
        command = f'python XSD-to-OWL/run.py {args.input} {args.output}'

    print(command)
    os.system(command)


if __name__ == "__main__":
    main()
