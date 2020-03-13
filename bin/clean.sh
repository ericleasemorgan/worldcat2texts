#!/usr/bin/env bash

# clean.sh - given a collection, undo initialization

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
LIBRARY='./library'
TSV='metadata.tsv'
CSV='metadata.csv'
OCLC='oclc-numbers.txt'

if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# do the work
rm -rf $LIBRARY/$COLLECTION/batches
rm -rf $LIBRARY/$COLLECTION/json
rm -rf $LIBRARY/$COLLECTION/texts
rm -rf $LIBRARY/$COLLECTION/tmp
rm -rf $LIBRARY/$COLLECTION/$TSV
rm -rf $LIBRARY/$COLLECTION/$CSV
rm -rf $LIBRARY/$COLLECTION/$OCLC

# done
exit

