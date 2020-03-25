# Converting XML to RDF

## Potential Problems with conversion
* Application Domain Extensions
  * Can these be incorporated?
  * What happens to converted CityGML files that use ADEs in RDF?
* XLinks (and any other reference to geometry/features)
  * Are links preserved?
  * If so, how are queries made between links?
* AbstractBuilding ↔ BuildingPart
  * Is hierarchy preserved?
  * How are these hierarchies queried?
* Code Lists
  * How are these be incorporated?
  * What happens to converted CityGML files that rely on Code Lists?

## Converters
 * https://www.w3.org/wiki/ConverterToRdf
### XML to RDF
 * ReDeFer's XML2RDF http://rhizomik.net/redefer/#XML2RDF
 * XmlToRdf https://github.com/AcandoNorway/XmlToRdf
### RDF Conversion Frameworks
 * Apache Any23 http://incubator.apache.org/any23/
 * Aperture http://aperture.sourceforge.net/
 * GRDDL http://www.w3.org/TR/grddl/
 * RML http://rml.io/
### Other interesting converters
 * CityGML to CityJSON - https://www.cityjson.org/help/users/conversion/
 * GML to Java - Geotools https://github.com/geotools/geotools
 * UML to RDF - EulerGUI http://eulergui.sourceforge.net/
 * SQL to RDF
   * D2RQ http://d2rq.org/ 
   * dbview.py http://www.w3.org/2000/10/swap/dbork/dbview.py
   * OpenLink Virtuoso https://www.w3.org/wiki/VirtuosoUniversalServer 
   * Triplify http://triplify.org/ 
   * RDBToOnto http://sourceforge.net/projects/rdbtoonto/ 
   * morph and morph https://github.com/jpcik/morph; https://github.com/boricles/morph


