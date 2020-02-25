#!/usr/bin/env bash

# clean.sh - scary

# configure
LIBRARY='./library'

if [[ -z $1 ]]; then
	echo "Usage: $0 <collection>" >&2
	exit
fi

# get input
COLLECTION=$1

# do the work and done
rm -rf $LIBRARY/$COLLECTION/texts/*
rm -rf $LIBRARY/$COLLECTION/tmp/*
exit

