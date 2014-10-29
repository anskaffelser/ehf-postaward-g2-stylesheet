<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:xsl  = "http://www.w3.org/1999/XSL/Transform" 
    xmlns:i2   = "urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
    xmlns:cac  = "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
    xmlns:cbc  = "urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
    xmlns:ccts = "urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" 
    xmlns:sdt  = "urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" 
    xmlns:udt  = "urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"    
    exclude-result-prefixes="i2 cac cbc ccts sdt udt xhtml"
>

	<!-- Including external resources-->
	<xsl:include href="EHF_complex_templates.xsl"/>
	
	<xsl:output method="html" encoding="utf-8" indent="yes"/>
	
	<xsl:decimal-format name="format1" grouping-separator=" " decimal-separator=","/>

	<xsl:template match="i2:Invoice">
		<div class="left">
			<div class="from content">
				<div class="content-holder">
					<xsl:apply-templates select="cac:AccountingSupplierParty" mode="short"/>
				</div>
			</div>
			<div class="to content">
				<div class="content-holder">
					<xsl:apply-templates select="cac:AccountingCustomerParty" mode="short"/>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="content">
				<table>
					<tbody>
						<tr>
							<td>Fakturanr.</td>
							<td>:</td>
							<td><xsl:value-of select="/i2:Invoice/cbc:ID" /></td>
						</tr>
						<tr>
							<td><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='IssueDate']"/></td>
							<td>:</td>
							<td><xsl:apply-templates select="cbc:IssueDate" /></td>
						</tr>
						<tr>
							<td>Forfallsdato</td>
							<td>:</td>
							<td><xsl:apply-templates select="cbc:PaymentDueDate"/></td>
						</tr>
						<tr>
							<td>Kontonr</td>
							<td>:</td>
							<td><xsl:value-of select="cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID"/></td>
						</tr>
						<tr>
							<td>Deres ref.</td>
							<td>:</td>
							<td><xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ID"/></td>
						</tr>
						<tr>
							<td>Vår ref.</td>
							<td>:</td>
							<td><xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ID"/></td>
						</tr>
					</tbody>				
				</table>
				<xsl:for-each select="/i2:Invoice/cbc:Note">
					<br/><span class="note" >Note:</span><span class="note"><xsl:value-of select="text()" /></span>
				</xsl:for-each>
			</div>		
			<div class="content delivery">
				<div class="content-holder">
					<xsl:apply-templates select="cac:Delivery" mode="short"/>
				</div>
			</div>
		</div>
		<div class="invoice-lines content page-break">
			<div class="content-holder">
				<table class="invoice-lines-table">
					<thead>
						<tr>
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>	</th>
							
							<th>
								<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='SellersItemIdentification']"/>
							</th>
							
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Name']"/>	</th><!--	cac:Item/cbc:Name	-->
							
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='InvoicedQuantity']"/>	</th>
							<th>MVA</th>
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PriceAmount']"/>	</th>
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineExtensionAmount']"/>	</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select="cac:InvoiceLine" mode="stripped" />
						<tr class="invoice-before-tax table-sum">
							<td colspan="6" class="pull-text-right"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineTaxBase']"/></td>
							<td ><span><xsl:value-of select="/i2:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" /></span>&#160;<span><xsl:value-of select="/i2:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID" /></span></td>
						</tr>
					</tbody>
				</table>
				
				<table>
					<thead>
						<th><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineTaxBase']"/></th>
						<th><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxName']"/></th>
						<th><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxAmount']"/></th>
					</thead>
					<tbody>
						<tr>
							<td><xsl:value-of select="/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" /></td>
							<td><xsl:value-of select="format-number(number(string(/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent)), '### ##0', 'format1')"/>%</td>								
							<td><xsl:value-of select="/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount" /></td>
						</tr>
					</tbody>
				</table>
				
				<div class="sum">
					<span><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Total']"/>:</span>
					<span class="word"><xsl:value-of select="/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount + /i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" /></span>&#160;<span><xsl:value-of select=" /i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount/@currencyID" /></span>
				</div>
				<!--div class="about">[*] Indikerer at en av følgende felt er satt for linjen; Beskrivelse, Notat, Produktegenskaper, Kontering eller Ordrereferanse. Se utdypende informasjon om linjen i vedlegg</div-->
			</div>
		</div>						
		<div>
			<xsl:apply-templates select="cac:PaymentMeans[1]" mode="bill" />
		</div>	
	</xsl:template>
	
	<!-- Invoce templates start -->
	<xsl:template match="i2:Invoice" mode="full">
		<header class="content">
			<div class="invoice-meta">
				<div class="header">Komplett faktura:</div>
				<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='IssueDate']"/></span>:<span class="value"><xsl:apply-templates select="cbc:IssueDate" /></span></div>
				<xsl:apply-templates select="cac:PaymentTerms" />
			</div>
			<!--div class="about">[*] Indikerer at det finnes mer utfyllende informasjon lengere ned</div-->
		</header>
		
		<div class="left">
			<div class="from content">
				<div class="header"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='from']"/></div>
				<div class="content-holder">
					<xsl:apply-templates select="cac:AccountingSupplierParty"/>
					<xsl:apply-templates select="cac:PayeeParty"/>
				</div>
			</div>
			<div class="content payment-means">
				<div class="header">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentMeans']"/><xsl:if test="count(cac:PaymentMeans) > 1" >*</xsl:if>
				</div>
				<div class="content-holder">
					<xsl:apply-templates select="cac:PaymentMeans[1]"/>
				</div>
			</div>
			
			<div class="content tax-total">
				<div class="content-holder">
					<xsl:apply-templates select="cac:TaxTotal"/>
				</div>
			</div>
			
		</div>
		<div class="right">
			<div class="to content">
				<div class="header"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='to']"/></div>
				<div class="content-holder">
					<xsl:apply-templates select="cac:AccountingCustomerParty"/>
				</div>
			</div>
			<div class="content delivery">
				<div class="header">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Delivery']"/>:
				</div>
				<div class="content-holder">
					<xsl:apply-templates select="cac:Delivery"/>
				</div>
			</div>
			
			<div class="content legal-monetary-total">
				<div class="header">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LegalMonetaryTotal']"/>
				</div>
				<div class="content-holder">
					<xsl:apply-templates select="cac:LegalMonetaryTotal"/>
				</div>
			</div>			
		</div>
		<div class="invoice-lines content">
			<div class="header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='InvoiceLines']"/>	</div>
			<div class="content-holder">
				<table class="invoice-lines-table">
					<thead>
						<tr>
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>	</th>
							
							<th>
								<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='SellersItemIdentification']"/>
							</th>
							
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Name']"/>	</th><!--	cac:Item/cbc:Name	-->
							
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='InvoicedQuantity']"/>	</th>
							<th>MVA</th>
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PriceAmount']"/>	</th>
							<th>	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineExtensionAmount']"/>	</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select="cac:InvoiceLine" mode="stripped" />
						<tr class="invoice-before-tax table-sum">
							<td colspan="6" class="pull-text-right"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineTaxBase']"/></td>
							<td ><span><xsl:value-of select="/i2:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" /></span><span><xsl:value-of select="/i2:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID" /></span></td>
						</tr>
					</tbody>
				</table>
				
				<table>
					<thead>
						<th><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineTaxBase']"/></th>
						<th><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxName']"/></th>
						<th><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxAmount']"/></th>
					</thead>
					<tbody>
						<tr>
							<td><xsl:value-of select="/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" /></td>
							<td><xsl:value-of select="format-number(number(string(/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent)), '### ##0', 'format1')"/>%</td>								
							<td><xsl:value-of select="/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount" /></td>
						</tr>
					</tbody>
				</table>
				
				<div class="sum">
					<span><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Total']"/>:</span>
					<span class="word"><xsl:value-of select="/i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount + /i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" /></span><span><xsl:value-of select=" /i2:Invoice/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount/@currencyID" /></span>
				</div>
				<!--div class="about">[*] Indikerer at en av følgende felt er satt for linjen; Beskrivelse, Notat, Produktegenskaper, Kontering eller Ordrereferanse. Se utdypende informasjon om linjen i vedlegg</div-->
			</div>
		</div>
		<!--	Inserting the only the first PaymentMean formated as a bill. Other potential payment means will be shown later under ".more"	-->		
		<div class="more">
			<div class="invoice-lines">
				<h2><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='InvoiceLines']"/></h2>					
				<xsl:apply-templates select="cac:InvoiceLine" mode="full" />
			</div>
			<div class="payment-means">
				<h2><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentMeansPlural']"/></h2>
				<xsl:apply-templates select="cac:PaymentMeans" />
			</div>
			
		</div>
	</xsl:template>
	
	<xsl:template match="i2:Invoice" mode="dump">
		<div class="invoice dump content holder">
				<xsl:for-each select="cbc:Note" >
					<xsl:if test="position() > 1">
						<xsl:apply-templates select="." mode="dump"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:apply-templates select="*[not(self::cbc:IssueDate) and not(self::cbc:Note) and not(self::cbc:UBLVersionID) and not(self::cbc:CustomizationID) and not (self::cbc:ProfileID) and not (self::cbc:ID)]" mode="dump"/>
		</div>
	</xsl:template>
	
	<!-- Invoce templates ends -->
	
	<!-- Triggering Invoice template if present in root -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
		<html lang="no" xml:lang="no" >			
			<head>
				<title>PEPPOL BIS Invoice</title>
				<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
				<style type="text/css">
