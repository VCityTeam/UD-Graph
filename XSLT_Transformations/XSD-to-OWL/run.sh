#!/bin/sh

if [ $# -lt 2 ]
   then echo "Incorrect number of arguments: $#"
        echo "Usage: ./run.sh [path to xsl file] [output filename]"
   exit 0
fi

java -jar ../saxon9he.jar -s:$1 -xsl:XSD2OWL.xsl > Results/$2
echo "transformed $1 to Results/$2"
python qualify-ns.py $1 Results/$2

exit 0
