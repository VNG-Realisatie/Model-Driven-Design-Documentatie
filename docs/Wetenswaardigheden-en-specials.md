---
layout: page-with-side-nav
title: Wetenswaardigheden en specials
---
# 6 Wetenswaardigheden en specials

## Algemeen

### Het wegvallen van traces in een afgeleid model (in EA)

Bij het inlezen van een nieuwe versie van een SIM of UGM in de EA omgeving kan het zijn dat, hoewel de guids van de objecttypen niet zijn veranderd, alle traces naar die modellen vanuit een ander model verdwijnen. Het SourceAttribute linkt in dat geval wel goed.

In zo'n geval kan het helpen om het UGM te deleten en dan een "get package" te doen.
Vergeet niet om eerst je UGM in te checken als je dat nog niet gedaan hebt.

### Opmaak in notes velden

De notes velden kunnen van markdown opmaak worden voorzien. Helaas wordt niet alle markdown goed verwerkt.
Hieronder volgende de beperkingen en eigenaardigheden.

- De alternatieve vorm voor de H2 notatie:

   @Alt H2
   ------@

  kan niet gebruikt worden aangezien dat conflicteert met de wijze waarop we in de Nieuwe Aanpak notes van UGM of
  SIM scheiden van die van BSM of UGM.

- Eveneens om dezelfde reden kan '---' niet gebruikt worden om een horizontale lijn te genereren.
  Indien een horizontale lijn toch gewenst is gebruik dan @***@ @***@ of @___@ @____@.

- Het is nu niet mogelijk om een gecombineerde bold en italic emphasis (*_voorbeeld_*) te creëren.

- Het is ook niet mogelijk om tekst door te laten strepen (-voorbeeld-) m.b.v. 2 '~' karakters rondom de tekst.

- Sublijsten zijn niet mogelijk en zorgen voor allerlei problemen. Niet doen dus.
  Enkele voorbeelden van de optredende problemen:
  - bij een sublijst met minder dan 4 spaties voor het listitem wordt het listitem beschouwd als behorende bij het
    bovenliggende niveau.
  - ondanks een duidelijke keuze voor ol worden deze toch als ul afgebeeld.

- listitems voorzien van separate paragrafen is mogelijk. Er dient dan een lege regel tussen de bullet en de
  paragraaf geplaatst te worden en voldoende spaties voor de nieuwe paragraaf.
  Wat voldoende is hangt af van hoe het listitem is vormgegeven. Is het vormgegeven als '1. ' (dus een '1' gevolgd
  door een '.' en een spatie), dus 3 karakters, dan moet de paragraaf ook vooraf gegaan worden door 3 karakters.
  Is het vormgegeven als '* ' (dus een '*' en een spatie), dus 2 karakters, dan moet de paragraaf ook vooraf gegaan
  worden door 2 karakters.

- Zogenaamde reference-style links werken niet zoals bijv.:

  @[You can use numbers for reference-style link definitions][1]
  [1]: http://slashdot.org
  @

  @Use the [link text itself]
  [link text itself]: http://www.reddit.com@

