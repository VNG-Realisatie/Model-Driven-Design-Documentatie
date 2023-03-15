---
layout: page-with-side-nav
title: Het opstellen van een koppelvlak
---
# 4.4 Het opstellen van een koppelvlak

In dit hoofdstuk beschrijven we hoe je tot de technische specificaties van een koppelvlak kunt komen. Althans wat betreft de StUF XML-Schema's en OAS3 specificatie. Een koppelvlakspecificatie bestaat immers uit meer dan alleen een van deze componenten. Denk onder andere aan de functionele documentatie maar ook aan een 'Getting started'.

Voor zowel StUF XML-Schema's als een OAS3 specificatie is het uitgangspunt dat er een valide UGM en dus ook een valide SIM voor het koppelvlak voor handen is. De paragrafen [4.3.1 Opstellen van een Koppelvlak-informatiemodel](./obsolete.md) en [4.3.2 opstellen van een koppelvlak-UitwisselingsGegevensModel](./obsolete.md) gaan daar dieper op in. De details over het modelleren van berichtspecificaties staan beschreven in paragraaf [[433 opstellen van een koppelvlak-BerichtStructuurModel]].

Voor het zover is moeten echter de onderstaande stappen genomen worden.

## Wens voor een koppelvlak onderkennen

VNG Realisatie vult een rol in als het gaat om het in beeld krijgen van de behoefte aan koppelvlakken. Dat kan vanuit twee perspectieven.

### Architectuurperspectief

Vanuit een architectuur-benadering kan geconstateerd worden dat het voor de hand ligt om tussen twee referentiecomponenten een koppelvlak met een specifiek doel te definiëren,
Volgend daarop zal altijd getoetst moeten worden of de behoefte aan deze koppelvlakspecificatie ook bestaat dan wel gemeenten ervan bewust moeten worden gemaakt wat de effecten zijn als een dergelijk koppelvlak wordt gedefinieerd. Uiteindelijk moet er bij de gemeenten draagvlak zijn voor een koppelvlak.

### Concrete behoefte

Vanuit de dagelijkse praktijk van gemeenten kan de behoefte aan een koppelvlak worden gedefinieerd. Hierbij kunnen concrete uitwisselingsproblemen of een concrete functionele (uitbreidings-)wens ten grondslag liggen. De hier gedefinieerde behoefte aan een koppelvlak zal altijd moeten worden afgebeeld op de architectuur. Welke referentiecomponenten spelen hier een rol, Is de behoefte wel een reëel koppelvlak-issue of wordt er een probleem opgelost dat is ontstaan omdat er niet onder architectuur is gewerkt etc....

### Wettelijke eis

p{color:red}. *Noot Robert:* Dit lijkt mij ook een perspectief dat benoemt moet worden. Wellicht kan dit ook beschouwd worden als een concrete behoefte maar die behoefte leeft misschien heel ergens anders dan bij de gemeenten.

## Keuze maken om het koppelvlak uit te gaan werken

Het uitwerken van een koppelvlak is in feite een investeringsbeslissing. Daarbij zal een afweging gemaakt moeten worden van de voor- en de nadelen vanuit het perspectief van de gemeenten. Daarnaast wordt in kaart gebracht welke resources er nodig zijn, hoe actueel het op te lossen probleem is en hoe groot de impact op het gemeentelijk applicatie-landschap zal zijn.

p{color:red}. *Noot Robert:* De investeringsbeslissing kan n.m.m. in het geval van een wettelijke eis mogelijk helemaal niet liggen bij de gemeenten. Ik kan me zelfs voorstellen dat het budget door een andere partij ter beschikking wordt gesteld.

## Werkgroep samenstellen

Werkgroepdeelnemers uitnodigen. Wens is altijd een goede gemeentelijke vertegenwoordiging, aangevuld met relevante leveranciers.
Er moeten op voorhand werkafspraken gemaakt worden over de volgende zaken :
* Voldoende beschikbare tijd voor werkgroepbijeenkomsten en het doen van uitwerkingen.
* Deelnemers zijn mede-eigenaar van het resultaat (dus geen aanpassingen/commentaar via de openbare consultaties. )
* Het doen van proefimplementaties binnen de projectperiode (project loopt door na de vaststelling of vaststelling pas na proefimplementatie. )

