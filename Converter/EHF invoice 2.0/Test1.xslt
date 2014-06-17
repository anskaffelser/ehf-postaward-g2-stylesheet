<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2">
	<xsl:output xmlns:xsd="http://purl.oclc.org/dsdl/svrl" method="text" omit-xml-declaration="no" standalone="yes" indent="yes"/>
	<xsl:template match="@* | node()">
		<xsl:choose>
			<xsl:when test="cbc:InvoiceTypeCode/@listID = 'UNCL1001' and cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode/@listID='ISO3166-1:Alpha2' and cac:InvoiceLine/cbc:InvoicedQuantity/@unitCodeListID='UNECERec20'">
				<xsl:text> New</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Old</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
