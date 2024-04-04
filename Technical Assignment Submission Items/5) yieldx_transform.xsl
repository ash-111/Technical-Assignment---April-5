<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mp="mx.MarketParameters" xmlns:xc="mx.MarketParameters">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">


        <mp:date xc:value="20200124"> 
            <sc:security xmlns:sc="mx.MarketParameters.Securities">
                <scpr:price xmlns:scpr="mx.MarketParameters.Securities.Prices">
                    <xsl:for-each select="/file/marketdata">
                        <scpr:type xc:value="Future">
                            <!-- <xsl:variable name="MarketName" select="'ZAR BD GOV'"/> -->
                            <xsl:variable name="MarketName">
                                <xsl:choose>
                                    <xsl:when test="ContractCode = 'JSE GOVI TR'">ZA JSE</xsl:when>
                                    <xsl:when test="ContractCode = 'JSE IGOV TR'">ZA JSE</xsl:when>
                                    <xsl:otherwise>ZAR BD GOV</xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>

                            <scpr:market xc:value="{$MarketName}">
                                <scpr:label xc:value="{ContractCode}">
                                    <scpr:maturity xc:type="Fields" xc:value="{ContractExpiry}">
                                        <mp:bid1 xc:keyFormat="N"><xsl:value-of select="UncalculatedPrice"/></mp:bid1>
                                        <mp:ask1 xc:keyFormat="N"><xsl:value-of select="UncalculatedPrice"/></mp:ask1>
                                    </scpr:maturity>                                    
                                </scpr:label>
                            </scpr:market>
                        </scpr:type>
                    </xsl:for-each>
                </scpr:price>
            </sc:security>
        </mp:date>


    </xsl:template>
</xsl:stylesheet>