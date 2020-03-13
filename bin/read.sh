#!/usr/bin/env bash

# read.sh - submit a previously created collection to the Reader

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
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