- Url's en url's tussen vishaken worden niet automatisch omgezet naar links. Gebruik daarom een van de volgende vormen:

  @[I'm an inline-style link](https://www.google.com)@

  @[I'm an inline-style link with title](https://www.google.com "Google's Homepage")@

- Bij images werkt de reference style wel.

- Het definiëren van blokken code werkt wel maar je kunt geen taal specificeren. Doe het dus in de volgende vorm:

  @ '''
  No language indicated, so no syntax highlighting.
  But let's throw in a <b>tag</b>. @ '''

  Let op de 3 quotes voorafgaand aan de code.

- Indien gewenst kun je de tekst van xml code voorzien. Deze worden netjes getoond. Dat heeft wel tot gevolg dat je er niet vanuit mag gaan dat ingeklopte html code netjes tot opmaak verwerkt wordt. Inline html is dus niet  mogelijk.

- Tabellen zijn niet mogelijk.

- Blockquotes zijn niet mogelijk.

### Dubbel voorkomende tagged values

Het is toegestaan om tagged values meerdere keren op een component te definiëren.
Dit is echter standaard niet zichtbaar en kan daardoor tot onverwachte effecten leiden.
Het is daarom goed om de setting waarmee je dit wel zichtbaar kunt maken goed in te stellen.

Open daarom bij een om het even welk component de Tags tab en pas daarin de volgende setting aan:

![TaggedValues](./images/TaggedValues3.jpg)

## Bij het opstellen van een SIM

Deze paragraaf moet nog gevuld worden.

## Bij het opstellen van een UGM

### Meerdere entiteiten gebaseerd op dezelfde entiteittypen.

Bij het samenstellen van het contentmodel van een entiteit kunnen zich 3 situaties voordoen:
- De entiteit bestaat nog niet in een ander UGM en moet nog gedefinieerd worden. Er moet dus EIGENLIJK een basis entiteit gecreëerd worden;
- De entiteit bestaat al in een ander UGM maar moet aangescherpt worden  i.h.k.v. het adopterende domein;
- De entiteit bestaat al in een ander UGM maar moet aangescherpt worden  omdat in het adopterende domein een andere rol vervult.

In zowel scenario 2 als 3 kunnen zich 2 situaties voordoen. Er kan sprake zijn van een restrictie van een basis entiteit en tegelijkertijd of juist in plaats daarvan kan er sprake kan zijn van een extensie van een basis entiteit. In het eerste geval worden er dus attributen en/of relaties verwijderd uit de entiteit of worden een of meerdere attributen van de entiteit van een afwijkend datatype voorzien. In het tweede geval worden er juist attributen toegevoegd aan de entiteit. De hierboven gedefinieerde scenario’s 2 en 3 worden hieronder besproken.

*Aanscherping entiteit zonder rol verandering*
Afhankelijk van het domein waarin een entiteit moet worden gebruikt kan er behoefte zijn aan het verwijderen danwel toevoegen van attributen. Sommige attributen hebben gewoon geen functie in het domein of er is bij het opstellen van de basis entiteit geen zicht geweest op de informatie behoefte van het adopterende domein.

Dit wordt opgelost door van het entiteittype een kopie op te nemen in het koppelvlak-UGM met een gespecialiseerde naam. Een voorbeeld hiervan is de NATUURLIJK PERSOON die wordt gebruikt in het kader van een vergunningen systeem. Het desambigueren in UML gebeurt op entiteittype-niveau door de betreffende entiteittype een afwijkende naam te geven (in dit geval bijv. "NatuurlijkPersoon_vergunningen" ).

Zodra een  basis-entiteit in een ander UGM wordt aangescherpt dan ontstaat de behoefte om de
subset class t.o.v. de orginele class te desambigueren. Daarom is er op UGM-niveau de tagged value 'Restriction identifier' ingevoerd. Deze tagged-value ken je toe aan de kopie entiteit met een waarde die de subset karakteriseert. Dit is bijvoorbeeld de extensie “vrg” in NPS-vrg voor een natuurlijkPersoon_betrokkene.
Indien een relatie verwijst naar een entiteit die een tagged-value 'Restriction identifier' heeft dan krijgt die relatie eveneens een tagged-value 'Restriction identifier' met dezelfde waarde als de entiteit waar het naar verwijst. Ook de entiteit van waaruit die relatie loopt krijgt dan een tagged-value 'Restriction identifier' met diezelfde waarde. Een tagged-value 'Restriction identifier' op een lager niveau impliceert dus dat alle hogere niveau objecten ook een tagged-value 'Restriction identifier' hebben met eenzelfde waarde. Het is zelfs zo dat in een contentmodel structuur waarin ergens een tagged-value 'Restriction identifier' voorkomt alle tagged-values 'Restriction identifier' dezelfde waarde hebben.

Andersom is dit overigens niet geldig. Een tagged-value 'Restriction identifier' op een hoger niveau impliceert niet dat objecten op de lagere niveau's ook zo'n tagged-value hebben. Een aangescherpte entiteit kan dus best een relatie hebben met een andere entiteit die niet is aangescherpt.

In die zin is het wellicht handig om alle entiteiten met dezelfde tagged-value waarde voor 'Restriction identifier' bij elkaar in een package onder te brengen en die package eenzelfde waarde te geven als de 'Restriction identifier'.

*Aanscherping entiteit met rolverandering*
In een koppelvlak-UGM (of een afgeleid UGM zoals UGM-ZKN) kan het voorkomen dat een entiteittype in verschillende rollen (relaties) gebruikt wordt. Er kan dan ook per rol een verschil in behoefte zijn v.w.b. de elementen die opgenomen zijn in de entiteit. Eigenlijk is dat niet anders dan het in de voorgaande paragraaf geschetste scenario. De verwerking is dan ook identiek.
Een voorbeeld van dit scenario is de NATUURLIJK PERSOON als BETROKKENE in het UGM ZKN. Zie ook onderstaand voorbeeld:

!voorbeeld%20subset.png!

Naast dat de betreffende entiteittype een afwijkende naam krijgt (in het geval van het voorbeeld bijv. "NatuurlijkPersoon_betrokkene" ) wordt er in dit scenario ook een passende Mnemonic aan dit entiteittype toegekend (in dit geval "BTR") via het ‘alias’ veld.

Voor het desambigueren van subset classes t.o.v. de orginele class wordt er in dit voorbeeld de tagged value 'Restriction identifier' ingevoerd met de waarde “btr”.

Voor relaties geldt hetzelfde verhaal, de in het voorgaande scenario beschreven procedure wordt gevolgd maar daarnaast wordt ook een aangepaste ‘mnemonic’ aan dit entiteittype toegekend (bijv. "BTRAOA") via het ‘alias’ veld.

## Bij het opstellen van een BSM

### Definieren aangescherpte enteiten

Net zoals je op UGM niveau entiteiten kunt aanscherpen kun je dat op BSM niveau ook.
Verschil is wel dat van de op UGM niveau geschetste scenario's alleen scenario 2 van toepassing kan zijn en dan zelfs alleen nog maar in de restriction variant.

We gaan er vanuit dat een op koppelvlak UGM niveau aangescherpte entiteit altijd 1 op 1 wordt gebruikt in de berichten. Het kan echter voorkomen dat je die entiteit voor een specifiek bericht nog verder wil aanscherpen. In dat geval maak je op BSM niveau weer een kopie van de op UGM niveau reeds aangescherpte entiteit, geeft hem weer een desambiguerende naam en ook een nieuwe waarde voor de 'Restriction identifier'. Verder geldt hier hetzelfde als beschreven in de paragraaf *Aanscherping entiteit zonder rol verandering* van de sectie "Meerdere entiteiten gebaseerd op dezelfde entiteittypen":https://kinggemeenten.plan.io/projects/de-nieuwe-aanpak/wiki/Wetenswaardigheden_en_specials#section-6.

### Custom parameters of stuurgegevens (XML/SOAP)

De te gebruiken Parameters en stuurgegevens worden bij het samenstellen van de XML-Schema’s voor berichten afgeleid van het type bericht. Zo wordt aan vraagberichten (Lvxx) standaard de complexTypes ‘ParametersVraag’ voor de parameters gekoppeld en afhankelijk van de berichtcode de complexType ‘StuurgegevensLvxx’. Het enige wat men hiervoor in het BSM model moet doen is het bewuste bericht met een generalization koppelen aan een van de standaard berichtinterfaces.

Het kan echter zijn dat er i.h.k.v. een koppelvlak behoefte is aan een aangepaste versie van deze complexTypes. Men wil bepaalde parameters of stuurgegevens niet opgenomen hebben of men wil de mogelijke waarden van een parameter of stuurgegeven inperken. Of misschien wil men wel eigen parameters toevoegen. Hieronder beschrijven we de procedure om deze customizations mogelijk te maken terwijl daar waar mogelijk hergebruik van de in de onderlaag gedefinieerde complexTypes gehandhaafd blijft.

De onderstaande procedure kan op details afwijken indien het MIM als metamodel wordt gebruikt.

- Indien het bericht waarop je custom parameters en/of stuurgegevens wil definiëren nog een generalization relatie heeft met een interface naar een van de standaard berichtmodellen uit de package ‘Berichtstructuren’ dan dien je deze te verwijderen;
- Om customizations mogelijk te maken moeten de parameters en stuurgegevens binnen het BSM package gemodelleerd worden. De eerste actie is dan ook de parameters en stuurgegevens groepen uit de package met het corresponderende bericht in het ‘Berichtstructuren’ model naar hetzelfde package te kopieren als het bericht. Hetzelfde geldt voor de groepen ‘Systeem’ en ‘Entiteittype’.
Daarnaast moet ook de ‘Datatype’ map met de door de attributen in deze groepen gebruikte datatypes naar het BSM package gekopieerd worden;
- Vul bij alle zojuist gekopieerde groepen het veld ‘Alias’ met de waarde ‘/www.kinggemeenten.nl/BSM/Berichtstrukturen’ en plaats er eveneens een tagged-value ‘Is afgeleid’ op met de waarde ‘Nee’. Met het eerste geven we aan dat de groep weliswaar niet meer fysiek in de package ‘Berichtstructuren’ staat maar er logisch nog steeds bij hoort. Hierdoor weet Imvertor hoe de inhoud naar XML-Schema moet worden vertaalt. De tagged value voorkomt allerlei warnings in Imvertor;
- Verwijder uit de groepen alle elementen waar je geen gebruik meer van wenst te maken;
- We hebben in stap 2 weliswaar de map ‘Datatypes’ naar het berichtpackage gekopieerd maar daarmee is de koppeling van de attributes naar deze datatypes nog niet gerealiseerd. Loop alle overblijvende attributen in de in stap 2 gekopieerde groepen af en koppel bij het ‘Type’ het juiste datatype uit de map ‘Datatypes’ in de berichtpackage. Definieer vervolgens ook op alle attributen in de groepen de tagged-value ‘Is afgeleid’ met de waarde ‘Nee’;
- Verwijder nu uit de map ‘Datatypes’ ook alle datatypes die niet meer gebruikt worden. Bijv. omdat het gerelateerde element in stap 4 is verwijderd of omdat je een datatype gaat vervangen door een custom type (tenminste als je dat datatype niet wil gebruiken als basis voor het gewijzigde datatype);
- Definieer nu ook op alle datatypes in de map ‘Datatypes’ de tagged-value ‘Is afgeleid’ met de waarde ‘Nee’;
- Trek vervolgens alle groepen die je wil gebruiken naar het diagram met het bericht.
Wil je geen ‘parameters’ hebben dan plaats je die groep dus ook niet in het diagram. In dat geval kan die groep natuurlijk ook verwijderd worden.
- Geef vervolgens op de relaties ‘zender’, ‘ontvanger’ en ‘entiteittype’ het veld ‘Alias’ de waarde ‘/www.kinggemeenten.nl/BSM/Berichtstrukturen’ en definieer ook hierop de tagged-value ‘Is afgeleid’ met de waarde ‘Nee’;
- Realiseer vervolgens weer de compositie relaties (of in geval je met het MIM metamodel werkt de dependency releaties) tussen het bericht en de groepen ‘Parameters’ en/of ‘Stuurgegevens’ (en geef deze, als je NIET met het MIM model werkt, de namen ‘parameters’ en ‘stuurgegevens’) en definieer ook daarop de tagged-value ‘Is afgeleid’ met de waarde ‘Nee’.
Op beide relaties komt, als je NIET met het MIM model werkt, ook nog de tagged-value ‘Positie’ met voor ‘stuurgegevens’ de waarde ‘-200’ en voor ‘parameters’ de waarde ‘-100’;
- Indien je met het MIM werkt zul je de berichtclass ook nog moeten voorzien van de attributes 'stuurgegevens' en 'parameters' met het stereotype 'Gegevensgroep'. Deze attributes laat je vervolgens verwijzen naar de groepen die we in stap 2 in de berichtpackages hebben gekopieerd. Tenslotte breng je ook tussen de berichtclass en beide groepen een dependency relatie aan.

Als er op dit moment XML-Schema’s worden gegenereerd zullen de elementen ‘parameters’ en ‘stuurgegevens’ nog steeds verwijzen naar de standaard complexTypes voor deze elementen in de StUF onderlaag. We hebben nu dus alleen nog maar de voorwaarden voor customization gerealiseerd.
Wil je in het bericht wel de standaard ‘stuurgegevens’ gebruiken en alleen de ‘parameters’ customizen dan voer je de volgende stappen alleen uit op de groep ‘parameters’. Wil je beide customizen dan voer je de volgende stappen uit op beide.

- Definieer op alle groepen waarin customizations gewenst zijn de tagged-value ‘Restriction identifier’ en geef dit voor al deze groepen dezelfde waarde die het bericht of een groep van berichten identificeert.
Indien aan de groepen ‘Systeem’ en/of ‘Entiteittype’ een ‘Restriction identifier’ is toegekend dan dient dit ook aan de groep ‘Stuurgegevens’ worden toegekend en hetzelfde geldt voor de relaties tussen deze groepen. Als aan de groepen ‘Systeem’ en ‘Entiteittype’ geen ‘Restriction identifier’ wordt toegekend dan zal daar gewoon de standaard complexType uit de StUF onderlaag worden gebruikt;

Generatie van XML-Schema’s op dit moment zorgt er al voor dat evt. verwijderde attributen in groepen waaraan het ‘Restriction identifier’ is toegekend in de resulterende custom complexTypes geen elementen worden aangemaakt.
Nu kunnen we ook andere customizations aanbrengen zoals het toevoegen van elementen of het wijzigen van het datatype van elementen.

*Het wijzigen van het datatype van elementen*
- Voor het wijzigen van het type van element moet het ‘Type’ veld van het gerelateerde attribuut van een andere waarde te worden voorzien. Ook kunnen de tagged-values ‘Patroon’, ‘Minimum lengte’, ‘Minimum waarde’ en ‘Maximum waarde’ van een waarde worden voorzien. Indien je de enumeration van een veld wil beinvloeden (bijv. als je deze wil inperken) dan dien je in de 'Datatype' folder een nieuw enumeration datatype te definiëren met de gewenste enumeraties (die allen de tagged value 'Is afgeleid' met de waarde 'Nee' moeten krijgen.
- Ken aan de gewijzigde/nieuwe datatypes ook de tagged value 'restriction identifier' toe.

*Het toevoegen van elementen*
- Het toevoegen van elementen gebeurd heel eenvoudig door het toevoegen van attributen aan de gewenste groep zoals we dat ook gewend zijn voor de attributen van het contentmodel.
Hier worden echter de tagged-values ‘Indicatie kerngegevens’, ‘Indicatie materiële historie’, ‘Indicatie formele historie’, ‘Mogelijk geen waarde’ en ‘SourceAttribute’ niet gebruikt.
De tagged-values ‘Patroon’, ‘Minimum lengte’, ‘Minimum waarde’ en ‘Maximum waarde’ kunnen wel gebruikt worden. Tenslotte moet aan elk toegevoegd element nog de tagged-values ‘Is afgeleid’ met de waarde ‘Nee’ en 'Restriction identifier' met dezelfde waarde als die deze op de overkoepelende groep heeft worden toegekend.

Generatie van de XML-Schema’s moet nu het gewenste resultaat opleveren.

### Het definiëren van vrije berichten

Bij het definiëren van vrije berichten wordt gebruik gemaakt van andere berichten. Dat kunnen zowel vraag-, antwoord- als kennisgevingsberichten zijn. Mogelijk in de nabije toekomst zelfs andere vrije berichten. Deze berichten worden dan binnen de vrije berichten opgenomen. In UML wordt er vanuit het vrije bericht dan een relatie getrokken naar het op te nemen bericht met het stereotype 'Berichtrelatie'.
In sommige gevallen zul je het opgenomen bericht wel en in sommige gevallen niet als individeel bericht in het berichtenschema willen opnemen. Dit is heel eenvoudig te realiseren. Indien een op te nemen bericht in hetzelfde package is geplaatst als het vrije bericht waarin dat bericht is opgenomen wordt er geen individueel bericht aangemaakt. Wil je dus wel een individueel bericht aanmaken dan zul je het in een ander package op moeten nemen dan het package waarin het vrije bericht is opgenomen.
In sommige gevallen moeten deze

### Entiteittypen in vraagberichten

In een BSM verwijzen de relaties ‘scope’ en ‘start’ van een vraagbericht altijd naar dezelfde entiteittype als het bijbehorende antwoordbericht.
Hiermee garanderen we dat de content van de daarvan afgeleide complexTypes gelijk is aan elkaar.
De relaties ‘gelijk’ , ‘ vanaf’  en ‘ tot en met’ mogen naar een ander gespecialiseerd entiteittype verwijzen.
In de complexTypes van gelijk, vanaf en tot en met zijn alle velden optioneel.
