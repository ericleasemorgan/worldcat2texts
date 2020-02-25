#!/usr/bin/env bash

# json2htid.sh - given a JSON of a particular design, output a HathiTrust identifier


# configure
JSON='json'
DB='haithtrust-numbers.txt'
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

# process each json file
find $LIBRARY/$COLLECTION/$JSON -name *.json | while read FILE; do

	# process each HathiTrust identifier
	cat $FILE | jq .items[].htid | sort | while read HTID; do
	
		# normalize
		HTID=$( echo $HTID | sed 's/"//g' )
		
		# filter identifiers containing $; dollar signs hurt
		if [[ $HTID == *'$'* ]]; then continue; fi
		
		# debug
		echo $HTID >&2
				
		# save for future reference
		echo $HTID >> $LIBRARY/$COLLECTION/$DB

		# we only want/need one identifier
		break
		
	done
		
done
exit

