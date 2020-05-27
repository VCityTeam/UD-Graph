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
   [15]="./Schema/CityGML/xAL.xsd"
   [16]="./Schema/GML/basicTypes.xsd"
   [17]="./Schema/GML/dataQuality.xsd"
   [18]="./Schema/GML/dynamicFeature.xsd"
   [19]="./Schema/GML/geometryComplexes.xsd"
   [20]="./Schema/GML/measures.xsd"
   [21]="./Schema/GML/temporal.xsd"
   [22]="./Schema/GML/coordinateOperations.xsd"
   [23]="./Schema/GML/datums.xsd"
   [24]="./Schema/GML/feature.xsd"
   [25]="./Schema/GML/geometryPrimitives.xsd"
   [26]="./Schema/GML/observation.xsd"
   [27]="./Schema/GML/topology.xsd"
   [28]="./Schema/GML/coordinateReferenceSystems.xsd"
   [29]="./Schema/GML/defaultStyle.xsd"
   [30]="./Schema/GML/geometryAggregates.xsd"
   [31]="./Schema/GML/gmlBase.xsd"
   [32]="./Schema/GML/referenceSystems.xsd"
   [33]="./Schema/GML/units.xsd"
   [34]="./Schema/GML/coordinateSystems.xsd"
   [35]="./Schema/GML/dictionary.xsd"
   [36]="./Schema/GML/geometryBasic0d1d.xsd"
   [37]="./Schema/GML/gml.xsd"
   [38]="./Schema/GML/temporalReferenceSystems.xsd"
   [39]="./Schema/GML/valueObjects.xsd"
   [40]="./Schema/GML/coverage.xsd"
   [41]="./Schema/GML/direction.xsd"
   [42]="./Schema/GML/geometryBasic2d.xsd"
   [43]="./Schema/GML/grids.xsd"
   [44]="./Schema/GML/temporalTopology.xsd"
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
   [15]="xAL.rdf"
   [16]="basicTypes.rdf"
   [17]="dataQuality.rdf"
   [18]="dynamicFeature.rdf"
   [19]="geometryComplexes.rdf"
   [20]="measures.rdf"
   [21]="temporal.rdf"
   [22]="coordinateOperations.rdf"
   [23]="datums.rdf"
   [24]="feature.rdf"
   [25]="geometryPrimitives.rdf"
   [26]="observation.rdf"
   [27]="topology.rdf"
   [28]="coordinateReferenceSystems.rdf"
   [29]="defaultStyle.rdf"
   [30]="geometryAggregates.rdf"
   [31]="gmlBase.rdf"
   [32]="referenceSystems.rdf"
   [33]="units.rdf"
   [34]="coordinateSystems.rdf"
   [35]="dictionary.rdf"
   [36]="geometryBasic0d1d.rdf"
   [37]="gml.rdf"
   [38]="temporalReferenceSystems.rdf"
   [39]="valueObjects.rdf"
   [40]="coverage.rdf"
   [41]="direction.rdf"
   [42]="geometryBasic2d.rdf"
   [43]="grids.rdf"
   [44]="temporalTopology.rdf"
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
      python postXSLT.py ${paths[$i]}
      echo -ne "                                                                                \r"
   done
else
   echo "Incorrect number of arguments: $#"
   echo "Usage: ./run.sh"
   echo "       ./run.sh [path to xsl file] [output filename]"
   exit 0
fi

exit 0
