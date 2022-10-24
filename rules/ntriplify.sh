#!/bin/sh

python ../Transformations/utilities/reformat_graph.py test_time_0.ttl ttl test_time_0.nt nt
python ../Transformations/utilities/reformat_graph.py test_time_1.ttl ttl test_time_1.nt nt
python ../Transformations/utilities/reformat_graph.py test_wksp_0.ttl ttl test_wksp_0.nt nt
python ../Transformations/utilities/reformat_graph.py test_wksp_1.ttl ttl test_wksp_1.nt nt