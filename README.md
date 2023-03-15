# Imvertor-Documentatie
In deze repository vind je de door VNG-Realisatie vastgelegde documentatie. Het betreft werkwijzen die binnen VNG Realisatie gehanteerd worden, niet per definitie werkwijzen zoals die door Armatiek worden voorgeschreven. E.e.a. is op basis van ervaring tot stand gekomen. Ook bevat het beschrijvingen van de wijze waarop gewerkt dient te worden met de door de VNG zelf ontwikkelde componenten.

## Gegenereerde documentatie
Sommige delen van deze repository worden gegenereerd. Indien dat het geval is wordt dit aangegeven met 'Gegenereerd: [datum]'.
In de volgende paragrafen een opsomming van de gegenereerde delen met een beschrijving hoe dit te genereren.

### Lijsten met Tagged Values

De lijsten met Taged Values zoals die in het bestand 'docs/Tagged-values.md' staan worden gegenereerd op basis van de voor de VNG van toepassing zijnde metamodel en tagged-value configuratiebestanden van Imvertor (zie folder 'https://github.com/Imvertor/Imvertor-Maven/src/main/resources/input/KING/cfg'). Zodra daarin een wijziging wordt aangebracht moeten deze lijsten met Tagged Values opnieuw gegenereerd worden. Het gaat om tabellen met tagged values met daarin:
* een omschrijving van de tagged value;
* op welke stereotypes deze kan worden toegepast; 
* of deze verplicht is en zo ja op welke stereotypes;
* de mogelijke waarden die deze kan aannemen;
* en of afleiding mogelijk is.

Het genereren gebeurd m.b.v. het XSLT stylesheet 'Consolidate-TVs-GitHub-style.xsl', te vinden in de folder https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/consolidateTagsets, en een of meer xml configuratiebestanden die je kunt vinden in de folder https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/consolidateTagsets/input. Elk configuratiebestand configureert voor één metamodel (Bijv VNGRSIM). Zo hebben we er één voor het genereren van de tagged value lijst die van toepassing zijn op het SIM, één voor het genereren van de tagged value lijst die van toepassing zijn op het UGM en één voor het genereren van de tagged value lijst die van toepassing zijn op het BSM. De input bestanden bevatten includes met een path naar zowel het root bestand van het gerelateerde metamodel configuratie als het root bestand van het gerelateerde tagged valueset configuratie. Het stylesheet creeert op basis daarvan een geconsolideerde instance van beide configfuraties maar ook van alle daar weer recursief (wederom m.b.v. includes) in opgenomen configuraties. Dat dient uiteindelijk als input voor het genereren van de lijsten.

Indien je voor een andere organisatie dan VNG Realisatie wil genereren dan zul je dat in deze bestanden moeten aangeven en wellicht dat je dan ook de bestanden een andere naam wil geven.

Het daadwerkelijk starten van het genereren gebeurd m.b.v. het bestand 'Consolidate.bat' eveneens te vinden in de folder https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/consolidateTagsets. Indien je voor een andere organisatie genereert let er dan op dat je ook in dit bestand waarschijnlijk aanpassingen moet aanbrengen.

