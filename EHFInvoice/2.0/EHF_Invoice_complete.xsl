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

	<xsl:output method="html" encoding="utf-8" indent="yes"/>
	
	<xsl:decimal-format name="format1" grouping-separator=" " decimal-separator=","/>

	<xsl:variable name="moduleDoc">
		<module xmlns:mmx="http://funx" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:svg="http://www.w3.org/2000/svg" xmlns:fnc="http://funx/fnc" xmlns:att="http://funx/att" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
			<document-merge>
				<g-funcs>
					<!--	Text representation of no value	-->
					<g name="null">Mangler data</g>
		
		
					<g name="from">Fra</g>
					<g name="to">Til</g>
				
					<g name="IssueDate">Utstedt</g>
					<g name="PaymentTerms">Betalingsbetingelser</g>
					
				
					<!--	Party related	-->
					<g name="AccountingSupplierParty">Leverandør</g>
					<g name="AccountingCustomerParty">Kjøper</g>
					<g name="AddressCountry">Land</g>
					<g name="PartyName">Navn</g>
					<g name="IdentificationCode">Landskode</g>
					<g name="EndpointID">Endepunkt</g>
					
					<!--	Address related	-->
					<g name="Address">Adresse</g>
					<g name="StreetName">Gate</g>
					<g name="AdditionalStreetName">Tilleggsgate</g>
					<g name="BuildingNumber">Husnummer</g>
					<g name="Department">Avdeling</g>
					<g name="CityName">By</g>
					<g name="PostalZone">Postnummer</g>
					<g name="CountrySubentity">Fylke</g>
					<g name="Country">Land</g>
					<g name="Postbox">Postboks</g>
					
					<!--	PartyLegalEntity related	-->
					
					<g name="Party">Aktør</g>
					<g name="PartyLegalEntity">LegalAktør</g>
					<g name="CompanyID">Organisasjonsnummer</g>
					<g name="RegistrationName">Organisasjonsnavn</g>
					<g name="RegistrationAddress">Adresse</g>
					
					<!--	Contact related	-->
					<g name="ID">ID</g>
					<g name="Contact">Kontakt</g>
					<g name="Telephone">Telefon</g>
					<g name="Telefax">Fax</g>
					<g name="ElectronicMail">Epost</g>
					
					<!--	Person related	-->
					<g name="Person">Person</g>
					<g name="FirstName">Fornavn</g>
					<g name="FamilyName">Etternavn</g>
					<g name="MiddleName">Mellomnavn</g>
					<g name="JobTile">Stilling</g>
		
					<!--	PartyTaxScheme related	-->
					<g name="PartyTaxScheme">Aktør avgiftsregime</g>
					<g name="CompanyID">Organisasjons id</g>
					<g name="TaxScheme">Beskattningstype</g>
		
					<!--	PartyIdentification related	-->
					<g name="PartyIdentification">Aktøridentifikator</g>
					
					<!--	PayeeParty related	-->
					<g name="PayeeParty">Betalingsmottaker</g>
					
					<!--	Delivery related	-->
					<g name="Delivery">Levering</g>
					<g name="ActualDeliveryDate">Leveringsdato</g>
					<g name="DeliveryLocation">Sted</g>
					
					<!--	MaymentMeans related	-->
					<g name="FinancialInstitution">Finansinstitusjon</g>
					<g name="FinancialInstitutionBranch">Finansinsitusjons gren</g>
					<g name="PayeeFinancialAccount">Finansiell kontoinformasjon</g>
					<g name="PaymentMeans">Betalingsmåte</g>
					<g name="PaymentMeansPlural">Betalingsmåter</g>
					<g name="PaymentMeansCode">Betalingstype</g>
					<g name="PaymentDueDate">Forfallsdato</g>
					<g name="PaymentID">BetalingsID</g>
					<g name="PaymentChannelCode">Betalingskanalkode</g>
		
					<!--	Tax related	-->
					<g name="TaxCategory">Skattekategori</g>
					<g name="Percent">Prosent</g>
					<g name="TaxableAmount">Avgiftsgrunnlag</g>
					<g name="TaxCategory">Avgiftskategori</g>
					<g name="TaxTotal">Avgiftstotaler</g>
					<g name="TaxExemptionReasonCode">Avgiftsfritakkode</g>
					<g name="TaxExemptionReason">Avgiftsfritak årsak</g>
					<g name="TaxAmount">Total avgift</g>
					
					<!--	LegalMonetaryTotal related	-->
					<g name="LegalMonetaryTotal">Fakturatotaler</g>
					<g name="LineExtensionAmount">Netto linjebeløp</g>
					<g name="TaxExclusiveAmount">NettoBeløp</g>
					<g name="TaxInclusiveAmount">Totalbeløp inklusiv avgifter</g>
					<g name="AllowanceTotalAmount">Total rabatt</g>
					<g name="AllowanceTotalAmount">Total rabatt</g>
					<g name="ChargeTotalAmount">GebyrTotal</g>
					<g name="PrepaidAmount">ForskuddTotal</g>
					<g name="PayableRoundingAmount">Øreavrundingbeløp</g>
					<g name="PayableAmount">Betalingsbeløp</g>
		
					<!--	InvoiceLine related	-->
					<g name="Invoice">Invoice</g>
					<g name="InvoiceLine">Fakturalinje</g>
					<g name="AllowanceCharge">RabattGebyr</g>
					<g name="ChargeIndicator">Type</g>
					<g name="ChargeIndicatorTrue">Gebyr</g>
					<g name="ChargeIndicatorFalse">Rabatt</g>
					<g name="AllowanceChargeReason">Årsak</g>
					<g name="Amount">Beløp</g>
					<g name="AccountingCost">Konteringsstreng</g>
					<g name="Note">Notat</g>
					
					<g name="Item">Artikkel</g>
					<g name="Name">Navn</g>
					<g name="Description">Beskrivelse</g>
					<g name="SellersItemIdentification">Selgers ID</g>
					<g name="StandardItemIdentification">Standard ID</g>
					<g name="CommodityClassification">Vareklassifisering</g>
					<g name="ItemClassificationCode">Vareklassifiseringsverdi</g>
					<g name="Value">Verdi</g>
					<g name="AdditionalItemProperty">Tilleggsegenskaper</g>
					<g name="OrderLineReference">Ordre linjereferanse</g>
		
					<g name="BaseQuantity">Antall</g>
					<g name="MultiplierFactorNumeric">Multiplikator</g>
					<g name="InvoicedQuantity">Antall</g>
					<g name="PriceAmount">Enhetspris</g>
		
					<g name="LineTaxBase">Totalt linjebeløp før MVA</g>	
					<g name="TaxName">MVA</g>	
					<g name="TaxAmount">MVA beløp</g>	
					<g name="Total">Totalt</g>
					<g name="InvoiceLines">Fakturalinjer</g>
				</g-funcs>
			</document-merge>
		</module>	
	</xsl:variable>

	<!--Template for writing EndpointID into a div if value is not an empty string -->
	<xsl:template match="cbc:EndpointID">
		<xsl:if test=". !=''">
			<span class="UBLEndpointID value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--Template for writing PartyName into a div if value is not an empty string -->
	<xsl:template match="cbc:Name">
		<xsl:if test=". !=''">
			<span class="UBLPartyName value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="dump">
		<div class="row" style="color:red">
			<span class="label">	<xsl:value-of select="local-name()"/>: </span>
			<span class="value">	<xsl:value-of select="."/>	</span>
		</div>
	</xsl:template>
	
	<xsl:template match="cbc:ID">
		<xsl:if test=". !='' ">
			<span class="UBLID value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	<!--
		BASIC TEMPLATES ADDRESS RELATED BEGINS HERE
	-->
			<!-- Template for writing StreetName into a div if value not an empty string | required field-->
			<xsl:template match="cbc:StreetName">
				<xsl:if test=". !=''">
					<span class="UBLStreetName value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>
			
			<!-- Template for writing AdditionalStreetName into a div if value not an empty string -->
			<xsl:template match="cbc:AdditionalStreetName">
				<xsl:if test=". !=''">
					<span class="UBLAdditionalStreetName value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>
			
			<!-- Template for writing BuildingNumber into a div if value not an empty string -->
			<xsl:template match="cbc:BuildingNumber">
				<xsl:if test=". !=''">
					<span class="UBLBuildingNumber value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>
			
			<!-- Template for writing Department into a div if value not an empty string -->
			<xsl:template match="cbc:Department">
				<xsl:if test=". !=''">
					<span class="UBLDepartment value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>
			
			<!-- Template for writing CityName into a div if value not an empty string | required field -->
			<xsl:template match="cbc:CityName">
				<xsl:if test=". !=''">
					<span class="UBLCityName value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>
			
			<!-- Template for writing PostalZone into a div if value not an empty string | required field-->
			<xsl:template match="cbc:PostalZone">
				<xsl:if test=". !=''">
					<span class="UBLPostalZone value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>

			<!-- Template for writing CountrySubentity into a div if value not an empty string -->
			<xsl:template match="cbc:CountrySubentity">
				<xsl:if test=". !=''">
					<span class="UBLCountrySubentity value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>	
			
			<!-- Template for writing IdentificationCode (Country code) into a div if value not an empty string -->
			<xsl:template match="cbc:IdentificationCode">
				<xsl:if test=". !='' ">
					<span class="UBLIdentificationCode value">
						<xsl:value-of select="."/>
					</span>
				</xsl:if>
			</xsl:template>
	<!--
		BASIC TEMPLATES ADDRESS RELATED ENDS HERE
	-->
	
	<xsl:template match="cbc:CompanyID">
		<xsl:if test=". != '' ">
			<span class="UBLCompanyID value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!-- Template for writing CountrySubentity into a div if value not an empty string -->
	<xsl:template match="cbc:RegistrationName">
		<xsl:if test=". !=''">
			<span class="UBLRegistrationName value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>	
	
	<!--	CONTACT RELATED TEMPLATES STARTS HERE	-->
	<xsl:template match="cbc:ElectronicMail">
		<xsl:if test=". !='' ">
			<span class="UBLElectronicMail value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:Telefax">
		<xsl:if test=". !='' ">
			<span class="UBLTelefax value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:Telephone">
		<xsl:if test=". !='' ">
			<span class="UBLTelephone value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>

	<!--	CONTACT RELATED TEMPLATES ENDS HERE	-->

	<!--	PERSON RELATED TEMPLATES STARTS HERE	-->
		<xsl:template match="cbc:FirstName">
		<xsl:if test=". !='' ">
			<span class="UBLFirstName value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:FamilyName">
		<xsl:if test=". !='' ">
			<span class="UBLFamilyName value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:MiddleName">
		<xsl:if test=". !='' ">
			<span class="UBLMiddleName value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:JobTitle">
		<xsl:if test=". !='' ">
			<span class="UBLJobTitle value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	PERSON RELATED TEMPLATES ENDS HERE	-->
	
	<xsl:template match="cbc:ActualDeliveryDate">
		<xsl:if test=". !='' ">
			<span class="UBLActualDeliveryDate value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	PAYMENTMEANS RELATED TEMPLATES STARTS HERE	-->
	
	<xsl:template match="cbc:PaymentMeansCode">
		<xsl:if test=". !='' ">
			<span class="UBLPaymentMeansCode value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:PaymentDueDate">
		<xsl:if test=". !='' ">
			<span class="UBLPaymentDueDate value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:PaymentChannelCode">
		<xsl:if test=". !='' ">
			<span class="UBLPaymentChannelCode value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:PaymentID">
		<xsl:if test=". !='' ">
			<span class="UBLPaymentID value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	PAYMENTMEANS RELATED TEMPLATES ENDS HERE	-->
	
	<!--	TAX RELATED TEMPLATES ENDS HERE	-->
	
	<xsl:template match="cbc:TaxableAmount">
		<xsl:if test=". !='' ">
			<span class="UBLTaxableAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:TaxAmount">
		<xsl:if test=". !='' ">
			<span class="UBLTaxAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:TaxExemptionReasonCode">
		<xsl:if test=". !='' ">
			<span class="UBLTaxExemptionReasonCode value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:TaxExemptionReason">
		<xsl:if test=". !='' ">
			<span class="UBLTaxExemptionReason value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:Percent">
		<xsl:if test=". !='' ">
			<span class="UBLPercent value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
		
	<!--	TAX RELATED TEMPLATES ENDS HERE	-->


	<!--	TAX LEGALMONETARYTOTAL TEMPLATES ENDS HERE	-->
	
	<xsl:template match="cbc:LineExtensionAmount">
		<xsl:if test=". !='' ">
			<span class="UBLLineExtensionAmount value">
				<xsl:value-of select="."/><xsl:value-of select="./@currencyID"/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:TaxExclusiveAmount">
		<xsl:if test=". !='' ">
			<span class="UBLTaxExclusiveAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:TaxInclusiveAmount">
		<xsl:if test=". !='' ">
			<span class="UBLTaxInclusiveAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:AllowanceTotalAmount">
		<xsl:if test=". !='' ">
			<span class="UBLAllowanceTotalAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:ChargeTotalAmount">
		<xsl:if test=". !='' ">
			<span class="UBLChargeTotalAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:PrepaidAmount">
		<xsl:if test=". !='' ">
			<span class="UBLPrepaidAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:PayableRoundingAmount">
		<xsl:if test=". !='' ">
			<span class="UBLPayableRoundingAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cbc:PayableAmount">
		<xsl:if test=". !='' ">
			<span class="UBLPayableAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
		
	<!--	TAX LEGALMONETARYTOTAL TEMPLATES ENDS HERE	-->
	
	<xsl:template match="cbc:IssueDate">
		<xsl:if test=". !='' ">
			<span class="IssueDate value">
				<xsl:value-of select="." />
			</span>
		</xsl:if>
	</xsl:template>

	<!--	INVOICELINE TEMPLATES STARTS HERE	-->

	<!--	Optional	-->
	<xsl:template match="cbc:Note">
		<xsl:if test=". !='' ">
			<span class="UBLNote value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:InvoicedQuantity">
		<xsl:if test=". !='' ">
			<span class="UBLInvoicedQuantity value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:LineExtensionAmount">
		<xsl:if test=". !='' ">
			<span class="UBLLineExtensionAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Optional	-->
	<xsl:template match="cbc:AccountingCost">
		<xsl:if test=". !='' ">
			<span class="UBLAccountingCost value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:LineID">
		<xsl:if test=". !='' ">
			<span class="UBLLineID value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>

	<!--	Required	-->
	<xsl:template match="cbc:ChargeIndicator">
		<xsl:if test=". !='' ">
			<span class="UBLChargeIndicator value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:ChargeIndicator">
		<xsl:if test=". !='' ">
			<span class="UBLChargeIndicator value">
				<xsl:if test=". = 'true' ">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ChargeIndicatorTrue']"/>
				</xsl:if>
				<xsl:if test=". = 'false' ">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ChargeIndicatorFalse']"/>
				</xsl:if>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Recommended	-->
	<xsl:template match="cbc:AllowanceChargeReason">
		<xsl:if test=". !='' ">
			<span class="UBLAllowanceChargeReason value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:Amount">
		<xsl:if test=". !='' ">
			<span class="UBLAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:Description">
		<xsl:if test=". !='' ">
			<span class="UBLDescription value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Optional	-->
	<xsl:template match="cbc:Name">
		<xsl:if test=". !='' ">
			<span class="UBLName value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Optional	-->
	<xsl:template match="cbc:CommodityClassification">
		<xsl:if test=". !='' ">
			<span class="UBLCommodityClassification value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:Value">
		<xsl:if test=". !='' ">
			<span class="UBLValue value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:PriceAmount">
		<xsl:if test=". !='' ">
			<span class="UBLPriceAmount value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Required	-->
	<xsl:template match="cbc:BaseQuantity">
		<xsl:if test=". !='' ">
			<span class="UBLBaseQuantity value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Optional	-->
	<xsl:template match="cbc:MultiplierFactorNumeric">
		<xsl:if test=". !='' ">
			<span class="UBLMultiplierFactorNumeric value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	
	<!--	Optional	-->
	<xsl:template match="cbc:MultiplierFactorNumeric">
		<xsl:if test=". !='' ">
			<span class="UBLMultiplierFactorNumeric value">
				<xsl:value-of select="."/>
			</span>
		</xsl:if>
	</xsl:template>
	<!--	INVOICELINE TEMPLATES ENDS HERE	-->

	<!-- 
		COMPLEX TEMPLATES USES ONLY BASIC TEMPLATES IN TEMPLATE DEFINITION
	-->
	<xsl:template name="genPath">
    <xsl:param name="prevPath"/>
    <xsl:variable name="currPath" select="concat('/',name(),'[',
      count(preceding-sibling::*[name() = name(current())])+1,']',$prevPath)"/>
    <xsl:for-each select="parent::*">
      <xsl:call-template name="genPath">
        <xsl:with-param name="prevPath" select="$currPath"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:if test="not(parent::*)">
      <xsl:value-of select="$currPath"/>      
    </xsl:if>
  </xsl:template>
  	
	<!--Universal template. Template for writing elements not coverd by any template These will be styled red -->
	<xsl:template match="* | text() | @*" mode="dump">
		<xsl:if test="text()">
		<div class="row dump" style="color:red">
			<span class="lable"><xsl:call-template name="genPath"/>:</span>&#160;<span class="value"><xsl:value-of select="."/></span>
		</div>
		</xsl:if>
		<xsl:apply-templates select="node()|@*" mode="dump"/>
	</xsl:template>
	
	<!-- TaxSceme must contain CompanyID-->
	<xsl:template match="cac:TaxScheme">
		<xsl:if test=". !='' ">
			<xsl:if test="cbc:ID">
				<div class="UBLTaxScheme row">
						<span class="label">
							<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxScheme']"/>:
						</span>
						<span class="UBLCompanyID value">
							<xsl:apply-templates select="cbc:ID"/>
						</span>
				</div>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<!-- Complex DUMP template for TaxSceme-->
	<xsl:template match="cac:TaxScheme" mode="dump">
		<xsl:if test=". !='' ">
			<xsl:apply-templates select="./*[not(self::cbc:ID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Compex template for PartyName	-->
	<xsl:template match="cac:PartyName">
		<xsl:if test=". !='' ">
			<div class="row">
