# Omgang met datatypes
Binnen Enterprise Architect maken we gebruik van 3 niveaus datatypes:
1.	Primitieve datatypes;
2.	Generieke datatypes;
3.	Lokale datatypes.

De laatste 2 types behoeven geen toelichting in het kader van deze documentatie aangezien het om componenten gaat die verwerkt moeten worden door Imvertor en daarmee beschikbaar komen voor andere modellen. Het gebruik van primitieve datatypes behoeft nog wel extra uitleg.
## Primitieve datatypes
Dit soort datatypes veronderstellen we als bekend. Ze worden nl. niet binnen onze modellen in Enterprise Architect gedefinieerd. Deze datatypes noemen we Primitieve datatypes alhoewel het niet persé hoeft te gaan om de rudimentaire primitieve datatypes. De term ‘primitieve datatypes’ wordt eigenlijk niet zuiver gehanteerd in de MIM 1.1 standaard. Een URI zou bijvoorbeeld kunnen zijn afgeleid van CharacterString. Een betere naam zou zijn ‘Built-in type’.

Onze modellen kennen deze datatypes eigenlijk niet aangezien ze worden gedefinieerd buiten het zicht van onze modellen. Ook op de Imvertor server zijn deze datatypes niet in het een of ander model aanwezig.

Om er binnen Imvertor toch iets mee te kunnen doen worden de karakteristieken hiervan binnen Imvertor gedeclareerd in een zogenaamd conceptual-schema ('conceptual-schemas.xml'). Een bestand waarin per datatype, per schemataal wordt vastgelegd welke metagegevens van het datatype je moet kennen. Er vindt dus een mapping van de naam op een aantal kenmerken plaats. Om het bijvoorbeeld te kunnen verwerken in een XML-Schema moet je dus weten of het om een complexType gaat, welk complexType je daar dan voor moet gebruiken en binnen welke namespace dat complexType dan bijv. is gedefinieerd. Om het te verwerken in een OAS3 of RDF schema heb je wellicht hele andere metagegevens nodig (in OAS3 informatie wordt op dit moment overigens nog niet voorzien).

Op het moment dat bij het processen van een model een referentie naar zo'n datatype wordt gevonden wordt, omdat Imvertor nergens iets anders vindt over zo'n datatype, teruggevallen op de definitie van dat datatype in dat conceptual schema. 

Voorbeelden van packages met dit soort datatypes zijn het 'GML3' package en het package 'MIM11 Primitieve datatypen'. In de eerste staan GML datatypes waar wij gebruik van willen maken (bijv. 'GM_Point'). De tweede bevat MIM 1.1 primitieve datatypes zoals:
*	CharacterString
*	Integer
*	Real
*	Decimal
*	Boolean
*	Date
*	DateTime
*	Year
*	Month
*	Day
*	URI

Hoe deze datatypes in deze packages zijn gedefinieerd (als class, datatype of als interface) is niet van belang. De naam en evt. de identifier zijn van belang niet het stereotype of enig andere karakteristiek.

Aan dit soort datatypes wordt zelf nooit direct gerefereerd als type, onze modellen hebben voldoende aan de naam. Om een van deze datatypes te gebruiken kan je er naar refereren door in het 'type' veld het betreffende datatype hard in te geven. Het heeft echter de voorkeur er naar te refereren door in het 'type' veld een van de types uit de packages 'MIM11 Primitieve datatypen' of 'GML3' te selecteren. Om die laatste methode af te dwingen is het gebruik van de parameter 'nativescalars' met de waarde 'no' van belang.

Nu kan het gebeuren dat een datatype zowel in het MIM als in GML voorkomt, bijv. 'boolean'. Er is dan sprake van ambiguïteit wat leidt tot foutmeldingen. Deze ambiguïteit kan op twee verschillende manieren worden opgelost. 
1.	door een van de twee mappings te laten vervallen (verwijderen uit de mapping in het conceptual schema);
2.	of door binnen het conceptual schema aan de mapping de GUID’s mee te geven van de betreffende datatypes.

In het laatste geval ben je gedwongen in alle modellen dezelfde versie van het MIM / GML package op te nemen. Onder normale omstandigheden heeft optie 1 de voorkeur.

Optie 2 werkt echter als volgt er vanuit gaande dat je de mappings voor ‘CharacterString’ wil aanpassen:
*	Je vindt in het conceptual schema een gelijksoortige code als:

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
*	Voeg daar dan het element ‘cs:managedID’ aan toe dat de waarde krijgt van de GUID van het element in het package dat wordt gebruikt in Enterprise Architect om naar te verwijzen. Je krijgt dus het volgende:

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
*	Doe hetzelfde voor alle andere voorkomens van het construct met de naam ‘CharacterString’.

Nu kunnen er in het conceptual schema meerdere secties voor GML voorkomen. Bijv. een voor GML 3.21 en een voor GML 3.22. Hoe hou je nu uit elkaar welke van de 2 je wil gebruiken.

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
