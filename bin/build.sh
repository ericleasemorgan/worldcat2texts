#!/usr/bin/env bash

# build.sh


# configure file system
LIBRARY='./library'
BATCHES='batches'
JSON='json'
TEXTS='texts'
TMP='tmp'

# configure scripts
BATCHES2JSON='./bin/batch2json.sh'
JSON2HTID='./bin/json2htid.sh'
HTIDS2TEXT='./bin/htids2txt.sh'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# build file system
mkdir -p $LIBRARY
mkdir -p $LIBRARY/$COLLECTION
mkdir -p $LIBRARY/$COLLECTION/$BATCHES
mkdir -p $LIBRARY/$COLLECTION/$JSON
mkdir -p $LIBRARY/$COLLECTION/$TEXTS
mkdir -p $LIBRARY/$COLLECTION/$TMP

<<<<<<< HEAD
# done
exit
=======
# do the work
$BATCHES2JSON $COLLECTION 
$JSON2HTID $COLLECTION 
$HTIDS2TEXT $COLLECTION 

# reduce and done
zip $LIBRARY/$COLLECTION/$COLLECTION.zip $LIBRARY/$COLLECTION/$TEXTS/*
exit
>>>>>>> 9c07bda99ebf560701e657b744b7124d7257d1ca
