<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:UML="omg.org/UML1.3" xmlns:uml="http://schema.omg.org/spec/UML/2.1" xmlns:myf="www.myfunctions">
	<xsl:output method="html" encoding="UTF-8"/>
	<!--<xsl:output method="xml" encoding="UTF-8"/>-->
	
	<xsl:param name="SVNpath"/>
	<!--<xsl:param name="SVNpath" select="'file:////C:/Data/KING/Kern-taken/StUF/EAP-bronnen/XMI-data/'"/>-->
	<!--<xsl:param name="SVNpath" select="'C:/Data/KING/Kern-taken/StUF/EAP-bronnen/XMI-data/'"/>-->

	<xsl:variable name="vTextSIMtrunk" select="replace(replace(unparsed-text(concat($SVNpath,'trunk/SIMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="vTextUGMtrunk" select="replace(replace(unparsed-text(concat($SVNpath,'trunk/UGMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="vTextBSMtrunk" select="replace(replace(unparsed-text(concat($SVNpath,'trunk/BSMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="tokenized-SIMtrunkcollection" select="fn:tokenize($vTextSIMtrunk,';')"/>
	<xsl:variable name="tokenized-UGMtrunkcollection" select="fn:tokenize($vTextUGMtrunk,';')"/>
	<xsl:variable name="tokenized-BSMtrunkcollection" select="fn:tokenize($vTextBSMtrunk,';')"/>
	<xsl:variable name="trunkcollection">
		<collection>
			<xsl:for-each select="$tokenized-SIMtrunkcollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'trunk/SIM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$tokenized-UGMtrunkcollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'trunk/UGM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$tokenized-BSMtrunkcollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'trunk/BSM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
		</collection>
	</xsl:variable>

	<xsl:variable name="vTextSIMbranches" select="replace(replace(unparsed-text(concat($SVNpath,'branches/SIMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="vTextUGMbranches" select="replace(replace(unparsed-text(concat($SVNpath,'branches/UGMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="vTextBSMbranches" select="replace(replace(unparsed-text(concat($SVNpath,'branches/BSMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="tokenized-SIMbranchescollection" select="fn:tokenize($vTextSIMbranches,';')"/>
	<xsl:variable name="tokenized-UGMbranchescollection" select="fn:tokenize($vTextUGMbranches,';')"/>
	<xsl:variable name="tokenized-BSMbranchescollection" select="fn:tokenize($vTextBSMbranches,';')"/>
	<xsl:variable name="branchescollection">
		<collection>
			<xsl:for-each select="$tokenized-SIMbranchescollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'branches/SIM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$tokenized-UGMbranchescollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'branches/UGM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$tokenized-BSMbranchescollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'branches/BSM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
		</collection>
	</xsl:variable>

	<xsl:variable name="vTextSIMtags" select="replace(replace(unparsed-text(concat($SVNpath,'tags/SIMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="vTextUGMtags" select="replace(replace(unparsed-text(concat($SVNpath,'tags/UGMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="vTextBSMtags" select="replace(replace(unparsed-text(concat($SVNpath,'tags/BSMcatalogue.txt')),'\r',';'),'\n','')"/>
	<xsl:variable name="tokenized-SIMtagscollection" select="fn:tokenize($vTextSIMtags,';')"/>
	<xsl:variable name="tokenized-UGMtagscollection" select="fn:tokenize($vTextUGMtags,';')"/>
	<xsl:variable name="tokenized-BSMtagscollection" select="fn:tokenize($vTextBSMtags,';')"/>
	<xsl:variable name="tagscollection">
		<collection>
			<xsl:for-each select="$tokenized-SIMtagscollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'tags/SIM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$tokenized-UGMtagscollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'tags/UGM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$tokenized-BSMtagscollection">
				<xsl:if test=".!=''">
					<doc href="{concat($SVNpath,'tags/BSM/',.)}"/>
				</xsl:if>
			</xsl:for-each>
		</collection>
	</xsl:variable>

	<xsl:variable name="collection">
		<modelsupplieroverzicht>
<?x			<trunk>
				<xsl:for-each select="$trunkcollection//doc[contains(@href,'/SIM/')]">
					<xsl:variable name="original-filename">
						<xsl:value-of select="substring-after(@href,'/SIM/')"/>
					</xsl:variable>
					<xsl:variable name="filename">
						<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
					</xsl:variable>
					<xsl:variable name="doc" select="fn:doc(@href)"/>
					<model>
						<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
						<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
						<project><xsl:value-of select="'SIM'"/></project>
						<projectid>1</projectid>
						<type>trunk</type>
						<xsl:comment select="'Aangezien release, versie en status in de trunk steeds wijzigen leg ik deze hier niet vast.'"/>
					</model>
				</xsl:for-each>
				<xsl:for-each select="$trunkcollection//doc[contains(@href,'/UGM/')]">
					<xsl:variable name="original-filename">
						<xsl:value-of select="substring-after(@href,'/UGM/')"/>
					</xsl:variable>
					<xsl:variable name="filename">
						<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
					</xsl:variable>
					<xsl:variable name="doc" select="fn:doc(@href)"/>
					<model>
						<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
						<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
						<project><xsl:value-of select="'UGM'"/></project>
						<projectid>2</projectid>
						<type>trunk</type>
						<xsl:comment select="'Aangezien release, versie en status in de trunk steeds wijzigen leg ik deze hier niet vast.'"/>
					</model>
				</xsl:for-each>
				<xsl:for-each select="$trunkcollection//doc[contains(@href,'/BSM/')]">
					<xsl:variable name="original-filename">
						<xsl:value-of select="substring-after(@href,'/BSM/')"/>
					</xsl:variable>
					<xsl:variable name="filename">
						<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
					</xsl:variable>
					<xsl:variable name="doc" select="fn:doc(@href)"/>
					<model>
						<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
						<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
						<project><xsl:value-of select="'BSM'"/></project>
						<projectid>3</projectid>
						<type>trunk</type>
					</model>
				</xsl:for-each>
			</trunk>
			<xsl:if test="$branchescollection//doc">
				<branches>
					<xsl:for-each select="$branchescollection//doc[contains(@href,'/SIM/')]">
						<xsl:variable name="original-filename">
							<xsl:value-of select="substring-after(@href,'/SIM/')"/>
						</xsl:variable>
						<xsl:variable name="filename">
							<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
						</xsl:variable>
						<xsl:variable name="doc" select="fn:doc(@href)"/>
						<model>
							<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
							<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
							<project><xsl:value-of select="'SIM'"/></project>
							<projectid>1</projectid>
							<type>trunk</type>
							<xsl:comment select="'Aangezien release, versie en status in de trunk steeds wijzigen leg ik deze hier niet vast.'"/>
						</model>
					</xsl:for-each>
					<xsl:for-each select="$branchescollection//doc[contains(@href,'/UGM/')]">
						<xsl:variable name="original-filename">
							<xsl:value-of select="substring-after(@href,'/UGM/')"/>
						</xsl:variable>
						<xsl:variable name="filename">
							<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
						</xsl:variable>
						<xsl:variable name="doc" select="fn:doc(@href)"/>
						<model>
							<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
							<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
							<project><xsl:value-of select="'UGM'"/></project>
							<projectid>2</projectid>
							<type>trunk</type>
							<xsl:comment select="'Aangezien release, versie en status in de trunk steeds wijzigen leg ik deze hier niet vast.'"/>
						</model>
					</xsl:for-each>
					<xsl:for-each select="$branchescollection//doc[contains(@href,'/BSM/')]">
						<xsl:variable name="original-filename">
							<xsl:value-of select="substring-after(@href,'/BSM/')"/>
						</xsl:variable>
						<xsl:variable name="filename">
							<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
						</xsl:variable>
						<xsl:variable name="doc" select="fn:doc(@href)"/>
						<model>
							<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
							<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
							<project><xsl:value-of select="'BSM'"/></project>
							<projectid>3</projectid>
							<type>trunk</type>
						</model>
					</xsl:for-each>
				</branches>
			</xsl:if> ?>
			<xsl:if test="$tagscollection//doc">
				<tags>
					<xsl:for-each select="$tagscollection//doc[contains(@href,'/SIM/')]">
						<xsl:variable name="original-filename">
							<xsl:value-of select="substring-after(@href,'/SIM/')"/>
						</xsl:variable>
						<xsl:variable name="filename">
							<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
						</xsl:variable>
						<xsl:variable name="status">
							<xsl:value-of select="myf:determineStatus($filename)"/>
						</xsl:variable>
						<xsl:variable name="doc" select="fn:doc(@href)"/>
						<xsl:if test="fn:substring(fn:substring-after(fn:upper-case($filename),fn:upper-case($status)),2,1)='R'">
							<model>
								<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
								<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
								<project><xsl:value-of select="'SIM'"/></project>
								<projectid>1</projectid>
								<type>tag</type>
								<release><xsl:value-of select="$doc/XMI/XMI.content/UML:TaggedValue[upper-case(@tag)='RELEASE' and @modelElement = //XMI.content/UML:Model/@xmi.id]/@value"/></release>
								<status><xsl:value-of select="$status"/></status>
								<xsl:if test="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-NAME']">
									<xsl:variable name="supplier-name" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-NAME']/@value"/>
									<xsl:variable name="tokenized-supplier-names" select="fn:tokenize($supplier-name,';|; ')"/>
									<xsl:variable name="supplier-names">
										<supplier-names>
											<xsl:for-each select="$tokenized-supplier-names">
												<supplier-name><xsl:value-of select="."/></supplier-name>
											</xsl:for-each>
										</supplier-names>
									</xsl:variable>
									<xsl:variable name="supplier-project" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-PROJECT']/@value"/>
									<xsl:variable name="tokenized-supplier-projects" select="fn:tokenize($supplier-project,';|; ')"/>
									<xsl:variable name="supplier-projects">
										<supplier-projects>
											<xsl:for-each select="$tokenized-supplier-projects">
												<supplier-project><xsl:value-of select="."/></supplier-project>
											</xsl:for-each>
										</supplier-projects>
									</xsl:variable>
									<xsl:variable name="supplier-release" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-RELEASE']/@value"/>
									<xsl:variable name="tokenized-supplier-releases" select="fn:tokenize($supplier-release,';|; ')"/>
									<xsl:variable name="supplier-releases">
										<supplier-releases>
											<xsl:for-each select="$tokenized-supplier-releases">
												<supplier-release><xsl:value-of select="."/></supplier-release>
											</xsl:for-each>
										</supplier-releases>
									</xsl:variable>
									<suppliers>
										<xsl:call-template name="suppliers">
											<xsl:with-param name="supplier-names" select="$supplier-names"/>
											<xsl:with-param name="supplier-projects" select="$supplier-projects"/>
											<xsl:with-param name="supplier-releases" select="$supplier-releases"/>
										</xsl:call-template>
									</suppliers>
								</xsl:if>
							</model>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="$tagscollection//doc[contains(@href,'/UGM/')]">
						<xsl:variable name="original-filename">
							<xsl:value-of select="substring-after(@href,'/UGM/')"/>
						</xsl:variable>
						<xsl:variable name="filename">
							<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
						</xsl:variable>
						<xsl:variable name="status">
							<xsl:value-of select="myf:determineStatus($filename)"/>
						</xsl:variable>
						<xsl:variable name="doc" select="fn:doc(@href)"/>
						<xsl:if test="fn:substring(fn:substring-after(fn:upper-case($filename),fn:upper-case($status)),2,1)='R'">
							<model>
								<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
								<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
								<project><xsl:value-of select="'UGM'"/></project>
								<projectid>2</projectid>
								<type>tag</type>
								<release><xsl:value-of select="$doc/XMI/XMI.content/UML:TaggedValue[upper-case(@tag)='RELEASE' and @modelElement = //XMI.content/UML:Model/@xmi.id]/@value"/></release>
								<status><xsl:value-of select="$status"/></status>
								<xsl:if test="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-NAME']">
									<xsl:variable name="supplier-name" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-NAME']/@value"/>
									<xsl:variable name="tokenized-supplier-names" select="fn:tokenize($supplier-name,';|; ')"/>
									<xsl:variable name="supplier-names">
										<supplier-names>
											<xsl:for-each select="$tokenized-supplier-names">
												<supplier-name><xsl:value-of select="."/></supplier-name>
											</xsl:for-each>
										</supplier-names>
									</xsl:variable>
									<xsl:variable name="supplier-project" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-PROJECT']/@value"/>
									<xsl:variable name="tokenized-supplier-projects" select="fn:tokenize($supplier-project,';|; ')"/>
									<xsl:variable name="supplier-projects">
										<supplier-projects>
											<xsl:for-each select="$tokenized-supplier-projects">
												<supplier-project><xsl:value-of select="."/></supplier-project>
											</xsl:for-each>
										</supplier-projects>
									</xsl:variable>
									<xsl:variable name="supplier-release" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-RELEASE']/@value"/>
									<xsl:variable name="tokenized-supplier-releases" select="fn:tokenize($supplier-release,';|; ')"/>
									<xsl:variable name="supplier-releases">
										<supplier-releases>
											<xsl:for-each select="$tokenized-supplier-releases">
												<supplier-release><xsl:value-of select="."/></supplier-release>
											</xsl:for-each>
										</supplier-releases>
									</xsl:variable>
									<suppliers>
										<xsl:call-template name="suppliers">
											<xsl:with-param name="supplier-names" select="$supplier-names"/>
											<xsl:with-param name="supplier-projects" select="$supplier-projects"/>
											<xsl:with-param name="supplier-releases" select="$supplier-releases"/>
										</xsl:call-template>
									</suppliers>
								</xsl:if>
							</model>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="$tagscollection//doc[contains(@href,'/BSM/')]">
						<!--xsl:message select="@href"/-->
						<xsl:variable name="original-filename">
							<xsl:value-of select="substring-after(@href,'/BSM/')"/>
						</xsl:variable>
						<xsl:variable name="filename">
							<xsl:value-of select="myf:string-replace-all($original-filename,'%20',' ')"/>
						</xsl:variable>
						<xsl:variable name="status">
							<xsl:value-of select="myf:determineStatus($filename)"/>
						</xsl:variable>
						<xsl:variable name="doc" select="fn:doc(@href)"/>
						<xsl:if test="fn:substring(fn:substring-after(fn:upper-case($filename),fn:upper-case($status)),2,1)='R'">
							<!--xsl:message select="$filename"/-->
							<model>
								<naam><xsl:value-of select="$doc/XMI/XMI.content/UML:Model/UML:Namespace.ownedElement/UML:Package/@name"/></naam>
								<bestandsnaam><xsl:value-of select="$filename"/></bestandsnaam>
								<project><xsl:value-of select="'BSM'"/></project>
								<projectid>3</projectid>
								<type>tag</type>
								<release><xsl:value-of select="$doc/XMI/XMI.content/UML:TaggedValue[upper-case(@tag)='RELEASE' and @modelElement = //XMI.content/UML:Model/@xmi.id]/@value"/></release>
								<status><xsl:value-of select="$status"/></status>
								<xsl:if test="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-NAME']">
									<xsl:variable name="supplier-name" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-NAME']/@value"/>
									<xsl:variable name="tokenized-supplier-names" select="fn:tokenize($supplier-name,';|; ')"/>
									<xsl:variable name="supplier-names">
										<supplier-names>
											<xsl:for-each select="$tokenized-supplier-names">
												<supplier-name><xsl:value-of select="."/></supplier-name>
											</xsl:for-each>
										</supplier-names>
									</xsl:variable>
									<xsl:variable name="supplier-project" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-PROJECT']/@value"/>
									<xsl:variable name="tokenized-supplier-projects" select="fn:tokenize($supplier-project,';|; ')"/>
									<xsl:variable name="supplier-projects">
										<supplier-projects>
											<xsl:for-each select="$tokenized-supplier-projects">
												<supplier-project><xsl:value-of select="."/></supplier-project>
											</xsl:for-each>
										</supplier-projects>
									</xsl:variable>
									<xsl:variable name="supplier-release" select="$doc/XMI/XMI.content/UML:TaggedValue[fn:upper-case(@tag)='SUPPLIER-RELEASE']/@value"/>
									<xsl:variable name="tokenized-supplier-releases" select="fn:tokenize($supplier-release,';|; ')"/>
									<xsl:variable name="supplier-releases">
										<supplier-releases>
											<xsl:for-each select="$tokenized-supplier-releases">
												<supplier-release><xsl:value-of select="."/></supplier-release>
											</xsl:for-each>
										</supplier-releases>
									</xsl:variable>
									<suppliers>
										<xsl:call-template name="suppliers">
											<xsl:with-param name="supplier-names" select="$supplier-names"/>
											<xsl:with-param name="supplier-projects" select="$supplier-projects"/>
											<xsl:with-param name="supplier-releases" select="$supplier-releases"/>
										</xsl:call-template>
									</suppliers>
								</xsl:if>
							</model>
						</xsl:if>
					</xsl:for-each>
				</tags>
			</xsl:if>
		</modelsupplieroverzicht>
	</xsl:variable>

	<xsl:template name="suppliers">
		<xsl:param name="supplier-names"/>
		<xsl:param name="supplier-projects"/>
		<xsl:param name="supplier-releases"/>
		<xsl:param name="loop" select="1"/>
		
		<xsl:if test="$supplier-names//supplier-name[$loop]">
			<supplier>
				<naam><xsl:value-of select="$supplier-names//supplier-name[$loop]"/></naam>
				<project>
					<xsl:choose>
						<xsl:when test="not($supplier-projects//supplier-project[$loop])">
							<xsl:value-of select="$supplier-projects//supplier-project[1]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$supplier-projects//supplier-project[$loop]"/>
						</xsl:otherwise>
					</xsl:choose>
				</project>
				<release>
					<xsl:choose>
						<xsl:when test="not($supplier-releases//supplier-release[$loop])">
							<xsl:value-of select="$supplier-releases//supplier-release[1]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$supplier-releases//supplier-release[$loop]"/>
						</xsl:otherwise>
					</xsl:choose>
				</release>
			</supplier>
			<xsl:call-template name="suppliers">
				<xsl:with-param name="supplier-names" select="$supplier-names"/>
				<xsl:with-param name="supplier-projects" select="$supplier-projects"/>
				<xsl:with-param name="supplier-releases" select="$supplier-releases"/>
				<xsl:with-param name="loop" select="$loop+1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:function name="myf:string-replace-all">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$by" />
				<xsl:value-of select="myf:string-replace-all(substring-after($text,$replace),$replace,$by)"/>
				<!--<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text"
						select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="by" select="$by" />
				</xsl:call-template>-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:function name="myf:determineStatus">
		<xsl:param name="filename" />
	
		<xsl:choose>
			<xsl:when test="contains(fn:upper-case($filename),'IN GEBRUIK')">
				<xsl:value-of select="'In gebruik'"/>
			</xsl:when>
			<xsl:when test="contains(fn:upper-case($filename),'IN ONTWIKKELING')">
				<xsl:value-of select="'In ontwikkeling'"/>
			</xsl:when>
			<xsl:when test="contains(fn:upper-case($filename),'GEREED VOOR UGM')">
				<xsl:value-of select="'Gereed voor UGM'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'STATUS IS NIET VASTGESTELD!'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<xsl:template match="/">
		<!--<xsl:copy-of select="$vText"/>-->
		<!--<test>
			<xsl:copy-of select="$trunkcollection"/>
			<xsl:copy-of select="$branchescollection"/>
			<xsl:copy-of select="$tagscollection"/>
		</test>-->
		<!--<xsl:copy-of select="$collection"/>-->
<xsl:text>---
layout: page-with-side-nav
title: Supplier overzicht
---

</xsl:text>
		<div>
			<head>
				<title></title>
				<style>
				* {
				    font-family: 'Montserrat', sans-serif;
				    color: #424242;
				    line-height: 1rem;
				}
				.model {
					font-size: 12px;
					font-weight: normal;
				}
				.modeltitle {
					font-size: 14px;
					font-weight: bold;
					margin-top: 10px;
				}
				.modeltitleError {
					font-size: 12px;
					color: red;
				}
				.modeltitleWarning {
					font-size: 12px;
					color: green;
				}
				.ancestormodel {
					margin: 2em;
				}
				.ancestormodeltitle {
					font-size: 14px;				
					font-weight: bold;
					font-style: italic;
				}
				.collapsible {
				  color: black;
				  cursor: pointer;
				  padding: 6px;
				  width: 100%;
				  border: none;
				  text-align: left;
				  outline: none;
				}
				
				.active, .collapsible:hover {
				  background-color: #555;
				  color: white;
				}
				
				.collapsible:after {
				  content: '\002B';
				  color: white;
				  font-weight: bold;
				  float: right;
				  margin-left: 5px;
				}
				
				.active:after {
				  content: "\2212";
				}
				
				.content {
				  padding: 0 18px;
				  max-height: 0;
				  overflow: hidden;
				  transition: max-height 0.2s ease-out;
				  background-color: #f1f1f1;
				}
				</style>
			</head>
			<body>
				<h1>Tags model-supplier overzicht</h1>
					<xsl:apply-templates select="$collection/modelsupplieroverzicht"/>
				<script>
				var coll = document.getElementsByClassName("collapsible");
				var i;
				
				for (i = 0; i &lt; coll.length; i++) {
				  coll[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var content = this.nextElementSibling;
					if (content.style.maxHeight){
					  content.style.maxHeight = null;
					} else {
					  content.style.maxHeight = content.scrollHeight + "px";
					} 
				  });
				}
				</script>
			</body>
		</div>
	</xsl:template>
	
	<xsl:template match="modelsupplieroverzicht">
		<xsl:apply-templates select="tags"/>
	</xsl:template>
	
	<xsl:template match="tags">
		<button class="collapsible" style="background-color: lightblue;font-size: 16px;font-weight: bold;">SIM</button>
		<div class="content">
			<xsl:for-each select="model[project='SIM']">
				<xsl:sort select="projectid" />
				<xsl:sort select="naam"/>
				<xsl:variable name="positie" select="position()"/>
	
				<xsl:apply-templates select="." mode="top">
					<xsl:with-param name="type" select="'model'"/>
					<xsl:with-param name="positie" select="$positie"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</div>

		<button class="collapsible" style="background-color: lightblue;font-size: 16px;font-weight: bold;">UGM</button>
		<div class="content">
			<xsl:for-each select="model[project='UGM']">
				<xsl:sort select="projectid" />
				<xsl:sort select="naam"/>
				<xsl:variable name="positie" select="position()"/>
	
				<xsl:apply-templates select="." mode="top">
					<xsl:with-param name="type" select="'model'"/>
					<xsl:with-param name="positie" select="$positie"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</div>

		<button class="collapsible" style="background-color: lightblue;font-size: 16px;font-weight: bold;">BSM</button>
		<div class="content">
			<xsl:for-each select="model[project='BSM']">
				<xsl:sort select="projectid" />
				<xsl:sort select="naam"/>
				<xsl:variable name="positie" select="position()"/>
	
				<xsl:apply-templates select="." mode="top">
					<xsl:with-param name="type" select="'model'"/>
					<xsl:with-param name="positie" select="$positie"/>
				</xsl:apply-templates>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template match="model" mode="top">
		<xsl:param name="type"/>
		<xsl:param name="positie"/>
		<xsl:variable name="naam" select="naam"/>
		<xsl:variable name="project" select="project"/>
		<xsl:variable name="release" select="release"/>
		<xsl:variable name="status" select="status"/>
		<xsl:variable name="tagdatum" select="tagdatum"/>
		<xsl:variable name="redundantmodelindicator">
			<xsl:choose>
				<xsl:when test="preceding::model[naam = $naam and project = $project and release = $release and status = $status] or following::model[naam = $naam and project = $project and release = $release and status = $status]">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="newerversionavailable">
			<xsl:choose>
				<xsl:when test="following::model[naam = $naam and project = $project and release > $release]">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<button class="collapsible">
			<xsl:if test="$positie mod 2 = 1">
				<xsl:attribute name="style" select="'background-color: lightblue;'"/>
			</xsl:if>
			<div class="modeltitle"><xsl:value-of select="naam"/></div>
			<xsl:if test="$redundantmodelindicator = 'true' and $type = 'model'">
				<div class="{concat($type,'titleError')}"> Let op! Dit model heeft dezelfde kenmerken als een van de voorgaande of volgende modellen in deze lijst.</div>
			</xsl:if>
			<xsl:if test="$newerversionavailable = 'true' and $type = 'model'">
				<div class="{concat($type,'titleWarning')}">Let op! Er is een nieuwere tagversie van dit model.</div>
			</xsl:if>
			<div><b>Bestandsnaam</b>: <xsl:value-of select="bestandsnaam"/></div>
			<b>Release</b>: <xsl:value-of select="release"/>, <b>Versie</b>: <xsl:value-of select="versie"/>, <b>Status</b>: <xsl:value-of select="status"/>
		</button>
		<div class="content">
			<xsl:apply-templates select="suppliers">
				<xsl:with-param name="type" select="'ancestormodel'"/>
			</xsl:apply-templates>
		</div>
	</xsl:template>
	
	<xsl:template match="model">
		<xsl:param name="type"/>
		<xsl:variable name="naam" select="naam"/>
		<xsl:variable name="project" select="project"/>
		<xsl:variable name="release" select="release"/>
		<xsl:variable name="status" select="status"/>
		<xsl:variable name="tagdatum" select="tagdatum"/>
		<xsl:variable name="redundantmodelindicator">
			<xsl:choose>
				<xsl:when test="preceding::model[naam = $naam and project = $project and release = $release and status = $status] or following::model[naam = $naam and project = $project and release = $release and status = $status]">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="newerversionavailable">
			<xsl:choose>
				<xsl:when test="following::model[naam = $naam and project = $project and release > $release]">true</xsl:when>
				<xsl:otherwise>false</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="{concat($type,'title')}"><xsl:value-of select="naam"/>
			<xsl:if test="$redundantmodelindicator = 'true' and $type = 'model'">
				<div class="{concat($type,'titleError')}"> Let op! Dit model heeft dezelfde kenmerken als een van de voorgaande of volgende modellen in deze lijst.</div>
			</xsl:if>
			<xsl:if test="$newerversionavailable = 'true' and $type = 'model'">
				<div class="{concat($type,'titleWarning')}">Let op! Er is een nieuwere tagversie van dit model.</div>
			</xsl:if>
		</div>
		<div><b>Bestandsnaam</b>: <xsl:value-of select="bestandsnaam"/></div>
		<b>Release</b>: <xsl:value-of select="release"/>, <b>Versie</b>: <xsl:value-of select="versie"/>, <b>Status</b>: <xsl:value-of select="status"/>
		<xsl:apply-templates select="suppliers">
			<xsl:with-param name="type" select="'ancestormodel'"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="suppliers">
		<xsl:param name="type"/>
		<div><b>Suppliermodel(len):</b></div>
		<div class="$type" style="margin-left: 2em">
			<xsl:apply-templates select="supplier"/>
		</div>
	</xsl:template>
	
	<xsl:template match="supplier">
		<xsl:variable name="naam" select="naam"/>
		<xsl:variable name="project" select="project"/>
		<xsl:variable name="release" select="release"/>
		<xsl:choose>
			<xsl:when test="//model[naam = $naam and project = $project and release = $release and status = 'In gebruik' and type = 'tag']">
				<xsl:apply-templates select="//model[naam = $naam and project = $project and release = $release and status = 'In gebruik' and type = 'tag']">
					<xsl:with-param name="type" select="'ancestormodel'"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="//model[naam = $naam and project = $project and release = $release and status = 'Gereed voor UGM' and type = 'tag']">
				<xsl:apply-templates select="//model[naam = $naam and project = $project and release = $release and status = 'Gereed voor UGM' and type = 'tag']">
					<xsl:with-param name="type" select="'ancestormodel'"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="//model[naam = $naam and project = $project and release = $release and status = 'In ontwikkeling' and type = 'tag']">
				<xsl:apply-templates select="//model[naam = $naam and project = $project and release = $release and status = 'In ontwikkeling' and type = 'tag']">
					<xsl:with-param name="type" select="'ancestormodel'"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<div class="ancestormodeltitle"><xsl:value-of select="naam"/></div>
				<b>release</b>: <xsl:value-of select="release"/> (<b style="color: red;">Van dit model is geen XMI variant aanwezig</b>).
			</xsl:otherwise>
		</xsl:choose>
		<!--<xsl:choose>
			<xsl:when test="//model[naam = $naam and project = $project and release = $release]">
				<xsl:apply-templates select="//model[naam = $naam and project = $project and release = $release]">
					<xsl:with-param name="type" select="'ancestormodel'"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<div class="ancestormodeltitle"><xsl:value-of select="naam"/></div>
				<b>release</b>: <xsl:value-of select="release"/> (<b style="color: red;">Van dit model is geen XMI variant aanwezig</b>).
			</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>
</xsl:stylesheet>
