---
layout: page-with-side-nav
title: Het drie-lagen model
---
# 3 Het drie-lagen model

De werkwijze die binnen KING ontwikkeld is om van een Semantisch Informatiemodel (SIM) te komen tot gedocumenteerde koppelvlakken en  berichtschema's is gebaseerd op een drie-lagen-model. Alle drie de lagen zijn opgesteld in UML en worden vastgelegd m.b.v. Enterprise Architect.

Die drie lagen hebben ieder hun eigen context maar zijn wel met elkaar verbonden. Teneinde die verbinding te kunnen leggen en te beheren dienen bij bewerking in Enterprise Architect alle modellen die, evt. via via, d.m.v. traces gerelateerd zijn aan het in bewerking zijnde model aanwezig te zijn in het betreffende Enterprise Architect bestand. Dit wordt in de onderstaande paragrafen verder toegelicht.

##  Laag 1: Semantisch InformatieModel (*SIM*) :

Dit is de basis waarop we het ontwerpen van koppelvlakken stoelen. Het primaire doel van het SIM is het modelleren en weergeven van de werkelijkheid in voor business professionals begrijpelijke structuren en uitleg. We modelleren daarvoor in een SIM de werkelijkheid.

Sommige SIM's zijn generiek van aard andere zijn specifiek voor een domein (Koppelvlak-informatiemodel). De generieke SIM's bevatten objecttypen die in meerdere domeinen een toepassing hebben. De specifieke domein SIM's bevatten objecttypen die alleen van toepassing zijn op een bepaald domein. Tezamen vormen deze SIM's de basis bij het maken van koppelvlakken.  

Bijzonderheden over het [4.3.1 Opstellen van een Koppelvlak-informatiemodel](Opstellen-koppelvlakSIM.md) zijn op een aparte pagina uitgewerkt

### Proxies

Daar waar sprake is van hergebruik van objecttypen en gegevensgroeptypen uit een generieke SIM worden de te hergebruiken objecttypen en gegevensgroeptypes opgenomen in het Koppelvlak specifieke SIM "Proxy".  In deze proxy-objecttypen (met stereotype 'objecttype_proxy') en proxy-gegevensgroeptypes (met stereotype 'Gegevensgroeptype_proxy') worden alleen die attribuutsoorten opgenomen die ook daadwerkelijk nodig zijn in het koppelvlak. Deze attribuutsoorten worden ook als proxy opgenomen (met stereotype 'Attribuutsoort_proxy' binnen Enterprise Architect.)

Er zijn dus proxies voor:
* objecttypen,
* gegevensgroeptypen
* en attribuutsoorten

Voor relaties bestaan dus geen proxies.

Het grote verschil tussen de proxy types en gewone types is dat op de laatste meer eigenschappen zijn gedefiniëerd. Proxies zijn in feite een kopie van een component uit een ander model daardoor is het niet nodig om alle eigenschappen op het proxy component opnieuw te definiëren. Er wordt middels de trace (zie volgende paragraaf) verwezen naar het originele component en Imverter kan daarmee de betreffende eigenschappen ophalen. Daarmee wordt voorkomen dat een proxy component (per ongeluk) gaat afwijken van het originele component.

Het kan voorkomen dat er informatie in een koppelvlak gewenst is welke niet in een generieke SIM is opgenomen.
Als het gaat om een aanvullende attribuutsoort bij een bestaand objecttype dan wordt deze atribuutsoort als *attribuutsoort* (en dus niet als proxy) toegevoegd met alle benodigde details aan de proxy objecttype.
Als het gaat om een nieuw objecttype, dan wordt dit objecttype inclusief alle benodigde attribuutsoorten (en relaties) toegevoegd aan het koppelvlak-informatiemodel. Ook bij deze toevoeging gaat het dan om het stereotype *objecttype* en niet om een proxy.
Voor gegevensgroeptypen geldt hetzelfde.

### Traces

Relaties tussen componenten in het ene model en die in het andere model worden formeel vastgelegd middels traces.
Daarmee wordt een afleidingsrelatie vastgelegd, het component in het ene model is afgeleid van het component in het andere model.
Op SIM niveau kan alleen een afleidingsrelatie worden vastgelegd met een component in een andere SIM. Afleidingsrelaties kunnen worden vastgelegd voor Objecttypes, Attribuutsoorten en Relatiesoorten.

Om vanuit een SIM model traces te kunnen leggen en beheren dienen alle SIM modellen waarnaar traces liggen vanuit het in bewerking zijnde model aanwezig te zijn in het betreffende Enterprise Architect bestand. Traces kunnen nl. alleen gelegd en beheerd worden naar modellen die in Enterprise Architect voor handen zijn. Voor de SIM modellen waarnaar de traces liggen geldt hetzelfde, de modellen waarnaar vanuit die modellen wordt getraced moeten eveneens aanwezig zijn. Het modellenlandschap voor een SIM moet dus compleet zijn binnen een Enterprise Architect bestand.

In de traces worden alleen de identifiers vastgelegd van de componenten waarnaar verwezen wordt. Er wordt dus niet bij vastgelegd in welk model het betreffende component te vinden is. Aangezien elk model in dit modellenlandschapafzonderlijk met Imvertor wordt verwerkt gaat die informatie verloren. De verwerking van de modellen resulteert in een pakket van bestanden per model (een zogenaamde job) op de Imvertor server waarbij er tussen de jobs geen relatie lijkt te liggen. Imvertor moet echter, als het zijn werk goed wil kunnen doen, in staat zijn om het modellenlandschap op de server te reconstrueren. Om die reden wordt elk model in Enterprise Architect voorzien van een aantal tagged values waarmee de onderlinge relatie wel formeel vastgelegd kan worden en die wordt opgeslagen in de jobs.
Hoe dat precies in zijn werk gaat is beschreven in hoofdstuk  [4 Model Driven Design](./ModelDrivenDesign.md). 

