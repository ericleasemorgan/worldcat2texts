#!/usr/bin/env bash

# htids2txt.sh - given a set of HathiTrust identifiers, save a set of plain text files 


# configure
HTID2TXT='./bin/htid2txt.sh'
DB='haithtrust-numbers.txt'
LIBRARY='./library'
TEXTS='texts'

if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# process each HathiTrust identifier
cat $LIBRARY/$COLLECTION/$DB | while read HTID; do
	
	# debug and do the work
	echo $HTID >&2
		
	if [[ -f $LIBRARY/$COLLECTION/$TEXTS/$( echo $HTID | sed "s/\//-/g" ).txt ]]; then 
		echo "exists" >&2
	else
	
		# do the work
		$HTID2TXT "$HTID" "$COLLECTION"
	fi
	
done
exit