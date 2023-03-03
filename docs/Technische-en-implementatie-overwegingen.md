---
layout: page-with-side-nav
title: Technische en implementatie-overwegingen
---
# 4.3.1 Technische en implementatie-overwegingen

Hier kunnen we documenteren welke overwegingen er zijn toegepast bij het opstellen van het UGM. Daarbij kan gebruik gemaakt worden van voorbeelden.

In mijn beleving wordt dit hoofdstuk wat vroeger het "verStUFfingsdocument"  was.

**Noot Robert:** Nee, dat klopt niet. Hier wordt uitgelegd wat de gedachte achter de creatie van een UGM is (in feite ook de gedachte achter het verStUFfingsdocument). In de volgende paragrafen moet dan uitgelegd worden welke methodes er bij het creëren van een UGM kunnen worden gehanteerd. Het zou kunnen dat deze pagina voor het yaml deel uiteindelijk vervangen wordt door de API Best Practices. Op zijn minst voor de principes, wellicht dat hier dan alleen nog wat handreikingen worden gedaan m.b.t. de wijze waarop in de praktijk met de API Best Practices in de UGM's moet worden omgegaan.

Een voorzet voor de API Best Practices wordt "hier":https://github.com/VNG-Realisatie/API-Kennisbank/blob/master/Analyse%20API%20Design/Analyse%20API%20Design.md gedaan.

## Generieke methodes

### Verwerking 'isEen' relaties

Het komt af en toe voor dat in een Informatiemodel een objectclass middels meerdere 'isEen' relaties verwijst naar andere objectclasses.
Het lijkt er dan op dat de objectclass meerdere supertypeclasses heeft. In de met deze relaties gekoppelde objectclasses zijn dan attributen aangebracht die specifiek zijn voor het betreffende type.
Binnen UGM zal je deze 'isEen' relaties waarschijnlijk willen oplossen. Dat kun je doen door de betreffende attributen op te nemen in de verwijzende entiteit en daarnaast een 'xxxType' attribuut op te nemen waarmee je bij de instantiërende resource kunt aangeven om wat voor type het gaat. Dat attribute kent dan als datatype een enumeratie.

### Toekomstig in te vullen objecttypen

Bij het vervaardigen van een informatiemodel baseren we ons op de realiteit. Sterker nog, een informatiemodel is niet anders dan een model van de realiteit. De realiteit is echter complex en bij het modelleren simplificeer je de realiteit vooral kijkend naar wat je nodig hebt om de userstories in te kunnen vullen. Af en toe zal je daarbij een voorschot nemen op mogelijk in de toekomst in te vullen userstories met als gevolg dat er objectclasses in het informatiemodel worden opgenomen die je (nog) niet nodig hebt.
In het UGM, waarin we alleen dat modelleren wat we voor de userstories technisch nodig hebben worden de entiteiten die relateren aan deze objectclasses dan ook verwijderd.

h2. Yaml specifieke methodes

### uuid en url attributen

Alle resources moeten m.b.v. een uuid op te vragen zijn en alle resources worden ook met een unieke url ontsloten. Om die reden wordt aan alle entiteiten in het UGM de attributen 'uuid' en 'url' toegevoegd.



## VerStUFfingsmethodes

**Noot Robert:** Dit hoofdstuk moet door Henri gevuld worden. Eigenlijk moeten we de term 'VerStUFfen' uitfaseren.

Hier komt een uitleg m.b.t. de overwegingen om objecttypen samen te voegen of plat te slaan in andere objecttypen, gegevensgroepen te koppelen en (technische) attributen toe te voegen.

## VerStUFfingsmethodes domeinspecifiek UGM

In een domeinspecifiek SIM wordt (meestal) ergens een koppeling gemaakt met het RSGB of het RGBZ. Over het algemeen zal 1 of meer objecten uit het RSGB of het RGBZ ook voorkomen in het domeinspecifieke SIM. Eventueel ook met een aantal domeinspecifiek toegevoegde  attributen.