@media print{
	.page-break {
		page-break-before:always;
		display: block;
	}
	.toggle{
		display: none;
	}
}
body{
	 -webkit-print-color-adjust: exact;
	padding:0;
	margin:0;
	width:20cm;
	position:relative;
}
header {
	text-align: center;
}
.header-header {
	font-size: 18pt;
	text-decoration: underline;
}

.invoice-meta,.header-header {
	width: 35%;
	margin: 0 auto;
	text-align: left;
}
.invoice-meta{
	margin-top: 0.25cm;
}

/*Invoice lines markup starts*/
.invoice-lines.content {
	width:19.6cm;
	display: inline-table;
	position: relative;
}

.invoice-lines.content table {
	width:100%;
	border-collapse: collapse;
	margin-bottom: 0.5cm;
}
.invoice-lines.content th {
	text-align: left;
}
.invoice-lines-table th:last-child {
	background: none;
	border-right
}

.invoice-lines td, .invoice-lines th {
	padding: 0.1cm;
}
.invoice-lines td {
	border-bottom: dotted 1px rgba(133,133,133,0.2);
	border-right: dotted 1px rgba(133,133,133,0.2);
}
.invoice-lines td:first-child{
	border-left: dotted 1px rgba(133,133,133,0.2);
}

th.more, td.more {
	border-right: none;
	border-top: none;
	border-bottom: none;
}
.invoice-before-tax, .totals {
	font-weight: bold;
}
.table-sum td{
	border-top:solid 1px rgba(133,133,133,0.2);
}
.pull-text-right{
	text-align: right;
}