p{color:red}. *Noot Robert:* Inmiddels werken we op een andere wijze. Werkgroepen zijn vervangen door communities waarin vertegenwoordigers van zowel gemeenten als leveranciers kunnen deelnemen. De gebruikte tooling moet het werken in communities ondersteunen en om die reden wordt inmiddels gebruik gemaakt van zowel GitHub als GitLab. Veelal wordt een agile werkwijze gehanteerd waarbij bij de opstart van het project voorzien is in de rollen benodigd voor de gekozen agile werkwijze. Zo is er bij een scrum werkwijze bijv. voorzien in een Project Owner en een Scrum Master. Met het verschuiven van de traditionele keuze voor StUF als koppelvlak techniek door REST API's zijn ook de op te leveren producten gewijzigd. Een belangrijke deliverable is voortaan de Referentie Implementatie. Tenslotte is ook de kwaliteitscontrole en het goedkeuringsproces flink gewijzigd. De kwaliteit van de opgeleverde Referentie Implementatie en de OAS3 specificatie wordt gedurende de ontwikkeling van de nieuwe standaarden gecontroleerd in een of meerdere API-Labs en de goedkeuring van deze producten is niet meer bij een Regiegroep belegd. Het lijkt me daarom goed deze paragraaf te herschrijven en de titel te wijzigen. Wel moet er aandacht zijn voor die trajecten die nog wel de oude werkwijze hanteren en die nog wel de oude producten opleveren.

## Functionele wensen en eisen formuleren

Door de werkgroep zullen de functionele eisen en wensen ten aanzien van het koppelvlak gedefinieerd moeten worden. Hierbij dienen de volgende aspecten in acht genomen te worden :
* Welke gegevens spelen een rol binnen het koppelvlak /domein
* Welke van die gegevens maakt al onderdeel uit van een bestaand Informatiemodel (RSGB of RGBZ)
* Welk interoperabilitietsprobleem wordt met dit koppelvlak opgelost.
* Uit welke berichten (berichtsoorten / content) bestaat het koppelvlak.
* Welke eisen worden er gesteld ten aanzien van de verwerking van deze berichten.

p{color:red}. *Noot Robert:* In het kader van het werken met communities, het intensiever betrekken van gemeenten bij de ontwikkeling van koppelvlakken en een agile aanpak wordt tegenwoordig vaak gestart met het definiëren van userstories. Dit zorgt er voor dat iedereen die dat wil zijn invloed kan pakken en de richting die de ontwikkeling van een koppelvlak neemt kan beïnvloeden. De aanpak is immers transparanter omdat het verwerken van de userstories in alle openheid gebeurd.

## Koppelvlak-informatiemodel opstellen

Op basis van de functionele eisen en wensen of de userstories wordt geïnventariseerd welke informatie-objecttypen, -relatietypen en -attribuuttypen er voor het koppelvlak nodig zijn. Deze worden vervolgens vastgelegd in een Semantisch InformatieModel dat specifiek voor het koppelvlak in beeld brengt om welke informatie het gaat.

Nadere details over het [4.3.1 Opstellen van een Koppelvlak-informatiemodel](./obsolete.md) zijn op een aparte pagina uitgewerkt.

## Koppelvlak-uitwisselingsgegevensmodel opstellen

Op basis van het koppelvlak Semantisch InformatieModel en eventueel te hergebruiken deel of delen van horizontale Uitwisselingsgegevensmodellen wordt een een koppelvlak UitwisselingsGegevensModel opgesteld.

Nadere details over het [4.3.2 opstellen van een koppelvlak-UitwisselingsGegevensModel](./obsolete.md) zijn op een aparte pagina uitgewerkt.

