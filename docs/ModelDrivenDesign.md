---
layout: page-with-side-nav
title: Model Driven Design
---
# 4 Model Driven Design

In [3 Het drie-lagen model](./Drielagen-model.md) is al uitgelegd hoe SIM's, UGM's en BSM's met elkaar verweven zijn. In dit hoofdstuk beschrijven we hoe deze modellen daadwerkelijk opgesteld kunnen worden.
Als handige start kan het [template Enterprise Architect bestand](./bestanden/Standaard-basis.EAP) als basis worden genomen. Dit bevat een initiële folder structuur en verder alleen modellen die je nodig zou kunnen hebben, bijv. modellen voor datatypes en berichtsoorten.

- In [4.1 Het gebruik van SVN](./Gebruik-van-SVN) wordt beschreven hoe we modellen vanuit Enterprise Architect in een repository kunnen plaatsen en hoe we modellen kunnen ophalen vanuit SVN om te bekijken of bewerken in Enterprise Architect.  

- In [4.2 Het opstellen van een horizontaal Semantisch InformatieModel](./Opstellen-SIM.md) wordt uitgelegd hoe een horizontaal SIM wordt gecreëerd.
Voor VNG Realisatie betreft het de SIM's voor de horizontale Informatiemodellen RSGB, RGBZ en imZTC. Echter de nieuwe aanpak zou in de toekomst ook ingezet kunnen worden door andere organisaties die hun eigen horizontale sectormodellen hebben.

- [4.3 Het opstellen van een horizontaal GegevensUitwisselingsModel](./Opstellen-UGM.md) gaat over het creeren van horizontale UitwiselingsGegevensModellen.
Wat VNG Realisatie betreft gaat het dan om de met RSGB, RGBZ en imZTC gerelateerde UGM's UGM-BG resp. UGM-ZKN en UGM-ZTC.
Ook hier geldt dat in de toekomst mogelijk door andere organisaties eigen UGM's kunnen worden samengesteld.

- In [4.4 Het opstellen van een koppelvlak](./Opstellen-BSM.md) wordt tenslotte beschreven hoe we ten einde te komen tot een koppelvlakspecificaties met al zijn deliverables de nieuwe aanpak kunnen gebruiken om domeinspecifieke SIM's, UGM's en BSM's te kunnen maken.

Bij het verwerken van de vervaardigde modellen met Imvertor kunnen er foutmeldingen en waarschuwingen optreden. Voor goedkeuring dient elk model vrij te zijn van foutmeldingen en waarschuwingen. Een lijst met de meeste mogelijke foutmeldingen kan  "hier":https://imvertor.armatiek.nl/imvertor-executor/dashboard/wikis/msg gevonden worden. Ook in hoofdstuk [8 Veel voorkomende fouten](./Veelvoorkomende-fouten.md) vind je een aantal veel voorkomende fouten en een uitleg hoe daarmee om te gaan.
