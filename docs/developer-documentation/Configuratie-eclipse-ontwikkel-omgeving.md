---
layout: page-with-side-nav
title: Configuratie eclipse ontwikkelomgeving
---
Terug naar de [inhoudsopgave](index),

# Configuratie eclipse ontwikkelomgeving

1. Installeer de laatste java versie;
2. Installeer de laatste versie van eclipse;
3. Indien je al eerder een eclipse ontwikkelomgeving hebt gehad dan beschik je ergens over de folders
   * Imvertor-Maven
   * imvertor_work
   * imvertor_output
   Importeer deze alledrie in eclipse waarbij je bij de eerste kiest voor 'Maven - Existing Maven Projects';
4. Indien je nog niet eerder een eclipse ontwikkelomgeving hebt gehad of je wil weer helemaal van scratch af aan beginnen check dan de GitHub repo 'https://github.com/Imvertor/Imvertor-Maven' uit en importeer deze in eclipse. Daarbij kies je bij het importeren voor 'Maven - Existing Maven Projects'.
   Creëer ook de folders:
   * imvertor_work
   * imvertor_output
   en importeer deze eveneens;
5. Voer in een Shell de opdracht ``mvn validate`` uit. Het kan zijn dat je daarvoor eerst [Maven moet installeren](https://maven.apache.org/install.html);
6. Plaats vervolgens nog het bestand 'server.properties' dat je [hier](https://github.com/VNG-Realisatie/Model-Driven-Design-Documentatie/blob/main/docs/bestanden/server.properties) kunt vinden in de root van de folder 'Imvertor-Maven'. Dit bestand mag niet opgenomen worden in GitHub, het is een lokaal bestand met installatie specifieke gegevens. Je kunt er bijv. voor zorgen dat deze door Git ignored wordt;
7. Installeer evt. andere eclipse plugins zoals de Oxygen Developer of Oxygen Editor plugin. Download die vanaf de Oxygen website (deze of deze). Je hebt daarvoor wel een licentie nodig;
8. Ga met de rechtermuistoets binnen ‘imvertor-source/src/nl.imvertor’ op ‘ChainTranslateAndReport.java’ staan en selecteer ‘Debug As – Debug Configurations…’ (kan ook door het kevertje in de bovenbalk te kiezen);
9. Ga met de rechtermuistoets op ‘Java Application’ staan en kies ‘New Configuration’;
10. Kies een naam voor de Debug configuration (bijv. ‘SIM RUIMTE’);
11. Ga naar het tabblad ‘Arguments’;
12.In het veld ‘Program arguments’ kun je vervolgens 2 dingen doen:
   * het volgende ingeven:
     
     ```-arguments [locatie-properties-bestand]```
     
     waarbij 'locatie-properties-bestand' het lokale pad naar een properties bestand bevat. Dat kan een properties bestand zijn dat op meerdere QEA bestanden van toepassing is of een pad naar een specifiek op een bepaald QEA bestand van toepassing zijn properties bestand.
     De inhoud van dat properties bestand kan dan wat in de volgend ebullet staat beschreven bevatten.
   * of iets als het volgende ingeven:
     ```
     -processingmode KING:SIM:uitgebreid

     -umlfile "C:\Data\KING\Kern-taken\Imvertor\Project\De nieuwe aanpak\StUF Schemagenerator\EA-files\Niet-in-mijn-beheer\ORI.QEA"

     -application "Open Raads- en StatenInformatie"
     -forcecompile no
     -debug no
     -refreshxmi yes
     -visuals VNGRSIM

     -createoffice html
     #-createofficevariant msword
     #-createofficevariant respec
     #-createimagemap yes
     #-createofficeanchor id
     #-createofficemode click

     #-compare release
     #-comparewith 20230113
     #-comparemethod default
     #-comparerules KINGSIM
     ```     

     Wijzig indien gewenst de processingmode in de eerste regel en het pad en filenaam in de tweede regel. De waarde van het argumenten ‘application’ is natuurlijk afhankelijk van het gekozen QEA file;
13.	Vul in het veld ‘VM arguments’ het volgende in:
     ```
     -Dinstall.dir=C:\Data\KING\Kern-taken\Imvertor\Imvertor\src\main\resources
     -Downer.name=KING
     -Djob.id=KING
     -Dfile.encoding=UTF-8[Uploading server.properties…]()

     -Djava.library.path="C:\Program Files\Sparx Systems\EA\Java API" 
     ```     

     Wijzig indien nodig de paden van de eerste en laatste regel;
14.	Ga naar het tabblad ‘Environment’ en voeg daar de variabele ‘imvertor_os_basefolder’ toe met als waarde het path naar waar het Excel property bestand staat (waarschijnlijk iets als ``C:\Data\KING\Kern-taken\Imvertor\Imvertor-Maven\src\main\resources\input\KING\props``;
14.	Herhaal stap 8 t/m 12 voor eventuele andere debug configuraties. Kopiëren van een bestaande configuratie is overigens ook mogelijk.
