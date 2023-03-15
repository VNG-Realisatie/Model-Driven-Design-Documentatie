---
layout: page-with-side-nav
title: Naamgevingsconventies
---
# 5.3 Naamgevingsconventies

## Bestandsnamen voor EA Bestanden

Bestandsnamenconventie voor bestanden in de trunk is:

`[Modeltype] [Domein (al dan niet als afkorting)].xml`

Bijvoorbeeld:
* SIM ImZTC.xml
* SIM Klanten.xml
* UGM ZTC.xml
* UGM ORI.xml
* BSM DCR.xml
* BSM JzJusGem.xml

Bestandsnamenconventie voor bestanden in de branch is:

`[bestandsnaam in trunk minus extensie] [versienummer] in gebruik [datum branchcreatie].xml`

Bijvoorbeeld:
* SIM Klanten 01_02_00 in gebruik 20221021.xml
* UGM ImZTC 02_02_00 in gebruik 20210916.xml
* BSM ORI 01_01_00 in gebruik 20230619.xml

Bestandsnamenconventie voor bestanden in de tags is:

`[bestandsnaam in trunk of branch minus (evt.) versienummer, status, datum en extensie] [versienummer] [status] R[releasedatum].xml`

Bijvoorbeeld:
* SIM ImZTC 02_02_00 in ontwikkeling R20180613.xml
* UGM JzJusGem 01_00_01 in gebruik R20190713.xml
* BSM ORI 01_01_00 in gebruik R20210826.xml

## Resources en Properties

Voor de naamgeving van resources en properties conformeren we ons aan de [API design rules](https://publicatie.centrumvoorstandaarden.nl/api/adr/) en [API Designrule extentions](https://geonovum.github.io/KP-APIs/API-strategie-extensies/) Van de Nederlandse API-strategie. 

## Component namen

| Componenttype|_. Conventie|_. Voorbeeld|
| Enumeratie | _[enumeratie naam]_enum_ | 'geslacht_enum' |
