#!/bin/sh

mkdir -p $1
cp -rp ../template/bin $1
cp ../template/run-simulation-and-seriations.sh $1/
cp ../template/seriationct-priors.json $1/
cp ../template/README.md $1/
cd $1/bin
perl -pi.bak -e "s/REPLACEME/$1/g" *.sh
rm *.bak
cd ..
perl -pi.bak -e "s/REPLACEME/$1/g" README.md
rm *.bak


mkdir exported-data
mkdir jobs
mkdir networks
mkdir rawnetworkmodels
mkdir random-sampled-data
mkdir random-sampled-seriation-results
mkdir temporal-strat-sampled-data
mkdir temporal-strat-seriation-results
mkdir spatial-sampled-data
mkdir spatial-strat-seriation-results
mkdir spatiotemporal-sampled-data
mkdir spatiotemporal-strat-seriation-results
mkdir sampled-traits
mkdir temporal
mkdir xyfiles

# touch a file in each, so that the empty directories persist in Git 
# prior to having content.  this makes it easier to synchronize an experiment
# through Github to multiple machines
touch exported-data/README
touch jobs/README
touch temporal/README
touch xyfiles/README
touch random-sampled-data/README
touch random-sampled-seriation-results/README
touch temporal-strat-sampled-data/README
touch temporal-strat-seriation-results/README
touch spatial-sampled-data/README
touch spatial-strat-seriation-results/README
touch spatiotemporal-sampled-data/README
touch spatiotemporal-strat-seriation-results/README


cd ..

echo "Experiment $1 directory structure complete"
echo "To configure your experiment, edit the files under the bin/ subdirectory "
echo "to specify a network model, seriation parameters, and simulation runbuilder "
echo "parameters.  To specify the simulation parameters themselves, edit the JSON "
echo "file in the main directory."
echo " "
echo "To run the experiment, in the main experiment directory ($1): "
echo "  sh run-experiment-steps.sh "