.sum {
	text-align: right;
	font-weight: bold;
}

/*Invoice lines markup ends*/

.about {
	font-style: italic;
	padding: 0.25cm;
	font-size: 11pt;
}

.content{
	padding:0.2cm;
	margin-bottom:0.2cm;
}
.content .header, .content-holder>.holder>.holder-header {
	font-size: 15pt;
	margin-bottom: 0.2cm;
	color:#858585;
	border-bottom: dotted 1px rgba(133,133,133,0.2);
	width:100%;
}

.content-holder{
	padding-left:0.2cm;
}
.content-holder>:first-child{
	margin-top: 0.2cm;
}

body .left, body .right{
	width:50%;
	float:left;
}
body .right{
	box-sizing:border-box;
	padding-left: 0.2cm;
}
span.label {
	padding-right:0.25cm;
	font-weight: bold;
}
.holder {
	margin-top: 0.2cm;
}
.holder-header {
	text-decoration: underline;
	color:rgb(133,133,133);
}

.holder .holder .row, .holder .holder {
	padding-left: 0.2cm;
}

.holder .holder-header:first-child {
	padding-left: 0;
}
.float-right{
	float:right;
}

.hvit { background: white; }
.litentekst { font-size: 6pt; font-weight: bold; }

.bill {width: 20cm; height: 10.6cm; background: yellow; margin-bottom: 0.2cm;} /* absolutt */
.bill .beloptop { top: 0.8cm; }

