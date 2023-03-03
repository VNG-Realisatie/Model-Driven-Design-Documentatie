---
layout: page-with-side-nav
title: Veel voorkomende fouten
---
# 8 Veel voorkomende fouten

| Model |Foutomschrijving| Oplossing|
| --- | --- | --- |
| BSM | Validatiefout op de property "info.title"  | De tagged value "Koppelvlak-naam" op de BSM package is leeg. Hier wordt de naam van de API ingevoerd. |
| BSM | Validatiefout op de property "info.contact.url"  | De tagged value "project_url" op de BSM package is leeg. Hier wordt de url ingevoerd van de lokatie waar de API-documentatie tie vinden is. Vaak de lokatie van de github repository |
| BSM | In een bericht is een entiteittype leeg.  | Indien het entiteittype wordt gerepresenteerd in een complexType waarmee matchgegevens worden gedefinieerd (het heeft dan het woord 'matchgegevens' in de naam) dan kan zijn dat in het model dat entiteittype alleen attributen en relaties bevat die geen matchgegevens zijn. Speelt dit niet dan is mogelijk de situatie van toepassing die in de volgende rij wordt beschreven. |
| BSM | In een bericht is een entiteittype leeg of bevat minder attributes en relaties dan verwacht. | Een mogelijke oorzaak is dat het entiteittype 2 maal is gedefinieerd in het koppelvlak terwijl er op geen van beide een 'Restriction identifier' tagged value is gedefinieerd. Zie ook [[6 Wetenswaardigheden en specials#Meerdere-entiteiten-gebaseerd-op-dezelfde-entiteittypen]] (Meerdere entiteiten gebaseerd op dezelfde entiteittypen) of  [[6 Wetenswaardigheden en specials#Definieren-aangescherpte-enteiten]] (Definieren aangescherpte enteiten) voor een uitgebreide beschrijving. |
| Alle | Bij het draaien van een EA model wordt aangegeven dat er meer dan 1 traces gevonden zijn op een object terwijl bij controle maar 1 trace op het object wordt aangetroffen. | De oorzaak dat dit optreedt kan hem zitten in het corrupt raken van het database model waaruit een EA bestand in feite bestaat. Verwijder het model uit je EA bestand en lees hem opnieuw in. *Let op!* Indien het model supplier is van een ander model dan dien je dat andere model ook te verwijderen en pas weer binnen te halen zodra het eerste model weer binnengehaald is. |
| BSM | Path parameter wordt niet meegegenereerd | Controleer of de tv "naam in meervoud op de parameter-class is ingevuld * Controleer of het volledige parameter-structuur conform query structuur is opgenomen
| BSM | Path parameter wordt niet meegegenereerd | Controleer of de path-parameter als ID is gedefinieerd  |
| BSM | Query parameter wordt niet meegegenereerd |  Controleer of het volledige parameter-structuur conform query structuur is opgenomen
| BSM | Query parameter wordt niet meegegenereerd | Controleer of de kardinaliteit op de relatie is opgenomen
| BSM | Query parameter wordt niet meegegenereerd | Controleer of de parameter niet als tabel of enumeratie is gedefinieerd.
| BSM | Query parameter wordt niet meegegenereerd | Controleer of de TV "naam in meervoud" is ingevuld |
| BSM | Het component voor een Complex Datatype wordt niet meeggegenereerd | Controleer of één van de data-elementen als datatype een tabel-entiteit heeft.  Zo ja, verwijder die en voege eventueel later handmatig toe. |
| BSM | Error parsing Json: Unrecognized character escape 'd' (code 100) etc... | Controleer of er een Patroon of een Formeel patroon is opgenomen bij 1 van de elementen (of zelfs op groepsniveau) Verwijder patroon en documenteer... en voeg pattern later met de hand toe aan OAS3. |
| BSM | Er wordt geen schema-component gegenereerd voor een entiteittype | Controleer of het entiteittype niet als abstract is gedefinieerd. |
| BSM | Onverklaarbare enmureratiewaarden | Waarschijnlijk is de enumeratie gekopieerd van een getrace-de versie. In de waarden zit dan nog de oude TV sourceAttribute. |
| BSM | Ondanks juiste instelling van tagged value 'Serialisatie' wordt er toch een andere schemavorm gegenereerd. | Een mogelijke oorzaak is dat de betreffende tagged value 2x voorkomt. In EA worden de tagged values niet altijd in het 'Tags' tabblad weergegeven maar soms juist in het 'Elements' tabblad. Het kan dus zijn dat de tagged value 'Serialisatie' in beide tabbladen met een andere waarde voorkomt. Verwijder een van beide. |
| BSM | Bij gebruik van een pad met inputparameter die niet aan het eind staat wordt deze inputparameter niet in de yaml opgenomen | Gebruik de tagged value custom_path_facet om de extra pad elementen te negeren zodat de parameter meegenomen wordt. |