Al deze bestanden (en dus de gehele inhoud van https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/consolidateTagsets) moeten lokaal geplaatst worden voordat ze gebruikt kunnen worden. Er zijn echter nog een aantal voorwaarden waaraan je moet voldoen:
* Ook de Imvertor-Maven repo moet lokaal beschikbaar zijn;
* De folder waarin de lokale Imvertor-Maven repository (bijv. 'C:/Data/Imvertor') te vinden is moet in de xml confoguratiebestanden worden gedefinieerde op het attribute '/tas:tagsandstereos/@static-base-uri' (dus alles van het pad dat voorafgaat aan 'Imvertor-Maven');
* Een recente versie van de Saxon processor for XSLT moet geïnstalleerd zijn (zie https://www.saxonica.com/welcome/welcome.xml) en het pad waarin het benodigde jar bestand staat moet toegevoegd zijn aan de 'CLASSPATH' omgevings variabele. Het installeren omhelst eigenlijk niet meer dan het uitpakken van de zip die je van de Saxonica website haalt. Wij gebruiken de 'saxon-he' variant van de saxon processor maar andere versies kunnen ook gebruikt worden;
* In 'Consolidate.bat' moet de variabele 'saxon_path' verwijzen naar het jar bestand dat je in de voorgaande stap hebt geïnstalleerd;
* En natuurlijk moet Java (liefst de laatste versie) geïnstalleerd zijn.

Door het starten van Consolidate.bat wordt er in de folder 'consolidateTagsets/Resultaat' een aantal bestanden geplaatst waarbinnen de lijsten met Tagged Values staan. Deze kunnen nu in het batch bestand 'docs/Tagged-values.md' de oude versies vervangen.

### Supplieroverzicht
Het overzicht in 'Supplieroverzicht.html' verschaft direct duidelijkheid over de voor een SIM, UGM of BSM model benodigde suppliermodellen. Vooral handig als je zo'n model wil bekijken of aanpassen in Enterprise Architect en mogelijk weer wil gaan verwerken met Imvertor. Het is dan nl. noodzakelijk om niet alleen het gewenste model maar ook alle modellen waarvan dit informatie overerft in Enterprise Architect binnen te halen en dat dient dan ook nog in de juiste volgorde te gebeuren. 

Zonder dit overzicht zul je dat overzicht handmatig moeten verwerven door eerst het model binnen te halen, te kijken welke supplier modellen er zijn, die weer binnen te halen enzovoort totdat alle Suppliermodellen bekend zijn. Daarna moet je alle modellen weer verwijderen om ze vervolgens in omgekeerde volgorde weer binnnen te halen.
Het moge duidelijk zijn dat dit overzicht veel tijd kan besparen.

Het genereren gebeurd m.b.v. het XSLT stylesheet 'Supplieroverzicht-html.xsl', te vinden in de folder https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/supplieroverzicht, en de in subversion opgeslagen modellen in de folders 'trunk', 'branch' en 'tags'. Deze folder moeten dus lokaal beschikbaar zijn. Op dit moment wordt er overigens alleen een overzicht gegenereerd op basis van de 'tags' folder.

Het daadwerkelijk starten van het genereren gebeurd m.b.v. het bestand 'Overzicht-modellen.bat' eveneens te vinden in de folder https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/supplieroverzicht. Let op, in dit batch bestand staan een aantal variabelen gedefinieerd die omgevings afhankelijk zijn, stel die voor jezelf correct in. De variabele 'trunk' bevat pad dat verwijst naar de locatie waar je jouw subversion folder voor de 'trunk' hebt staan. Op de variabele 'basefolder' en 'saxon11-path' kom ik zo terug.

Beide bestanden van https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/code/supplieroverzicht moeten lokaal geplaatst worden voordat ze gebruikt kunnen worden. De folder waarin je deze bestanden plaatst is de basefolder en het pad naar die folder moet dus als waarde aan de variabele 'basefolder' in het bestand 'Overzicht-modellen.bat' worden toegekend. Er zijn echter nog een aantal voorwaarden waaraan je moet voldoen:
* Zoals gezegd moet de subversion folder met daarin de folders 'trunk', 'branch' en 'tags' lokaal staan;
* Je moet op al deze folders en de subfolders daaronder schrijfrechten hebben;
* Een recente versie van de Saxon processor for XSLT moet geïnstalleerd zijn (zie https://www.saxonica.com/welcome/welcome.xml) en het pad waarin het benodigde jar bestand staat moet toegevoegd zijn aan de 'CLASSPATH' omgevings variabele. Het installeren omhelst eigenlijk niet meer dan het uitpakken van de zip die je van de Saxonica website haalt. Wij gebruiken de 'saxon-he' variant van de saxon processor maar andere versies kunnen ook gebruikt worden;
* In 'Consolidate.bat' moet de variabele 'saxon_path' verwijzen naar het jar bestand dat je in de voorgaande stap hebt geïnstalleerd;
* En natuurlijk moet Java (liefst de laatste versie) geïnstalleerd zijn.

Door het starten van het batch bestand 'Overzicht-modellen.bat' wordt er in de folder waarin dat bestand staat het bestand 'Supplieroverzicht.html' geplaatst. Dit bestand kan het bestand met dezelfde naam in https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/tree/main/docs vervangen.
Tijdens het genereren worden er tijdelijke hulp bestanden gegenereerd in de 'trunk', 'branch' en 'tags' folders welke na verwerking ook weer meteen worden verwijderd.
