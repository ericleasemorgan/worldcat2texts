#!/usr/bin/env bash

# batch2json.sh - given a batch of MARC XML files, output JSON files from HathiTrust

BATCH2OCLC='./etc/batch2oclc.xsl'
BATCHES='batches'
DB='oclc-numbers.txt'
JSON='json'
TEMPLATE='https://catalog.hathitrust.org/api/volumes/full/oclc/##OCLC##.json'
LIBRARY='./library'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# initialize
rm -rf $LIBRARY/$COLLECTION/$DB
touch $LIBRARY/$COLLECTION/$DB
mkdir -p $LIBRARY/$COLLECTION/$JSON

# process each batch
find $LIBRARY/$COLLECTION/$BATCHES -name *.xml | parallel xsltproc $BATCH2OCLC {} | while read OCLC; do

	# (re-)configure
	URL=$( echo $TEMPLATE | sed "s/##OCLC##/$OCLC/" )
	OUTPUT="$LIBRARY/$COLLECTION/$JSON/$OCLC.json"
	
	# debug
	echo $OCLC    >&2
	echo $URL     >&2
	echo $OUTPUT  >&2

	# save for future reference
	echo $OCLC >> $LIBRARY/$COLLECTION/$DB
	
	# do the work
	if [[ -f $OUTPUT ]]; then
		echo "exists" >&2
	else
		wget -O $OUTPUT $URL
	fi

	# delimit
	echo >&2
	
done
exit