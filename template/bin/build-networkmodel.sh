#!/bin/sh

mkdir -p rawnetworkmodels/REPLACEME-networkmodel

seriationct-build-clustered-network.py --experiment REPLACEME --outputdirectory rawnetworkmodels/REPLACEME-networkmodel --numclusters 3 --slices 5 --nodespercluster 10 --interconnectfraction 0.2 --centroidmin 100 --centroidmax 1000 --clusterspread 10 --intercluster_edgeweight 1 --intracluster_edgeweight 100 --debug 1

cp bin/build-networkmodel.sh rawnetworkmodels/REPLACEME-networkmodel
cd rawnetworkmodels
zip -r REPLACEME-network-gml.zip REPLACEME-networkmodel/*.gml
zip -r REPLACEME-full-network.zip REPLACEME-networkmodel
cp REPLACEME-networkmodel/REPLACEMEXY.txt ../xyfiles
mv REPLACEME-network-gml.zip ../networks

