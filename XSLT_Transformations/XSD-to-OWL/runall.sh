#!/bin/bash

paths[0]="./Schema/CityGML/2.0/cityGMLBase.xsd"
paths[1]="./Schema/CityGML/appearance/2.0/appearance.xsd"
paths[2]="./Schema/CityGML/bridge/2.0/bridge.xsd"
paths[3]="./Schema/CityGML/building/2.0/building.xsd"
paths[4]="./Schema/CityGML/cityfurniture/2.0/cityFurniture.xsd"
paths[5]="./Schema/CityGML/cityobjectgroup/2.0/cityObjectGroup.xsd"
paths[6]="./Schema/CityGML/generics/2.0/generics.xsd"
paths[7]="./Schema/CityGML/landuse/2.0/landUse.xsd"
paths[8]="./Schema/CityGML/relief/2.0/relief.xsd"
paths[9]="./Schema/CityGML/transportation/2.0/transportation.xsd"
paths[10]="./Schema/CityGML/tunnel/2.0/tunnel.xsd"
paths[11]="./Schema/CityGML/vegetation/2.0/vegetation.xsd"
paths[12]="./Schema/CityGML/waterbody/2.0/waterBody.xsd"
paths[13]="./Schema/CityGML/texturedsurface/2.0/texturedSurface.xsd"

filenames[0]="cityGMLBase.rdf"
filenames[1]="appearance.rdf"
filenames[2]="bridge.rdf"
filenames[3]="building.rdf"
filenames[4]="cityFurniture.rdf"
filenames[5]="cityObjectGroup.rdf"
filenames[6]="generics.rdf"
filenames[7]="landUse.rdf"
filenames[8]="relief.rdf"
filenames[9]="transportation.rdf"
filenames[10]="tunnel.rdf"
filenames[11]="vegetation.rdf"
filenames[12]="waterBody.rdf"
filenames[13]="texturedSurface.rdf"

# transform all listed schema
for (( i = 0 ; i < ${#paths[@]} ; i++ ))
do
   java -jar ../saxon9he.jar -s:${paths[$i]} -xsl:XSD2OWL.xsl > Results/${filenames[$i]}
   echo "transformed ${paths[$i]} to Results/${filenames[$i]}"
   python qualify-ns.py ${paths[$i]} Results/${filenames[$i]}
done

exit 0
