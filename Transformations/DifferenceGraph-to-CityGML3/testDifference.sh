#!/bin/sh

python DifferenceGraph2RDF.py \
    --existence_time_stamps \
        2000-01-01T00:00:00 \
        2001-01-01T00:00:00 \
    differences_test.json \
    v1 v2 \
    difference_test.ttl

python DifferenceGraph2RDF.py \
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace \
    --v1-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009_split_v3 \
    --v1-prefix v2009 \
    --v2-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2012_split_v3 \
    --v2-prefix v2012 \
    -d \
    -f ttl \
    --strip-time-stamp \
    --existence_time_stamps \
        2009-01-01T00:00:00 \
        2012-01-01T00:00:00 \
    'DifferencesAsGraph09-12.json' \
    2009 2012 \
    'DifferencesAsGraph2009-2012.ttl'

python DifferenceGraph2RDF.py \
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace \
    --v1-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2012_split_v3 \
    --v1-prefix v2012 \
    --v2-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2015_split_v3 \
    --v2-prefix v2015 \
    -d \
    -f ttl \
    --strip-time-stamp \
    --existence_time_stamps \
        2012-01-01T00:00:00 \
        2015-01-01T00:00:00 \
    'DifferencesAsGraph12-15.json' \
    2012 2015 \
    'DifferencesAsGraph2012-2015.ttl'

python DifferenceGraph2RDF.py \
    --base-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2009-2018_Workspace \
    --v1-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2015_split_v3 \
    --v1-prefix v2015 \
    --v2-uri https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/Datasets/GratteCiel_2018_split_v3 \
    --v2-prefix v2018 \
    -d \
    -f ttl \
    --strip-time-stamp \
    --existence_time_stamps \
        2015-01-01T00:00:00 \
        2018-01-01T00:00:00 \
    'DifferencesAsGraph15-18.json' \
    2015 2018 \
    'DifferencesAsGraph2015-2018.ttl'
