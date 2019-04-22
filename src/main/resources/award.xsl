<?xml version="1.0" encoding="iso-8859-1"?>
<!--  Main Template - Edit fo:block objects depending on the project
			All coments apply to the section right below-->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/1999/XSL/Format" xmlns:exsl="http://exslt.org/common">
		
		<!-- set Variables used in the main layout -->
		<xsl:output indent="yes"/>
		<xsl:variable name="pageWidth" select="11" />
		<xsl:variable name="pageHeight" select="8.5" />
		<xsl:variable name="fontSizeLarge" select="18" />
		<xsl:variable name="fontSizeMedium" select="12.5" />
		<xsl:variable name="fontSizeSmall" select="10.8" />
		<xsl:param name="borderStyle" select="'0.5pt solid black'" />
		
		
		
		<!-- PDF page main layout - Edit depending on format -->
		<xsl:template match="/">
			<fo:root font-family="Helvetica" font-size="{$fontSizeMedium}pt" font-style="normal" text-align="center">
				<fo:layout-master-set>
					<fo:simple-page-master master-name="MasterLayout" page-width="{$pageWidth}in" page-height="{$pageHeight}in" >
						<fo:region-body/>
						<fo:region-before/>
						<fo:region-after/>
					</fo:simple-page-master>
				</fo:layout-master-set>
				<xsl:apply-templates select="award"/>
			</fo:root>
		</xsl:template>
		

		
		<!-- Page Content separated by fo:block objects -->
		<xsl:template match="award">
			<fo:page-sequence master-reference="MasterLayout">
				<fo:flow flow-name="xsl-region-body">
				
						<fo:block-container position="absolute" top="{0.1 * $pageHeight}in">
							<fo:block>
								
							</fo:block>
						</fo:block-container>

				</fo:flow>
			</fo:page-sequence>
		</xsl:template>
	
	
	<!-- Reusable templates for date and string formatting -->
	
	<xsl:template name="getDelimiter">
		<xsl:param name="position" select="'1'" />
		<xsl:param name="total" select="'1'"/>
		<xsl:choose>
			<xsl:when test="$position = $total or $position &gt; $total"> 
				<xsl:text></xsl:text>
			</xsl:when>
			<xsl:when test="$position = $total - 1">
				<xsl:text> AND </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>, </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template name="yearToText">
		<xsl:param name="date"/>
		<xsl:variable name="mappedYear">
			<xsl:call-template name="mapYear">
				<xsl:with-param name="year" select="substring-before($date, '-')"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$mappedYear"/>
	</xsl:template>


	<xsl:template name="monthToText">
		<xsl:param name="date"/>
		<xsl:variable name="mappedMonth">
			<xsl:call-template name="mapMonth">
				<xsl:with-param name="month" select="substring-before(substring-after($date, '-'), '-')"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$mappedMonth"/>
	</xsl:template>


	<xsl:template name="dayToText">
		<xsl:param name="date"/>
		<xsl:variable name="mappedDay">
			<xsl:call-template name="mapDay">
				<xsl:with-param name="day" select="substring-after(substring-after($date, '-'), '-')"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$mappedDay"/>
	</xsl:template>


	<xsl:template name="mapDay">
		<xsl:param name="day"/>
		<xsl:choose>
			<xsl:when test="$day = '01'"><xsl:text>first</xsl:text></xsl:when>
			<xsl:when test="$day = '02'"><xsl:text>second</xsl:text></xsl:when>
			<xsl:when test="$day = '03'"><xsl:text>third</xsl:text></xsl:when>
			<xsl:when test="$day = '04'"><xsl:text>fourth</xsl:text></xsl:when>
			<xsl:when test="$day = '05'"><xsl:text>fifth</xsl:text></xsl:when>
			<xsl:when test="$day = '06'"><xsl:text>sixth</xsl:text></xsl:when>
			<xsl:when test="$day = '07'"><xsl:text>seventh</xsl:text></xsl:when>
			<xsl:when test="$day = '08'"><xsl:text>eighth</xsl:text></xsl:when>
			<xsl:when test="$day = '09'"><xsl:text>ninth</xsl:text></xsl:when>
			<xsl:when test="$day = '10'"><xsl:text>tenth</xsl:text></xsl:when>
			<xsl:when test="$day = '11'"><xsl:text>eleventh</xsl:text></xsl:when>
			<xsl:when test="$day = '12'"><xsl:text>twelfth</xsl:text></xsl:when>
			<xsl:when test="$day = '13'"><xsl:text>thirteenth</xsl:text></xsl:when>
			<xsl:when test="$day = '14'"><xsl:text>fourteenth</xsl:text></xsl:when>
			<xsl:when test="$day = '15'"><xsl:text>fifteenth</xsl:text></xsl:when>
			<xsl:when test="$day = '16'"><xsl:text>sixteenth</xsl:text></xsl:when>
			<xsl:when test="$day = '17'"><xsl:text>seventeenth</xsl:text></xsl:when>
			<xsl:when test="$day = '18'"><xsl:text>eighteenth</xsl:text></xsl:when>
			<xsl:when test="$day = '19'"><xsl:text>nineteenth</xsl:text></xsl:when>
			<xsl:when test="$day = '20'"><xsl:text>twentieth</xsl:text></xsl:when>
			<xsl:when test="$day = '21'"><xsl:text>twenty first</xsl:text></xsl:when>
			<xsl:when test="$day = '22'"><xsl:text>twenty second</xsl:text></xsl:when>
			<xsl:when test="$day = '23'"><xsl:text>twenty third</xsl:text></xsl:when>
			<xsl:when test="$day = '24'"><xsl:text>twenty fourth</xsl:text></xsl:when>
			<xsl:when test="$day = '25'"><xsl:text>twenty fifth</xsl:text></xsl:when>
			<xsl:when test="$day = '26'"><xsl:text>twenty sixth</xsl:text></xsl:when>
			<xsl:when test="$day = '27'"><xsl:text>twenty seventh</xsl:text></xsl:when>
			<xsl:when test="$day = '28'"><xsl:text>twenty eighth</xsl:text></xsl:when>
			<xsl:when test="$day = '29'"><xsl:text>twenty ninth</xsl:text></xsl:when>
			<xsl:when test="$day = '30'"><xsl:text>thirtieth</xsl:text></xsl:when>
			<xsl:when test="$day = '31'"><xsl:text>thirty first</xsl:text></xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$day"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="mapMonth">
		<xsl:param name="month"/>
		<xsl:choose>
			<xsl:when test="$month = '01'"><xsl:text>January</xsl:text></xsl:when>
			<xsl:when test="$month = '02'"><xsl:text>February</xsl:text></xsl:when>
			<xsl:when test="$month = '03'"><xsl:text>March</xsl:text></xsl:when>
			<xsl:when test="$month = '04'"><xsl:text>April</xsl:text></xsl:when>
			<xsl:when test="$month = '05'"><xsl:text>May</xsl:text></xsl:when>
			<xsl:when test="$month = '06'"><xsl:text>June</xsl:text></xsl:when>
			<xsl:when test="$month = '07'"><xsl:text>July</xsl:text></xsl:when>
			<xsl:when test="$month = '08'"><xsl:text>August</xsl:text></xsl:when>
			<xsl:when test="$month = '09'"><xsl:text>September</xsl:text></xsl:when>
			<xsl:when test="$month = '10'"><xsl:text>October</xsl:text></xsl:when>
			<xsl:when test="$month = '11'"><xsl:text>November</xsl:text></xsl:when>
			<xsl:when test="$month = '12'"><xsl:text>December</xsl:text></xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$month"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="mapYear">
		<xsl:param name="year"/>
		<xsl:variable name="yearPrefix">
			<xsl:call-template name="mapYearPrefix">
				<xsl:with-param name="prefix" select="substring($year, 1, 2)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="yearSuffix">
			<xsl:call-template name="mapYearSuffix">
				<xsl:with-param name="suffix" select="substring($year, 3, 4)"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$year = '1900' or $year = '2000'">
				<xsl:value-of select="$yearPrefix
				"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($yearPrefix, ' and ', $yearSuffix)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="mapYearPrefix">
		<xsl:param name="prefix"/>
		<xsl:choose>
			<xsl:when test="$prefix = '19'"><xsl:text>nineteen hundred</xsl:text></xsl:when>
			<xsl:otherwise><xsl:text>two thousand</xsl:text></xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="mapYearSuffix">
		<xsl:param name="suffix"/>
		<xsl:variable name="firstDigit" select="substring($suffix, 1, 1)"/>
		<xsl:variable name="secondDigit" select="substring($suffix, 2, 2)"/>
		<xsl:choose>
			<xsl:when test="$firstDigit = '0'">
				<xsl:call-template name="digitValue">
					<xsl:with-param name="digit" select="$secondDigit"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$firstDigit = '1'">
				<xsl:call-template name="teenYear">
					<xsl:with-param name="digit" select="$secondDigit"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="tensDigit">
					<xsl:call-template name="tensValue">
						<xsl:with-param name="digit" select="$firstDigit"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="onesDigit">
					<xsl:call-template name="digitValue">
						<xsl:with-param name="digit" select="$secondDigit"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="concat($tensDigit, ' ', $onesDigit)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="teenYear">
		<xsl:param name="digit"/>
		<xsl:choose>
			<xsl:when test="$digit = '0'"><xsl:text>ten</xsl:text></xsl:when>
			<xsl:when test="$digit = '1'"><xsl:text>eleven</xsl:text></xsl:when>
			<xsl:when test="$digit = '2'"><xsl:text>twelve</xsl:text></xsl:when>
			<xsl:when test="$digit = '3'"><xsl:text>thirteen</xsl:text></xsl:when>
			<xsl:when test="$digit = '4'"><xsl:text>fourteen</xsl:text></xsl:when>
			<xsl:when test="$digit = '5'"><xsl:text>fifteen</xsl:text></xsl:when>
			<xsl:when test="$digit = '6'"><xsl:text>sixteen</xsl:text></xsl:when>
			<xsl:when test="$digit = '7'"><xsl:text>seventeen</xsl:text></xsl:when>
			<xsl:when test="$digit = '8'"><xsl:text>eighteen</xsl:text></xsl:when>
			<xsl:when test="$digit = '9'"><xsl:text>nineteen</xsl:text></xsl:when>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="tensValue">
		<xsl:param name="digit"/>
		<xsl:choose>
			<xsl:when test="$digit='2'"><xsl:text>twenty</xsl:text></xsl:when>
			<xsl:when test="$digit='3'"><xsl:text>thirty</xsl:text></xsl:when>
			<xsl:when test="$digit='4'"><xsl:text>forty</xsl:text></xsl:when>
			<xsl:when test="$digit='5'"><xsl:text>fifty</xsl:text></xsl:when>
			<xsl:when test="$digit='6'"><xsl:text>sixty</xsl:text></xsl:when>
			<xsl:when test="$digit='7'"><xsl:text>seventy</xsl:text></xsl:when>
			<xsl:when test="$digit='8'"><xsl:text>eighty</xsl:text></xsl:when>
			<xsl:when test="$digit='9'"><xsl:text>ninety</xsl:text></xsl:when>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="digitValue">
		<xsl:param name="digit"/>
		<xsl:choose>
			<xsl:when test="$digit='1'"><xsl:text>one</xsl:text></xsl:when>
			<xsl:when test="$digit='2'"><xsl:text>two</xsl:text></xsl:when>
			<xsl:when test="$digit='3'"><xsl:text>three</xsl:text></xsl:when>
			<xsl:when test="$digit='4'"><xsl:text>four</xsl:text></xsl:when>
			<xsl:when test="$digit='5'"><xsl:text>five</xsl:text></xsl:when>
			<xsl:when test="$digit='6'"><xsl:text>six</xsl:text></xsl:when>
			<xsl:when test="$digit='7'"><xsl:text>seven</xsl:text></xsl:when>
			<xsl:when test="$digit='8'"><xsl:text>eight</xsl:text></xsl:when>
			<xsl:when test="$digit='9'"><xsl:text>nine</xsl:text></xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
