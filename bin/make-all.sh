#!/usr/bin/env bash

# make-all.sh - one script to rule them all

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# do each process; assume (incorrectly) the query term is the same as the collection name
./bin/build.sh $COLLECTION
./bin/search.sh $COLLECTION $COLLECTION
./bin/make-metadata.sh $COLLECTION
./bin/make-cache.sh $COLLECTION
./bin/make-ready.sh $COLLECTION
./bin/clean.sh $COLLECTION
./bin/read.sh $COLLECTION

# done
exit
