# Omgang met datatypes
Binnen Enterprise Architect maken we gebruik van 3 verschillende soorten datatypes:
1. Primitieve datatypes;
2. Generieke datatypes;
3. Lokale datatypes.

Hieronder volgt een toelichting m.b.t. de wijze waarop de XSLT stylesheets hiermee omgaan en hoe je nieuwe datatypes kunt toevoegen.

## Primitieve datatypes
Dit soort datatypes wordt als bekend verondersteld bij de verwerkende applicatie. Ze worden nl. niet binnen de modellen in Enterprise Architect gedefinieerd. We noemen ze Primitieve datatypes alhoewel het niet persé hoeft te gaan om rudimentaire primitieve datatypes. De term ‘primitieve datatypes’ wordt eigenlijk niet zuiver gehanteerd in de MIM 1.1 standaard. Een URI kan bijvoorbeeld afgeleid zijn van CharacterString. Een betere naam zou dan ook zijn ‘Built-in datatypes’. Datatypes dus die binnen een schemataal specificatie zijn gedefinieerd.

Zoals gesteld kennen de modellen deze datatypes eigenlijk niet aangezien ze worden gedefinieerd buiten het zicht van de modellen. Ook op de Imvertor server zijn deze datatypes niet in het een of ander model aanwezig. Berichtontwerpers worden verondersteld te weten wat er mee bedoelt wordt en wanneer en waar ze gebruikt kunnen worden. De stylesheets zijn ingericht op het verwerken van deze types naar de schemataal waarvoor het stylesheet is opgezet. Het MIM 1.1 Primitieve datatype 'CharacterString' wordt bijvoorbeeld door een stylesheet dat XML-Schema genereert vertaalt naar 'xs:string' en door een stylesheet dat JSON genereert naar 'string'.

Om dit te kunnen doen worden deze datatypes binnen Imvertor gedeclareerd in een van de zogenaamde conceptual-schema's. De werking van conceptual schema's is in de laatste paragraaf van dit document beschreven. 

## Generieke datatypes
Bij Generieke datatypes gaat het om datatypes die een voor een organisatie vaste vorm vertegenwoordigen. Een goed voorbeeld is het datatype 'DatumOnvolledig' dat binnen VNG-Realisatie wordt gebruikt. Het bestaat uit de elementen:
* 'dag';
* 'maand';
* 'jaar';
* en 'datum'.

Ook hier geldt:
* dat onze modellen deze datatypes eigenlijk niet kennen en dat ze worden gedefinieerd buiten het zicht van die modellen;
* dat berichtontwerpers worden verondersteld te weten wat er mee bedoelt wordt en wanneer en waar ze gebruikt kunnen worden;
* dat de stylesheets die deze datatype gebruiken zijn ingericht op het verwerken van deze types naar de schemataal waarvoor het stylesheet is opgezet;
* en dat deze gedeclareerd worden in een van de zogenaamde conceptual-schema's. 

## Lokale datatypes
Lokale datatypes zijn datatypes die specifiek binnen een model een toepassing vinden, bijvoorbeeld omdat dat binnen een model veel wordt gebruikt. Het gaat hier om datatypes die ook binnen zo'n model worden gedefiniëerd en die over het algemeen een aanscherping zijn van de primitieve datatypes. Bijv. een datatype dat is gebaseerd op een integer maar waarvan de minimum waarde 1 en de maximum waarde 100 is.
Doordat deze datatypes gebaseerd zijn op primitieve datatypes wordt er bij de verwerking door Imvertor gebruik gemaakt van dezelfde mechanismes als bij de Primitieve datatypes.

## Conceptual schema's
Voor het verwerken van de datatypes zijn Conceptual schema's gecreëerd. Dit zijn bestanden waarin per datatype en per schemataal een conceptual mapping is gedefinieerd. M.b.v. de conceptual schema's vindt er dus een mapping plaats van het datatype naar een construct in een schemataal. Om het datatype bijvoorbeeld te kunnen verwerken in een XML-Schema moet je dus weten naar welk XML simpleType of complexType het datatype mapt. Om het te verwerken in een OAS3 of RDF schema map je natuurlijk naar geheel andere types.

