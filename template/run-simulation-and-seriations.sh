#!/bin/sh

#echo "Creating network model......"
#sh bin/build-networkmodel.sh

echo "Creating simulation scripts....."
sh bin/build-simulations.sh

echo "Running simulations in parallel...."
for d in `ls jobs/*.sh`; do ( sh $d ); done 

echo "Simulations complete...."

echo "Export and post-process simulation results..."
sh bin/simulation-postprocess.sh


echo "Performing seriations -- THIS COULD TAKE AWHILE..."

sh bin/run-seriations.sh

echo "Annotating seriation output..."
sh bin/annotate-seriation-output.sh

echo "Experiment COMPLETE"


