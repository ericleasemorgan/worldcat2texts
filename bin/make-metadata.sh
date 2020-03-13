#!/usr/bin/env bash

# make-metadata.sh - process cached MARCXML, process resulting JSON files, and output metadata file

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
BATCHES2JSON='./bin/batch2json.sh'
JSON2HTID='./bin/json2htid.sh'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# do the work and done
$BATCHES2JSON $COLLECTION
$JSON2HTID $COLLECTION
exit
