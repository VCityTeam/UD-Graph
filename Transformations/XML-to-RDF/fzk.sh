#!/bin/sh

python ./XML2RDF.py \
    -v \
    --log test_FZK.log \
    --format ttl \
    --no-geometry \
    ../test-data/GML/FZK-Haus-LoD4-KIT-IAI-KHH-B36-V1.gml \
    ./citygml_2_mappings.json \
    ../../Ontologies/CityGML/2.0/core.ttl \
    ../../Ontologies/CityGML/2.0/appearance.ttl \
    ../../Ontologies/CityGML/2.0/building.ttl \
    ../../Ontologies/CityGML/2.0/generics.ttl \
    https://www.w3.org/2009/08/skos-reference/skos.rdf \
    http://www.opengis.net/ont/geosparql# \
    http://www.opengis.net/ont/gml# \
    ../../Ontologies/Alignments/CityGML2-ISO19136.ttl \
    ../../Ontologies/Alignments/CityGML2-GeoSPARQL.ttl \
    https://def.isotc211.org/iso19136/2007/Feature.rdf \
    https://def.isotc211.org/iso19107/2003/CoordinateGeometry.rdf 
