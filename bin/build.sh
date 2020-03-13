#!/usr/bin/env bash

# build.sh - given a name, initialize the file system for a collection; think "database"

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
LIBRARY='./library'
BATCHES='batches'
JSON='json'
TEXTS='texts'
TMP='tmp'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# build file system
mkdir -p $LIBRARY
mkdir -p $LIBRARY/$COLLECTION
mkdir -p $LIBRARY/$COLLECTION/$BATCHES
mkdir -p $LIBRARY/$COLLECTION/$JSON
mkdir -p $LIBRARY/$COLLECTION/$TEXTS
mkdir -p $LIBRARY/$COLLECTION/$TMP

# done
exit

