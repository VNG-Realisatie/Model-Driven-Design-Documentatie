---
layout: page-with-side-nav
title: Het opstellen van een horizontaal GegevensUitwisselingsModel
---
# 4.3 Het opstellen van een horizontaal GegevensUitwisselingsModel

In een horizontaal GegevensUitwisselingsmodel worden die gegevens op UGM niveau
uitgewerkt die een meervoudige toepassing kennen. Als in een verticaal GegevensUitwisselingsModel
dan wordt verwezen naar entiteiten en attributen uit een horizontaal GegevensUitwisselingsModel
zorgt dat er voor dat deze gegevens in alle koppelvlakken (ongeacht of dat nu gaat om een StUF
of een REST JSON koppelvlak) op eenzelfde wijze worden gespecificeerd.


Zoals in hoofdstuk [3 Het drie-lagen model](./Drielagen-model.md) al is uitgelegd zijn SIM's en UGM's sterk met elkaar verweven.
In het geval van een UGM kan die verwevenheid initieel al voor een groot deel geautomatiseerd worden vastgelegd.
Voer daarvoor de werkinstructie 'Werkinstructie SIM omzetten naar UGM' zoals beschreven in  [5.1 Werkinstructies#Werkinstructie-SIM-omzetten-naar-UGM](./Werkinstructie-SIM-omzetten-naar-UGM.md) uit.
Dit zorgt er voor dat alle stereotypes die in feite nog tot het MIG behoren worden omgezet naar stereotypes die tot het MUG behoren.
Zo krijgt een class met het stereotype 'Objecttype' het stereotype 'Entiteittype' toegekend en een attribuut met het stereotype 'Attribuutsoort' het stereotype 'Element'. Daarnaast worden er automatisch traces gecreëerd tussen de gerelateerde componenten in het SIM en het UGM.

**Vraag Robert:** Wat moet er gebeuren met een evt. met het SIM mee gekopieerd intern package 'Generieke Datatypen'?

Het UGM is daarmee bijna klaar om verder verwerkt te worden tot een volwaardig UGM. Dat wil zeggen dat voor SIM logische structuren omgezet worden naar structuren die technisch beter verwerkt kunnen worden. Dat gebeurd op basis van een aantal [4.3.1 Technische en implementatie-overwegingen](./Technische-en-implementatie-overwegingen.md). Eerst moeten er echter een aantal handelingen uitgevoerd worden die onafhankelijk zijn van de gewenste uitvoer (yaml of StUF) en een aantal handelingen die specifiek zijn voor de gewenste uitvoer.

## Generieke handelingen

Om Imvertor in staat te stellen de gelegde traces te interpreteren moet duidelijk zijn naar welke modellen de traces leiden. Voer daarvoor de volgende handelingen uit:
  -  Definieer op het zojuist vervaardigde package (het nieuwe UGM model) de volgende tagged values:
    - **Supplier-name** : ken hieraan de naam van het package toe waar het UGM van is afgeleid. Is het UGM van meerdere packages (SIM of UGM)  afgeleid plaats dan alle namen in deze tagged value van elkaar gescheiden door een ';' (punt komma);
    - **Supplier-project**: ken hieraan de typeindicatie van de package waar het UGM van is afgeleid. Is het UGM van meerdere packages afgeleid dan plaats je ook hier meerdere type indicaties wederom van elkaar gescheiden door een ';' (punt komma). Let er op dat de volgorde van de packages gelijk moet zijn aan die in de tagged value 'Supplier-name';
    - **Supplier-release**: ken hier tenslotte de release van de package waar het UGM van is afgeleid. Het gaat dus om de tagged value 'Release' in dat betreffende packages. Ook nu geldt weer dat je meerdere 'release' waarden kunt plaatsen mits ze maar gescheiden zijn door een ';' (punt komma) en in dezelfde volgorde staan als in de voorgaande twee tagged values.

Voer vervolgens de volgende acties uit:

  -  Creëer de tagged value 'Release' en ken daar een waarde aan toe met de volgende conventie 'yyyymmdd';
  -  Ken aan de property 'Version' op het  UGM package een waarde toe met het volgende patroon 'nn.nn.nn' waarbij 'n' een numerieke waarde is. Bijvoorbeeld '00.00.01';
  -  Ken voor elke SIM waarvan het UGM is afgeleid de tagged value 'Versienummer SIM [naam oorspronkelijke SIM]' aan het UGM package toe. Geef deze tagged values als waarde de waarde van de property 'Version' van de betreffende SIM's, Dit is alleen ter documentatie;
  -  Ken voor elke UGM waarvan het UGM is afgeleid de tagged value 'Versienummer UGM [naam oorspronkelijke UGM]' aan het UGM package toe. Geef deze tagged values als waarde de waarde van de property 'Version' van de betreffende UGM's, Ook dit is alleen ter documentatie;
  -  Creëer zo gewenst nieuwe packages voor Groepen, Complexdatatypes, etc... of hernoemd bestaande packages.

Dit is niet perse noodzakelijk maar slechts ter ordening _<-- Indien we bij SIM standaard package namen hanteren dan kunnen deze omgezet worden naar de in het UGM te hanteren namen. Dat vergt nog een aanpassing in het script van Geert_;
  -  Plaats indien van toepassing alle objecten in de zojuist aangemaakte packages;
  -  Wijzig alle stereotypes 'Tabel Element' in 'Element'. _<-- Script genereert nu nog verkeerde stereotype <<Tabel element>> in plaats van <<Element>>. Vergt nog een aanpassing in het script van Geert_;
  -  Hernoem alle stereotypes 'Groep' naar 'Groep compositie'. _<-- Zit niet in script ??en in MUG profiel??. Vergt nog een aanpassing van het script van Geert_;
  -  Voorzie de tagged value 'Formeel patroon' van een valide regular expression indien de tagged value 'Patroon' een waarde heeft;
  -  Zorg dat alle attributen een type hebben;
  -  Zoek, indien de typering van attributen verwijst naar tabel-entiteiten of enumeraties in een SIM buiten het eigen model, in andere UGM modellen naar het gerelateerde tabel-entiteit of enumeratie en kopieer dat naar je eigen UGM;
  -  Herstel de traces vanuit de zojuist gekopieerde tabel-entiteiten en enumeraties (afhankelijk van hoe je dat wil naar het SIM of naar het UGM waaruit ze vandaan komen);
  -  Ken de nieuwe tabel-entiteiten en enumeraties toe aan de attributen in jouw model waarop ze betrekking hebben;
Voorzie attributen die geen type hebben van een type. Vaak zijn dit types die voorheen het stereotype attribuutsoort_proxy hadden;
  -  Wijzig op het UGM package het 'Keyword' veld in 'UGM';

**Vraag Robert:** Wat is de functie hiervan?

  -  Pas, indien gewenst, op het UGM package het 'Author' veld aan;

## Handelingen t.b.v. de generatie van yaml schema's

De volgende handelingen zijn alleen van toepassing indien het uiteindelijke doel het genereren van yaml schema's is:

  -  Wijzig de traces van de proxy objecten, de proxy groepen en hun proxy attributen zo dat ze verwijzen naar de objecten en attributen in het gerelateerde SIM.
  -  Pas aan de hand van de volgende omzettingstabel de stereotypes van de proxy objecten, de proxy groepen en hun proxy attributen aan. Doe dat zodanig dat je de oude stereotypes er eerst van verwijdert.

|_. Stereotype SIM |_. Stereotype UGM |
| Objecttype_proxy | Entiteittype |
| Gegevensgroep_proxy | Groep compositie |
| Attribuutsoort_proxy | Element |

  -  Geef de oude proxy objecten, proxy groepen en hun proxy attributen gewenste namen;
  -  Herschrijf namen met unsupported characters zoals

**Noot Robert:** Nagaan of dit soort karakters niet door Imvertor worden verwijderd. Indien dat het geval is dan is deze handeling niet noodzakelijk al kan je er voor kiezen om in het UGM de juiste benamingen te gebruiken.

  -  We streven naar een UGM dat qua naamgeving 1 op 1 overeenkomt met de in yaml gebruikte naamgeving. Verwijder daarom eventuele spaties en vreemde karakters uit de enumeraties. Alleen de tekens a-z, A-Z en underscore zijn toegestaan;
  -  Desambigueer duplicate relatienamen;

**Noot Robert:** Nagaan of dit nodig is voor yaml. Zo ja dan kan deze handeling naar de generieke handelingen. Deze handeling moet dan ook uit de handelingen voor StUF gehaald worden.

  -  Maak daar waar gewenst relaties bi-directioneel of inverteer deze. Anders kun je op het moment dat je met het BSM aan de slag gaat niet de inverse richting op in schema composer.

**Noot Robert:** Nagaan of dit nodig is voor yaml.

  -  Ken de volgende tagged values toe:
    - Aan alle entiteiten 'Naam in meervoud' met een waarde die gelijk is aan het meervoud van de naam van de resource.
    - Aan alle relaties 'target role in meervoud' met een waarde die gelijk is aan het meervoud van de naam van de resource waarnaar verwezen wordt. Als er meerdere relaties naar dezelfde resource verwijzen dan moet deze tagged value gedifferentieerd worden.

**Vraag Robert:** Waaraan moet de naamgeving van deze tagged values voldoen. Het gaat me niet zozeer om het patroon maar meer of in de naam ook de semantiek van de relatie tot uiting moet komen. Dus moet het 'medewerkers' zijn of 'contactvoerendemedewerkers'? Bij meerdere relaties naar dezelfde resource lijkt me de laatste i.i.g. van toepassing.

## Handelingen t.b.v. de generatie van StUF schema's

De volgende handelingen zijn alleen van toepassing indien het uiteindelijke doel het genereren van StUF schema's is:

  -  Pas de alias van het UGM package aan naar de namespace waarin de XML-schema's moeten komen. Dit kan een nieuwe namespace zijn maar ook een al bestaande;
  -  Ken de tagged value 'Verkorte alias' toe aan het UGM package. Deze is gelijk aan de prefix die je in de XML-schema's wil gebruiken;
  -  Wijzig de traces van de proxy objecten, de proxy groepen en hun proxy attributen zo dat ze verwijzen naar de objecten en attributen in het gerelateerde SIM of naar entiteiten en attributen in een ander UGM. Stel jezelf daarbij de vraag in welke namespace je de entiteiten, de groepen, de attributen van de entiteiten, groepen, relaties en tabel-entiteiten geplaatst wil hebben. Is dat in de namespace van het UGM dat je nu aan het creëren bent laat dan de traces lopen naar het SIM waarvan het UGM is afgeleid. Is dat in de namespace van het UGM dat verbonden is met de SIM waar de proxies naar verwijzen zet dan de traces om naar de entiteiten, de groepen en de attributen van die entiteiten, groepen, relaties en tabel-entiteiten in dat UGM.
  -  Pas aan de hand van de volgende omzettingstabel de stereotypes van de proxy objecten, de proxy groepen en hun proxy attributen aan. Doe dat zodanig dat je de oude stereotypes er eerst van verwijdert.

|_. Stereotype SIM |_. Stereotype UGM |
| Objecttype_proxy | Entiteittype |
| Gegevensgroep_proxy | Groep compositie |
| Attribuutsoort_proxy | Element |

  -  Indien je de proxy objecten, de proxy groepen en hun proxy attributen hebt laten tracen naar een ander UGM, wijzig dan de namen van deze componenten ook zo dat ze overeen komen met de namen die ze in het met de proxy objecten gerelateerde UGM hebben. Indien je ze hebt laten tracen naar het met het UGM gerelateerde SIM dan kun je je eigen namen bedenken;
  -  Herschrijf namen met unsupported characters zoals /;

**Noot Robert:** Nagaan of dit soort karakters niet door Imvertor worden verwijderd. Indien dat het geval is dan is deze handeling niet noodzakelijk al kan je er voor kiezen om in het UGM de juiste benamingen te gebruiken.

  -  Verwijder zo nodig de spaties uit enumeraties (p{color:red};

**Noot Robert:** Volgens mij zijn spaties in enumeraties in XML-Schema wel toegestaan. Indien dat zo is dan is bovenstaande handeling niet nodig.

  - Desambigueer duplicate relatienamen;
  - Pas de aliassen aan van de entiteittypen, relaties, relatie-entiteiten en tabel-entiteiten.
    - Zorg er ook voor dat de aliassen van die relaties onderling afwijken door er een 9 letterige mnemonic van te maken;
    - Relatie-entiteiten krijgen dezelfde alias als de relatie waarmee ze verbonden zijn;
  -  Maak daar waar gewenst relaties bi-directioneel of inverteer deze. Anders kun je op het moment dat je met het BSM aan de slag gaat niet de inverse richting op in schema composer.
  -  Voorzie indien nodig de tagged values 'Historie materieel' en 'Historie formeel' van een waarde;
  -  Kijk waar attributen in de supplier horizontale sectormodellen uit andere entiteiten komen (ze zijn daar dus platgeslagen) en voorzie die in de naam van de prefix die gelijk is met de mnemonic van de oorspronkelijke entiteit gevolgd door een punt;
  -  Kijk waar groepen zijn platgeslagen in de horizontale sectormodellen. Doe dat ook in het UGM;
  -  Verwijder de zojuist platgeslagen groepen;
  -  Herstel traces van platgeslagen attributen;
  -  Kijk welke attributen matchgegevens moeten zijn. Stel bij die attributen de tagged value 'Indicatie matchgegeven' in op 'Ja' en definieer die attributen ook als zijnde 'Static' waardoor deze onderstreept worden. Alle id attributen zijn matchgegevens dus daar moeten deze wijzigingen sowieso worden aangebracht.
  -  Corrigeer de volgorde van attributen in entiteiten indien deze niet gelijk zijn aan die in horizontale sectormodellen en dat is wel gewenst is.

NB: Eigenlijk moeten een aantal handmatige stappen al in het SIM geregeld zijn, want nu moet het elke keer handmatig overnieuw gedaan worden.
