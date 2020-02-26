#!/usr/bin/env bash

# search.sh - given a few pre-configurations, query Lexis/Nexis and output results as a set of files

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# November 7, 2019 - first documentation, but based on previous work; need to remove pre-configurations


# configure
WSKEY=$WCWSKEY
TEMPLATE='http://www.worldcat.org/webservices/catalog/search/sru?query=srw.su+%3D+%22##IDEA##%22+and+srw.yr+<+%221923%22+and+srw.la+=+%22eng%22&startRecord=##START##&maximumRecords=##MAXIMUM##&wskey=##WSKEY##'
GETCOUNT='./etc/get-count.xsl'
BATCH=0
BATCHES='batches'
COUNT=100
LIBRARY='./library'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <idea> <collection>" >&2
	exit
fi

# get input
IDEA=$1
COLLECTION=$2

# build the URL
START=0
MAXIMUM=0
URL=$TEMPLATE
URL=$( echo $URL | sed "s/##IDEA##/$IDEA/" )
URL=$( echo $URL | sed "s/##START##/$START/")
URL=$( echo $URL | sed "s/##MAXIMUM##/$MAXIMUM/")
URL=$( echo $URL | sed "s/##WSKEY##/$WSKEY/" )

# debug
echo "$URL" >&2
echo >&2

# get the number of found records
RESPONSE=$(wget -O - "$URL" )
TOTAL=$( echo $RESPONSE | xsltproc $GETCOUNT - )
echo "Number of records: $COUNT" >&2

# re-initialize
START=1
MAXIMUM=100

# repeat forever; search
while [ 1 ]; do
	
	# re-configure
	let BATCH=BATCH+1
	OUTPUT=$LIBRARY/$COLLECTION/$BATCHES/batch-$( printf "%04d" $BATCH ).xml
	
	# re-configure URL
	URL=$TEMPLATE
	URL=$( echo $URL | sed "s/##IDEA##/$IDEA/" )
	URL=$( echo $URL | sed "s/##START##/$START/")
	URL=$( echo $URL | sed "s/##MAXIMUM##/$MAXIMUM/")
	URL=$( echo $URL | sed "s/##WSKEY##/$WSKEY/" )

	# do the work
	echo "Getting $COUNT records of $TOTAL starting at record $START ($OUTPUT)" >&2
	echo >&2
	wget -O $OUTPUT "$URL"
	
	# increment and done, conditionally
	let START=START+COUNT
	if [[ $START -gt $TOTAL ]]; then break; fi
	
# fini
done
exit