## Laag 2: UitwisselingsGegevensModel (UGM)

Een UGM is gebaseerd op een SIM. Er is een ontwerp-slag gemaakt waarbij [4.2.1 Technische en implementatie-overwegingen](./Technische-en-implementatieoverwegingen.md) een rol spelen. In die ontwerpslag worden gegevensstructuren aangepast om uiteindelijk de toepassing daarvan te vereenvoudigen. Tevens worden beschrijvingen dermate geformaliseerd dat op basis daarvan code en/of berichtschema's gegenereerd kunnen worden.

Waar bij het SIM de business professionals de primaire doelgroep is vormt bij het UGM de ICT-deskundige, en in het verlengde daarvan computers, de primaire doelgroep. Een UGM is dus geen modellering van de werkelijkheid.

Net als bij het SIM heb je hier het onderscheid in een generiek UGM en een specifiek UGM.
Het generieke UGM is gebaseerd op een generiek SIM en een specifiek UGM op een specifiek SIM.

Voor een Koppelvlak wordt er op basis van het (domein-) specifieke koppelvlak-informatiemodel een specifiek UGM opgesteld dat daarmee correspondeert. Bij het opstellen van dit UGM worden dezelfde technische- en implementatie-overwegingen gehanteerd als die voor de "standaard" UGM's worden gehanteerd. In de praktijk betekent dit dat voor alle proxies in de informatiemodellen de corresponderende constructies uit het onderliggende UGM worden gekopieerd in het koppelvlak-UGM en dat voor alle toevoegingen aan het koppelvlak specifieke SIM ook toevoegingen worden gedaan aan het koppelvlak specifieke UGM. Bijzonderheden over het [4.3.2 Opstellen van een koppelvlak-UitwisselingsGegevensModel](Opstellen-koppelvlakUGM.md) zijn op een aparte pagina uitgewerkt.

Voor UGM modellen zijn proxies niet van toepassing.

### Traces

Ook op UGM niveau worden relaties tussen componenten in het ene model en die in het andere model formeel vastgelegd middels traces.
Op UGM niveau kan een afleidingsrelatie worden vastgelegd met een component in een SIM maar ook met een component in een ander UGM. Afleidingsrelaties kunnen in een UGM worden vastgelegd voor Entiteittypes, Elementen en Relaties.

Net als bij de SIM modellen is het bij een UGM model van belang dat alle UGM of SIM modellen waar het, evt. via via, van afgeleid is aanwezig zijn in het Enterprise Architect bestand en ook hier geldt dat voor een goede verwerking door Imvertor de eerder genoemde tagged values aanwezig zijn.

## Laag 3: BerichtStructuurModellen (BSM)

Het BSM is een berichtmodel van één of meerdere berichtschema. Bij [4.3 Het opstellen van een koppelvlak](./Opstellen-koppelvlak.md) wordt dus één BSM gemaakt. Dit model bestaat uit enerzijds specifieke informatie die nodig is om te bepalen welk type bericht er van toepassing is en welke (bericht-) structuur daarbij hoort en anderzijds de content van het bericht.

De specifieke informatie van een berichttype betreft een relatief beperkte set. Afhankelijk van het type koppelvlak (een StUF of een REST JSON koppelvlak) zijn er een aantal berichttypen vooraf gedefinieerd die gebruikt kunnen worden. Voor ieder van die berichttypen is bepaald welke informatie onderdeel uit MAG maken en welke informatie onderdeel uit MOET maken van een bericht.

De content-informatie die in een bericht-schema wordt opgenomen is gebaseerd op het koppelvlak UGM.
Omdat een koppelvlak UGM gebaseerd kan zijn op een horizontaal UGM en dat op haar beurt weer op een ander horizontaal UGM kan een bericht-schema een subset van 1 of meerdere UGM's zijn.

Voor StUF berichtschema's geldt bijvoorbeeld dat de content van berichten bijvoorbeeld samengesteld kan zijn op basis van het UGM-BG. Zaak-berichten zullen over het algemeen weer gebaseerd zijn op zowel het UGM-ZKN als het UGM-BG. Bijzonderheden over het [4.3.3 Opstellen van een koppelvlak-BerichtStructuurModel](./Opstellen-koppelvlakBSM.md) zijn op een aparte pagina uitgewerkt.

Net als bij UGM modellen geldt voor BSM modellen dat proxies niet van toepassing zijn.

### Traces

Op BSM niveau worden relaties tussen componenten in het ene model en die in het andere model formeel eveneens vastgelegd middels traces. Op BSM niveau kan een afleidingsrelatie worden vastgelegd met een component in het koppelvlak specifieke UGM. Afleidingsrelaties kunnen in een BSM net als in een UGM worden vastgelegd voor Entiteittypes, Elementen en Relaties.

Tenslotte geldt hier eveneens dat het voor een BSM model van belang dat alle UGM of SIM modellen waar het, evt. via via, van afgeleid is aanwezig zijn in het Enterprise Architect bestand en dat ook de eerder genoemde tagged values aanwezig zijn.

Een Enterprise Architect bestand met een BSM bevat uiteindelijk dus alle modellen (BSM, UGM en SIM) die nodig zijn om het complete plaatje geheel te maken.
