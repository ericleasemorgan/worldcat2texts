#!/usr/bin/env perl

# harvest-text.pl - given a HathiTrust identifier and a page number, output a page of OCR

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# February 10, 2019 - first cut
# February 16, 2019 - gonna call it done, but software is never finished
# July     14, 2019 - trapped for HTTP errors 401, 404, and 503
# March    12, 2020 - migrated/tweaked for the Distant Reader


# configure
use constant REQUEST => 'https://babel.hathitrust.org/cgi/htd/volume/pageocr/';
use constant KEY     => $ENV{ 'HTCLIENTID' }; 
use constant SECRET  => $ENV{ 'HTSECRET' }; 

# require
use strict;
use OAuth::Lite::Consumer;
use OAuth::Lite::AuthMethod;

# get input
my $htid   = $ARGV[ 0 ];
my $page   = $ARGV[ 1 ];
if ( ! $htid | ! $page ) { die "Usage: $0 <htid> <page>\n" }

# initialize
my $url  = REQUEST . "$htid/$page";
my $done = 'false';

while( $done eq 'false' ) {

	# authenticate
	my $consumer = OAuth::Lite::Consumer->new(
			consumer_key    => KEY,
			consumer_secret => SECRET,
			auth_method     => OAuth::Lite::AuthMethod::URL_QUERY,
		);

	# request
	my $response = $consumer->request(
			method => 'GET',
			url    => $url,
			params => { v => '2' }
		);

	# debug
	warn join( "\t", ( $htid, 'txt', $page, $response->code ) ), "\n";

	# output, conditionally and done
	if ( $response->code == '200' ) {

		print $response->content;
		exit( 1 );
	
	}

	# check for time-stamp error; re-try
	elsif ( $response->code == '401' ) { $done = 'false' }

	# check for file not found; signal exit
	elsif ( $response->code == '404' ) {
	
		$done =  'true';
		exit ( $page ) 
	
	}

	# system overloaded; rest
	elsif ( $response->code == '503' ) { $done = 'false'; sleep 4 }

	# system overloaded; rest
	elsif ( $response->code == '400' ) {
	
		$done = 'false';
		print $response->content, "\n";
		
	}

	# system overloaded; rest
	elsif ( $response->code == '403' ) {
	
		$done = 'true';
		exit ( 2 )
		
	}

	# error
	else { exit( 0 ) }

}