In het domeinspecifieke SIM wordt deze relatie gelegd door  een objecttype op te nemen met dezelfde naam als de naam die in het SIM RSGB of het SIM RGBZ wordt gehanteerd en deze als Stereotype "Proxy" op te nemen. In deze klasse worden de gewenste attribuutsoorten die reeds in het RSGB gedefinieerd zijn ook opgenomen, maar ook in dit geval met de stereotype "Proxy". Bij beide proxies (zowel de objecttypen als de attribuutsoorten) worden geen eigenschappen opgenomen en wordt voor het ophalen van deze eigenschappen een trace aangelegd tussen de "Proxy" klassen en het objecttype uit het RSGB dat als bron dient.  

Eventuele toe te voegen attribuutsoorten (die we in het RSGB dus nog niet kennen) worden in de Proxy-klasse opgenomen met het stereotype "Attribuutsoort".  Bij deze toegevoegde attribuutsoorten moeten wel alle eigenschappen worden opgenomen die nodig zijn om de attribuutsoort eenduidig te kunnen definiëren.

Daarnaast kunnen in een koppelvlak-specifiek SIM objecttypen worden toegevoegd die onderling, (maar ook met de Proxy-klassen) gerelateerd kunnen zijn. Deze toegevoegde objecttypen hebben ook het stereotype objecttype
Dat ziet er bijvoorbeeld als volgt uit. De beige objecttypen zijn domeinspecifiek en de blauwe objecttypen zijn onderdeel van het SIM RSGB.

 ![domeinspecsim](./images/Dom-spec%20SIM.JPG)

Het bovenstaande is een voorbeeld van een Informatiemodel dat ten grondslag ligt aan het UitwisselingsGegevensModel (UGM) dat wordt opgesteld t.b.v. een koppelvlak. Bij het maken van een domeinspecifiek (of koppelvlakspecifiek) UGM wordt enerzijds hergebruik gemaakt van entiteittypen die al eerder gemodelleerd zijn en anderzijds worden er nieuwe entiteittypen geïntroduceerd naar aanleiding van nieuw in het domeinspecifieke informatiemodel gedefinieerde objecttypen.

Voor die objecttypen die  in het domeinspecifieke informatiemodel als proxy zijn opgenomen wordt gekeken naar het UGM waarin de betreffende objecttypen al eerder zijn vormgegeven tot entiteittype. Hierbij zijn "verStUFfingsregels" toegepast. De kans is zeer groot dat de overwegingen om objecttypen samen te voegen, gegevensgroepen te koppelen of (technische) attributen toe te voegen die eerder van toepassing waren ook bij het maken van het domeinspecifieke UGM van toepassing zullen zijn.

Kort samengevat geldt dat voor elk Proxy-objecttype dat opgenomen is in het domeinspecifieke SIM het corresponderende entiteittype gekopieerd wordt  uit het "generieke" UGM. (Het UGM dat is afgeleid van het SIM waarnaar de Proxy verwijst).
Vervolgens wordt dit gekopieerde entiteittype op maat gemaakt voor het domeinspecifieke UGM. Attributen worden verwijderd als deze niet voorkomen in het koppelvlak en attribuutsoorten die in een Proxy klasse zijn toegevoegd worden in het entiteittype toegevoegd als attribuut.

 ![domeinspecugm](./images/Dom-spec%20UMG.JPG)

p{color:red}. *Noot Robert:* Op de nieuwe entiteittypen die naar aanleiding van nieuw in het domeinspecifieke informatiemodel gedefinieerde objecttypen in het domeinspecifieke UGM worden geïntroduceerd kan net zoals de entiteittypen in de "generieke" UGM's natuurlijk ook een verStUFfingsslag van toepassing zijn. Daarvoor gelden dezelfde technieken als voor het verStUFfen van entiteittypen in de "generieke" UGM's (zie de voorgaande paragraaf).
