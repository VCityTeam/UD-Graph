#!/bin/sh

python DifferenceGraph2RDF.py /
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace /
    --output_dir ./2009-2012 /
    -f xml \
    '..\..\..\..\..\Desktop\CityGML datasets\GratteCiel_2009-2018v2\4-diff\2009-2012\DifferencesAsGraph.json' 2009 2012
python DifferenceGraph2RDF.py /
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace /
    --output_dir ./2009-2012 /
    -f ttl \
    '..\..\..\..\..\Desktop\CityGML datasets\GratteCiel_2009-2018v2\4-diff\2009-2012\DifferencesAsGraph.json' 2009 2012
python DifferenceGraph2RDF.py /
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace /
    --output_dir ./2012-2015 /
    -f xml \
    '..\..\..\..\..\Desktop\CityGML datasets\GratteCiel_2009-2018v2\4-diff\2012-2015\DifferencesAsGraph.json' 2012 2015
python DifferenceGraph2RDF.py /
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace /
    --output_dir ./2012-2015 /
    -f ttl \
    '..\..\..\..\..\Desktop\CityGML datasets\GratteCiel_2009-2018v2\4-diff\2012-2015\DifferencesAsGraph.json' 2012 2015
python DifferenceGraph2RDF.py /
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace /
    --output_dir ./2015-2018 /
    -f xml \
    '..\..\..\..\..\Desktop\CityGML datasets\GratteCiel_2009-2018v2\4-diff\2015-2018\DifferencesAsGraph.json' 2015 2018
python DifferenceGraph2RDF.py /
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace /
    --output_dir ./2015-2018 /
    -f ttl \
    '..\..\..\..\..\Desktop\CityGML datasets\GratteCiel_2009-2018v2\4-diff\2015-2018\DifferencesAsGraph.json' 2015 2018