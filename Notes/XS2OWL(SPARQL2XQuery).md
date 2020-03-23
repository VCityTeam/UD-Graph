# XS2OWL
This is a review of the XS2OWL conversion tool, which can be found [here](https://github.com/istavrak/XS2OWL). This tool was created under the the SPARQL2XQuery framework project, which can be found [here](http://www.nbikakis.com/SPARQL2XQuery.html)

## Related Articles
* **XS2OWL: A Formal Model and a System for enabling XML Schema Applications to interoperate with OWLDL Domain Knowledge and Semantic Web Tools** - Chrisa Tsinaraki and Stavros Christodoulakis

## Limits and requirements
* Java 8
* [Saxon](http://www.saxonica.com/products/products.xml)
* For converting OWL to XML the [OWL2XMLRules Ontology](http://www.music.tuc.gr/chrisa/material/OWL2XMLRules) is required

## Notes
The XS2OWL converter outputs 2 files, a main.owl file which contains the main structure of the ontology, and a main2xml.owl file which contains a mapping of semantically similar elements that can be used to convert the main ontology back to XML - even after individuals are added - while respecting the original schema. The conversion of CityGML schema appears to be lossless **(!CHECK!)**, however, it does require user input to make sure converted namespaces are accessible when reading from the ontology. The following CityGML module schemas were tested:

| Module | Identifier |
|--------|--------|
| CityGMLBase | http://www.opengis.net/citygml/2.0 |
| Building | http://www.opengis.net/citygml/building/2.0 |

After conversion, the resulting main ontologies were analyzed with [Protégé](https://protege.stanford.edu/). The Building.owl file appeared to import correctly, but upon the initial import of CityGMLBase.owl the following error occurred:
```
INFO  09:47:54  ------------------------------- Loading Ontology -------------------------------
INFO  09:47:54  Loading ontology from file:/home/diego/Documents/Converters/XS2OWL/outputs/cityGMLBase.owl
INFO  09:47:54  Notice: root element does not have an xml:base. Relative IRIs will be resolved against file:/home/diego/Documents/Converters/XS2OWL/outputs/cityGMLBase.owl
ERROR  09:47:54  Entity not properly recognized, missing triples in input? http://org.semanticweb.owlapi/error#Error1 for type Class
WARN  09:47:54  Possible malformed list: rdf:first triple missing
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx2
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx4
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx6
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx8
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx10
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx13
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx15
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx17
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx19
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx21
WARN  09:47:54  Possible malformed list: cannot translate it _:genid-nodeid-node1e39h86gbx23
INFO  09:47:54  Unparsed triple: _:genid-nodeid-node1e39h86gbx111 -> http://www.w3.org/2002/07/owl#onProperty -> urn:oasis:names:tc:ciq:xsdschema:xAL:2.0#AddressDetails
INFO  09:47:54  Finished loading file:/home/diego/Documents/Converters/XS2OWL/outputs/cityGMLBase.owl
```
It appears that the default formation of the xAL addressing schema does not import well into Protégé or was cont converted well from XS2OWL.

