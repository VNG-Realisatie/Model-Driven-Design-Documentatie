---
layout: page-with-side-nav
title: Pipeline stappen op hoofdlijnen
---
Terug naar de [inhoudsopgave](index),

#  Pipeline stappen op hoofdlijnen
Imvertor is in wezen een Java pipeline applicatie die bestaat uit een aantal elkaar opvolgende stappen en waarin de output 
van de ene stap de input is van de andere stap. Elke stap wordt gecontroleerd door een Java class. Daarbinnen kan sprake 
zijn van een of meer sub-stappen waarmee aangegeven wordt welk input bestand met welk stylesheet tot welk output bestand 
wordt verwerkt. In plaats van die informatie hard in de java code te coderen gebeurd dat met variabelen. Een in de Java 
class voorkomende variabale wordt m.b.v. properties geconfigureerd in een gerelateerd 'parms.xml' bestand.

Met de Java class 'ChainTranslateAndReport.java' wordt, naast enkele andere dingen, bepaald welke stappen worden uitgevoerd. 
Sommige stappen moeten sowieso worden uitgevoerd maar voor andere stappen wordt dat bepaald met command line properties 
welke per organisatie zijn geconfigureerd. Voor VNG Realisatie gebeurd dat in het bestand 'src\main\resources\input\KING\props\KING.xlsx'.

Voor VNG Realisatie zijn op dit moment de volgende achtereenvolgens te doorlopen stappen geconfigureerd:
*	XmiCompiler
*	ConfigCompiler
*	XmiTranslator
*	Validator
*	ApcModifier
*	ModelHistoryAnalyzer
*	ImvertCompiler
*	ReleaseComparer (optioneel)
*	EapCompiler
*	YamlCompiler
*	RunAnalyzer
*	Reporter
*	ReadmeCompiler
*	ReleaseCompiler

De functie van elke step wordt in de volgende paragraaf in het kort beschreven.

## Steps
**XmiCompiler:**<br/>
Deze stap verzorgt wat voorbereidende verwerkingen. Zo checkt het o.a. of het EA bestand wel de gewenste applicatie bevat.

*Wat doet deze stap nog meer?*

**ConfigCompiler:**<br/>
De werking van Imvertor wordt sterk gedreven door de configuratie. Hier wordt het complete configuratiebestand opgebouwd.

*Aan welke configuraties moet ik hierbij denken?*

**XmiTranslator:**<br/>
Deze step verwerkt het lastig te interpreteren XMI formaat naar het eenvoudigere imvertor formaat wat resulteert in het bestand ‘imvertor.01.init.xml’.

**Validator:**<br/>
Deze stap voert een aantal canonicalisatie en validatie slagen uit op het resultaat van de voorgaande stap. Welke canonicalisatie en validaties worden uitgevoerd is deels afhankelijk van de organisatie die gebruik maakt van Imvertor..

**ApcModifier:**<br/>
Voeg informatie toe aan het Imvertor bestand welke specifiek is voor bepaalde verwerkingsrun.

**ModelHistoryAnalyzer:**<br/>
In deze stap wordt de status van de voorgaande release van het in bewerking zijnde model geanalyseerd.

**ImvertCompiler:**<br/>
Compileer een uiteindelijke representatie van het input bestand t.b.v. schema generatie.

**ReleaseComparer:**<br/>
compare releases. Dit is een optionele stap waarvan een gebruiker zelf bepaald of deze moet gan lopen.

**EapCompiler:**<br/>
Compileer templates en creëer een rapportage over de UML EAP.

**YamlCompiler:**<br/>
Deze stap genereert op basis van een BSM model een yaml bestand waarmee de oAS specificatie wordt uitgedrukt. Daarbij worden teven json bestanden gegenereerd in 2 verschillende json formaten.

**RunAnalyzer:**<br/>
Analiseer de huidige run.

**Reporter:**<br/>
Deze step wordt altijd gedraaid. Het pakt alle fragmenten en de status informatie in parms.xml en genereert documentatie.

**ReadmeCompiler:**<br/>
Een readme bestand voorziet in toegang tot de gegenereerde documentatie, json en de yaml bestanden.

**ReleaseCompiler:**<br/>
Verwerkt tenslotte de release zowel als de ZIP release.

## Vormen van variabelen en configuratie
Zoals al uit het de voorgaande paragraaf blijkt zijn er diverse bestanden met variabelen en configuratie items waarmee de werking van Imvertor beïnvloed kan worden.
Hieronder behandelen we deze kort.

### Parameter bestanden voor de Java classes
De Java classes (in 'src\main\java\nl\imvertor') zijn in principe op dezelfde wijze georganiseerd als de xslt stylesheets (in 'src\main\resources\xsl'), per Imvertor module. Elke module komt grofweg overeen met een Imvertor stap. De classes zijn gelardeerd met variabelen welke in de parameter bestanden (in 'src\main\resources\cfg') worden gedeclareerd. Ook deze zijn op dezelfde wijze georganiseerd als de xslt stylesheets. Elke Java class heeft over het algemeen dus zijn eigen parameter bestand ('parms.xml'). Deze parameter bestanden zijn voor elke organisatie gelijk. In de Java classes kunnen echter takken voorkomen die specifiek voor een organisatie geldt. In dat geval kunnen daar specifieke variabelen in gebruik zijn welke dan dus in de parameter bestanden zijn gedeclareerd. Geen parameter bestanden per organisatie dus maar evt. wel specifieke variabelen per organisatie.

### Command line properties bestand 
Elke organisatie heeft zijn eigen Command line property bestand (in 'src\main\resources\input\KING\props'). Dat kunnen tekst bestanden zijn ('*.properties) maar steeds vaker ook Excel spreadsheets. Voor VNG Realisatie is dat laatste het geval ('src\main\resources\input\KING\props\KING.xlsx').

In deze bestanden wordt per Imvertor verwerkingstype de waarde van de properties gedefinieerd, waarden die gelden voor alle gebruikers van de betreffende organisatie. Een gebruiker kan deze waarden echter wel overrulen door bij de verwerking een eigen '*.properties' bestand mee te geven waarin de afwijkingen t.o.v. de Command line property bestand zijn gedefinieerd.
Zo kan deze bijv. aangeven dat voor de verwerking van een specifiek model Respec documentatie moet worden gegenereerd of een compare moet worden uitgevoerd.

De Command line properties zijn in de xslt stylesheets vaak te herkennen aan de mnemonic 'cli', zoals bijv. in de volgende regel code

```jsn
if (succeeds && configurator.isTrue("cli","createjsonschema",false)) {
```
'createjsonschema' is in dit geval de specifieke command line property.

### Diverse configuraties
  - comparerules;
  - docrules;
  - translationrules;
  - metamodels;
  - notesrules;
  - owners;
  - schemarules;
  - shaclrules;
  - tvsets;
  - versionrules;
  - visuals.

### conceptual schema constructs.
Voor de verwerking verwijs ik naar de paragraaf die daarover gaat op de [pagina over datatypes](../Omgang-met-datatypes.html#conceptual-schemas).
