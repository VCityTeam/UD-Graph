#!/bin/sh

python DifferenceGraph2RDF.py \
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace \
    --v1-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009_split_v3 \
    --v1-prefix 2009 \
    --v2-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2012_split_v3 \
    --v2-prefix 2012 \
    -f ttl \
    --strip-time-stamp \
    '../../../Data/DifferencesAsGraph_2009-2012.json' \
    2009 2012 \
    'DifferencesAsGraph_2009-2012.ttl'

python DifferenceGraph2RDF.py \
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace \
    --v1-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2012_split_v3 \
    --v1-prefix 2012 \
    --v2-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2015_split_v3 \
    --v2-prefix 2015 \
    -f ttl \
    --strip-time-stamp \
    '../../../Data/DifferencesAsGraph_2012-2015.json' \
    2012 2015 \
    'DifferencesAsGraph_2012-2015.ttl'

python DifferenceGraph2RDF.py \
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace \
    --v1-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2015_split_v3 \
    --v1-prefix 2015 \
    --v2-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2018_split_v3 \
    --v2-prefix 2018 \
    -f ttl \
    --strip-time-stamp \
    '../../../Data/DifferencesAsGraph_2015-2018.json' \
    2015 2018 \
    'DifferencesAsGraph_2015-2018.ttl'
