#!/bin/sh

### CityGML 2.0
mkdir ./2.0
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/core/core.ttl ./2.0/core.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/appearance/appearance.ttl ./2.0/appearance.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/bridge/bridge.ttl ./2.0/bridge.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/building/building.ttl ./2.0/building.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/cityfurniture/cityfurniture.ttl ./2.0/cityfurniture.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/cityobjectgroup/cityobjectgroup.ttl ./2.0/cityobjectgroup.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/core/core.ttl ./2.0/core.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/generics/generics.ttl ./2.0/generics.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/landuse/landuse.ttl ./2.0/landuse.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/relief/relief.ttl ./2.0/relief.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/transportation/transportation.ttl ./2.0/transportation.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/tunnel/tunnel.ttl ./2.0/tunnel.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/vegetation/vegetation.ttl ./2.0/vegetation.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_2.0_Conceptual_Model/FLATTENER1/waterbody/waterbody.ttl ./2.0/waterbody.ttl
python ontologyPatcher.py ../test-data/OWL/Workspace/2.0/document/document.ttl ./2.0/document.ttl
python ontologyPatcher.py ../test-data/OWL/Workspace/2.0/version/version.ttl ./2.0/version.ttl
python ontologyPatcher.py ../test-data/OWL/Workspace/2.0/workspace/workspace.ttl ./2.0/workspace.ttl

### CityGML 3.0
mkdir ./3.0
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/appearance/appearance.ttl ./3.0/appearance.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/bridge/bridge.ttl ./3.0/bridge.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/building/building.ttl ./3.0/building.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/cityfurniture/cityfurniture.ttl ./3.0/cityfurniture.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/cityobjectgroup/cityobjectgroup.ttl ./3.0/cityobjectgroup.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/construction/construction.ttl ./3.0/construction.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/core/core.ttl ./3.0/core.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/dynamizer/dynamizer.ttl ./3.0/dynamizer.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/generics/generics.ttl ./3.0/generics.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/landuse/landuse.ttl ./3.0/landuse.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/pointcloud/pointcloud.ttl ./3.0/pointcloud.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/relief/relief.ttl ./3.0/relief.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/transportation/transportation.ttl ./3.0/transportation.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/tunnel/tunnel.ttl ./3.0/tunnel.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/vegetation/vegetation.ttl ./3.0/vegetation.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/versioning/versioning.ttl ./3.0/versioning.ttl
python ontologyPatcher.py ../test-data/OWL/CityGML_3.0_Conceptual_Model/FLATTENER1/waterbody/waterbody.ttl ./3.0/waterbody.ttl
python ontologyPatcher.py ../test-data/OWL/Workspace/3.0/document/document.ttl ./3.0/document.ttl
python ontologyPatcher.py ../test-data/OWL/Workspace/3.0/workspace/workspace.ttl ./3.0/workspace.ttl