## Koppelvlak-BerichtStructuurModel opstellen

### Koppelvlak aanmaken.

- Package aanmaken onder het project KING: BSM met de naam van het koppelvlak. (De naamgevingsconventie is: BSM KV Naam koppelvlak)
- In properties het Stereotype “koppelvlak” geven.
- Het veld 'Alias'  vullen met de namespace van het koppelvlak opnemen(bv /demo.kinggemeenten.nl). Dit is alleen van belang bij het genereren van StUF koppelvlakken.
- Het veld 'Version' vullen met het semantic versienummer van een API koppelvlak of het 4-cijferig versienummer van een StUF koppelvlak.
- Het veld 'Phase' vullen met een van de volgende waarden ...... <-- opzoeken.
- De volgende tagged values moeten opgenomen worden :
  - 'derived' : heeft de waarde 'yes' als er afleiding van een ander model plaatsvindt (en dat is vrijwel altijd het geval). <-- Is dit echt nodig?
  - 'release' : de datum waarop begonnen is met de release in het format yyyymmdd. Dit moet altijd groter zijn dan de release van het supplier-model.
  - 'supplier-name' : de naam van het UGM waar het koppelvlak op is gebaseerd (bv. UGM KV Naam koppelvlak). Alle traces vanuit het BSM lopen naar dit UGM.
  - 'supplier-project' : heeft in dit geval altijd de waarde 'UGM' ( het project waar het supplier-model is ondergebracht).
  - 'supplier-release' :  de datum van de release in het format yyyymmdd van het supplier-model
  - 'verkorte alias' : alias waarmee de koppelvlak-namespace wordt geïdentificeerd in de StUF bericht schema's (alleen bij StUF koppelvlakken)
  - 'beheerder_email': e-Mailadres waarop jij als beheerder bereikbaar bent.
  - 'koppelvlak-naam': naam van het koppelvlak.
  - 'project_url': url van het GitHub project waarbinnen de API standaard wordt ontwikkeld. (Alleen bij API koppelvlakken)
  - 'serialisatie': in het geval van een API koppelvlak moet aangegeven worden of het als plain 'JSON' moet worden gegenereerd of als 'Hal+JSON'. (Alleen bij API koppelvlakken)

- De volgende tagged values mogen opgenomen worden:
  - 'toelichting opnemen vanaf' : ................
  - 'Versienummer AAA nnnnnn' : Voor elk supplier model 1. Hier kan het betreffende versienummer van dat model opgenomen worden. 'AAA' heeft de waarde 'SIM' of 'UGM'. 'nnnnnn' bevat de naam van het betreffende model.

- Neem het interne package "Berichtstructuren" op.
- Neem het interne package "Generieke Datatypen" op.

Voor het supplier-model geldt dat dit in een imvertor-run gedraaid moet zijn voordat het koppelvlak-model gedraaid wordt. Anders kent imvertor het supplier-model niet en kan er geen derivation plaatsvinden.

### Bericht aanmaken (dit zullen er over het algemeen meerdere per koppelvlak zijn)

#### Berichtpackage

- Bericht-package aanmaken onder de koppelvlak-package.
- In de properties het stereotype “bericht” toevoegen.
- Naam van de namespace voor het koppelvlak toevoegen in de alias.
- Properties opslaan. Daarna tonen dat de tab MBG is toegevoegd aan de properties.
- Tab “MBG” tonen. Toelichten van de eigenschappen van het bericht als documentatie.

#### Berichtcontent

- Schema-composer starten (TOOLS > Schema Composer)
- New > Schema >
- Naam bericht invoeren.
- Schema-set : Selecteer ECDM Message Composer
- Selecteer de package waarin het bericht wordt opgeslagen (Package dat zojuist zoals hierboven beschreven is aangemaakt. )
- Haal de fundamentele entiteit van het bericht op uit het UGM.
- Selecteer de gewenste attributen, gegevensgroepen, enumeraties en relaties toe.
  (De werking van de Schema-composer vereist wat uitleg)

