#!/usr/bin/env bash

# json2htid.sh - given a JSON of a particular design, output a HathiTrust identifier

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 12, 2020 - first documentation; while coronavirus is happening; jq++


# configure
JSON='json'
DB='metadata.tsv'
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

	# re-configure
	IFS=$'\t'
	
	# process each HathiTrust identifier and its metadata; jq++
	cat $FILE | jq --raw-output "{title:.records[].titles[0], date:.records[].publishDates[0], htid:.items[].htid} | [.title, .date, .htid] | @tsv" | while read TITLE DATE HTID; do
	
		# normalize title, a bit
		TITLE=$( echo $TITLE | sed 's/ \/$//' )
		
		# filter out identifiers containing $; dollar signs hurt
		if [[ $HTID == *'$'* ]]; then continue; fi
		
		# create identifier
		TXT=$( echo $HTID | sed "s/\//-/g" ).txt

		# debug
		echo "  title: $TITLE" >&2
		echo "   date: $DATE"  >&2
		echo "   htid: $HTID"  >&2
		echo "   file: $TXT"   >&2
		echo                   >&2

		# save for future reference
		printf "$TITLE\t$DATE\t$HTID\t$TXT\n" >> $LIBRARY/$COLLECTION/$DB

		# we only want/need one identifier
		break
		
	done
		
done
exit

