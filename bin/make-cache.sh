#!/usr/bin/env bash

# make-cache.sh - loop through a metadata file, and create a cache of OCR

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening


# configure
HTID2TXT='./bin/htid2txt.sh'
DB='metadata.tsv'
LIBRARY='./library'
TEXTS='texts'

# sanity check
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
	
	# delimit
	echo  >&2
	
done
exit