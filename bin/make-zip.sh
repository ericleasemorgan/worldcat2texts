#!/usr/bin/env bash

# configure scripts
TSV2CSV='./bin/tsv2csv.sh'
LIBRARY='./library'
TEXT='texts'
CSV='metadata.csv'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# create CSV file
$TSV2CSV $COLLECTION

# copy it, zip the texts, and done
cp $LIBRARY/$COLLECTION/$CSV $LIBRARY/$COLLECTION/$TEXT
cd $LIBRARY/$COLLECTION
zip $COLLECTION.zip $TEXT/*
exit
