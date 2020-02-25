# worldcat2texts

There is no real "here" yet, but there will be. 

Seriously. Given an SRU query intended to be applied to the WorldCat Search API, this system of files will then:

   1. search WorldCat
   2. cache the results as XML files
   3. extract the OCLC numbers from the XML files
   4. search the HathiTrust matching records
   5. cache the results as JSON files
   6. extract the HathiTrust identifiers from the JSON files
   7. harvest the OCR associated with the HathiTrust identifiers

In the end, the harvested OCR will be zipped up and (manually) submitted to the [Distant Reader](https://distantreader.org).

The really big goal is to create substantial collections of plain text files where each collection surrounds one of the 102 [Great Ideas](https://www.thegreatideas.org). These collections will make great fodder for the purposes of demonstrating the functionality of the Reader.

---
Eric Lease Morgan &lt;emorgan@nd.edu&gt;   
February 25, 2020 -- "Happy Mardi Gras!"
