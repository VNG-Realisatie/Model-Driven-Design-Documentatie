<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:fo="http://www.w3.org/1999/XSL/Format" 
		xmlns:xs="http://www.w3.org/2001/XMLSchema" 
		xmlns:fn="http://www.w3.org/2005/xpath-functions" 
		xmlns:xi="http://www.w3.org/2001/XInclude"
		xmlns:tas="http://www.vng.nl/tagsandsetereos">
		
		<xsl:output method="text" encoding="UTF-8"/>

		<xsl:variable name="metId" select="'No'"/>
		
		<xsl:variable name="static-base-uri" select="/tas:tagsandstereos/@static-base-uri"/>

	<xsl:template match="/">
		<xsl:variable name="date" select="fn:string(fn:current-date())"/>
		<xsl:text>Generated: </xsl:text><xsl:value-of select="fn:substring-before($date,'+')"/><xsl:text>

</xsl:text>
		
		<xsl:if test="$metId='Yes'">| Tagged value id</xsl:if><xsl:text>| Tagged value naam | Waar | Verplicht (in) | Beschrijving | Mogelijke waarden _(in vet de defaultwaarde)_ | Afleiding mogelijk |
</xsl:text>
		<xsl:if test="$metId='Yes'">| ---</xsl:if><xsl:text>| --- | --- | --- | --- | --- | --- |
</xsl:text>
		<xsl:variable name="alltagsets">
			<alltagsets>
				<xsl:apply-templates select="tas:tagsandstereos" mode="consolidate"/>
			</alltagsets>
		</xsl:variable>

 		<xsl:variable name="stereos">
			<stereos>
				<xsl:for-each-group select="$alltagsets//stereo" group-by="@id">
					<xsl:variable name="id" select="@id"/>
					<stereo id="{@id}"><xsl:value-of select="$alltagsets//stereotypes/stereo[@id = $id]/name[@lang='nl']"/></stereo>
				</xsl:for-each-group>
			</stereos>
		</xsl:variable>

		<xsl:variable name="descriptions">
			<descriptions>
				<xsl:for-each-group select="$alltagsets//tv" group-by="@id">
					<xsl:variable name="id" select="@id"/>
					<description id="{@id}"><xsl:apply-templates select="$alltagsets//tv[@id = $id]/desc[@lang='nl']" mode="descriptionlevel"/></description>
				</xsl:for-each-group>
			</descriptions>
		</xsl:variable>

		<xsl:variable name="examples">
			<examples>
				<xsl:for-each-group select="$alltagsets//tv" group-by="@id">
					<xsl:variable name="id" select="@id"/>
					<examples id="{@id}"><xsl:apply-templates select="$alltagsets//tv[@id = $id]/examples" mode="examples"/></examples>
				</xsl:for-each-group>
			</examples>
		</xsl:variable>

		<xsl:for-each-group select="$alltagsets//tv[.//stereo]" group-by="@id">
			<xsl:sort select="upper-case(name[@lang='nl'])" />
			<xsl:variable name="id" select="@id"/>
			<xsl:variable name="rule">
				
				<xsl:if test="$metId='Yes'">
					<xsl:text>| </xsl:text><xsl:value-of select="$id"/>
				</xsl:if>

				<xsl:if test="$metId='Yes'"><xsl:text> </xsl:text></xsl:if><xsl:text>| </xsl:text><xsl:apply-templates select="$alltagsets//tv[@id = $id and name]/name[@lang='nl']"/>

				<xsl:variable name="stereos4this">
					<xsl:apply-templates select=".//stereo"><xsl:with-param name="stereos" select="$stereos"/></xsl:apply-templates>				
				</xsl:variable>
				<xsl:text> | </xsl:text><xsl:sequence select="$stereos4this"/>
	
				<xsl:choose>
					<xsl:when test=".//stereo[starts-with(@minmax,'0')] and .//stereo[starts-with(@minmax,'1')]">
						<xsl:text> | </xsl:text><xsl:apply-templates select=".//stereo[starts-with(@minmax,'1')]"><xsl:with-param name="stereos" select="$stereos"/></xsl:apply-templates>
					</xsl:when>
					<xsl:when test=".//stereo[starts-with(@minmax,'1')]">
						<xsl:text> | Ja</xsl:text>
					</xsl:when>
					<xsl:when test=".//stereo[starts-with(@minmax,'0')]">
						<xsl:text> | Nee</xsl:text>
					</xsl:when>
				</xsl:choose>
				
				<xsl:choose>
					<xsl:when test="$descriptions//description[@id=$id]/desc">
						<xsl:apply-templates select="$descriptions//description[@id=$id]/desc"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text> | **Wie kan hier een definitie van geven ?**</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				
				<xsl:text> | </xsl:text><xsl:apply-templates select=".//declared-values[@lang='nl']"/><xsl:apply-templates select="$examples//examples[@id=$id]/example[@lang='nl']"/>
				
				<xsl:text> | </xsl:text><xsl:apply-templates select=".//derive"/><xsl:text> |</xsl:text>
			</xsl:variable>

			<xsl:value-of select="fn:normalize-space($rule)"/><xsl:text>
