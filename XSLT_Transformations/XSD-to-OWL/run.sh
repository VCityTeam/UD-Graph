#!/bin/bash

paths=(
   [0]="./Schema/cityGMLBase.xsd"
   [1]="./Schema/appearance.xsd"
   [2]="./Schema/bridge.xsd"
   [3]="./Schema/building.xsd"
   [4]="./Schema/cityFurniture.xsd"
   [5]="./Schema/cityObjectGroup.xsd"
   [6]="./Schema/generics.xsd"
   [7]="./Schema/landUse.xsd"
   [8]="./Schema/relief.xsd"
   [9]="./Schema/transportation.xsd"
   [10]="./Schema/tunnel.xsd"
   [11]="./Schema/vegetation.xsd"
   [12]="./Schema/waterBody.xsd"
   [13]="./Schema/texturedSurface.xsd"
   [14]="./Schema/CityGML.xsd"
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
   [14]="CityGML.rdf"
)

if [ $# -eq 2 ]; then
   echo "transforming $1 to Results/$2"
   java -jar ../saxon9he.jar -s:$1 -xsl:XSD2OWL.xsl > Results/$2
   echo "post-transformation cleanup..."
   python postXSLT.py $1 Results/$2
elif [ $# -eq 0 ]; then
   echo "Transforming known schema..."
   for (( i = 0 ; i < ${#paths[@]} ; i++ ))
   do
      echo "${paths[$i]} to Results/${filenames[$i]}"
      java -jar ../saxon9he.jar -s:${paths[$i]} -xsl:XSD2OWL.xsl > Results/${filenames[$i]}
   done
   echo "post-transformation cleanup..."
   for (( i = 0 ; i < ${#paths[@]} ; i++ ))
   do
      echo "cleaning ${filenames[$i]}"
      python postXSLT.py ${paths[$i]} Results/${filenames[$i]}
   done
else
   echo "Incorrect number of arguments: $#"
   echo "Usage: ./run.sh"
   echo "       ./run.sh [path to xsl file] [output filename]"
   exit 0
fi

exit 0
