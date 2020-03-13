#!/usr/bin/env bash

# clean.sh - given a collection, undo initialization

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
LIBRARY='./library'

if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# do the work and done
rm -rf $LIBRARY/$COLLECTION/batches/*
rm -rf $LIBRARY/$COLLECTION/json/*
rm -rf $LIBRARY/$COLLECTION/texts/*
rm -rf $LIBRARY/$COLLECTION/tmp/*
exit