</xsl:text>
		</xsl:for-each-group>
	</xsl:template>
	
	<xsl:template match="name">
		<xsl:variable name="name" select="."/>

		<xsl:if test="not(preceding::name[. = $name and parent::tv])">
			<xsl:text>'</xsl:text><xsl:value-of select="."/><xsl:text>' </xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="stereo">
		<xsl:param name="stereos"/>
		
		<xsl:variable name="id" select="."/>
<xsl:value-of select="$stereos//stereo[@id=$id and not(preceding::stereo[@id=$id])]"/><xsl:if test="following-sibling::stereo"><xsl:text>, </xsl:text></xsl:if>
	</xsl:template>
	
	<xsl:template match="desc">
		<xsl:variable name="level" select="@level"/>
		
		<xsl:choose>
			<xsl:when test="not(following-sibling::desc[@level &lt; $level]) and not(preceding-sibling::desc[@level &lt; $level])">
				<xsl:choose>
					<xsl:when test=".='TODO'">
						<xsl:text> | *Wie kan hier een definitie van geven ?*</xsl:text>
					</xsl:when>
					<xsl:when test=".=''">
						<xsl:text> | *Wie kan hier een definitie van geven ?*</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text> | </xsl:text><xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="declared-values">
		<xsl:apply-templates select="value"/>
	</xsl:template>
	
	<xsl:template match="value">
		<xsl:if test="@default='yes'">*</xsl:if><xsl:text>'</xsl:text><xsl:value-of select="."/><xsl:text>'</xsl:text><xsl:if test="@default='yes'">*</xsl:if><xsl:if test="following-sibling::value"><xsl:text>, </xsl:text></xsl:if>
	</xsl:template>
	
	<xsl:template match="example">
		<xsl:variable name="level" select="@level"/>
		
		<xsl:if test="not(following-sibling::example[@level &lt; $level]) and not(preceding-sibling::example[@level &lt; $level])">
			<xsl:text>Bijv. '</xsl:text><xsl:value-of select="."/><xsl:text>'</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="derive">
		<xsl:choose>
			<xsl:when test=".='yes'">Ja</xsl:when>
			<xsl:when test=".='no'">Nee</xsl:when>
			<xsl:otherwise>Nee</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="desc" mode="descriptionlevel">
		<desc level="{count(ancestor::tagset)}">
			<xsl:value-of select="."/>
		</desc>
	</xsl:template>

	<xsl:template match="examples" mode="examples">
		<xsl:apply-templates select="example[@lang='nl']" mode="examples"/>
	</xsl:template>

	<xsl:template match="example" mode="examples">
		<example level="{count(ancestor::tagset)}" lang="{@lang}">
			<xsl:value-of select="."/>
		</example>
	</xsl:template>

	<!-- Templates for resolving xinclude. -->
	
	<xsl:template match="@*|*|text()" mode="consolidate">
		<xsl:copy>
			<xsl:apply-templates select="@*|*|text()" mode="consolidate"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="tas:tagsandstereos" mode="consolidate">
		<xsl:apply-templates select="xi:include" mode="consolidate"/>
	</xsl:template>
	
	<xsl:template match="xi:include[@href]" mode="consolidate">
		<xsl:param name="base-uri" select="''"/>
		<xsl:variable name="external-resource">
			<xsl:choose>
				<xsl:when test="$base-uri = ''">
					<xsl:value-of select="fn:concat($static-base-uri,@href)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="dynamic-base-uri">
						<xsl:call-template name="build-base-uri">
							<xsl:with-param name="uri" select="$base-uri"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="fn:concat($dynamic-base-uri,@href)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:copy-of select="fn:document(concat('file:////',$external-resource))"/>

		<xsl:variable name="inclusion">
			<xsl:copy-of select="fn:document(concat('file:////',$external-resource))"/>
		</xsl:variable>

		<xsl:apply-templates select="$inclusion//xi:include" mode="consolidate">
			<xsl:with-param name="base-uri" select="$external-resource"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template name="build-base-uri">
		<xsl:param name="uri"/>
		<xsl:param name="base-uri" select="''"/>
		
		<xsl:choose>
			<xsl:when test="contains($uri,'/')">
				<xsl:call-template name="build-base-uri">
					<xsl:with-param name="uri" select="fn:substring-after($uri,'/')"/>
					<xsl:with-param name="base-uri" select="concat($base-uri,fn:substring-before($uri,'/'),'/')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$base-uri"/>
			</xsl:otherwise>
		</xsl:choose>
	
	</xsl:template>
	
	<xsl:template match="xi:include" mode="consolidate"/>
	
</xsl:stylesheet>
