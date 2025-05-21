#  Pipeline stappen op hoofdlijnen
Imvertor is in wezen een Java pipeline applicatie die bestaat uit een aantal elkaar opvolgende stappen en waarin de output 
van de ene stap de input is van de andere stap. Elke stap wordt gecontroleerd door een Java class. Daarbinnen kan sprake 
zijn van een of meer sub-stappen waarmee aangegeven wordt welk input bestand met welk stylesheet tot welk output bestand 
wordt verwerkt. In plaats van die informatie hard in de java code te coderen gebeurd dat met variabelen. Een in de Java 
class voorkomende variabale wordt m.b.v. properties geconfigureerd in een gerelateerd 'parms.xml' bestand.

Met de Java class 'ChainTranslateAndReport.java' wordt weer bepaald welke stappen worden uitgevoerd. Sommige stappen moeten 
sowieso worden uitgevoerd maar voor andere stappen wordt dat bepaald met command line properties welke per organisatie zijn 
geconfigureerd. Voor VNG Realisatie gebeurd dat in het bestand 'src\main\resources\input\KING\props\KING.xlsx'.

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

### XmiTranslator
Deze step verwerkt het lastig te interpreteren XMI formaat naar het eenvoudigere imvertor formaat wat resulteert in het bestand ‘imvertor.01.init.xml’.

### Validator
Deze stap voert een aantal canonicalisatie en validatie slagen uit op het resultaat van de voorgaande stap. Welke canonicalisatie en validaties worden uitgevoerd is deels afhankelijk van de organisatie.

### ReadmeAnalyzer

### ImvertCompiler

### XsdCompiler

### ReleaseComparer

### SchemaValidator

### OfficeCompiler

### ComplyCompiler

### RunAnalyzer

### Reporter

### ReadmeCompiler

### ReleaseCompiler

### YamlCompiler

## Variabelen en configuratie

