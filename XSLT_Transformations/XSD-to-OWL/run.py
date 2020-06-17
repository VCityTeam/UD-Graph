import sys

if len(sys.argv) != 2:
   sys.exit('Incorrect number of arguments: {}\nUsage: run.py\n       run.py [xsd to convert]'.format(len(sys.argv)))

paths = ['Schema/','Schema/CityGML/','Schema/GML']

# if [ $# -eq 2 ]; then
#    echo "transforming $1 to Results/$2"
#    java -jar ../saxon9he.jar -s:$1 -xsl:XSD2OWL.xsl > Results/$2
#    python postXSLT.py $1
# elif [ $# -eq 0 ]; then
#    echo "Transforming known schema..."
#    for (( i = 0 ; i < ${#paths[@]} ; i++ ))
#    do
#       echo -ne "[$i/${#paths[@]}] ${paths[$i]}\r"
#       java -jar ../saxon9he.jar -s:${paths[$i]} -xsl:XSD2OWL.xsl > Results/${filenames[$i]}
#       echo -ne "                                                                                \r"
#    done
#    echo "post-transformation cleanup..."
#    for (( i = 0 ; i < ${#paths[@]} ; i++ ))
#    do
#       echo -ne "[$i/${#paths[@]}] cleaning ${filenames[$i]}: \r"
#       python postXSLT.py ${paths[$i]}
#       echo -ne "                                                                                \r"
#    done
# else
#    echo "Incorrect number of arguments: $#"
#    echo "Usage: ./run.sh"
#    echo "       ./run.sh [path to xsl file] [output filename]"
#    exit 0
# fi
# echo "Done!"
# exit 0