---
layout: page-with-side-nav
title: Omgang met datatypes
---
# Omgang met datatypes
In dit hoofdstuk leggen we het verschil tussen de verschillende datatypes uit, geven we een toelichting op de wijze waarop XSLT stylesheets hiermee omgaan en geven 
we voor alle soorten aan hoe je nieuwe datatypes kunt toevoegen of waar van toepassing kunt promoveren.

## De verschillende soorten datatypes
Binnen Enterprise Architect maken we gebruik van 4 verschillende soorten datatypes:
1. [Primitieve datatypes](#primitieve-datatypes);
2. [Generieke datatypes](#generieke-datatypes);
3. [Lokale datatypes](#lokale-datatypes).

### Primitieve datatypes
Dit soort datatypes wordt als bekend verondersteld bij de verwerkende applicatie. Ze worden nl. niet binnen de modellen in Enterprise Architect gedefinieerd. 
We noemen ze Primitieve datatypes alhoewel het niet persé hoeft te gaan om rudimentaire primitieve datatypes. De term ‘primitieve datatypes’ wordt eigenlijk
niet zuiver gehanteerd in de MIM 1.1 standaard. Het MIM Primitieve datatype URI kan bijvoorbeeld afgeleid zijn van CharacterString. Een betere naam zou dan ook 
zijn ‘Built-in datatypes’. Datatypes dus die binnen een schemataal specificatie zijn gedefinieerd. Voorbeelden hiervan vind je in het 'MIM11 Primitieve datatypen' 
model. Gemene deler bij dit soort datatypes is dat ze als stereotype 'Interface' hebben.

Zoals gesteld kennen de modellen deze datatypes eigenlijk niet aangezien ze worden gedefinieerd buiten het zicht van de modellen. De packages die deze datatypes 
bevatten bestaan dus alleen om er voor te zorgen dat de Interface componenten daarin in Enterprise Architect door een ander model gebruikt kunnen worden. Deze 
modellen hoeven dus ook nooit met Imvertor verwerkt te worden. Daarmee zijn deze datatypes dus ook niet op de Imvertor server aanwezig. 

Informatiemodelleurs en berichtontwerpers worden verondersteld te weten wat er met de datatypes bedoelt wordt en wanneer en waar ze gebruikt kunnen worden. De 
stylesheets zijn ingericht op het verwerken van deze types al dan niet naar een schemataal waarvoor het stylesheet is opgezet. 
Het MIM 1.1 Primitieve datatype 'CharacterString' wordt bijvoorbeeld door een stylesheet dat XML-Schema's genereert vertaalt naar 'xs:string' en door een stylesheet 
dat JSON genereert naar 'string'.

Om dit te kunnen doen worden deze datatypes binnen Imvertor gedeclareerd in een van de zogenaamde conceptual-schema's. Zie [Conceptual schema's](#conceptual-schemas) 
voor de beschrijving van de verwerking. 

**Vraag**: Waarom heeft het 'MIM11 Primitieve datatypen' model geen stereotype en het 'GML' model wel?  
**Antwoord**: Het stereotype doet er niet zoveel toe. De eerste zouden we ook een stereotype kunnen geven of hem bij de tweede zelfs weg kunnen laten.

Zie ook het [Toevoegen nieuw MIM primitief datatype](#toevoegen-nieuw-mim-primitief-datatype) en het [Toevoegen nieuw GML datatype](#toevoegen-nieuw-gml-datatype).

### Generieke datatypes
Bij Generieke datatypes gaat het om datatypes die een voor een organisatie vaste vorm vertegenwoordigen. Een goed voorbeeld is het datatype 'DatumOnvolledig' dat 
binnen VNG-Realisatie wordt gebruikt en daar in het model 'Generieke Datatypen Gemeenten' is gedefinieerd. Het bestaat uit de elementen:
* 'dag';
* 'maand';
* 'jaar';
* en 'datum'.

Ook hier geldt:
* dat onze modellen deze datatypes eigenlijk niet kennen en dat ze worden gedefinieerd buiten het zicht van die modellen;
* dat berichtontwerpers worden verondersteld te weten wat er mee bedoelt wordt en wanneer en waar ze gebruikt kunnen worden;
* dat de stylesheets die deze datatypes gebruiken zijn ingericht op het verwerken van deze types al dan niet naar een schemataal waarvoor het stylesheet is opgezet;
* en dat deze gedeclareerd worden in een van de zogenaamde conceptual-schema's.

Generieke datatypes worden in een package van het stereotype 'Basismodel' gemodelleerd en in tegenstelling tot 'Primitieve datatypes' packages moeten deze wel met 
Imvertor verwerkt worden. Deze datatypes kunnen van het stereotype 'Primitief datatype' of 'Gestructureerd datatype' zijn. Bij datatypes van het stereotype 'Primitief 
datatype' kan de generalization relatie met een van de MIM 1.1 Primitive datatype gelegd worden. Voor de verwerking met Imvertor is dit niet noodzakelijk maar toch 
is dat aan te bevelen aangezien op die wijze formeel wordt vastgelegd waar de eigen primitieve datatypes op gebaseerd zijn.

Wil je de in deze paragraaf beschreven soort datatypes in een ander model kunnen gebruiken dan moet er in dat andere model een package geplaatst worden met het
stereotype 'Intern' dat dezelfde naam en dezelfde waarde voor de tagged value 'release' heeft als het gerelateerde basismodel. In dat package moeten dan objecten met 
het stereotype 'Interface' worden geplaatst met wederom dezelfde naam als de in het gerelateerde generieke datatype model voorkomende datatypes. Deze 'Interface'
componenten kunnen vervolgens door de attributen van de objecttypes, entiteittypes, groepen, etc... als type worden gebruikt.

Voor de verwerking met Imvertor van dit soort datatypes wordt ook gebruik gemaakt van conceptual-schema's. Zie [Conceptual schema's](#conceptual-schemas) voor 
de beschrijving van de verwerking. 

**Vraag**: Ik kan me voorstellen waarom er bij 'MIM11 Primitieve datatypen' voor een andere constructie is gekozen. Dat zijn immers datatypen die in schematalen 
verwijzen naar built in datatypes. Waarom is er echter in het geval van 'GML' voor gekozen om niet de generieke datatypes constructie te gebruiken? 
'GML' heeft als stereotype 'Extern' terwijl 'Generieke Datatypen Gemeenten' juist het stereotype 'basismodel' heeft. De constructie is in het conceptual schema volgens 
mij echter wel gelijk.  

**Vraag**: Het lijkt een beetje onzinnig dat je dit soort datatypes wel met Imvertor moet verwerken terwijl je ze ook in een Conceptual schema declareert. Zijn er 
redenen aan te wijzen dat we dit toch doen? In weerwil van de bovenstaande vraag zou je ook kunnen besluiten dit soort datatypes hetzelfde te behandelen als de 
Primitieve datatypes, toch?

Zie ook het [Toevoegen Gemeentelijk generiek datatype](#toevoegen-gemeentelijk-generiek-datatype).

### Lokale datatypes
Lokale datatypes zijn datatypes die specifiek binnen een specifiek model een toepassing vinden, bijvoorbeeld omdat die binnen dat model en alleen dat model veel worden 
gebruikt. Het gaat hier om datatypes die ook binnen zo'n model worden gedefiniëerd en die over het algemeen een aanscherping zijn van de primitieve datatypes. Bijv. 
een datatype dat is gebaseerd op een integer maar waarvan de minimum waarde 1 en de maximum waarde 100 is.
Doordat deze datatypes gebaseerd zijn op primitieve datatypes wordt er bij de verwerking door Imvertor gebruik gemaakt van die primitieve datatypes maar worden ze op
basis van hun lokale definitie verder aangescherpt. Deze datatypes hoeven dan ook niet in een Conceptual schema gedeclareerd te worden.

Er kan een moment komen dat we een lokaal datatype willen promoveren tot een generiek datatype. Als eerste stap dient dat datatype dan in een van de Conceptual schema's 
te worden gedefinieerd. Daarna kan het als een object met het stereotype 'Interface' worden toegevoegd aan een bestaand of nieuw package met generieke datatypes.
Vervolgens kan overal waar het als lokaal datatype wordt gebruikt het type worden gewijzigd in een referentie naar een generiek datatype en tenslotte kan het lokale
datatype worden verwijderd.

**Vraag**: Is dit voldoende of vereist dit ook nog een aanpassing van de stylesheets?

Zie ook het [Toevoegen Lokaal datatype](#toevoegen-lokaal-datatype).

## Conceptual schema's
Voor het verwerken van datatypes van het stereotype 'Interface' zijn Conceptual schema's gecreëerd. Dit zijn bestanden waarin per datatype en per schemataal een conceptual 
mapping is gedefinieerd. M.b.v. de conceptual schema's vindt er een mapping plaats van het datatype naar een construct in een schemataal. Om het datatype bijvoorbeeld te 
kunnen verwerken in een XML-Schema moet je dus weten naar welk XML simpleType of complexType het datatype mapt. Om het te verwerken in een OAS3 of RDF schema map je 
natuurlijk naar geheel andere types.

De conceptual schema's zijn georganiseerd over meerdere bestanden. Zo hebben we conceptual schema's voor de MIM 1.1 Primitieve datatypes maar ook voor GML3 en VNG-R 
datatypes. Het conceptual schema 'conceptual-schemas.xml' (voor VNG Realisatie te vinden in 'src\main\resources\input\KING\xsd') fungeert als catalog waardoor de andere 
conceptual schema's kunnen worden gevonden.

**Vraag**: Wat is de functie van de conceptual schema bestanden met de prefix 'cs-'?.

**Vraag**: Wat is de functie van de verschillende elementen in de conceptual schema bestanden (zowel die met de prefix 'cs-' als die met de prefix 'cm-')?.

### Werking
Op het moment dat bij het processen van een model een referentie naar een datatype wordt gevonden dat niet in een gerelateerd model wordt aangetroffen treedt het conceptual 
schema mechanisme in werking. Alle conceptual schema's worden afgezocht naar een mapping waarvan de naam overeenkomt met dat van het datatype. 

Voorbeelden van packages met dit soort datatypes zijn het 'GML3' package en het package 'MIM11 Primitieve datatypen'. In de eerste staan GML datatypes waar wij gebruik 
van willen maken (bijv. 'GM_Point'). De tweede bevat MIM 1.1 primitieve datatypes zoals:
* CharacterString
* Integer
* Real
* Decimal
* Boolean
* Date
* DateTime
* Year
* Month
* Day
* URI

Hoe deze datatypes in deze packages zijn gedefinieerd (als class, datatype of als interface) is eigenlijk niet van belang. De naam en evt. de identifier zijn van belang 
niet het stereotype of enig andere karakteristiek.
Om een van deze datatypes te gebruiken kan je er naar refereren door in het 'type' veld het betreffende datatype hard in te geven. Het heeft echter de voorkeur er naar 
te refereren door in het 'type' veld een van de types uit de datatype packages te selecteren. Om die laatste methode af te dwingen is het handig de Imvertor parameter 
'nativescalars' de waarde 'no' te geven.

### Meerdere voorkomens van hetzelfde datatype.
Nu kan het gebeuren dat een datatype in meerdere packages voorkomt, bijv. in zowel het 'MIM11 Primitieve datatypes' als in het 'GML3' package, bijv. 'boolean'. Er is 
dan sprake van ambiguïteit wat leidt tot foutmeldingen. Deze ambiguïteit kan op drie verschillende manieren worden opgelost. 
1. door een van de twee mappings te laten vervallen (verwijderen uit de mapping in het conceptual schema);
2. door een van de twee mappings te hernoemen;
3. of door binnen het conceptual schema aan de mapping de GUID’s mee te geven van de betreffende datatypes.

De 2e optie heft weliswaar de ambiguïteit op maar er bestaan nog steeds 2 dezelfde datatypes in 2 verschillende packages. Dat heeft natuurlijk geen toegevoegde waarde. 
Bij de laatste optie ben je gedwongen in alle modellen dezelfde versie van het MIM / GML package op te nemen omdat je anders andere GUID's krijgt. Onder normale 
omstandigheden heeft optie 1 daarom de voorkeur.

Er vanuit gaande dat je de mappings voor ‘CharacterString’ wil aanpassen werkt optie 2 echter als volgt :
* Je vindt in het conceptual schema een gelijksoortige code als:

```xml
        <cs:Construct>
            <cs:name>CharacterString</cs:name>
            <cs:sentinel>false</cs:sentinel>
            <cs:catalogEntries>
                <cs:CatalogEntry>
                    <cs:name>#primitive-datatypes</cs:name>
                </cs:CatalogEntry>
            </cs:catalogEntries>
            <cs:xsdTypes>
                <cs:XsdType>
                    <cs:name>xs:string</cs:name>
                    <cs:asAttribute>xs:string</cs:asAttribute>
                    <cs:asAttributeDesignation>simpletype</cs:asAttributeDesignation>
                    <cs:primitive>true</cs:primitive>
                </cs:XsdType>
            </cs:xsdTypes>
        </cs:Construct>
```
* Voeg daar dan het element `<cs:managedID>` aan toe dat de waarde krijgt van de GUID van het datatype in het package in Enterprise Architect dat wordt gebruikt. Je 
krijgt dus iets als het volgende:

```xml
        <cs:Construct>
            <cs:name>CharacterString</cs:name>
            <cs:sentinel>false</cs:sentinel>
            <cs:managedID>EAID_18BFBA8D_E3F4_4d8c_9A8F_4429FA54B041</cs:managedID>
            <cs:catalogEntries>
                <cs:CatalogEntry>
                    <cs:name>#primitive-datatypes</cs:name>
                </cs:CatalogEntry>
            </cs:catalogEntries>
            <cs:xsdTypes>
                <cs:XsdType>
                    <cs:name>xs:string</cs:name>
                    <cs:asAttribute>xs:string</cs:asAttribute>
                    <cs:asAttributeDesignation>simpletype</cs:asAttributeDesignation>
                    <cs:primitive>true</cs:primitive>
                </cs:XsdType>
            </cs:xsdTypes>
        </cs:Construct>
```
* Doe hetzelfde voor alle andere voorkomens van het construct met de naam ‘CharacterString’ (al krijgen die natuurlijk wel een andere GUID waarde).

Het is overigens ook mogelijke het element `<cs:managedID>` meerdere keren toe te voegen aan één en dezelfde `<cs:Construct>`. Die hebben dan wel steeds een andere 
waarde.

**Vraag**: Moeten we het gebruik van optie 2 en 3 niet actief ontmoedigen en er voor zorgen dat we situaties waarin dat gebeurd wegnemen?

### Meerdere versies van een mapping
In het conceptual schema 'conceptual-schemas.xml' (voor VNG Realisatie te vinden in 'src\main\resources\input\KING\xsd') kunnen meerdere secties voor GML voorkomen. Bijv. een voor GML 3.21 en een 
voor GML 3.22. Hoe hou je nu uit elkaar welke van de 2 je wil gebruiken?

Bij het verwerken met Imvertor worden de properties behorende bij de gekozen processing mode uitgelezen. Een van die properties is 'mapping' waaraan een identifier 
is toegekend, bijv. ‘NEN3610_GML321’. In het conceptual schema is ook een mapping configuratie gedeclareerd met de naam 'NEN3610_GML321':

```xml
        <cs:mappings>
           <cs:Mapping>
              <cs:name>NEN3610_GML321</cs:name>
              <cs:use>
                 <cs-ref:MapRef xlink:href="#GML321"/>
                 <cs-ref:MapRef xlink:href="#MIM111"/>
                 <cs-ref:MapRef xlink:href="#VNGR-MAP"/>
              </cs:use>
           </cs:Mapping>
        </cs:mappings>
```
In feite definieert deze mapping dat de conceptual mappings met de mapping referenties 'GML321', 'MIM111' en 'VNGR-MAP', mappings die verderop in het bestand worden 
geinclude, moeten worden gebruikt. Definieer, als je een andere set conceptual mappings wil gebruiken, een nieuwe mapping configuratie met daarin de gewenste  mapping 
referenties. Definieer zo nodig ook nieuwe conceptual mapping bestanden.

### Mappings voor andere schematalen
In de voorgaande paragraaf zagen we al de volgende conceptual mapping:
```xml
        <cs:Construct>
            <cs:name>CharacterString</cs:name>
            <cs:sentinel>false</cs:sentinel>
            <cs:catalogEntries>
                <cs:CatalogEntry>
                    <cs:name>#primitive-datatypes</cs:name>
                </cs:CatalogEntry>
            </cs:catalogEntries>
            <cs:xsdTypes>
                <cs:XsdType>
        </cs:Construct>
```
Zoals je ziet bevat deze conceptual mapping de mapping naar een XSD-type. Naast mappings voor XSD-types kun je ook mappings voor OAS- en RDF-types definiëren in een 
conceptual mapping. Daarvoor definiëer je op hetzelfde niveau als het element `<cs:xsdRtpes>` de elementen `<cs:oasTypes>` resp. `<cs:rdfTypes>`.

Het element `<cs:xsdType>` in `<cs:xsdTypes>` kent de volgende structuur:

```xml
        <cs:xsdType>
           <cs:name>xs:string</cs:name>
           <cs:asAttribute>xs:string</cs:asAttribute>
           <cs:asAttributeDesignation>simpletype</cs:asAttributeDesignation>
           <cs:primitive>true</cs:primitive>
        </cs:XsdType>
```
`<cs:oasType>` en `<cs:rdfType>` kennen de elementen `<cs:asAttributes>` en `<cs:asAttributeDesignation>` niet. OAS bestanden bevatten immers geen attributes zoals die in een 
XML bestand wel aanwezig kunnen zijn.<br/>
`<rdfType>` kent daarnaast ook het element `<cs: primitive>` niet.

In de toekomst zouden er indien gewenst ook mappings voor andere schematalen kunnen worden toegevoegd.

### Toevoegen nieuw MIM primitief datatype
Er vanuit gaand dat nog niet alle primitieve datatypen vertegenwoordigd zijn in het package 'MIM11 Primitieve datatypen' wordt hier beschreven hoe deze toe te voegen.
1. Voeg een nieuw Datatype element toe aan het package 'MIM11 Primitieve datatypen' met de naam van het nieuwe primitieve datatype en geeft dit als stereotype 
'VNG-R SIM+Grouping NL::interface';
2. Definieer in het conceptual schema bestand 'cm-MIM111.xml' (of een nieuwere versie daarvan) een nieuwe 'cs:Construct' waarin je de gewenste mappings (XSD en/of OAS) 
definieert.
3. Zodra de wijziging is aangebracht in de Develop branch van de 'Imvertor-Maven' GitHub repository is het bruikbaar in de 'nightly build' van Imvertor. Zodra het is 
uitgerold naar de master is het bruikbaar in de laatste release van Imvertor. Vanaf dat moment kan het datatype gebruikt worden in Enterprise Architect.

### Toevoegen nieuw GML datatype
1. Voeg een nieuw Datatype element toe aan het package 'MIM Primitieve datatypen' met de naam van het nieuwe primitieve datatype en geeft dit als stereotype 
'VNG-R SIM+Grouping NL::interface';
2. Definieer in het conceptual schema bestand 'cm-GML322.xml' (of een nieuwere versie daarvan) een nieuwe 'cs:Construct' waarin je de gewenste mappings (XSD en/of OAS) 
definieert.
3. Zodra de wijziging is aangebracht in de Develop branch van de 'Imvertor-Maven' GitHub repository is het bruikbaar in de 'nightly build' van Imvertor. Zodra het is 
uitgerold naar de master is het bruikbaar in de laatste release van Imvertor. Vanaf dat moment kan het datatype gebruikt worden in Enterprise Architect.

### Toevoegen Gemeentelijk generiek datatype
1. Definieer in het package 'Generieke Datatypen Gemeenten' een nieuw datatype, geef dat het gewenste datatype stereotype ('Primitief datatype' of 'Gestructureerd datatype');
2. Maak, indien het een 'Primitief datatype betreft', een diagram en trek daarin een Generalisatie associatie vanuit het nieuwe datatype naar een van de datatypes in een
ander package en scherp het vervolgens aan;
4. Definieer in het 'Intern' stereotyped package met de naam 'Generieke Datatypen Gemeenten' een nieuw 'Datatype' component met het stereotype 'Interface';
5. Definieer in het gerelateerde Conceptual schema bestand dat start met 'cm-' (of een nieuwere versie daarvan) een nieuwe 'cs:Construct' waarin je de gewenste 
mappings (XSD, RDF en/of OAS) definieert.
6. Zodra de wijziging is aangebracht in de Develop branch van de 'Imvertor-Maven' GitHub repository is het bruikbaar in de 'nightly build' van Imvertor. Zodra het is 
uitgerold naar de master is het bruikbaar in de laatste release van Imvertor. Vanaf dat moment kan het datatype gebruikt worden in Enterprise Architect.

### Toevoegen Lokaal datatype
1. Definieer in het model waarin je dat nodig hebt het nieuwe datatype, geef dat het gewenste datatype stereotype, maak een diagram en trek daarin een Generalisatie 
associatie vanuit het nieuwe datatype naar een van de datatypes in een ander package en scherp het vervolgens aan;
2. Vanaf dat moment kan het datatype gebruikt worden in Enterprise Architect.
