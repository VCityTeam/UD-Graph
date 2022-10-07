#!/bin/sh

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2009_split_v3.ttl \
    ./GratteCiel_2009_split_v3.ttl \
    2009-01-01T00:00:00 2009-01-01T00:00:00 \
    -d

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2012_split_v3.ttl \
    ./GratteCiel_2012_split_v3.ttl \
    2012-01-01T00:00:00 2012-01-01T00:00:00 \
    -d

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2015_split_v3.ttl \
    ./GratteCiel_2015_split_v3.ttl \
    2015-01-01T00:00:00 2015-01-01T00:00:00 \
    -d

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2018_split_v3.ttl \
    ./GratteCiel_2018_split_v3.ttl \
    2018-01-01T00:00:00 2018-01-01T00:00:00 \
    -d


python AddTimeStamps.py \
    ../Datasets/GratteCiel_2009_split_v3.ttl \
    ./GratteCiel_2009_split_v3.rdf \
    2009-01-01T00:00:00 2009-01-01T00:00:00 \
    -d \
    --output-format xml

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2012_split_v3.ttl \
    ./GratteCiel_2012_split_v3.rdf \
    2012-01-01T00:00:00 2012-01-01T00:00:00 \
    -d \
    --output-format xml

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2015_split_v3.ttl \
    ./GratteCiel_2015_split_v3.rdf \
    2015-01-01T00:00:00 2015-01-01T00:00:00 \
    -d \
    --output-format xml

python AddTimeStamps.py \
    ../Datasets/GratteCiel_2018_split_v3.ttl \
    ./GratteCiel_2018_split_v3.rdf \
    2018-01-01T00:00:00 2018-01-01T00:00:00 \
    -d \
    --output-format xml
