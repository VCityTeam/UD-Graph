#!/bin/bash

paths=(
   [0]="./Schema/CityGML/cityGMLBase.xsd"
   [1]="./Schema/CityGML/appearance.xsd"
   [2]="./Schema/CityGML/relief.xsd"
   [3]="./Schema/CityGML/building.xsd"
   [4]="./Schema/CityGML/cityFurniture.xsd"
   [5]="./Schema/CityGML/cityObjectGroup.xsd"
   [6]="./Schema/CityGML/generics.xsd"
   [7]="./Schema/CityGML/landUse.xsd"
   [8]="./Schema/CityGML/relief.xsd"
   [9]="./Schema/CityGML/transportation.xsd"
   [10]="./Schema/CityGML/tunnel.xsd"
   [11]="./Schema/CityGML/vegetation.xsd"
   [12]="./Schema/CityGML/waterBody.xsd"
   [13]="./Schema/CityGML/texturedSurface.xsd"
   [14]="./Schema/CityGML/CityGML.xsd"
)

filenames=(
   [0]="cityGMLBase.rdf"
   [1]="appearance.rdf"
   [2]="relief.rdf"
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
   python postXSLT.py $1 Results/$2
elif [ $# -eq 0 ]; then
   echo "Transforming known schema..."
   for (( i = 0 ; i < ${#paths[@]} ; i++ ))
   do
      echo -ne "[$i/${#paths[@]}] ${paths[$i]}\r"
      java -jar ../saxon9he.jar -s:${paths[$i]} -xsl:XSD2OWL.xsl > Results/${filenames[$i]}
      echo -ne "                                                                                \r"
   done
   echo "post-transformation cleanup..."
   for (( i = 0 ; i < ${#paths[@]} ; i++ ))
   do
      echo -ne "[$i/${#paths[@]}] cleaning ${filenames[$i]}: \r"
      python postXSLT.py ${paths[$i]} Results/${filenames[$i]}
      echo -ne "                                                                                \r"
   done
else
   echo "Incorrect number of arguments: $#"
   echo "Usage: ./run.sh"
   echo "       ./run.sh [path to xsl file] [output filename]"
   exit 0
fi

exit 0
