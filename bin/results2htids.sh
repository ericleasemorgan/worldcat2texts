#!/usr/bin/env bash

# configure scripts
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
