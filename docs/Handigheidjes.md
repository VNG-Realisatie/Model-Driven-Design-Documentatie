---
layout: page-with-side-nav
title: Technieken en handigheidjes
---
# 5.2 Technieken en handigheidjes

## Attributen specifieke class verbergen

Je kunt de attributes van een specifieke class als volgt verbergen:
- Klik met je rechtermuis op de class
- Ga naar Features & Properties
- Ga naar Feature & Compartment Visibility
- Vink alle vormen van Attribute  Visibility uit

## Tagged values tonen in diagram

Indien je de tagged values ook wil tonen in een diagram doe dan het volgende:

- Dubbelklik op de achtergrond van dat diagram.
!https://kinggemeenten.plan.io/attachments/download/160339/TaggedValues1.jpg!
- Selecteer vervolgens ‘ Elements’ :
!https://kinggemeenten.plan.io/attachments/download/160340/TaggedValues2.jpg!
zet de ‘ Tags’ checkbox aan en klik op ‘OK’.

## Problemen in Enterprise Architect

Een EA bestand is eigenlijk een database formaat. Het kan voorkomen dat dat corrupt raakt en de volgende melding of gelijksoortig is dan mogelijk:
!https://kinggemeenten.plan.io/attachments/download/160314/Foutmelding_EA.png!

Bouw in dit geval een nieuw EA bestand op of vraag een kopie bij een collega.

## Traces handmatig instellen

Als je handmatig objecten hebt gekopieerd of aangemaakt die gebaseerd zijn op objecten in een ander model dan moet je handmatig traces aanbrengen. Voor elk type object is hiervoor een eigen werkwijze.

### Objecttypen/Entiteittypen/Groepen:

- Zorg er voor dat je in een diagram in vragende model het betreffende object van dat model hebt staan en drag daar gerelateerde object uit het leverende model bij;
- Trek vervolgens van het eerste object een relatie naar het tweede object en kies voor het type trace;
- Het leverende object kun je vervolgens weer uit het diagram verwijderen.

### Attributen:

- Dubbel klik op het attribuut;
- Ga naar de tagged values;
- Klik bij de tagged value ‘SourceAttribute’ op het invoerveld en klik op de button met de 3 puntjes die dan verschijnt;
- Nu kun je door te browsen het gerelateerde attribuut vinden.

### Relaties:

- Een trace wordt bij een relatie gelegd door bij de relatie waar vandaan de trace gelegd wordt de tagged value "SourceAssociation" op te nemen. De waarde van deze "SourceAssociation" is de GUID van de relatie waar de trace naar toe gelegd wordt. Deze GUID is op te halen m.b.v. de Navigator. Door eerst in een diagram de doel-relatie te selecteren kan in de navigator de GUID gekopieerd worden middel de "copy GUID" knop. Vervolgens staat de GUID op het klembord en kan deze in de waarde van de tagged value "SourceAssociation" geplakt worden.

### Enumeraties:

- ?

## Het toevoegen van relatieklasses

Het toevoegen van relatieklassen kan op 2 manieren. Hieronder worden beide wijzen beschreven echter alleen de tweede wijze is correct omdat dat de enige wijze is waarop het juiste MIM stereotype (Relatieklasse) aan de relatieklasse gekoppeld kan worden.

*Foutief:*

*Door het koppelen van een class aan een association*
In dit geval bestaan de association en de class al en wordt de class op de volgende wijze aan de association gekoppeld:
- Plaats de class in het diagram waarin ook de association zichtbaar is;
- Klik met de rechter muistoets op de class en selecteer 'Advanced - Association Class ...';
- Kies de gewenste association.

*Correct:*

*Door het direct aanmaken van een association class*
In dit geval worden zowel de association als de class op het moment van aanmaken van de association class gecreëerd.
- Maak een association aan en kies als type 'Association Class';
- Voorzie zowel de association als de class van het juiste stereotype en andere metadata en de class van de gewenste attributes.


## Werkinstructie synchroniseren informatiemodel of uitwisselingsmodel met aangepast metamodel t.a.v. nieuw toegevoegde tagged values


Het kan zijn dat er op een bestaand stereotype een aanpassing is doorgevoerd in het profiel waarbij er een of meer nieuwe tagged values zijn opgenomen bij het betreffende stereotype. De bestaande modellen (SIM, UGM en BSM) moeten uitgebreid worden met deze nieuwe tagged values. Dit kan als volgt doorgevoerd worden nadat je het nieuwe profiel heb ingelezen.
- Selecteer het <<domain>> Model waarop de aanpassingen doorgevoerd moeten worden.
- Ga naar de toolbox.
- Selecteer het profiel waarop een wijziging is doorgevoerd (MIG of MUG)
- Selecteer een item uit het profiel in een van de groepen Type, Gegeven of Relatie dat gewijzigd is
- Druk vervolgens op de rechtermuisknop
- Selecteer in het pop-up menu Synchronize stereotype
- Klik op Ok.
- Als het goed is zie je alle aanpassingen op het scherm verschijnen.

Let op: wanneer in het profiel tagged values verwijderd zijn dan moet er een script gedraaid worden. Ga daarvoor naar de beheerder van het metamodel

## 'Set traceability' script draaien

Voor het toepassen van het 'Set traceability' script moet het package waarop het script wordt toegepast uitgecheckt zijn of niet onder invloed van versie controle staan.

Het toepassen van het 'set traceability' script gaat als volgt:
- selecteer het package waarvan je de traces wil wijzigen met je rechtermuisknop;
- selecteer 'Scripts' en 'Set Traceability with transformation' of 'Set Traceability without transformation'
!https://kinggemeenten.plan.io/attachments/download/160335/Set-traceablility1.jpg!;

>* Gebruik 'with transformation' als je op basis van een SIM een UGM hebt gemaakt, Je wil dan niet alleen de traces instellen maar ook de stereotypes aanpassen.
>* Gebruik 'without transformation' als je op basis van een SIM een ander SIM hebt gemaakt of op basis van een UGM een nader UGM, Aanpassen van de stereotypes is dan niet nodig.

- Er wordt je nu gevraagd het package te selecteren waarnaar de traces moeten lopen
!https://kinggemeenten.plan.io/attachments/download/160336/Set-traceablility2.jpg!;
- Klik op 'OK' en selecteer in het volgende menu het betreffende package
!https://kinggemeenten.plan.io/attachments/download/160337/Set-traceablility3.jpg!;
- Klik wederom op 'OK' waarna het script zijn werk gaat doen. In de System Output kun je het verloop van het script volgen. Zodra het klaar is wordt dat aangegeven met 'Finished adding traces'.
!https://kinggemeenten.plan.io/attachments/download/160338/Set-traceablility4.jpg!.

## Verwijderen van versie control op een package

Af en toe is het nodig om versie controle van een package te verwijderen. Dit gaat als volgt:

- Selecteer de betreffende package en kies via de linkermuis-knop de keuze 'Package Control'  en in het Sub-menu de keuze 'Configure';
- Kies in het pop-up menu de keuze 'Configure';
- Klik het vinkje bij 'Control Package' uit;
- Klik op 'OK'.

!https://kinggemeenten.plan.io/attachments/download/161704!

In Enterprise Architect 15.1 kan dit menu gevonden worden via het menu *Publish > Model Exhange > Package Control > Configure > Package Control...*.
