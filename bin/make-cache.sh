#!/usr/bin/env bash

# htids2txt.sh - given a set of HathiTrust identifiers, save a set of plain text files 


# configure
HTID2TXT='./bin/htid2txt.sh'
DB='metadata.tsv'
LIBRARY='./library'
TEXTS='texts'

if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# process each HathiTrust identifier
IFS=$'\t'
cat $LIBRARY/$COLLECTION/$DB | while read TITLE DATE HTID FILE; do
	
	# debug and do the work
	echo $FILE >&2
	echo $HTID >&2
		
	if [[ -f $LIBRARY/$COLLECTION/$TEXTS/$FILE ]]; then 
		echo "exists" >&2
	else
	
		# do the work
		$HTID2TXT "$HTID" "$COLLECTION"
	fi
	
	echo       >&2
done
exit