.bill .krvenstre { left: 7.5cm; width: 2.9cm; }
.bill .kvitteringtopp { height: 2cm; }
.bill .kvitteringtopp .kvitteringtoptekst {  margin-left: 1cm; font-family: verdana; padding-top: .1cm; font-size: 10pt; font-weight: bold; }
.bill .kvitteringtopp .felttekst {  margin-left: .2cm; font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringtopp .feltboks { height: .6cm;  padding-top: .1cm; margin-top: .1cm; text-align: center; }
.bill .kvitteringtopp .innbetaltkonto { margin-left: 1cm; float: left; width: 3cm; }
.bill .kvitteringtopp .belop { margin-left: 3.8cm; float: left; width: 3.8cm; }
.bill .kvitteringtopp .betalerkonto { margin-left: 1cm; float: left; width: 4cm; }
.bill .kvitteringtopp .blankett { margin-left: .2cm; float: left; width: 3cm; }

.bill .kvitteringmidt  { height: 6cm; background: white; }
.bill .kvitteringmidt .betalingsinfogiro { height: 3cm; width: 19cm; padding: 0 .5cm; }
.bill .kvitteringmidt .betalingsinfogiro .tekstgirofrist { clear: both; }
.bill .kvitteringmidt .betalingsinfogiro .betalingsinfotekst {
    float: left; width: 3cm; margin-left: .2cm; height: .4cm; font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringmidt .betalingsinfogiro .girotekst {
    float: left; width: 1.2cm;  margin-left: 7.5cm; font-family: verdana; padding-top: .1cm; font-size: 10pt; font-weight: bold;
}
.bill .kvitteringmidt .betalingsinfogiro .betalingsfristtekst {
    float: left; width: 1.3cm; margin-left: 3.5cm; font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold;
}
.bill .kvitteringmidt .betalingsinfogiro .betalingsinfo {
    float: left; width: 8.5cm; padding-top: .1cm; font-size: 10pt;
}
.bill .kvitteringmidt .betalingsinfogiro .signatur {
    float: left; width: 8.5cm; margin-left: 2cm; font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold;
}
.bill .kvitteringmidt .betalingsinfogiro .betalingsfristboks {
    float: left; padding-top: .1cm; margin-left: .2cm;
} 
.bill .kvitteringmidt .betalingsinfogiro .betalingsinfoboks {
    height: 1.6cm;  padding-left: 0.5cm; padding-top: 0.2cm; margin-top: 0.4cm; border: dotted 1px #cccccc; }
.bill .kvitteringmidt .betalingsinfogiro .signaturtekst {
    font-family: verdana; margin-left: .2cm; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringmidt .betalingsinfogiro .signaturboks {
    height: 1.8cm; border: dotted 1px #cccccc; }

.bill .kvitteringmidt .betalttilav .avtilboks {
    height: 2.1cm; width: 8.5cm; border: dotted 1px #cccccc; font-size: 10pt; padding-left: 0.5cm; }
.bill .kvitteringmidt .betalttilav { width: 19cm; padding: 0 .5cm; }
.bill .kvitteringmidt .betalttilav .av, .kvitteringmidt .betalttilav .til {
    height: 2.5cm; width: 8.5cm; }
.bill .kvitteringmidt .betalttilav .avtiltekst {
    margin-left: .2cm; height: .4cm; font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringmidt .betalttilav .avtilboks {
    height: 1.9cm; padding-top: 0.2cm; width: 8cm; border: dotted 1px #cccccc; }
.bill .kvitteringmidt .betalttilav .av { float: left; }
.bill .kvitteringmidt .betalttilav .til { float: right; }

.bill .kvitteringbunn  { height: 2.3cm; }
.bill .kvitteringbunn .belast { height: .8cm; margin-left: 3cm;  }
.bill .kvitteringbunn .belast .belasttekst {
    float: left; width: 1cm;  font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringbunn .belast .kvitteringtekst {
    margin-left: 6.8cm; float: left; width: 1.4cm;  font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringbunn .belast .belastrute, .bill .kvitteringbunn .belast .kvitteringrute {
    height: .5cm; width: .5cm; margin: .1cm .1cm 0 0; float: left; background: white;  }

.bill .kvitteringbunn .kidsumkonto { padding-left: .2cm; padding-top: 0.3cm; height: 1.4cm;  background: white; }
.bill .kvitteringbunn .felttekst {  margin-left: .2cm; font-family: verdana; padding-top: .1cm; font-size: 6pt; font-weight: bold; }
.bill .kvitteringbunn .feltboks{  padding-top: .1cm; margin-top: .1cm; text-align: center; padding-bottom: 0.3cm; }

.bill .kvitteringbunn .kid { float: left; width: 7cm; border-left: solid 1pt black; }
.bill .kvitteringbunn .kroner { padding-right: .2cm; float: left; width: 2.3cm;  border-left: solid 1pt black;  }
.bill .kvitteringbunn .kroner .feltboks { text-align: right; }
.bill .kvitteringbunn .ore { border-left: solid 1pt yellow; float: left; width: 2.5cm; }
.bill .kvitteringbunn .ore .feltboks { padding-left: .2cm; text-align: left; }

.bill .kvitteringbunn .konto { float: left; width: 3.5cm; }
.bill .kvitteringbunn .blankettnummer { float: left; width: 3.5cm; }
				
				</style>
			</head>
			
			<body>				
				<xsl:apply-templates select="i2:Invoice"/>
				<div class="leftovers page-break">
					<xsl:apply-templates select="i2:Invoice" mode="full"/>
				</div>
				<div class="leftovers page-break">
					<xsl:apply-templates select="i2:Invoice" mode="dump" />
				</div>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