#### Complexe content (modelleerprincipes)

*Recursieve relaties*

"Bij STUF"
Voor de berichten waarbij er vanuit een (fundamentele) entiteit een relatie naar zichzelf is gelegd is het van belang dat er een aangepaste entiteit wordt aangemaakt. Als voorbeeld de natuurlijk Persoon (NPS) die de recursieve relatie "heeftAlsKind" kent.
Er wordt een NPS-kind (naamgeving is nog niet besproken en vastgesteld) of een NPS-kerngegevens gemaakt op basis van de NPS-entiteit die al in het bericht zit.
- Kopieer de NPS-entiteit
- Hernoem de kopie naar NPS-kind (Met deze twee acties blijven de traces op de attributen behouden naar de corresponderende entiteit uit het UGM.)
- Herstel de trace op de entiteit.
- Herhaal deze actie voor alle gerelateerde gegevensgroepen en entiteiten.
- Leg handmatig de relatie "heeftAlsKind" om van recursief naar een relatie tussen NPS en NPS-kind.
- Leg handmatig de composite-relaties met de gegevensgroepen aan.

"Bij REST/JSON
Voor een recursieve relatie wordt net als bij StUF koppelvlakken een aangepaste entiteit aangemaakt. Uitgaande van een voorbeeld waarbij 'Persoon' entiteit een link naar zichzelf heeft wordt het volgende gedaan:
- Kopieer de 'Persoon' entiteit;
- Hernoem deze naar 'Persoon_lnk';
- Herstel de trace op de entiteit;
- Verwijder evt. attributen indien je in het yaml bestand alleen een link naar de resource wil opnemen;
- Verwijder de betreffende relatie op het '_lnk' object;
- Verwijder ook evt. andere relaties indien in het yaml bestand alleen een link naar de resource wil opnemen.
(Wat moet je doen als je het object in zijn geheel op wil nemen? Moeten dan de links blijven staan?)
- Plaats het '_lnk' object in het diagram waarin de entiteit met de recursieve link voorkomt;
- Verleg de target van de recursieve link naar het geplaatste '_lnk' object.

*Vraagberichten*

Bij het modelleren van vraag antwoord combinatie (lv/la) dient de "start"-relatie uit de lv altijd naar dezelfde klasse te  verwijzen als de "object"- relatie uit het la-bericht. Gelijk, vanaf en totEnMet verwijzen altijd naar een ander complextype dan de Start. Voor scope loopt de discussie nog of deze naar hetzelfde complexType als antwoord mag verwijzen.  

Complextypes

Voor elke entiteitklasse, gegevensgroeklasse en elke relatie wordt per bericht slechts 1 complextype aangemaakt.
Uitzondering daarop zijn de historieFormeel, en historieFormeelRelatie historieMaterieel en de kerngegevens bij de gerelateerde.

#### *Genereer de bericht-content

Selecteer de knop "Generate"

### Regels en afspraken bij het opstellen van een BSM.






+
*_Johan : Tot hier gekomen.... Rest is under construction*_+

- Orden de diagram

#### Berichttype

Generiek berichttype koppelen aan de content

Creëer een package met de naam van het bericht.
Geef deze package het gewenste bericht type. Keuze uit :
- Antwoordberichttype (La)
- Generiek Berichttype
- Kennisgevingberichttype(Lk)
- Synchronisatieberichttype (Sa, Sh)
- Vraagberichttype (Lv)
- Vrij berichttype (Di, Du)
Selecteer uit de interne package "berichtstructuren" de interface die correspondeert met het gewenste generieke bericht.
Leg een


*Specifiek bericht (vrij bericht of een specifiek bericht o.b.v. generieke structuur) maken en koppelen aan de content*



*Genereer de bericht-content (knop "Generate")
- Orden de diagram
- Voeg berichttype toe
- Pas tagged values aan waar nodig, voeg berichtcode toe waar nodig.
- Voeg de Entiteitrelatie toe*

####
Complexere berichten
