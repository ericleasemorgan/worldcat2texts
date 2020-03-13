#!/usr/bin/env bash

# configure scripts
LIBRARY='./library'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# make sane, submit, and done
cd $LIBRARY/$COLLECTION
sbatch $COLLECTION.slurm
exit
