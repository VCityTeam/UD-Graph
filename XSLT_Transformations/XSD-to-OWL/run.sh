#!/bin/bash

paths=(
   [0]="./Schema/CityGML/2.0/cityGMLBase.xsd"
   [1]="./Schema/CityGML/appearance/2.0/appearance.xsd"
   [2]="./Schema/CityGML/bridge/2.0/bridge.xsd"
   [3]="./Schema/CityGML/building/2.0/building.xsd"
   [4]="./Schema/CityGML/cityfurniture/2.0/cityFurniture.xsd"
   [5]="./Schema/CityGML/cityobjectgroup/2.0/cityObjectGroup.xsd"
   [6]="./Schema/CityGML/generics/2.0/generics.xsd"
   [7]="./Schema/CityGML/landuse/2.0/landUse.xsd"
   [8]="./Schema/CityGML/relief/2.0/relief.xsd"
   [9]="./Schema/CityGML/transportation/2.0/transportation.xsd"
   [10]="./Schema/CityGML/tunnel/2.0/tunnel.xsd"
   [11]="./Schema/CityGML/vegetation/2.0/vegetation.xsd"
   [12]="./Schema/CityGML/waterbody/2.0/waterBody.xsd"
   [13]="./Schema/CityGML/texturedsurface/2.0/texturedSurface.xsd"
)

filenames=(
   [0]="cityGMLBase.rdf"
   [1]="appearance.rdf"
   [2]="bridge.rdf"
   [3]="building.rdf"
   [4]="cityFurniture.rdf"
   [5]="cityObjectGroup.rdf"
   [6]="generics.rdf"
   [7]="landUse.rdf"
   [8]="relief.rdf"
   [9]="transportation.rdf"
   [10]="tunnel.rdf"
   [11]="vegetation.rdf"
   [12]="waterBody.rdf"
   [13]="texturedSurface.rdf"
)

if [ "$1" = "-a" ]; then
   echo "Transforming all known schema..."
   for (( i = 0 ; i < ${#paths[@]} ; i++ ))
   do
      echo "transforming ${paths[$i]} to Results/${filenames[$i]}"
      java -jar ../saxon9he.jar -s:${paths[$i]} -xsl:XSD2OWL.xsl > Results/${filenames[$i]}
      python qualify-ns.py ${paths[$i]} Results/${filenames[$i]}
   done
elif [ $# -lt 2 ]; then
   echo "Incorrect number of arguments: $#"
   echo "Usage: ./run.sh [-a] [path to xsl file] [output filename]"
   echo "                -a : transform known schema automatically"
   exit 0
else
   echo "transforming $1 to Results/$2"
   java -jar ../saxon9he.jar -s:$1 -xsl:XSD2OWL.xsl > Results/$2
   python qualify-ns.py $1 Results/$2
fi

exit 0