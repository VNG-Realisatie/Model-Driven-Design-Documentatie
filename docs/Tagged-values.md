---
layout: page-with-side-nav
title: Tagged Values
---
# 7 Tagged Values

M.b.v. tagged values (TV's) kan aan constructies in UML extra semantiek meegegeven worden. De aanwezigheid van TV's kan m.b.v. metamodellen gefaciliteerd of m.b.v. Imvertor afgedwongen worden. In de volgende tabel staan TV's die noch gefaciliteerd noch afgedwongen worden. Daarnaast hebben ze ook geen functie voor Imvertor. Het is echter de afspraak dat we onze modellen er van voorzien ter documentatie.

| Tv-naam |  Waar | Verplicht (in) | Beschrijving | Mogelijke waarden | Afleiding mogelijk |
| ----------------- | ----- | -------------- | ------------ | ----------------- | ------------------ |
| Versienummer yyy xxxx | Packages | Nee | Versienummer van een suppliermodel. 'xxxx' komt dan overeen met een van de waarden genoemd in de TV 'Supplier-name'. De waarde van deze TV zelf komt overeen met de EA property 'Version' van het bewuste suppliermodel. Deze TV is strikt informatief. | bijv. '02.02.00' | Nee |

De tabellen in de volgende secties bevatten de tagged values voor de SIM, UGM en BSM modellen die voor Imvertor en de genereer-code (XML/SOAP en JSON / JSON Linked Data) nodig zijn om op juiste wijze te kunnen werken. Deze tabellen zijn gegenereerd op basis van de Imvertor configuratiebestanden. Aanpassingen van deze tabellen moeten dan ook niet op deze plaats plaatsvinden maar in de configuratiebestanden waarna deze tabellen weer gegenereerd moeten worden.

## Tagged values voor de MIM gebaseerde SIM (Semantische Informatie Modellen)

Generated: 2023-03-01

| Tagged value naam | Waar | Verplicht (in) | Beschrijving | Mogelijke waarden _(in vet de defaultwaarde)_ | Afleiding mogelijk |
| --- | --- | --- | --- | --- | --- |
| 'Herkomst definitie' | Attribuutsoort_proxy, Gegevensgroeptype_proxy, Objecttype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld. | | |
| 'Indicatie materiële historie' | Attribuutsoort_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: Indicatie of de materiële historie van het kenmerk van het object te bevragen is. | 'Ja', *'Nee'*, 'Zie groep', 'Ja, zie regels', 'N.v.t.' | |
| 'Indicatie formele historie' | Attribuutsoort_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is. | 'Ja', *'Nee'*, 'Zie groep', 'N.v.t.' | |
| 'Authentiek' | Attribuutsoort_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: Aanduiding of het kenmerk een authentiek gegeven betreft. | | |
| 'Mogelijk geen waarde' | Attribuutsoort_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is. | | |
| 'Herkomst' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is. | | |
| 'Populatie' | Objecttype_proxy | Nee | MIM 1.1: Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn. | | |
| 'Begrip' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd. De verwijzing heeft de vorm van een term of een URI. | | |
| 'Datum opname' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: De datum waarop het modelelement is opgenomen in het informatiemodel. | | |
| 'Kwaliteit' | Objecttype_proxy | Nee | MIM 1.1: Beschrijving van de mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn. | | |
| 'Definitie' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: De beschrijving van de betekenis van dit modelelement. | | |
| 'Toelichting' | Objecttype_proxy, Attribuutsoort_proxy, Gegevensgroeptype_proxy, Gegevensgroep_proxy | Nee | MIM 1.1: Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding. | | |
| 'Regels' | Attribuutsoort_proxy, Gegevensgroeptype_proxy | Nee | *Wie kan hier een definitie van geven ?* | | |
| 'Patroon' | Attribuutsoort_proxy | Nee | MIM 1.1: De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur. | | |
| 'Formeel patroon' | Attribuutsoort_proxy | Nee | MIM 1.1: Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de computer wordt herkend. | | |
| 'Lengte' | Attribuutsoort_proxy | Nee | MIM 1.1: De aanduiding van de lengte van een gegeven. | | |
| 'Locatie' | Attribuutsoort_proxy | Nee | MIM 1.1: Als het type van het attribuutsoort een waardenlijst is, dan wordt hier de locatie waar deze te vinden is opgegeven. | | |
| 'Eigenaar' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroeptype_proxy | Nee | *Wie kan hier een definitie van geven ?* | | |
| 'Alternatieve naam' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroeptype_proxy | Nee | De naam in natuurlijke of formele taal; afhankelijk van gekozen aanpak. Een alternatieve naam. | | Ja |
| 'Positie' | Attribuutsoort_proxy, Objecttype_proxy, Gegevensgroep_proxy | Nee | De positie van de construct binnen producten waarin deze opeenvolging een rol speelt. | | |
| 'Indicatie classificerend' | Attribuutsoort_proxy | Nee | MIM 1.1: Indicatie dat een attribuutsoort het objecttype waar het bijhoort classificeert in (sub)typen. | | |
| 'Aanduiding strijdigheid/nietigheid' | Attribuutsoort, Gegevensgroep, Relatiesoort, Attribuutsoort_proxy, Gegevensgroep_proxy | Nee | De aanduiding of te bevragen is dat de attribuutwaarde strijdig met de openbare orde dan wel nietig is. | | Ja |
| 'Afkorting' | Informatiemodel, Basismodel, Toepassing, Domein, View | Nee | Afkorting van dit model. Deze afkorting wordt o.a. gebruikt waar informatie over het model wordt gepubliceerd. | | Ja |
| 'Beheerder' | Informatiemodel, Domein, Extern, View | Nee | Naam van de beheerder van het model of het deel van het model. | | Ja |
| 'Imvertor' | Informatiemodel, Basismodel, Toepassing | Nee | Deze waarde geeft aan dat het pakket een volledig model is dat kan worden verwerkt door de Imvertor-software. Deze waarde is vereist door de Imvertor add-in op Enterprise Architect. | | Nee |
| 'Indicatie in onderzoek' | Attribuutsoort, Gegevensgroep, Relatiesoort, Attribuutsoort_proxy, Gegevensgroep_proxy | Nee | De indicatie of te bevragen is dat er twijfel is of is geweest aan de juistheid van de attribuutwaarde en dat een onderzoek wordt of is uitgevoerd naar de juistheid van de attribuutwaarde. | 'Ja', *'Nee'*, 'Zie groep' | Ja |
| 'Informatiedomein' | Informatiemodel | Ja | MIM 1.1: Aanduiding van het functionele domein waartoe het informatiemodel behoort. | | Ja |
| 'Informatiemodel type' | Informatiemodel | Ja | MIM 1.1: De beschrijving van de aard van het informatiemodel, hoe het geïnterpreteerd moet worden. | *'Conceptueel'*, 'Logisch' | Ja |
| 'Intern project' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Interne naam' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Interne release' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Is afgeleid' | Project, Basismodel, Toepassing, Domein, Extern, Intern, Objecttype, Relatiesoort, Relatierol, Data element, Attribuutsoort, Gegevensgroep, Referentielijst, Referentie element, Keuze, Enumeratie, Enumeratiewaarde, Codelijst, Gegevensgroeptype, Relatieklasse, Gestructureerd datatype, Primitief datatype, Interface | Nee | Deze constructie is al dan niet afgeleid van een "supplier model". Wanneer je niks opgeeft wordt afleiding vastgesteld op basis van het package waarin het voorkomt. | 'Nee', 'Ja', *'Zie package'* | Nee |
| 'Is includeerbaar' | Product | Nee | Deze constructie kan via xi:include worden geincludeerd in het document. De equivalente constructie in het XML schema, of constructies daarbinnen, krijgt hierdoor dan een optioneel attribuut xml:base bijgevoegd. | 'Ja', *'Nee'* | JaJa |
| 'Maximumwaarde' | Attribuutsoort, Data element, Primitief datatype, Gestructureerd datatype | Nee | De boven (inclusief) voor de waarde. | | Ja |
| 'MIM extensie' | Informatiemodel | Nee | MIM 1.1: De aanduiding van een extensie op MIM. | | Ja |
| 'MIM extensie versie' | Informatiemodel | Nee | De versie van de extensie op MIM. | | Ja |
| 'MIM taal' | Informatiemodel | Nee | De aanduiding van de taal die gebruikt is voor de modelelementen. | MIM 1.1: De aanduiding van de taal die gebruikt is voor de modelelementen. | *'NL'*, 'EN' | Ja |
| 'MIM versie' | Informatiemodel | Ja | MIM 1.1: De versie van de MIM specificatie die gebruikt is om het informatiemodel in uit te drukken. | *'1.1'*, *'1.1.0'* | Ja |
| 'Minimumwaarde' | Attribuutsoort, Data element, Primitief datatype, Gestructureerd datatype | Nee | De ondergrens (inclusief) voor de waarde. | | Ja |
| 'Niveau' | Informatiemodel, Basismodel | Nee | Het niveau is een waarde uit een beperkte set: "algemeen" betekent dat het model een fundament is van een ander model en moet worden opgenomen. Het modelleert generieke constructies die deel uitmaken van de echte wereld. Dit omvat meestal abstracte object typen. Het kan andere constructen bevatten. "specifiek" betekent dat het model een bepaald domein beschrijft of een samenhangend deel ervan . | 'generiek', *'specifiek'* | Nee |
| 'Ref-release' | Domein, View, Extern | Nee | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Ref-version' | Domein, View, Extern | Nee | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Relatiemodelleringtype' | Informatiemodel | Ja | MIM 1.1: Aanduiding van een in MIM gedefinieerd alternatief voor een modelleringswijze, en welke keuze hierbij is gemaakt. | *'Relatiesoort leidend'*, 'Relatierol leidend' | Ja |
| 'Release' | Informatiemodel, Basismodel, Toepassing, Domein, View, Extern, Intern | Informatiemodel, Basismodel, Toepassing, Domein, View, Intern | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Supplier-name' | Informatiemodel, Basismodel, Toepassing | Toepassing | De naam van het supplier model. Alleen opnemen wanneer van afleiding sprake is. | | Nee |
| 'Supplier-package-name' | Domein, View | Nee | De naam van de supplier (domein of view) package. Deze naam wordt opgegeven als deze niet gelijk is aan de naam van het package waar de tagged value op geplaatst is. | | Nee |
| 'Supplier-project' | Informatiemodel, Basismodel, Toepassing | Toepassing | De naam van het supplier project. Alleen opnemen wanneer van afleiding sprake is. | | Nee |
| 'Supplier-release' | Informatiemodel, Basismodel, Toepassing | Toepassing | De release van het supplier model. Alleen opnemen wanneer van afleiding sprake is. | | Nee |
| 'Versie ID' | Informatiemodel, Basismodel, Toepassing, Domein, Extern, View | Nee | De identificatie van de versie/revisie van dit model of model-element in het gehanteerde versiebeheersysteem. | | Nee |
| 'Web locatie' | Basismodel, Toepassing, Extern, View, Domein | Nee | **Wie kan hier een definitie van geven ?** | | Ja |

## Tagged values voor de UGM (UitwisselingsGegevensModel)

Generated: 2023-03-01

| Tagged value naam | Waar | Verplicht (in) | Beschrijving | Mogelijke waarden _(in vet de defaultwaarde)_ | Afleiding mogelijk |
| --- | --- | --- | --- | --- | --- |
| 'Is afgeleid' | Gegevensgroep | Nee | Deze constructie is al dan niet afgeleid van een "supplier model". Wanneer je niks opgeeft wordt afleiding vastgesteld op basis van het package waarin het voorkomt. | | Nee |
| 'Data locatie' | Extern, View | View | De locatie waar informatie over de gegevens van een construct te vinden zijn. Wanneer het een external of view package betreft: De verwijzing naar de locatie van het bijbehorende informatiemodel waar dit package een representatie van is. In alle andere gevallen moet het een waardenlijst betreffen. Het gaat dan om de verwijzing naar de plek waar de waarden beschikbaar worden gesteld. De verwijzing heeft de vorm van een URI conform een gekozen URI strategie. | | Ja |
| 'Afkorting' | Basismodel, Toepassing, Domein, View | Nee | Afkorting van dit model. Deze afkorting wordt o.a. gebruikt waar informatie over het model wordt gepubliceerd. | | Ja |
| 'Beheerder' | Extern | Nee | Naam van de beheerder van het model. | | Ja |
| 'Definitie' | Project, Basismodel, Toepassing, Domein, View, Extern, Intern | Nee | De beschrijving van de betekenis van de construct zoals gespecificeerd in de catalogus van de desbetreffende (basis)registratie of informatiemodel. | | |
| 'Endpoint beschikbaar' | Entiteittype | Nee | Voorziening waarmee kan worden aangegeven dat er voor een entiteit al dan niet een resource endpoint beschikbaar is. | *'Ja'*, 'Nee' | Nee |
| 'Example' | Element | Nee | Voorbeeldwaarde van een property. | | Nee |
| 'Formeel patroon' | Tabel Element, Element, Complex datatype, Data element, Union element, Datatype Primitief datatype | Nee | Formele notatie in de vorm van een reguliere expressie van het gegevenspatroon van een element. | | Nee |
| 'Groepsnaam' | Groep | Nee | Voorziening om een groep aangepaste naam te kunnen geven. | | Nee |
| 'Herkomst' | Element, Datatype Primitief datatype, Complex datatype, Gegevensgroep, Relatie, Data element, Groep, Tabel-entiteit | Nee | **Wie kan hier een definitie van geven ?** | | Ja |
| 'Imvertor' | Basismodel, Toepassing | Nee | Deze waarde geeft aan dat het pakket een volledig model is dat kan worden verwerkt door de Imvertor-software. Deze waarde is vereist door de Imvertor add-in op Enterprise Architect. | | Nee |
| 'Indicatie authentiek' | Element, Groep, Relatie | Nee | Aanduiding of het een authentiek gegeven (attribuutsoort) betreft. | | Ja |
| 'Indicatie formele historie' | Element, Gegevensgroep, Relatie | Ja | Voorziening waarmee aangegeven kan worden of formele historie van toepassing is op de constructie. | 'Ja', *'Nee'*, 'Zie groep', 'N.v.t.' | Ja |
| 'Indicatie in onderzoek' | Element, Gegevensgroep, Relatie | Nee | De indicatie of te bevragen is dat er twijfel is of is geweest aan de juistheid van de attribuutwaarde en dat een onderzoek wordt of is uitgevoerd naar de juistheid van de attribuutwaarde. | | Ja |
| 'Indicatie kerngegeven' | Element, Groep, Relatie, Relatie-entiteit | Nee | Indicatie om aan te kunnen geven of een gegeven deel uit maakt van de matchgegevens. Een groep van gegevens waarmee een entiteit gevonden kan worden. Heeft alleen een toepassing binnen StUF schema's. Deprecated. | 'Ja', *'Nee'* | Ja |
| 'Indicatie matchgegeven' | Element, Groep, Relatie, Relatie-entiteit | Nee | Indicatie dat het gegeven noodzakelijk is voor het kunnen identificeren van een object. Heeft alleen een toepassing binnen StUF schema's. | 'Ja', *'Nee'* | Ja |
| 'Indicatie materiële historie' | Element, Gegevensgroep, Relatie | Ja | Voorziening waarmee aangegeven kan worden of materiële historie van toepassing is op de constructie. | 'Ja', *'Nee'*, 'Zie groep', 'N.v.t.', 'Ja, zie regels' | Ja |
| 'Intern project' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Interne naam' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Interne release' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Is includeerbaar' | Product | Nee | Deze constructie kan via xi:include worden geincludeerd in het document. De equivalente constructie in het XML schema, of constructies daarbinnen, krijgt hierdoor dan een optioneel attribuut xml:base bijgevoegd. | 'Ja', *'Nee'* | JaJa |
| 'Lengte' | Element, Data element, Datatype Primitief datatype, Tabel Element | Nee | De maximale lengte die een attribuut kan hebben. | | Nee |
| 'Maximum waarde (inclusief)' | Element, Data element, Datatype Primitief datatype | Nee | DDe maximale waarde (inclusief) dat een attribuut mag hebben. | | Nee |
| 'Minimum lengte' | Element, Data element, Datatype Primitief datatype, Tabel Element | Nee | De minimale lengte die een attribuut moet hebben. | | Nee |
| 'Minimum waarde (inclusief)' | Element, Data element, Datatype Primitief datatype | Nee | De minimale waarde (inclusief) dat een attribuut moet hebben | | Nee |
| 'Mogelijk geen waarde' | Element, Groep, Relatie, Gegevensgroep | Nee | Indicatie waarmee wordt aangegeven dat het gegeven ook geen waarde kan hebben. | 'Ja', *'Nee'* | Ja |
| 'Naam' | Project, Basismodel, Toepassing, Domein, View, Extern, Intern | Nee | **Wie kan hier een definitie van geven ?** | | |
| 'Naam in meervoud' | Entiteittype | Ja | Voorziening om een entiteit een meervoudsnaam te kunnen geven. Deze wordt gebruikt als propertynaam van een entiteit in het yaml bestand. | | |
| 'Niveau' | Basismodel | Nee | Het niveau is een waarde uit een beperkte set: "algemeen" betekent dat het model een fundament is van een ander model en moet worden opgenomen. Het modelleert generieke constructies die deel uitmaken van de echte wereld. Dit omvat meestal abstracte object typen. Het kan andere constructen bevatten. "specifiek" betekent dat het model een bepaald domein beschrijft of een samenhangend deel ervan . | 'generiek', *'specifiek'* | Nee |
| 'Patroon' | Element, Complex datatype, Data element, Union element, Datatype Primitief datatype | Nee | Beschrijving van het gegevenspatroon van een element. Dit kan de basis zijn voor een reguliere expressie. | | Nee |
| 'Positie' | Domein, Extern, Intern, Entiteittype, Relatie, Data element, Element, Tabel-entiteit, Tabel Element, Union, Union element, Enumeration, Enum, Relatie-entiteit, Complex datatype, Datatype Primitief datatype, Interface | Nee | De positie van de construct binnen producten waarin deze opeenvolging een rol speelt. | | Ja |
| 'Ref-release' | Domein, View, Extern | Nee | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Ref-version' | Domein, View, Extern | Nee | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Release' | Basismodel, Toepassing, Domein, View, Extern, Intern | Basismodel, Toepassing, Domein, View, Intern | Dit bevat de releasedatum in het format yyyymmdd . De releasedatum wordt mede gebruikt om een model, koppelvlak of bericht uniek te identificeren in Imvertor. | Bijv. '20170901' | Nee |
| 'Restriction identifier' | Entiteittype, Relatie, Element, Groep, Groep compositie, Relatie-entiteit, Tabel-entiteit, Tabel Element, Enumeration, Datatype Primitief datatype, Complex datatype, Union, Data element, Union element, Enum | Nee | Een label dat aan een construct kan worden toegekend om onderscheid mogelijk te maken tussen aangescherpte constructs die afgeleid zijn van eenzelfde construct. Heeft alleen een functie bij het genereren van StUF schema's. | | Ja |
| 'Supplier-name' | Basismodel, Toepassing | Toepassing | De naam van het supplier model. Alleen opnemen wanneer van afleiding sprake is. | Dit bevat de naam van het suppliermodel waarvan een model hergebruik maakt. Er zijn meerdere waardes mogelijk, gescheiden door een ; (puntkomma) Volgorde moet corresponderen met die in Supplier-project en Supplier-release. Alleen opnemen wanneer van afleiding sprake is. | Bijv. 'SIM;SIM' | Nee |
| 'Supplier-package-name' | Domein, View | Nee | De naam van de supplier (domein of view) package. Deze naam wordt opgegeven als deze niet gelijk is aan de naam van het package waar de tagged value op geplaatst is. | | Nee |
| 'Supplier-project' | Basismodel, Toepassing | Toepassing | De naam van het supplier project. Alleen opnemen wanneer van afleiding sprake is. | Dit bevat de naam van project waarbinnen het suppliermodel waarvan een model hergebruik maakt is opgenomen. Er zijn meerdere waardes mogelijk, gescheiden door een ; (puntkomma) . Volgorde moet corresponderen met die in Supplier-name en Supplier-release. Alleen opnemen wanneer van afleiding sprake is. | Bijv. 'RSGB;IMztc' | Nee |
| 'Supplier-release' | Basismodel, Toepassing | Toepassing | De release van het supplier model. Alleen opnemen wanneer van afleiding sprake is. | Dit bevat de releasedatum in het format yyyymmdd van het suppliermodel waarvan een model hergebruik maakt. Er zijn meerdere waardes mogelijk, gescheiden door een ; (puntkomma) . Volgorde moet corresponderen met die in supplier-name en supplier-project. Alleen opnemen wanneer van afleiding sprake is. | Bijv. '20170901;20170801' | Nee |
| 'Target role in meervoud' | Relatie | Ja | Voorziening om de target role een meervoudsnaam te kunnen geven. Deze wordt gebruikt als propertynaam van een relatie in het yaml bestand. | | |
| 'Toelichting' 'Omschrijving' | Entiteittype, Element, Relatie, Groep, Relatie-entiteit, Tabel-entiteit, Tabel Element, Enumeration, Datatype Primitief datatype, Complex datatype, Union, Data element, Union element, Enum | Nee | Aanvullende beschrijving van het construct met de bedoeling dat te verduidelijken. | | Ja |
| 'Verkorte alias' | Toepassing, Basismodel | Toepassing, | Verkorte alias is een korte naam, die uiteindelijk gekoppeld is aan een namespace in XML schema. In feite is het dus een technisch configuratie-element. Heeft alleen een toepassing binnen StUF schema's. | | Nee |
| 'Versie ID' | Basismodel, Toepassing, Domein, Extern, View | Nee | De identificatie van de versie/revisie van dit model of model-element in het gehanteerde versiebeheersysteem. | | Nee |
| 'Web locatie' | Basismodel, Toepassing, Extern, View, Domein | Nee | **Wie kan hier een definitie van geven ?** | | Ja |

## Tagged values voor de BSM (Bericht Structuur Modellen)

Generated: 2023-03-01

| Tagged value naam | Waar | Verplicht (in) | Beschrijving | Mogelijke waarden _(in vet de defaultwaarde)_ | Afleiding mogelijk |
| --- | --- | --- | --- | --- | --- |
| 'Indicatie authentiek' | Element, Groep, Relatie | Nee | Aanduiding of het een authentiek gegeven (attribuutsoort) betreft. | | Ja |
| 'Indicatie materiële historie' | Element, Groep, Relatie | Nee | Voorziening waarmee aangegeven kan worden of materiële historie van toepassing is op de constructie. | | Ja |
| 'Indicatie formele historie' | Element, Groep, Relatie | Nee | Voorziening waarmee aangegeven kan worden of formele historie van toepassing is op de constructie. | | Ja |
| 'Supplier-project' | Koppelvlak Toepassing | Ja | De naam van het supplier project. Alleen opnemen wanneer van afleiding sprake is. | Dit bevat de naam van project waarbinnen het suppliermodel waarvan een model hergebruik maakt is opgenomen. Er zijn meerdere waardes mogelijk, gescheiden door een ; (puntkomma) . Volgorde moet corresponderen met die in Supplier-name en Supplier-release. Alleen opnemen wanneer van afleiding sprake is. | Bijv. 'RSGB;IMztc' | |
| 'Supplier-name' | Koppelvlak Toepassing | Ja | De naam van het supplier model. Alleen opnemen wanneer van afleiding sprake is. | Dit bevat de naam van het suppliermodel waarvan een model hergebruik maakt. Er zijn meerdere waardes mogelijk, gescheiden door een ; (puntkomma) Volgorde moet corresponderen met die in Supplier-project en Supplier-release. Alleen opnemen wanneer van afleiding sprake is. | Bijv. 'SIM;SIM' | |
| 'Supplier-package-name' | Koppelvlak Toepassing | Nee | De naam van de supplier (domein of view) package. Deze naam wordt opgegeven als deze niet gelijk is aan de naam van het package waar de tagged value op geplaatst is. | | |
| 'Supplier-release' | Koppelvlak Toepassing | Ja | De release van het supplier model. Alleen opnemen wanneer van afleiding sprake is. | Dit bevat de releasedatum in het format yyyymmdd van het suppliermodel waarvan een model hergebruik maakt. Er zijn meerdere waardes mogelijk, gescheiden door een ; (puntkomma) . Volgorde moet corresponderen met die in supplier-name en supplier-project. Alleen opnemen wanneer van afleiding sprake is. | Bijv. '20170901;20170801' | |
| 'Positie' | Entiteitrelatie | Nee | De positie van de construct binnen producten waarin deze opeenvolging een rol speelt. | | Ja |
| 'Is afgeleid' | Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vraagberichttype, Vrij berichttype, Getberichttype, Patchberichttype, Postberichttype, Putberichttype, Deleteberichttype, Padtype, Entiteitrelatie, Berichtrelatie, Padrelatie | Ja | Deze constructie is al dan niet afgeleid van een "supplier model". Wanneer je niks opgeeft wordt afleiding vastgesteld op basis van het package waarin het voorkomt. | | |
| 'Data locatie' | Extern, View | View | De locatie waar informatie over de gegevens van een construct te vinden zijn. Wanneer het een external of view package betreft: De verwijzing naar de locatie van het bijbehorende informatiemodel waar dit package een representatie van is. In alle andere gevallen moet het een waardenlijst betreffen. Het gaat dan om de verwijzing naar de plek waar de waarden beschikbaar worden gesteld. De verwijzing heeft de vorm van een URI conform een gekozen URI strategie. | | Ja |
| 'aanvullendeElementen genereren' | Koppelvlak Toepassing | Nee | Geeft aan of er in de XML-schema's 'aanvullendeElementen' elementen moeten worden mee gegenereerd. Standaard worden deze optioneel mee gegenereerd. Kan alleen op Koppelvlak niveau worden gedefinieerd. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Ja'* | |
| 'Afkorting' | Basismodel, Koppelvlak Toepassing, Domein, View | Nee | Afkorting van dit model. Deze afkorting wordt o.a. gebruikt waar informatie over het model wordt gepubliceerd. | | Ja |
| 'Beheerder' | Extern | Nee | Naam van de beheerder van het model. | | Ja |
| 'beheerder_email' | Koppelvlak Toepassing | Nee | e-Mailadres van de beheerder van het koppelvlak. | | Nee |
| 'Berichtcode' | Vraagberichttype, Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vrij berichttype, Getberichttype, Patchberichttype, Postberichttype, Putberichttype, Deleteberichttype | Ja | Code waarmee de aard van een bericht uniek geidentificeerd kan worden. | 'Bv01', 'Bv02', 'Bv03', 'Bv04', 'De01', 'Di01', 'Di02', 'Du01', 'Du02', 'Fo01', 'Fo02', 'Fo03', 'Gc01', 'Gc02', 'Gr01', 'La01', 'La02', 'La03', 'La04', 'La05', 'La06', 'La07', 'La08', 'La09', 'La10', 'La11', 'La12', 'La13', 'La14', 'Lk01', 'Lk02', 'Lk03', 'Lk04', 'Lk05', 'Lk06', 'Lv01', 'Lv02', 'Lv03', 'Lv04', 'Lv05', 'Lv06', 'Lv07', 'Lv08', 'Lv09', 'Lv10', 'Lv11', 'Lv12', 'Lv13', 'Lv14', 'Pa01', 'Po01', 'Pu01', 'Sa01', 'Sa02', 'Sa03', 'Sa04', 'Sh01', 'Sh02', 'Sh03', 'Sh04', 'Tr01' | Nee |
| 'Bijzonderheden' | Vraagberichttype, Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vrij berichttype | Nee | Opnemen ter documentatie van een bericht. | | Nee |
| 'custom_path_facet' | Padtype | Nee | Het deel van de messagenaam dat niet uit het model afgeled kan worden. Om de messagenaam toch te kunnen verifieren tegen het model wordt daar eerst de custom_path_facet uit verwijderd. Deze tv mag ‘/’ (slashes) bevatten maar niet aan het begin en eind. | | Nee |
| 'Definitie' | Entiteittype, Element, Relatie, Groep, Relatie-entiteit, Tabel-entiteit, Tabel Element, Enumeration, Datatype Primitief datatype, Complex datatype, Union, Data element, Union element, Enum, Extern, View | Nee | De beschrijving van de betekenis van de construct zoals gespecificeerd in de catalogus van de desbetreffende (basis)registratie of informatiemodel. | De beschrijving van de betekenis van de construct zoals gespecificeerd in de catalogus van de desbetreffende (basis)registratie of informatiemodel. | | Ja |
| 'Direct gevolg' | Vraagberichttype, Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vrij berichttype | Nee | Opnemen ter documentatie van een bericht. | | Nee |
| 'e-types genereren' | Koppelvlak Toepassing | Nee | Geeft aan of de -e complexTypes in de XML-schema's mee gegenereerd moeten worden. Standaard worden deze mee gegenereerd. Kan alleen op Koppelvlak niveau worden gedefinieerd. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Ja'* | |
| 'Endpoint beschikbaar' | Entiteittype | Nee | Voorziening waarmee kan worden aangegeven dat er voor een entiteit al dan niet een resource endpoint beschikbaar is. | *'Ja'*, 'Nee' | Nee |
| 'Example' | Element | Nee | Voorbeeldwaarde van een property. | | Nee |
| 'extraElementen genereren' | Koppelvlak Toepassing | Nee | Geeft aan of er in de XML-schema's 'extraElementen' elementen moeten worden mee gegenereerd. Standaard worden deze optioneel mee gegenereerd. Kan alleen op Koppelvlak niveau worden gedefinieerd. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Ja'* | |
| 'Formeel patroon' | Tabel Element, Element, Complex datatype, Data element, Union element, Datatype Primitief datatype | Nee | Formele notatie in de vorm van een reguliere expressie van het gegevenspatroon van een element. | | Nee |
| 'Functie berichtrelatie' | Berichtrelatie | Nee | Geeft het karakter aan van de berichtrelatie. Heeft alleen een functie bij StUF schema generatie. | 'update', 'selectie', *'antwoord'* | Nee |
| 'Functie entiteitrelatie' | Entiteitrelatie | Nee | Geeft het karakter aan van de entiteitrelatie. Heeft alleen een functie bij StUF schema generatie. | 'entiteit' | Nee |
| 'Groepsnaam' | Groep | Nee | Voorziening om een groep aangepaste naam te kunnen geven. | | Nee |
| 'Grouping' | Getberichttype | Nee | Indicatie waarmee wordt aangegeven of de response meerdere resultaten kan teruggeven (collection) of slechts 1 resultaat (resource). | 'resource', 'collection' | Nee |
| 'Herkomst' | Element, Datatype Primitief datatype, Complex datatype, Gegevensgroep, Relatie, Data element, Groep, Tabel-entiteit | Nee | **Wie kan hier een definitie van geven ?** | | Ja |
| 'Imvertor' | Basismodel, Koppelvlak Toepassing | Nee | Deze waarde geeft aan dat het pakket een volledig model is dat kan worden verwerkt door de Imvertor-software. Deze waarde is vereist door de Imvertor add-in op Enterprise Architect. | | Nee |
| 'Indicatie in onderzoek' | Element, Groep, Relatie | Ja | De indicatie of te bevragen is dat er twijfel is of is geweest aan de juistheid van de attribuutwaarde en dat een onderzoek wordt of is uitgevoerd naar de juistheid van de attribuutwaarde. | | Ja |
| 'Indicatie kerngegeven' | Element, Groep, Relatie, Relatie-entiteit | Nee | Indicatie om aan te kunnen geven of een gegeven deel uit maakt van de matchgegevens. Een groep van gegevens waarmee een entiteit gevonden kan worden. Heeft alleen een toepassing binnen StUF schema's. Deprecated. | 'Ja', *'Nee'* | Ja |
| 'Indicatie matchgegeven' | Element, Groep, Relatie, Relatie-entiteit | Nee | Indicatie dat het gegeven noodzakelijk is voor het kunnen identificeren van een object. Heeft alleen een toepassing binnen StUF schema's. | 'Ja', *'Nee'* | Ja |
| 'Intern project' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Interne naam' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Interne release' | Intern | Ja | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Is includeerbaar' | Product | Nee | Deze constructie kan via xi:include worden geincludeerd in het document. De equivalente constructie in het XML schema, of constructies daarbinnen, krijgt hierdoor dan een optioneel attribuut xml:base bijgevoegd. | 'Ja', *'Nee'* | JaJa |
| 'Koppelvlak-naam' | Koppelvlak Toepassing | Ja | De naam van het koppelvlak. | | Nee |
| 'Lege enumeration toegestaan' | Enumeration, Koppelvlak Toepassing | Nee | Geeft aan of er aan elke enumeratie simpleType ook een lege enumeratie toegevoegd moet worden. Standaard wordt dit mee gegenereerd. Kan zowel op Koppelvlak niveau als op enumeration niveau worden gedefinieerd waarbij die op attribuutniveau die op op Koppelvlak niveau overrulled. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Ja'* | |
| 'Lengte' | Element, Data element, Datatype Primitief datatype, Tabel Element | Nee | De maximale lengte die een attribuut kan hebben. | | Nee |
| 'Maximum waarde (inclusief)' | Element, Data element, Datatype Primitief datatype | Nee | DDe maximale waarde (inclusief) dat een attribuut mag hebben. | | Nee |
| 'Minimum lengte' | Element, Data element, Datatype Primitief datatype, Tabel Element | Nee | De minimale lengte die een attribuut moet hebben. | | Nee |
| 'Minimum waarde (inclusief)' | Element, Data element, Datatype Primitief datatype | Nee | De minimale waarde (inclusief) dat een attribuut moet hebben | | Nee |
| 'Mogelijk geen waarde' | Element, Groep, Relatie, Gegevensgroep | Nee | Indicatie waarmee wordt aangegeven dat het gegeven ook geen waarde kan hebben. | 'Ja', *'Nee'* | Ja |
| 'Naam' | Project, Basismodel, Koppelvlak Toepassing, Domein, View, Extern, Intern | Nee | **Wie kan hier een definitie van geven ?** | | |
| 'Naam in meervoud' | Entiteittype | Ja | Voorziening om een entiteit een meervoudsnaam te kunnen geven. Deze wordt gebruikt als propertynaam van een entiteit in het yaml bestand. | | |
| 'Niveau' | Basismodel | Nee | Het niveau is een waarde uit een beperkte set: "algemeen" betekent dat het model een fundament is van een ander model en moet worden opgenomen. Het modelleert generieke constructies die deel uitmaken van de echte wereld. Dit omvat meestal abstracte object typen. Het kan andere constructen bevatten. "specifiek" betekent dat het model een bepaald domein beschrijft of een samenhangend deel ervan . | 'generiek', *'specifiek'* | Nee |
| 'noValue toegestaan' | Koppelvlak Toepassing | Nee | Geeft aan of het StUF:noValue attribute in de XML-schema's mee gegenereerd wordt. Standaard wordt dit mee gegenereerd. Kan alleen op Koppelvlak niveau worden gedefinieerd. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Ja'* | |
| 'Page' | Getberichttype | Nee | Indicatie waarmee wordt aangegeven of de response geschikt moet zijn voor hal+json pagination. Natuurlijk alleen van toepassing als de serialisatie ook hal+json is. | 'true', 'false' | Nee |
| 'Patroon' | Element, Complex datatype, Data element, Union element, Datatype Primitief datatype | Nee | Beschrijving van het gegevenspatroon van een element. Dit kan de basis zijn voor een reguliere expressie. | | Nee |
| 'project_url' | Koppelvlak Toepassing | Nee | Url van het bij het koppelvlak horende GitHub project. | | Nee |
| 'Ref-release' | Domein, View, Extern | Nee | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Ref-version' | Domein, View, Extern | Nee | **Wie kan hier een definitie van geven ?** | | Nee |
| 'Release' | Koppelvlak Toepassing | Ja | Dit bevat de releasedatum in het format yyyymmdd . De releasedatum wordt mede gebruikt om een model, koppelvlak of bericht uniek te identificeren in Imvertor. | Bijv. '20170901' | |
| 'Restriction identifier' | Entiteittype, Relatie, Element, Groep, Groep compositie, Relatie-entiteit, Tabel-entiteit, Tabel Element, Enumeration, Datatype Primitief datatype, Complex datatype, Union, Data element, Union element, Enum | Nee | Een label dat aan een construct kan worden toegekend om onderscheid mogelijk te maken tussen aangescherpte constructs die afgeleid zijn van eenzelfde construct. Heeft alleen een functie bij het genereren van StUF schema's. | | Ja |
| 'serialisatie' | Koppelvlak Toepassing | Nee | Het JSON formaat waarin het koppelvlak uitgevoerd moet worden. | 'hal+json', 'json' | Nee |
| 'servicename' | Vraagberichttype, Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vrij berichttype, Getberichttype, Patchberichttype, Postberichttype, Putberichttype, Deleteberichttype | Nee | OperationId van de OAS3 service. | | Nee |
| 'Sort' | Getberichttype | Nee | Indicatie waarmee wordt aangegeven of de request parameter 'Sort' moet worden opgenomen in het bericht. | 'true', 'false' | Nee |
| 'tag' | Getberichttype, Patchberichttype, Postberichttype, Putberichttype, Deleteberichttype | Ja | Naam waarmee een aantal gerelateerde berichten gegroepeerd worden. | | Nee |
| 'Target role in meervoud' | Relatie | Ja | Voorziening om de target role een meervoudsnaam te kunnen geven. Deze wordt gebruikt als propertynaam van een relatie in het yaml bestand. | | |
| 'tijdstipRegistratie genereren' | Koppelvlak Toepassing | Nee | Geeft aan of en zo ja hoe in de XML-schema's de 'tijdstipRegistratie' elementen worden mee gegenereerd. Standaard worden deze optioneel mee gegenereerd. Kan alleen op Koppelvlak niveau worden gedefinieerd. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Optioneel'*, 'Verplicht' | |
| 'tijdvakGeldigheid genereren' | Koppelvlak Toepassing | Nee | Geeft aan of en zo ja hoe in de XML-schema's de 'tijdvakGeldigheid' elementen worden mee gegenereerd. Standaard worden deze optioneel mee gegenereerd. Kan alleen op Koppelvlak niveau worden gedefinieerd. Heeft alleen een functie bij het genereren van StUF schema's. | 'Nee', *'Optioneel'*, 'Verplicht' | |
| 'Toelichting' 'Omschrijving' | Entiteittype, Element, Relatie, Groep, Relatie-entiteit, Tabel-entiteit, Tabel Element, Enumeration, Datatype Primitief datatype, Complex datatype, Union, Data element, Union element, Enum | Nee | Aanvullende beschrijving van het construct met de bedoeling dat te verduidelijken. | | Ja |
| 'toelichting opnemen vanaf' | Koppelvlak Toepassing | Nee | Het model vanaf waar de toelichting moet worden opgenomen. | *'SIM'*, 'UGM', 'BSM' | Nee |
| 'Trigger' | Vraagberichttype, Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vrij berichttype | Nee | Opnemen ter documentatie van een bericht. | | Nee |
| 'Verkorte alias' | Koppelvlak Toepassing, Basismodel | Koppelvlak Toepassing, | Verkorte alias is een korte naam, die uiteindelijk gekoppeld is aan een namespace in XML schema. In feite is het dus een technisch configuratie-element. Heeft alleen een toepassing binnen StUF schema's. | | Nee |
| 'Versie ID' | Basismodel, Koppelvlak Toepassing, Domein, Extern, View | Nee | De identificatie van de versie/revisie van dit model of model-element in het gehanteerde versiebeheersysteem. | | Nee |
| 'Voorwaarde' | Koppelvlak Toepassing, Vraagberichttype, Antwoordberichttype, Kennisgevingberichttype, Synchronisatieberichttype, Vrij berichttype | Nee | Opnemen ter documentatie van een bericht. | | Nee |
| 'Web locatie' | Basismodel, Koppelvlak Toepassing, Extern, View, Domein | Nee | **Wie kan hier een definitie van geven ?** | | Ja |
