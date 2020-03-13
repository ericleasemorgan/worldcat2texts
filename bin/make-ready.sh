#!/usr/bin/env bash

# configure scripts
TSV2CSV='./bin/tsv2csv.sh'
LIBRARY='./library'
TEXT='texts'
CSV='metadata.csv'
TEMPLATE='./etc/template.slurm'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# create slurm script
cat $TEMPLATE | sed s"/##COLLECTION##/$COLLECTION/g" > $LIBRARY/$COLLECTION/$COLLECTION.slurm

# create CSV file
$TSV2CSV $COLLECTION

# copy it and create a zip file
cp $LIBRARY/$COLLECTION/$CSV $LIBRARY/$COLLECTION/$TEXT
cd $LIBRARY/$COLLECTION
zip $COLLECTION.zip $TEXT/*

# done
exit
