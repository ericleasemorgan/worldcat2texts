#!/usr/bin/env bash

# search.sh - given a few pre-configurations, query Lexis/Nexis and output results as a set of files

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# November 7, 2019 - first documentation, but based on previous work; need to remove pre-configurations


# configure
WSKEY=$WCWSKEY
TEMPLATE='http://www.worldcat.org/webservices/catalog/search/sru?query=srw.su+%3D+%22##IDEA##%22+and+srw.yr+<+%221923%22+and+srw.la+=+%22eng%22&startRecord=##START##&maximumRecords=100&wskey=##WSKEY##'
START=1

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <idea>" >&2
	exit
fi

# get input
IDEA=$1

# build the URL
URL=$TEMPLATE
URL=$( echo $URL | sed "s/##START##/$START/")
URL=$( echo $URL | sed "s/##IDEA##/$IDEA/" )
URL=$( echo $URL | sed "s/##WSKEY##/$WSKEY/" )

# debug
echo "$URL" >&2
echo >&2

# do the work
wget -O - "$URL"

