#!/usr/bin/env bash

# tsv2csv.sh - convert the original metadata (TSV) file to a CSV file, because the Reader wants CSV

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
LIBRARY='./library'
TSV='metadata.tsv'
CSV='metadata.csv'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# initialize
HEADER=$( printf "title\tdate\thtid\tfile" )
METADATA=$( cat "$LIBRARY/$COLLECTION/$TSV" )

# build, output, and done
( printf "$HEADER\n$METADATA" | perl -lpe 's/"/""/g; s/^|$/"/g; s/\t/","/g' ) > $LIBRARY/$COLLECTION/$CSV
exit
