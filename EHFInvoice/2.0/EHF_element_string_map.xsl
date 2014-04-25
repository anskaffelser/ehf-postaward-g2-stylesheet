<?xml version="1.0" encoding="utf-8"?>
<!--

-->
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
