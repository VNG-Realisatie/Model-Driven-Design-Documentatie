#  Pipeline stappen op hoofdlijnen
Imvertor is in wezen een pipeline applicatie die bestaat uit een aantal elkaar opvolgende steps en waarin de output van de ene step de input is van de andere step. In de Imvertor configuratie van VNG Realisatie onderscheiden we de volgende achtereenvolgens te doorlopen stappen:
*	XmiCompiler
*	XmiTranslator
*	Validator
*	ReadmeAnalyzer
*	ImvertCompiler
*	XsdCompiler
*	ReleaseComparer
*	SchemaValidator
*	OfficeCompiler
*	ComplyCompiler
*	RunAnalyzer
*	Reporter
*	ReadmeCompiler
*	ReleaseCompiler
*	YamlCompiler
*	
De functie van elke step wordt in de volgende paragraaf beschreven.
## Steps
### XmiCompiler
Deze stap verzorgt wat voorbereidende stappen. Zo checkt het o.a. of het EA bestand wel de gewenste applicatie bevat.
Wat doet deze stap nog meer?

### XmiTranslator
Deze step verwerkt het lastig te interpreteren XMI formaat naar het eenvoudigere imvertor formaat wat resulteert in het bestand ‘imvertor.01.init.xml’.
Validator
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
