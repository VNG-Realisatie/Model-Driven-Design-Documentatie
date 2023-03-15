@echo off
set saxon_path=C:\SaxonHE11-5J\saxon-he-11.5.jar

@echo on

del /Q Resultaat\*.*

cls

java -Xmx1024m -cp %saxon_path% net.sf.saxon.Transform -t -o:Resultaat/VNGRSIM.txt -s:Input/VNGRSIM.xml -xsl:Consolidate-TVs-GitHub-style.xsl
java -Xmx1024m -cp %saxon_path% net.sf.saxon.Transform -t -o:Resultaat/KINGUGM.txt -s:Input/KINGUGM.xml -xsl:Consolidate-TVs-GitHub-style.xsl
java -Xmx1024m -cp %saxon_path% net.sf.saxon.Transform -t -o:Resultaat/KINGBSM.txt -s:Input/KINGBSM.xml -xsl:Consolidate-TVs-GitHub-style.xsl
