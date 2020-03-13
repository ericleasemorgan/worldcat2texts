#!/usr/bin/env bash

if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# do each process
./bin/build.sh $COLLECTION
./bin/search.sh $COLLECTION $COLLECTION
./bin/make-metadata.sh $COLLECTION
./bin/make-cache.sh $COLLECTION
./bin/make-ready.sh $COLLECTION
./bin/read.sh $COLLECTION

# done
exit