De conceptual schema's zijn georganiseerd over meerdere bestanden. Zo hebben we conceptual schema's voor de MIM 1.1 Primitieve datatypes maar ook voor GML3 en VNG-R datatypes. Het conceptual schema 'conceptual-schemas.xml' (src\main\resources\input\KING\xsd) fungeert als catalog waardoor de andere conceptual schema's kunnen worden gevonden.

### Werking
Op het moment dat bij het processen van een model een referentie naar een datatype wordt gevonden treedt het conceptual schema mechanisme in werking. Alle conceptual schema's worden afgezocht naar een mapping waarvan de naam overeenkomt met dat van het datatype. 

Voorbeelden van packages met dit soort datatypes zijn het 'GML3' package en het package 'MIM11 Primitieve datatypen'. In de eerste staan GML datatypes waar wij gebruik van willen maken (bijv. 'GM_Point'). De tweede bevat MIM 1.1 primitieve datatypes zoals:
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

Hoe deze datatypes in deze packages zijn gedefinieerd (als class, datatype of als interface) is eigenlijk niet van belang. De naam en evt. de identifier zijn van belang niet het stereotype of enig andere karakteristiek.
Om een van deze datatypes te gebruiken kan je er naar refereren door in het 'type' veld het betreffende datatype hard in te geven. Het heeft echter de voorkeur er naar te refereren door in het 'type' veld een van de types uit de datatype packages te selecteren. Om die laatste methode af te dwingen is het handig de Imvertor parameter 'nativescalars' de waarde 'no' te geven.

Nu kan het gebeuren dat een datatype in meerdere packages voorkomt, bijv. in zowel het 'MIM11 Primitieve datatypes' als in het 'GML3' package, bijv. 'boolean'. Er is dan sprake van ambiguïteit wat leidt tot foutmeldingen. Deze ambiguïteit kan op drie verschillende manieren worden opgelost. 
1. door een van de twee mappings te laten vervallen (verwijderen uit de mapping in het conceptual schema);
2. door een van de twee mappings te hernoemen;
3. of door binnen het conceptual schema aan de mapping de GUID’s mee te geven van de betreffende datatypes.

De 2e optie heft weliswaar de ambiguïteit op maar er bestaan nog steeds 2 dezelfde datatypes in 2 verschillende packages. Dat heeft natuurlijk geen toegevoegde waarde. Bij de laatste optie ben je gedwongen in alle modellen dezelfde versie van het MIM / GML package op te nemen omdat je anders andere GUID's krijgt. Onder normale omstandigheden heeft optie 1 de voorkeur.

Optie 2 werkt echter als volgt er vanuit gaande dat je de mappings voor ‘CharacterString’ wil aanpassen:
* Je vindt in het conceptual schema een gelijksoortige code als:

```
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
* Voeg daar dan het element ‘cs:managedID’ aan toe dat de waarde krijgt van de GUID van het datatype in het package in Enterprise Architect dat wordt gebruikt. Je krijgt dus het volgende:

```
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
* Doe hetzelfde voor alle andere voorkomens van het construct met de naam ‘CharacterString’.

### Meerdere versies van een mapping
In het conceptual schema 'conceptual-schemas.xml' (src\main\resources\input\KING\xsd) kunnen meerdere secties voor GML voorkomen. Bijv. een voor GML 3.21 en een voor GML 3.22. Hoe hou je nu uit elkaar welke van de 2 je wil gebruiken?

Bij het verwerken met Imvertor worden de properties gedefinieerd. In die properties wordt een mapping identifier meegegeven, bijv. ‘NEN3610_GML321’. In het conceptual schema wordt ook een mapping configuratie gedeclareerd, dat gaat als volgt:

```
   <cs:mappings>
      <cs:Mapping>
         <cs:name>NEN3610_GML321</cs:name>
         <cs:use>
            <cs-ref:MapRef xlink:href="#GML321"/>
            <cs-ref:MapRef xlink:href="#MIM11"/>
            <cs-ref:MapRef xlink:href="#VNGR-MAP"/>
         </cs:use>
      </cs:Mapping>
   </cs:mappings>
```
Hieruit kun je opmaken dat deze identifier correspondeert met de mappings voor GML321, MIM11 en VNGR-MAP, mappings die verderop in dat bestand worden gedefinieerd.
