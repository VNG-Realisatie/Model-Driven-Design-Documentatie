---
layout: page-with-side-nav
title: Pipeline stappen op hoofdlijnen
---
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

De functie van elke step wordt in de volgende paragraaf beschreven.

## Steps
### XmiCompiler
Deze stap verzorgt wat voorbereidende stappen. Zo checkt het o.a. of het EA bestand wel de gewenste applicatie bevat.
Wat doet deze stap nog meer?

### ConfigCompiler
De werking van Imvertor wordt sterk gedreven door de configuratie. Hier wordt het complete configuratiebestand opgebouwd.

### XmiTranslator
Deze step verwerkt het lastig te interpreteren XMI formaat naar het eenvoudigere imvertor formaat wat resulteert in het bestand ‘imvertor.01.init.xml’.

### Validator
Deze stap voert een aantal canonicalisatie en validatie slagen uit op het resultaat van de voorgaande stap. Welke canonicalisatie en validaties worden uitgevoerd is deels afhankelijk van de organisatie.

### ApcModifier
Voeg informatie toe aan het Imvertor bestand welke specifiek is voor bepaalde verwerkingsrun.

### ModelHistoryAnalyzer
In deze stap wordt de status van de voorgaande release van het in bewerking zijnde model geanalyseerd.

### ImvertCompiler
Compileer een uiteindelijke representatie van het input bestand t.b.v. schema generatie.

### ReleaseComparer
compare releases. Dit is een optionele stap waarvan een gebruiker zelf bepaald of deze moet gan lopen.

### EapCompiler
Compileer templates en creëer een rapportage over de UML EAP.

### YamlCompiler
Deze stap genereert op basis van een BSM model een yaml bestand waarmee de oAS specificatie wordt uitgedrukt. Daarbij worden teven json bestanden gegenereerd in 2 verschillende json formaten.

### RunAnalyzer
Analiseer de huidige run.

### Reporter
Deze step wordt altijd gedraaid. Het pakt alle fragmenten en de status informatie in parms.xml en genereert documentatie.

### ReadmeCompiler
Een readme bevstand voorziet in toegang tot de gegenereerde documentatie, json en de yaml bestanden.

### ReleaseCompiler
Verwerkt tenslotte de release zowel als de ZIP release.

## Vormen van variabelen en configuratie