<!--				<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PartyName']"/>:	</span>
-->				<span class="value">	<xsl:apply-templates select="cbc:Name"/>	</span>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Compex DUMP template for PartyName	-->
	<xsl:template match="cac:PartyName" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="*[not(self::cbc:Name) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>

	<!--	Compex template for PartyIdentification	-->
	<xsl:template match="cac:PartyIdentification">
		<xsl:if test=". !='' ">
			<div class="row">
				<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PartyIdentification']"/>:	</span>
				<span class="value">	<xsl:apply-templates select="cbc:ID"/>	</span>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Compex DUMP template for PartyIdentification	-->
	<xsl:template match="cac:PartyIdentification" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cac:Country" mode="short">
		<xsl:if test=". !='' ">
			<div class="row">
				<!--span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Country']"/>:	</span-->
				<span class="value identification-code">	<xsl:apply-templates select="cbc:IdentificationCode"/>	</span>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Compex template for Country	-->
	<xsl:template match="cac:Country">
		<xsl:if test=". !='' ">
			<div class="row">
				<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Country']"/>:	</span>
				<span class="value identification-code">	<xsl:apply-templates select="cbc:IdentificationCode"/>	</span>
			</div>
		</xsl:if>
	</xsl:template>
	
		<!--	Compex DUMP template for Country	-->
	<xsl:template match="cac:Country" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:IdentificationCode) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cac:PostalAddress | cac:DeliveryAddress | cac:Address | cac:JurisdictionRegionAddress | cac:OriginAddress | cac:RegistrationAddress" mode="short">
		<xsl:if test=". !='' ">
			<xsl:if test="cbc:Postbox">
				<div class="row"><span class="value"><xsl:value-of select="cbc:Postbox"/></span></div>
			</xsl:if>
			<xsl:if test="cbc:StreetName">
					<div class="row"><span class="value"><xsl:value-of select="./cbc:StreetName"/></span></div>
			</xsl:if>
			<xsl:if test="cbc:AdditionalStreetName">
				<div class="row"><span class="value"><xsl:value-of select="cbc:AdditionalStreetName"/></span></div>
			</xsl:if>
			<xsl:if test="cbc:PostalZone">
				<div class="row">
					<span class="value"><xsl:value-of select="cbc:PostalZone"/></span>&#160;<span class="value"><xsl:value-of select="cbc:CityName"/></span>
				</div>
			</xsl:if>
			<xsl:apply-templates select="cac:Country" mode="short" />
		</xsl:if>
	</xsl:template>

	<!-- Complex template for PostalAddress, DeliveryAddress, Address, JurisdictionRegionAddress, OriginAddress and RegistrationAddress
		Writing out multiple elements related to address. 
	-->
	<xsl:template match="cac:PostalAddress | cac:DeliveryAddress | cac:Address | cac:JurisdictionRegionAddress | cac:OriginAddress | cac:RegistrationAddress">
		<xsl:if test=". !='' ">
			<div class="Address holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Address']"/>:	</span>
				<xsl:if test="cbc:StreetName">
						<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='StreetName']"/>:
						</span><span class="value"><xsl:value-of select="./cbc:StreetName"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:AdditionalStreetName">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AdditionalStreetName']"/>:
					</span><span class="value"><xsl:value-of select="cbc:AdditionalStreetName"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:BuildingNumber">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='BuildingNumber']"/>:
					</span><span class="value"><xsl:value-of select="cbc:BuildingNumber"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:Department">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Department']"/>:
					</span><span class="value"><xsl:value-of select="cbc:Department"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:CityName">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='CityName']"/>:
					</span><span class="value"><xsl:value-of select="cbc:CityName"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:PostalZone">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PostalZone']"/>:
					</span><span class="value"><xsl:value-of select="cbc:PostalZone"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:CountrySubentity">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='CountrySubentity']"/>:
					</span><span class="value"><xsl:value-of select="cbc:CountrySubentity"/></span></div>
				</xsl:if>
				<xsl:apply-templates select="cac:Country" />
				<xsl:if test="cbc:Postbox">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Postbox']"/>:
					</span><span class="value"><xsl:value-of select="cbc:Postbox"/></span></div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!-- Complex DUMP template for PostalAddress, DeliveryAddress, Address, JurisdictionRegionAddress, OriginAddress and RegistrationAddress
		Writing out multiple elements related to address. -->
	<xsl:template match="cac:PostalAddress | cac:DeliveryAddress | cac:Address | cac:JurisdictionRegionAddress | cac:OriginAddress | cac:RegistrationAddress" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:CountrySubentity) and not(self::cbc:PostalZone) and not(self::cbc:CityName) and not(self::cbc:Department) and not(self::cbc:BuildingNumber) and not(self::cbc:AdditionalStreetName) and not(self::cbc:StreetName) and not(self::cbc:Postbox)] " mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for PartyTaxScheme	-->
	<xsl:template match="cac:PartyTaxScheme">
		<xsl:if test=". !='' ">
			<div class="UBLPartyTaxSceme holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PartyTaxScheme']"/>:	</span>
				<xsl:if test="cbc:CompanyID">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='CompanyID']"/>:</span>
					<span class="value"><xsl:apply-templates select="cbc:CompanyID"/></span></div>
				</xsl:if>
				<xsl:if test="cac:TaxScheme">
					<xsl:apply-templates select="cac:TaxScheme"/>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex DUMP template for PartyTaxScheme	-->
	<xsl:template match="cac:PartyTaxScheme" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:CompanyID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for PartyLegalEntity	-->
	<xsl:template match="cac:PartyLegalEntity" mode="short">
		<xsl:if test=". !='' ">
				<xsl:if test="cbc:CompanyID">
					<div class="row">
						<span class="label"><xsl:value-of select="cbc:CompanyID/@schemeID"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:CompanyID"/></span></div>
				</xsl:if>
		</xsl:if>
	</xsl:template>

	<!--	Complex template for PartyLegalEntity	-->
	<xsl:template match="cac:PartyLegalEntity">
		<xsl:if test=". !='' ">
			<div class="ubl-party-legal-entity holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PartyLegalEntity']"/>:	</span>
				<xsl:if test="cbc:RegistrationName">
					<div class="row">
						<span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='RegistrationName']"/>:</span>
						<span class="value"><xsl:apply-templates select="cbc:RegistrationName"/></span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:CompanyID">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='CompanyID']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:CompanyID"/></span></div>
				</xsl:if>
				<xsl:if test="cac:RegistrationAddress">
					<xsl:apply-templates select="cac:RegistrationAddress"/>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex DUMP template for PartyLegalEntity	-->
	<xsl:template match="cac:PartyLegalEntity" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:CompanyID) and not(self::cbc:RegistrationName) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for Contact	-->
	<xsl:template match="cac:Contact">
		<xsl:if test=". !='' ">
			<div class="UBLContact holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Contact']"/>:	</span>
				<xsl:if test="cbc:ID">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:ID"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:Telephone">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Telephone']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:Telephone"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:Telefax">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Telefax']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:Telefax"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:ElectronicMail">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ElectronicMail']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:ElectronicMail"/></span></div>
				</xsl:if>
				<!--	Writing out additional nodes if present, if no spesific template exist the universal template will be triggered and mark them as red	-->
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex DUMP template for Contact	-->
	<xsl:template match="cac:Contact" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ID) and not(self::cbc:Telephone) and not(self::cbc:Telefax) and not(self::cbc:ElectronicMail) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>	

	<!--	Complex template for Person	-->
	<xsl:template match="cac:Person">
		<xsl:if test=". !='' ">
			<div class="UBLPerson holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Person']"/>:	</span>
				<xsl:if test="cbc:FirstName">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='FirstName']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:FirstName"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:FamilyName">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='FamilyName']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:FamilyName"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:MiddleName">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='MiddleName']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:MiddleName"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:JobTitle">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='JobTitle']"/>:
					</span><span class="value"><xsl:apply-templates select="cbc:JobTitle"/></span></div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex DUMP template for Person	-->
	<xsl:template match="cac:Person" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:JobTitle) and not(self::cbc:MiddleName) and not(self::cbc:FamilyName) and not(self::cbc:FirstName) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cac:Party" mode="short">
		<xsl:if test=". !='' ">
			<div class="holder party">
				<xsl:apply-templates select="cac:PartyName"/>					
				<xsl:apply-templates select="cac:PostalAddress" mode="short"/>
				<xsl:apply-templates select="cac:PartyLegalEntity" mode="short"/>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex template for Party	-->
	<xsl:template match="cac:Party">
		<xsl:if test=". !='' ">
			<div class="holder party">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Party']"/>:	</span>
				
				<xsl:apply-templates select="cac:PartyName"/>
				<xsl:apply-templates select="cac:PartyLegalEntity"/>
					
				<xsl:if test="cbc:EndpointID">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='EndpointID']"/>:</span>
					<span class="value"><xsl:apply-templates select="cbc:EndpointID"/></span></div>
				</xsl:if>
				
				<xsl:apply-templates select="cac:PartyIdentification"/>
				<xsl:apply-templates select="cac:PostalAddress"/>
				<xsl:apply-templates select="cac:PartyTaxScheme"/>
				<xsl:apply-templates select="cac:PartyLegalEntity"/>
				<xsl:apply-templates select="cac:Contact"/>
				<xsl:apply-templates select="cac:Person"/>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex DUMP template for Party	-->
	<xsl:template match="cac:Party" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:EndpointID)]" mode="dump"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cac:AccountingSupplierParty | cac:AccountingCustomerParty" mode="short">
			<div class="holder accounting-supplier-party/accounting-customer-party">
				<xsl:apply-templates select="cac:Party" mode="short"/>
			</div>
	</xsl:template>
	
	<!--	Complex template for AccountingSupplierParty and AccountingCustomerParty	-->
	<xsl:template match="cac:AccountingSupplierParty | cac:AccountingCustomerParty">
		<xsl:if test=". !='' ">
			<div class="holder accounting-supplier-party/accounting-customer-party">
				<span class="holder-header">
					<xsl:choose>
						<xsl:when test="local-name() = 'AccountingSupplierParty'">
							<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AccountingSupplierParty']"/>:
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AccountingCustomerParty']"/>:
						</xsl:otherwise>
					</xsl:choose>
				</span>
				
				<xsl:apply-templates select="cac:Party"/>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex DUMP template for AccountingSupplierParty and AccountingCustomerParty	-->
	<xsl:template match="cac:AccountingSupplierParty | cac:AccountingCustomerParty" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="* " mode="dump" />
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for PayeeParty	-->
	<xsl:template match="cac:PayeeParty">
		<xsl:if test=". !='' ">
			<div class="UBLPayeeParty holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PayeeParty']"/>:	</span>
				<!--	Writing out additional nodes if present, if no spesific template exist the universal template will be triggered and mark them as red	-->
				<xsl:apply-templates select="cac:PartyName"/>
				<xsl:apply-templates select="cac:PartyIdentification"/>
				<xsl:apply-templates select="cac:PartyLegalEntity"/>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex DUMP template for PayeeParty	-->
	<xsl:template match="cac:PayeeParty" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*" mode="dump"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cac:DeliveryLocation" mode="short">
		<xsl:if test=". !='' ">
				<xsl:if test="cbc:ID">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:</span>
					<span class="value"><xsl:apply-templates select="cbc:ID"/></span></div>
				</xsl:if>
				
				<xsl:if test="cac:Address">
					<xsl:apply-templates select="cac:Address" mode="short"/>
				</xsl:if>
		</xsl:if>
	</xsl:template>

	<!--	Complex template for DeliveryLocation	-->
	<xsl:template match="cac:DeliveryLocation">
		<xsl:if test=". !='' ">
			<div class="UBLDeliveryLocation holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='DeliveryLocation']"/>:	</span>
				
				<xsl:if test="cbc:ID">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:</span>
					<span class="value"><xsl:apply-templates select="cbc:ID"/></span></div>
				</xsl:if>
				
				<xsl:if test="cac:Address">
					<xsl:apply-templates select="cac:Address" />
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex DUMP template for DeliveryLocation	-->
	<xsl:template match="cac:DeliveryLocation" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="cac:Delivery" mode="short">
		<xsl:if test=". !='' ">
			<div class="holder">
				<div class="holder">
				<div class="row">
					<span class="holder-header"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Delivery']"/>:</span>
				</div>
				<xsl:if test="cbc:ActualDeliveryDate">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ActualDeliveryDate']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:ActualDeliveryDate" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cac:DeliveryLocation">
					<xsl:apply-templates select="cac:DeliveryLocation" mode="short"/>
				</xsl:if>
			</div>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex template for Delivery	-->
	<xsl:template match="cac:Delivery">
		<xsl:if test=". !='' ">
			<div class="UBLDelivery holder">
				<span class="holder-header"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Delivery']"/>:</span>
				<xsl:if test="cbc:ActualDeliveryDate">
					<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ActualDeliveryDate']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:ActualDeliveryDate" />	</span>
				</xsl:if>
				<xsl:if test="cac:DeliveryLocation">
					<xsl:apply-templates select="cac:DeliveryLocation" />
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
<!--	Complex DUMP template for Delivery	-->
	<xsl:template match="cac:Delivery" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ActualDeliveryDate) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	PAYMENTMEANS RELATED TEMPLATES STARTS HERE	-->
	
	<!--	Complex template for FinancialInstitution	-->
	<xsl:template match="cac:FinancialInstitution">
		<xsl:if test=". !='' ">
			<div class="UBLFinancialInstitution holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='FinancialInstitution']"/>:		</span>
				<xsl:if test="cbc:ID and cbc:ID!='' ">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:ID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:ID= '' ">
					<span class="value">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='null']"/></span>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
		<!--	Complex template for FinancialInstitution	-->
	<xsl:template match="cac:FinancialInstitution" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for FinancialInstitutionBrance	-->
	<xsl:template match="cac:FinancialInstitutionBranch">
		<xsl:if test=". !='' ">
			<div class="UBLFinancialInstitutionBranch holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='FinancialInstitutionBranch']"/>:	</span>
				<xsl:if test="cac:FinancialInstitution">
					<xsl:if test="cbc:ID and cbc:ID!='' ">
						<div class="row">
							<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:	</span>
							<span class="value">	<xsl:apply-templates select="cbc:ID" />	</span>
						</div>
					</xsl:if>
					<xsl:if test="cac:FinancialInstitution">
						<xsl:apply-templates select="cac:FinancialInstitution"/>
					</xsl:if>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex DUMP template for FinancialInstitutionBrance	-->
	<xsl:template match="cac:FinancialInstitutionBranch" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ID)]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for PayeeFinancialAccount	-->
	<xsl:template match="cac:PayeeFinancialAccount">
		<xsl:if test=". !='' ">
			<div class="UBLPayeeFinancialAccount holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PayeeFinancialAccount']"/>:	</span>
				<xsl:if test="cbc:ID and cbc:ID!='' ">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:	</span>
						<xsl:apply-templates select="cbc:ID"/>
					</div>
				</xsl:if>
				<xsl:apply-templates select="cac:FinancialInstitutionBranch"/>
			</div>
		</xsl:if>
	</xsl:template>

	<!--	Complex DUMP template for PayeeFinancialAccount	-->
	<xsl:template match="cac:PayeeFinancialAccount" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for PaymentMeans	-->
	<xsl:template match="cac:PaymentMeans">
		<xsl:if test=". !='' ">
			<div class="UBLPaymentMeans holder content">
				<xsl:if test="cbc:PaymentMeansCode">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentMeansCode']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:PaymentMeansCode" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:PaymentDueDate">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentDueDate']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:PaymentDueDate" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:PaymentChannelCode">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentChannelCode']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:PaymentChannelCode" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:PaymentID">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentID']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:PaymentID" />	</span>
					</div>
				</xsl:if>
				<xsl:apply-templates select="cac:PayeeFinancialAccount" />
			</div>
		</xsl:if>
	</xsl:template>
	<!--	Complex template for PaymentMeans	-->
	<xsl:template match="cac:PaymentMeans" mode="bill">
		<xsl:if test=". !='' ">
			<div class="bill payment-menas">
				<div class="bill">
					<div class="kvitteringtopp">
						<div class="kvitteringtoptekst">
							Kvittering
						</div>
						<div class="kvitteringfelter">
							<div class="innbetaltkonto">
								<div class="felttekst">
									Innbetalt til konto
								</div>
								<div class="feltboks">
									<xsl:value-of select="cac:PayeeFinancialAccount/cbc:ID" />
								</div>
							</div>
							<div class="belop">
								<div class="felttekst">
									Beløp
								</div>
								<div class="feltboks hvit">
									<span><xsl:value-of select="/i2:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount" /></span>
								</div>
							</div>
							<div class="betalerkonto">
								<div class="felttekst">
									Betalerens kontonummer
								</div>
								<div class="feltboks hvit">
									<xsl:value-of select="/i2:Invoice/cbc:AccountingCost" />
								</div>
							</div>
							<div class="blankett">
								<div class="felttekst">
									Blankettnummer
								</div>
								<div class="feltboks hvit">
									
								</div>
							</div>
						</div>
					</div>
					<div class="kvitteringmidt">
						<div class="betalingsinfogiro">
							<div class="tekstgirofrist">
								<div class="betalingsinfotekst">
									Betalingsinformasjon
								</div>
								<div class="girotekst">
									GIRO
								</div>
								<div class="betalingsfristtekst">
									Betalings- frist
								</div>
								<div class="betalingsfristboks">
									<xsl:value-of select="./cbc:PaymentDueDate" />
								</div>
							</div>
							<div class="infosignatur">
								<div class="betalingsinfo">
									<div class="betalingsinfoboks">
										Fakturanr.: <xsl:value-of select="/i2:Invoice/cbc:ID" /><br/>
										<xsl:if test="/i2:Invoice/cbc:Note">
											<br/><span class="note" >Note:</span><span class="note"><xsl:value-of	select="/i2:Invoice/cbc:Note" /></span>
										</xsl:if>
									</div>
								</div>
								<div class="signatur">
									<div class="signaturtekst">
										Underskrift ved girering
									</div>
									<div class="signaturboks">
									</div>
								</div>
							</div>
						</div>
						<div class="betalttilav"> 
							<div class="av">
								<div class="avtiltekst">
									Betalt av
								</div>
								<div class="avtilboks">
									<span class="PartyName">	<xsl:apply-templates select="/i2:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name" /></span><br/>
									
									<span class="gate">	<xsl:value-of select="/i2:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" />	</span><br/><br/>
									
									<span class="PostalZone"><xsl:value-of select="/i2:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" /></span><span class="CityName"><xsl:value-of select="/i2:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" /></span>
								</div>
							</div>
							<div class="til">
								<div class="avtiltekst">
									Betalt til
								</div>
								<div class="avtilboks">
									<span class="PartyName">	<xsl:apply-templates select="/i2:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name" /></span><br/>
									
									<span class="gate">	<xsl:value-of select="/i2:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" />	</span><br/><br/>
									
									<span class="PostalZone"><xsl:value-of select="/i2:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" /></span><span class="CityName"><xsl:value-of select="/i2:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" /></span>
								</div>
							</div>                    
						</div>
					</div>
					<div class="kvitteringbunn">
						<div class="belast">
							<div class="belasttekst">
								Belast konto
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="belastrute">
							</div>
							<div class="kvitteringtekst">
								Kvittering tilbake
							</div>
							<div class="kvitteringrute">
							</div>
						</div>
						<div class="kidsumkonto">
							<div class="kid">
								<div class="felttekst">
									Kundeidentifikasjon (KID)
								</div>
								<div class="feltboks">
									<xsl:apply-templates select="cbc:PaymentID" />
								</div>
							</div>    
							<div class="kroner">
								<div class="felttekst">
									Kroner
								</div>
								<div class="feltboks">
									<xsl:value-of select="floor(/i2:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount)" />
								</div>
							</div>
							<div class="ore">
								<div class="felttekst">
									Øre
								</div>
								<div class="feltboks">
									<xsl:value-of select="round((/i2:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount - floor(/i2:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount))*100)" />
								</div>
							</div>
							<div class="konto">
								<div class="felttekst">
									Til konto
								</div>
								<div class="feltboks">
								   <xsl:apply-templates select="cac:PayeeFinancialAccount/cbc:ID" />
								</div>
							</div>
							<div class="blankettnr">
								<div class="felttekst">
									Blankettnummer
								</div>
								<div class="feltboks">
									
								</div>
							</div>  
						</div> 
					</div> 
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<!--	Complex DUMP template for PaymentMeans	-->
	<xsl:template match="cac:PaymentMeans" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:PaymentID) and not(self::cbc:PaymentChannelCode) and not(self::cbc:PaymentDueDate) and not(self::cbc:PaymentMeansCode)]" mode="dump"/>
		</xsl:if>
	</xsl:template>

	<!--	PAYMENTMEANS RELATED TEMPLATES STARTS HERE	-->
	
	<!--	TAX RELATED TEMPLATES STARTS HERE	-->
	
	<!-- Complex template for TaxCategory or ClassifiedTaxCategory -->
	<xsl:template match="cac:TaxCategory | cac:ClassifiedTaxCategory">
		<xsl:if test=". !='' ">
			<div class="UBLTaxCategory holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxCategory']"/>:	</span>
				<xsl:if test="cbc:ID != '' ">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:ID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:Percent != '' ">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Percent']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:Percent" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:TaxExemptionReasonCode != '' ">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxExemptionReasonCode']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxExemptionReasonCode" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:TaxExemptionReason != '' ">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxExemptionReason']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxExemptionReason" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cac:TaxScheme != '' ">	
					<xsl:apply-templates select="cac:TaxScheme" />
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMP template for TaxCategory or ClassifiedTaxCategory -->
	<xsl:template match="cac:TaxCategory | cac:ClassifiedTaxCategory" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:Percent) and not(self::cbc:ID) and not(self::cbc:TaxExemptionReasonCode) and not(self::cbc:TaxExemptionReason) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>	
	
	<!-- Complex template for TaxSubtotal -->
	<xsl:template match="cac:TaxSubtotal">
		<xsl:if test=". !='' ">
			<div class="UBLTaxSubtotal holder">
				<xsl:if test="cbc:TaxableAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxableAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxableAmount" /> 	<xsl:apply-templates select="cbc:TaxableAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:TaxAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxAmount" />	<xsl:apply-templates select="cbc:TaxAmount/@currencyID" />		</span>
					</div>
				</xsl:if>
				<xsl:apply-templates select="cac:TaxCategory" />
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMP template for TaxSubtotal -->
	<xsl:template match="cac:TaxSubtotal" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:TaxAmount) and not(self::cbc:TaxableAmount) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!-- Complex template for TaxTotal -->
	<xsl:template match="cac:TaxTotal">
		<xsl:if test=". !='' ">
			<div class="UBLTaxTotal holder">
				<span class="holder-header"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxTotal']"/>:</span>
				<xsl:if test="cbc:TaxAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxAmount" /> 	<xsl:apply-templates select="cbc:TaxAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				
				<xsl:if test="cac:TaxSubtotal">
					<xsl:apply-templates select="cac:TaxSubtotal" />
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	
	<!-- Complex DUMP template for TaxTotal -->
	<xsl:template match="cac:TaxTotal" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:TaxAmount) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	TAX RELATED TEMPLATES ENDS HERE	-->


	<!--	Complex template for LegalMonetaryTotal	-->
	<xsl:template match="cac:LegalMonetaryTotal">
		<xsl:if test=". !='' ">
			<div class="ubl-legal-monetary-total holder">
				<xsl:if test="cbc:LineExtensionAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineExtensionAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:LineExtensionAmount" /> 	<xsl:apply-templates select="cbc:LineExtensionAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:LineExtensionAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxExclusiveAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxExclusiveAmount" /> 	<xsl:apply-templates select="cbc:TaxExclusiveAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:TaxInclusiveAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxInclusiveAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:TaxInclusiveAmount" /> 	<xsl:apply-templates select="cbc:TaxInclusiveAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:AllowanceTotalAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AllowanceTotalAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:AllowanceTotalAmount" /> 	<xsl:apply-templates select="cbc:AllowanceTotalAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:ChargeTotalAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ChargeTotalAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:ChargeTotalAmount" /> 	<xsl:apply-templates select="cbc:ChargeTotalAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:PrepaidAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PrepaidAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:ChargeTotalAmount" /> 	<xsl:apply-templates select="cbc:PrepaidAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:PayableRoundingAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PayableRoundingAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:PayableRoundingAmount" /> 	<xsl:apply-templates select="cbc:PayableRoundingAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
				<xsl:if test="cbc:PayableAmount">
					<div class="row">
						<span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PayableAmount']"/>:	</span>
						<span class="value">	<xsl:apply-templates select="cbc:PayableAmount" /> 	<xsl:apply-templates select="cbc:PayableAmount/@currencyID" />	</span>
					</div>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	<!--	Complex DUMP template for LegalMonetaryTotal	-->

	<xsl:template match="cac:LegalMonetaryTotal" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:PayableAmount) and not(self::cbc:PayableRoundingAmount) and not(self::cbc:PrepaidAmount) and not(self::cbc:ChargeTotalAmount) and not(self::cbc:AllowanceTotalAmount) and not(self::cbc:TaxInclusiveAmount) and not(self::cbc:TaxExclusiveAmount) and not(self::cbc:LineExtensionAmount) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	INVOICELINE TEMPLATES STARTS HERE	-->
	
	<!--	Complex template for OrderLineReference	-->
	<xsl:template match="cac:OrderLineReference">
		<xsl:if test=". !='' ">
			<span class="UBLOrderLineReference">
				<xsl:apply-templates select="cbc:LineID" />
			</span>
		</xsl:if>
	</xsl:template>
	<!--	Complex DUMP template for OrderLineReference	-->
	<xsl:template match="cac:OrderLineReference" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:LineID) ]" />
		</xsl:if>
	</xsl:template>
	
	<!-- Complex template for AllowenceCharge -->
	<xsl:template match="cac:AllowanceCharge">
		<xsl:if test=". !='' ">
			<div class="UBLAllowanceCharge holder">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AllowanceCharge']"/>:	</span>
				<xsl:if test="cbc:ChargeIndicator != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ChargeIndicator']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:ChargeIndicator" />	</span></div>
				</xsl:if>
				
				<xsl:if test="cbc:AllowanceChargeReason != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AllowanceChargeReason']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:AllowanceChargeReason" />	</span></div>
				</xsl:if>
				
				<xsl:if test="cbc:MultiplierFactorNumeric != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='MultiplierFactorNumeric']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:MultiplierFactorNumeric" />	</span></div>
				</xsl:if>
				
				<xsl:if test="cbc:Amount != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Amount']"/>:	</span>
					<span class="value">	<span><xsl:apply-templates select="cbc:Amount" /></span><span><xsl:apply-templates select="cbc:Amount/@currencyID" /></span>	</span></div>
				</xsl:if>
				
				<xsl:if test="cbc:BaseAmount != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='BaseAmount']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:BaseAmount" />	</span></div>
				</xsl:if>
				
				<xsl:if test="cac:TaxCategory != '' ">
					<xsl:apply-templates select="cac:TaxCategory" />
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMP template for AllowenceCharge -->
	<xsl:template match="cac:AllowanceCharge" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:BaseAmount) and not(self::cbc:Amount) and not(self::cbc:MultiplierFactorNumeric) and not(self::cbc:AllowanceChargeReason) and not(self::cbc:ChargeIndicator) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for SellersItemIdentification -->
	<xsl:template match="cac:SellersItemIdentification">
		<xsl:if test=". !='' ">
			<div class="row">
				<span class="UBLSellersItemIdentification label">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='SellersItemIdentification']"/>:
				</span>
				<span class="value">
					<xsl:apply-templates  select="cbc:ID"/>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
	<!--	Complex DUMP template for SellersItemIdentification -->
	<xsl:template match="cac:SellersItemIdentification" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:ID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	
	<!-- Complex template for StandardItemIdentification -->
	<xsl:template match="cac:StandardItemIdentification">
		<xsl:if test=". !='' and ./cbc:ID != '' ">
			<div class="row">
				<span class="UBLStandardItemIdentification label">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='StandardItemIdentification']"/>:
				</span>
				<span class="value">
					<xsl:apply-templates  select="cbc:ID"/>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMP template for StandardItemIdentification -->
	<xsl:template match="cac:StandardItemIdentification" mode="dump">
		<xsl:if test=". !='' and ./cbc:ID != '' ">
				<xsl:apply-templates  select="./*[not(self::cbc:ID) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!-- Complex template for CommodityClassification -->
	<xsl:template match="cac:CommodityClassification">
		<xsl:if test=". !='' and ./cbc:ID != '' ">
			<div class="row">
				<span class="UBLCommodityClassification label">
					<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='CommodityClassification']"/>:
				</span>
				<span class="value">
					<xsl:apply-templates  select="cbc:CommodityClassification"/>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMPtemplate for CommodityClassification -->
	<xsl:template match="cac:CommodityClassification" mode="dump">
		<xsl:if test=". !='' and ./cbc:ID != '' ">
				<xsl:apply-templates  select="./*[not(self::cbc:CommodityClassification) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!--	Complex template for AdditionalProperty -->
	<xsl:template match="cac:AdditionalItemProperty">
		<xsl:if test=". !='' ">
			<div class="holder UBLAdditionalItemProperty">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AdditionalItemProperty']"/>:	</span>
				<div class="row ">
					<span class="label">
						<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Name']"/>:
					</span>
					<span class="value">
						<xsl:apply-templates  select="cbc:Name"/>
					</span>
				</div>
				<div class="row ">
					<span class="label">
						<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Value']"/>:
					</span>
					<span class="value">
						<xsl:apply-templates  select="cbc:Value"/>
					</span>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<!--	Complex DUMP template for AdditionalProperty -->
	<xsl:template match="cac:AdditionalItemProperty" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates  select="./*[not(self::cbc:Value) and not(self::cbc:Name) ]" mode="dump"/>
		</xsl:if>
	</xsl:template>
	
	<!-- Complex template for Item -->
	<xsl:template match="cac:Item">
		<xsl:if test=". !='' ">
			<div class="UBLItem holder real">
				<span class="holder-header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Item']"/>:	</span>
				<xsl:if test="cbc:Description != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Description']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:Description" />	</span></div>
				</xsl:if>
				
				<xsl:if test="cbc:Name != '' ">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Name']"/>:	</span>
					<span class="value">	<xsl:apply-templates select="cbc:Name" />	</span></div>
				</xsl:if>
				
				<xsl:if test="cac:SellersItemIdentification != '' ">
					<xsl:apply-templates select="cac:SellersItemIdentification" />
				</xsl:if>

				<xsl:if test="cac:StandardItemIdentification != '' ">
					<xsl:apply-templates select="cac:StandardItemIdentification" />
				</xsl:if>
				
				<xsl:if test="cac:CommodityClassification != '' ">
					<xsl:apply-templates select="cac:CommodityClassification" />
				</xsl:if>
				
				<xsl:if test="cac:ClassifiedTaxCategory != '' ">
					<xsl:apply-templates select="cac:ClassifiedTaxCategory" />
				</xsl:if>
				<xsl:apply-templates select="cac:AdditionalItemProperty" />
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMP template for Item  -->
	<xsl:template match="cac:Item" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:Description) and not(self::cbc:Name)]" mode="dump"/>
		</xsl:if>
	</xsl:template>
		
	<!-- Complex template for Price -->
	<xsl:template match="cac:Price">
		<xsl:if test=". !='' ">
			<div class="holder NBLPrice">
				<xsl:if test="cbc:PriceAmount">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PriceAmount']"/>:	</span>
					<span class="value">	<xsl:apply-templates  select="cbc:PriceAmount"/>	</span></div>
				</xsl:if>
				<xsl:if test="cbc:BaseQuantity">
					<div class="row"><span class="label">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='BaseQuantity']"/>:	</span>
					<span class="value">	<xsl:apply-templates  select="cbc:BaseQuantity"/>	</span></div>
				</xsl:if>
				<xsl:if test="cbc:AllowanceCharge">
					<xsl:apply-templates  select="cac:AllowanceCharge"/>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- Complex DUMP template for Price -->
	<xsl:template match="cac:Price" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:AllowanceCharge) and not(self::cbc:BaseQuantity) and not(self::cbc:PriceAmount) ]" mode="dump" />
		</xsl:if>
	</xsl:template>
	
	<!--	Stripped complex template for InvoiceLine	-->
	<xsl:template match="cac:InvoiceLine" mode="stripped">
		<xsl:if test=". !='' ">
			<tr>
				<td>	<xsl:value-of select="./cbc:ID" />	</td>
				<xsl:choose>
					<xsl:when test="./cac:Item/cac:SellersItemIdentification"><td>
						<xsl:value-of select="./cac:Item/cac:SellersItemIdentification/cbc:ID"/>
					</td></xsl:when>
					
					<xsl:otherwise><td>
						<xsl:value-of select="./cac:Item/cac:StandardItemIdentification/cbc:ID"/>
					</td></xsl:otherwise>
				</xsl:choose>
				<td>	<xsl:value-of select="./cac:Item/cbc:Name"/>
					<xsl:if test="./cac:Item/cbc:Description">
						&#160;- <xsl:value-of select="./cac:Item/cbc:Description"/>
					</xsl:if>
				</td>
				<td><span class="word"><xsl:value-of select="./cbc:InvoicedQuantity" /></span><span class="word"><xsl:value-of select="./cbc:InvoicedQuantity/@unitCode" /></span>	</td>
				<td>
					<xsl:if test="./cac:Item/cac:ClassifiedTaxCategory/cbc:Percent != '' " ><xsl:value-of select="./cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" />%</xsl:if>
				</td>
				<td>
					<span><xsl:value-of select="./cac:Price/cbc:PriceAmount" /></span>&#160;<span><xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID" /></span>
				</td>
				<td>
					<span><xsl:value-of select="./cbc:LineExtensionAmount" /></span>&#160;<span><xsl:value-of select="./cbc:LineExtensionAmount/@currencyID" /></span>
				</td>
				<xsl:if test="./cac:OrderLineReference != '' or ./cbc:AccountingCost or ./cbc:Note or ./cac:Item/cac:AdditionalItemProperty!= '' "><td class="more">*</td></xsl:if>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!--	Full complex template for InvoiceLine	-->
	<xsl:template match="cac:InvoiceLine" mode="full">
		<div class="content ">
			<span class="header">	<xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='InvoiceLine']"/>	</span>
		
			<xsl:if test=". !='' ">
				<xsl:if test="cbc:ID !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='ID']"/>:</span>
					<xsl:apply-templates select="cbc:ID"/></div>
				</xsl:if>
				<xsl:if test="cbc:Note !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Note']"/>:</span>
					<xsl:apply-templates select="cbc:Note"/></div>
				</xsl:if>
				<xsl:if test="cbc:InvoicedQuantity !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='InvoicedQuantity']"/>:</span>
					<span><xsl:apply-templates select="cbc:InvoicedQuantity"/></span><span><xsl:apply-templates select="cbc:InvoicedQuantity/@unitCode"/></span></div>
				</xsl:if>
				<xsl:if test="cbc:LineExtensionAmount !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='LineExtensionAmount']"/>:</span>
					<xsl:apply-templates select="cbc:LineExtensionAmount"/></div>
				</xsl:if>
				<xsl:if test="cbc:AccountingCost !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='AccountingCost']"/>:</span>
					<xsl:apply-templates select="cbc:AccountingCost"/></div>
				</xsl:if>
				<xsl:if test="cac:OrderLineReference !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='OrderLineReference']"/>:</span>
					<xsl:apply-templates select="cac:OrderLineReference"/></div>
				</xsl:if>
				<xsl:if test="cac:Delivery !='' ">
					<div class="row"><span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='Delivery']"/>:</span>
					<xsl:apply-templates select="cac:Delivery"/></div>
				</xsl:if>
				<xsl:if test="cac:AllowanceCharge !='' ">
					<xsl:apply-templates select="cac:AllowanceCharge"/>
				</xsl:if>
				<xsl:if test="cac:TaxTotal !='' ">
					<div class="row"><span class="holder-header"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='TaxTotal']"/>:</span>
					<xsl:apply-templates select="cac:TaxTotal"/></div>
				</xsl:if>
				<xsl:if test="cac:Item !='' ">
					<xsl:apply-templates select="cac:Item"/>
				</xsl:if>
				<xsl:if test="cac:Price !='' ">
					<xsl:apply-templates select="cac:Price"/>
				</xsl:if>
			</xsl:if>
		</div>
	</xsl:template>
	<!--Complex DUMP template for InvoiceLine	-->
	<xsl:template match="cac:InvoiceLine" mode="dump">
			<xsl:apply-templates select="./*[not(self::cbc:OrderLineReference) and not(self::cbc:AccountingCost) and not(self::cbc:LineExtensionAmount) and not(self::cbc:InvoicedQuantity) and not(self::cbc:Note) and not(self::cbc:ID) ]" mode="dump" />
	</xsl:template>
	
	<!--	INVOICELINE TEMPLATES ENDS HERE	-->
	
	<!--	Complex template for PaymentTerms -->
	<xsl:template match="cac:PaymentTerms">
		<xsl:if test=". !='' ">
			<div class="row NBLPaymentTerms">
			<span class="label"><xsl:value-of select="$moduleDoc/module/document-merge/g-funcs/g[@name='PaymentTerms']"/>:</span>
			<span class="value"><xsl:apply-templates select="cbc:Note" /></span></div>
		</xsl:if>
	</xsl:template>
	<!--	Complex DUMP template for PaymentTerms -->
	<xsl:template match="cac:PaymentTerms" mode="dump">
		<xsl:if test=". !='' ">
				<xsl:apply-templates select="./*[not(self::cbc:Note)]" mode="dump"/>
		</xsl:if>
	</xsl:template>	

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
						<xsl:apply-templates select="." mode="dump "/>
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