<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0"
	xmlns:xsl  = "http://www.w3.org/1999/XSL/Transform" 
	xmlns:i2 = "urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" 
	xmlns:cac  = "urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc  = "urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ccts = "urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" 
	xmlns:sdt  = "urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" 
	xmlns:udt  = "urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
	exclude-result-prefixes="i2 cac cbc ccts sdt udt"
>

	<xsl:variable name="moduleDoc" select="document('EHF_element_string_map.xsl')"/>
	
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
</xsl:stylesheet>
