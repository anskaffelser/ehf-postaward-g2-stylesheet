<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"
    xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
    xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
    xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2"
    xmlns:sdt="urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2"
    xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2"
    exclude-result-prefixes="n1 cac cbc ccts sdt udt">
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>


    <!--Party templates from here:-->
    <xsl:template match="cac:SellerSupplierParty | cac:BuyerCustomerParty">
        <div>
            <xsl:apply-templates select="cac:Party"/>
        </div>
    </xsl:template>

    <xsl:template match="cac:Party">

        <xsl:apply-templates select="cac:PartyName"/>

        <div>
            <xsl:if test="cac:PartyIdentification/cbc:ID">
                <dl>
                    <dt>Aktør:</dt>
                    <dd><xsl:apply-templates select="cac:PartyIdentification/cbc:ID"/>
                            (<xsl:apply-templates select="cac:PartyIdentification/cbc:ID/@schemeID"
                        />) </dd>
                </dl>
            </xsl:if>
        </div>
        <div>
            <xsl:if test="cbc:EndpointID">
                <dl>
                    <dt>Endepunkt:</dt>
                    <dd><xsl:apply-templates select="cbc:EndpointID"/> (<xsl:apply-templates
                            select="cbc:EndpointID/@schemeID"/>)</dd>
                </dl>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="cac:PartyName">
        <xsl:if test="cbc:Name != ''">
            <h2>
                <xsl:apply-templates select="cbc:Name"/>
            </h2>
        </xsl:if>
    </xsl:template>

    <!-- Kontaktinfo -->

    <!--Contact from here: -->
    <xsl:template match="cac:SellerSupplierParty/cac:Party" mode="selsupcontact">
        <xsl:apply-templates select="cac:Contact"/>
    </xsl:template>
    <xsl:template match="cac:BuyerCustomerParty/cac:Party" mode="buycuscontact">
        <xsl:apply-templates select="cac:Contact"/>
    </xsl:template>

    <xsl:template match="cac:Contact">
        <div>
            <h3>Kontakt</h3>
            <dl>
                <xsl:if test="cbc:ID">
                    <dt>ID:</dt>
                    <dd>
                        <xsl:apply-templates select="cbc:ID"/>
                    </dd>
                </xsl:if>

                <xsl:if test="cbc:Name != ''">
                    <dt>Navn:</dt>
                    <dd>
                        <xsl:apply-templates select="cbc:Name"/>
                    </dd>
                </xsl:if>

                <xsl:if test="cbc:Telephone != ''">
                    <dt>Telefon:</dt>
                    <dd>
                        <xsl:apply-templates select="cbc:Telephone"/>
                    </dd>
                </xsl:if>

                <xsl:if test="cbc:Telefax != ''">
                    <dt>Telefax:</dt>
                    <dd>
                        <xsl:apply-templates select="cbc:Telefax"/>
                    </dd>
                </xsl:if>

                <xsl:if test="cbc:ElectronicMail != ''">
                    <dt>e-post:</dt>
                    <dd>
                        <xsl:apply-templates select="cbc:ElectronicMail"/>
                    </dd>
                </xsl:if>           
            </dl>
        </div>
    </xsl:template>

    <!-- Lineinfo -->
    <xsl:template match="cac:OrderLine">
        <small>
            <div class="row">
                <div class="col-1">
                    <xsl:value-of select="cac:LineItem/cbc:ID"/>
                </div>
                <div class="col-1">
                    <xsl:value-of select="cac:OrderLineReference/cbc:LineID"/>
                </div>
                <div class="col-1">
                    <xsl:apply-templates select="cac:LineItem/cbc:LineStatusCode"/>

                </div>
                <div class="col-3">
                    <xsl:apply-templates select="cac:LineItem/cac:Item"/>
                </div>

                <div class="col-1">
                    <xsl:value-of select="cac:LineItem/cbc:Quantity"/> &#160; <xsl:value-of
                        select="cac:LineItem/cbc:Quantity/@unitCode"/>
                </div>
                <div class="col-1">
                    <xsl:apply-templates
                        select="cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod"/>
                </div>
                <div class="col-2">
                    <xsl:value-of select="cac:LineItem/cbc:Note"/>
                </div>
                <div class="col-1">
                    <xsl:apply-templates select="cac:LineItem/cac:Price/cbc:PriceAmount"/>
                </div>
                <div class="col-1">
                    <xsl:apply-templates select="cac:LineItem/cac:Price/cbc:BaseQuantity"/>
                </div>
            </div>
            <xsl:apply-templates select="cac:SellerSubstitutedLineItem"/>
            <hr/>
        </small>
    </xsl:template>

    <!-- Substitute line -->
    <xsl:template match="cac:SellerSubstitutedLineItem">
        <div class="row substitute">
            <h3>Erstatningsvare</h3>
            <small>
                <div class="col-1">
                    <b> Linjenr.</b>
                    <br/>
                    <xsl:value-of select="cbc:ID"/>
                </div>
                <div class="col-2">
                    <b>Produktnavn</b>
                    <br/>
                    <xsl:value-of select="cac:Item/cbc:Name"/>
                </div>
                <div class="col-2">
                    <b>Selgers id</b>
                    <br/>
                    <xsl:apply-templates select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
                </div>
                <div class="col-2">
                    <b>Standard id</b><br/>
                    <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID"/>
                    &#160;( <xsl:value-of
                        select="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID"/>) </div>
                <div class="col-1">
                    <b>Klassifisering</b><br/>
                    <xsl:value-of
                        select="cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode"
                    />&#160;( <xsl:value-of
                        select="cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode/@listID"
                    />) </div>
                <div class="col-2">
                    <b>MVA info</b>
                    <br/>
                    <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory"/>
                </div>
                <div class="col-2">
                    <b>Tilleggsegenskaper</b>
                    <br/>
                    <xsl:apply-templates select="cac:Item/cac:AdditionalItemProperty"/>
                </div>
            </small>
        </div>




    </xsl:template>

    <!-- Produktinfo -->
    <xsl:template match="cac:LineItem/cac:Item">
        <dl>
            <xsl:if test="cbc:Name != ''">
                <dt>Produktnavn:</dt>
                <dd>
                    <xsl:apply-templates select="cbc:Name"/>
                </dd>
            </xsl:if>
            <xsl:if test="cac:SellersItemIdentification/cbc:ID != ''">
                <dt>Selgers id:</dt>
                <dd>
                    <xsl:apply-templates select="cac:SellersItemIdentification/cbc:ID"/>
                </dd>
            </xsl:if>
            <xsl:if test="cac:StandardItemIdentification/cbc:ID != ''">
                <dt>Standard id:</dt>
                <dd>
                    <xsl:apply-templates select="cac:StandardItemIdentification/cbc:ID"/>
                </dd>
            </xsl:if>
        </dl>
    </xsl:template>

    <!-- Responskoder -->
    <xsl:template match="cbc:OrderResponseCode | cbc:LineStatusCode">
        <xsl:choose>
            <xsl:when test=". = '30'"> Accepted with change (<xsl:value-of select="."/>) </xsl:when>
            <xsl:when test=". = '29'"> Accepted (<xsl:value-of select="."/>) </xsl:when>
            <xsl:when test=". = '27'"> Rejected (<xsl:value-of select="."/>) </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- Prisinfo -->

    <xsl:template match="cac:LineItem/cac:Price/cbc:PriceAmount">
        <xsl:value-of select="."/> &#160; <xsl:value-of select="./@currencyID"/>
    </xsl:template>

    <xsl:template match="cac:LineItem/cac:Price/cbc:BaseQuantity">
        <xsl:value-of select="."/> &#160; <xsl:value-of select="./@unitCode"/>
    </xsl:template>

    <!-- Leveringsdato -->
    <xsl:template match="//cac:PromisedDeliveryPeriod">
        <dl>
            <dt>Fra:</dt>
            <dd>
                <xsl:value-of select="cbc:StartDate"/>
            </dd>
            <dt>Til:</dt>
            <dd>
                <xsl:value-of select="cbc:EndDate"/>
            </dd>
        </dl>
    </xsl:template>

    <!-- MVA koder -->
    <xsl:template match="cac:ClassifiedTaxCategory">
        <dl>
            <dt>Kategori:</dt>
            <dd>
                <xsl:apply-templates select="cbc:ID"/>
            </dd>
            <xsl:if test="cbc:Percent != ''">
                <dt>MVA sats:</dt>
                <dd>
                    <xsl:apply-templates select="cbc:Percent"/>
                </dd>
            </xsl:if>
        </dl>
    </xsl:template>

    <!-- AdditionalIteminfo -->

    <xsl:template match="cac:AdditionalItemProperty">
        <dl>
            <dt>Navn:</dt>
            <dd>
                <xsl:apply-templates select="cbc:Name"/>
            </dd>

            <dt>Verdi:</dt>
            <dd>
                <xsl:apply-templates select="cbc:Value"/>
            </dd>
            <xsl:if test="cbc:ValueQuantity != ''">
                <dt>Antall</dt>
                <dd>
                    <xsl:apply-templates select="cbc:ValueQuantityD"/>&#160; <xsl:value-of
                        select="cbc:ValueQuantity/@unitCode"/>
                </dd>
            </xsl:if>
        </dl>
    </xsl:template>


    <!-- Start HTML -->

    <xsl:template match="n1:OrderResponse">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="EHF.css"/>
                <title>EHF Ordrebekreftelse</title>
            </head>

            <body>

                <div class="header">
                    <h1> Ordrebekreftelse</h1>

                    <div class="row">
                        <b>
                            <div class="col-3">ID</div>
                            <div class="col-3">Utstedelsesdato/tid</div>
                            <div class="col-3">Valutakode</div>
                            <div class="col-3">Leveringsperiode</div>
                        </b>
                    </div>

                    <div class="row">
                        <div class="col-3">
                            <xsl:value-of select="cbc:ID"/>
                        </div>
                        <div class="col-3"><xsl:value-of select="cbc:IssueDate"/>&#160;
                                <xsl:value-of select="cbc:IssueTime"/></div>
                        <div class="col-3">
                            <xsl:value-of select="cbc:DocumentCurrencyCode"/>
                        </div>
                        <div class="col-3">
                            <xsl:apply-templates select="cac:Delivery/cac:PromisedDeliveryPeriod"/>
                        </div>
                    </div>
                </div>



                <div class="status">
                    <div class="row statusheader">
                        <div class="col-3">Ordrenr</div>
                        <div class="col-7">Responsbeskrivelse</div>
                        <div class="col-2">Status</div>
                    </div>

                    <div class="row">
                        <h2>
                            <div class="col-3">
                                <xsl:value-of select="cac:OrderReference/cbc:ID"/>
                            </div>
                            <div class="col-7">
                                <xsl:if test="cbc:Note != ''">
                                    <xsl:value-of select="cbc:Note"/>
                                </xsl:if>
                            </div>
                            <div class="col-2">
                                <xsl:apply-templates select="cbc:OrderResponseCode"/>
                            </div>
                        </h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">

                        <h3>Selger</h3>
                        <p>
                            <xsl:apply-templates select="cac:SellerSupplierParty"/>
                        </p>
                        <p>
                            <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact != ''">
                                <xsl:apply-templates select="cac:SellerSupplierParty/cac:Party"
                                    mode="selsupcontact"/>
                            </xsl:if>
                        </p>
                    </div>
                    <div class="col-6">
                        <h3>Kjøper</h3>
                        <p>
                            <xsl:apply-templates select="cac:BuyerCustomerParty"/>
                        </p>
                        <p>
                            <xsl:if test="cac:BuyerCustomerParty/cac:Party/cac:Contact != ''">

                                <xsl:apply-templates select="cac:BuyerCustomerParty/cac:Party"
                                    mode="buycuscontact"/>
                            </xsl:if>
                        </p>
                    </div>
                </div>
                <hr/>

                <!-- Linjeinformasjon -->
                <xsl:if test="cac:OrderLine != ''">
                    <div class="row lineheader">
                        <div class="col-1"> Linjenr. </div>
                        <div class="col-1"> Ordrelinje </div>
                        <div class="col-1"> Status </div>
                        <div class="col-3"> Produktinfo </div>
                        <div class="col-1"> Kvantum </div>
                        <div class="col-1"> Lev.periode </div>
                        <div class="col-2"> Notat </div>
                        <div class="col-1"> Pris </div>
                        <div class="col-1"> Priskvantum </div>
                    </div>
                    <xsl:apply-templates select="cac:OrderLine"/>
                </xsl:if>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
