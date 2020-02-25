<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- batch2oclc.xsl - given a batch of MARCXML records, output a list of OCLC numbers -->

<!-- Eric Lease Morgan <emorgan@nd.edu> -->
<!-- (c) University of Notre Dame; distributed under a GNU License -->

<!-- Feburary 25, 2020 - first cut -->


<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:marc="http://www.loc.gov/MARC21/slim"
	version="1.0">

	<xsl:strip-space elements="*"/>
	<xsl:output method="text" />
	<xsl:template match="/">
		<xsl:for-each select="//marc:controlfield">
			<xsl:if test='@tag = "001"'>
				<xsl:value-of select='.' /><xsl:text>&#10;</xsl:text>
			</xsl:if>	
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
