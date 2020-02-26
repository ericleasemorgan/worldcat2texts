<?xml version="1.0"?>

<!-- get-count.xsl - merely extract the numbe of records in a result set -->

<!-- Eric Lease Morgan <emorgan@nd.edu> -->
<!-- (c) University of Notre Dame; distributed under a GNU License -->

<!-- Feburary 26, 2020 - first cut -->


<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:srw="http://www.loc.gov/zing/srw/"
	version="1.0">

	<xsl:output method="text" />
	<xsl:template match="/srw:searchRetrieveResponse">
			<xsl:value-of select='./srw:numberOfRecords' />
	</xsl:template>

</xsl:stylesheet>
