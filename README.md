# Worldcat2Texts

Given a word (a "great idea"), search OCLC, cache a set of OCR files from the HathiTrust, and submit the result to the Distant Reader

More specifically, given an SRU query intended to be applied against WorldCat using the Search API, this system of files will then:

   1. search WorldCat
   2. cache the results as XML files
   3. extract the OCLC numbers from the XML files
   4. search the HathiTrust for matching records
   5. cache the results as JSON files
   6. extract the HathiTrust identifiers from the JSON files
   7. cache the OCR associated with the HathiTrust identifiers

The previous steps are sufficient for many purposes, but the following steps go further and analyze/index the OCR using the [Distant Reader](https://distantreader.org):

   8. create a simple metadata (CSV) file
   9. compress the cache along with the metadata file into a zip file
  10. submit the result to the Distant Reader

The really big goal is to create substantial collections of plain text files where each collection surrounds one of the 102 [Great Ideas](https://www.thegreatideas.org). These collections are wonderful fodder for the purposes of demonstrating the functionality of the Reader.

## Cookbook

Use the following sequence to make this system work for you:

   1. `./bin/pre-search.sh` - see what is available
   2. `./bin/build.sh` - initialize a collection
   3. `./bin/search.sh` - search OCLC and cache batches of search results
   4. `./bin/make-metadata.sh` - loop through search results, join them with HathiTrust, and output rudimentary metadata
   6. `./bin/make-cache.sh` - loop through the metadata and cache OCR; very not fast
   7. `./bin/make-ready.sh` - create a metadata file apropos to the Reader, zip the cache, and get ready processing
   8. `./bin/clean.sh` - optionally remove the temporary and staging files from the collection
   9. `./bin/read.sh` - submit the result of all the above to the Distant Reader; "Cook until done."

If you want to do everything at one go, then:

  10. `./bin/make-all.sh` - one script to rule them all

---
Eric Lease Morgan &lt;emorgan@nd.edu&gt;   
March 13, 2020 -- "While coronavirus is still happening"
