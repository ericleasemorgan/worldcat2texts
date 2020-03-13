#!/usr/bin/env bash

# htid2txt.sh - a front-end to harvest-text.sh; parallelize the process of building OCR version of book

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# February 16, 2019 - first documentation
# July     11, 2019 - figured out how to parallelize the process; substantial speed increase
# July     14, 2019 - removed need for size parameter; exported size for htid2pdf.sh
# March    12, 2020 - enhanced for the Distant Reader


# configure
HARVEST='./bin/harvest-text.sh'
LIBRARY='./library'
MAXIMUM=10000
TEXTS='texts'
TMP='tmp'

# sanity check
if [[ -z $1 || -z $2 ]]; then
	echo "Usage: $0 <HathiTrust identifier> <collection>" >&2
	exit
fi

# get input
HTID=$1
COLLECTION=$2

# make sane
mkdir -p $LIBRARY/$COLLECTION/$TMP
mkdir -p $LIBRARY/$COLLECTION/$TEXTS
rm   -rf $LIBRARY/$COLLECTION/$TMP/*.txt

# harvest each page
seq 1 $MAXIMUM | parallel $HARVEST $HTID {} $COLLECTION

# build the book and output
TEXT=$( cat $LIBRARY/$COLLECTION/$TMP/*.txt )
HTID=$( echo $HTID | sed "s/\//-/g" )
echo -e "$TEXT" > "$LIBRARY/$COLLECTION/$TEXTS/${HTID}.txt"

# done
exit



