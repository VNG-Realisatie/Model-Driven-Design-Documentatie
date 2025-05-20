---
layout: page-with-side-nav
title: Berekenen endpoint path, vaststellen path- en query-parameters en analyseren response tree
---
Deze uitleg heeft alleen betrekking op de stylesheets in de YamlCompiler module.

# Berekenen van endpoint path en de path-, query-parameters

In een OAS specificatie worden een of meerdere berichten in yaml syntax gedefinieerd. Elk bericht bestaat daarbij uit 
een header en optioneel een body en/of responsebody. Voor het modelleren van deze structuren gebruiken we een BSM model.
Voor elk bericht worden daartoe de volgende componenten aan elkaar gekoppeld:

* **Een berichttype class**<br/>Dit bepaald het type van een bericht en daarom ook met wat voor associaties het mag
koppelen aan andere classes;
* **Een Padtype class**<br/>Hiermee wordt m.b.v. de naam het pad van een of meer berichten gedefinieerd (Bijv.
'/fracties/{fractienummer}') en is verplicht voor elk berichttype. Het koppelen gebeurt met één en niet meer dan één
associatie met de naam 'pad' en het stereotype 'Padrelatie';
* **Entiteittype classes**<br/>Definiëren de structuur van de yaml-header van het bericht, de requestbody en/of de
responsebody. Het koppelen gebeurt met een associatie met de naam 'request', 'requestbody' of 'response' en het stereotype
'Entiteitrelatie';

In het kader van dit verhaal zijn met name de volgende classes van belang:
1. de Padtype class;
2. de, daarmee een berichttype class gemeen hebbende, Entiteittype class welke met een associatie met de naam 'request'
aan de berichttype gekoppeld is;
4. de, daarmee een berichttype class gemeen hebbende, Entiteittype class welke met een associatie met de naam 'response'
aan de berichttype gekoppeld is.

De eeste 2 classes hebben een relatie. De eerste definieert zoals al gezegd het pad van een bericht (incl. een evt. path 
parameter). De tweede definieert de evt. query parameters, de typering daarvan en die van de pad parameter. In enkele 
gevallen worden de query parameters overigens niet gedefinieerd maar afgeleid. Daarover later meer.

**TODO** He genereren van de afgeleide parameters beschrijven.

Om dit allemaal goed te kunnen doen moet de tree structuur die wordt uitgedrukt in de Padtype class overeenkomen met de tree 
structuur die wordt gemodelleerd met de eerder genoemde Entiteittype class en de daar weer aan gekoppelde Entiteittype classes.
Het YamlCompiler stylesheet 'EP-2-XML-4-JSON-header-mapping.xsl' bevat daartoe functies waarmee beide tree structuren tegen
elkaar kunnen worden gehouden en vergeleken. Alleen als die vergelijking slaagt vindt verdere verwerking plaats.

In het eerder genoemde stylesheet vindt de vergelijking in de volgende 3 stappen plaats:

* **determine uri structure**<br/>In deze stap wordt de naam van de Padtype class vertaald naar een machine leesbare vorm;
* **calculate uri structure**<br/>Zet de tree structure van de Entiteittype class(es) om naar eenzelfde machine leesbare
vorm;
* **check uri structure**<br/>De in beide voorgaande stappen verkregen structuren worden met elkaar vergeleken.

Tenslotte wordt in een 4e stap ook de response tree structure nog geanalyseerd in de stap:
* **analyze response tree structure**<br/>Op basis van het resultaat van deze stap worden indien nodig ook nog query parameters 
gegenereerd.

In de volgende paragrafen geven we meer uitleg over deze 4 stappen.

## Determine uri structure

Voor het kunnen vergelijken van de beide eerder genoemde structuren moeten deze worden omgezet naar een machine leesbare structuur.
Een pad als bijv. '/mmm/{mmm-nummer}/nnn/ppp/{ppp-nummer}' wordt daartoe in deze stap omgezet naar de volgende xml structuur:

```xml
<ep:uriStructure name="/mmm/{mmm-nummer}/nnn/{nnn-nummer}/ppp/{ppp-nummer}" customPathFacet="">
   <ep:uriPart>
      <ep:entityName original="mmm">mmm</ep:entityName>
      <ep:param>
         <ep:name original="mmm/{mmm-nummer">mmm-ummer</ep:name>
      </ep:param>
   </ep:uriPart>
   <ep:uriPart>
      <ep:entityName original="nnn">nnn</ep:entityName>
      <ep:param>
         <ep:name original="nnn/{nnn-nummer">nnn-nummer</ep:name>
      </ep:param>
   </ep:uriPart>
   <ep:uriPart>
      <ep:entityName original="ppp">ppp</ep:entityName>
      <ep:param>
         <ep:name original="ppp/ppp-nummer">ppp-nummer</ep:name>
      </ep:param>
   </ep:uriPart>
</ep:uriStructure>
``` 

## Calculate uri structure*

Hetzelfde gebeurd eigenlijk met de Entiteittype class(es) van de request tree structure. Een UML structuur als bijv.

<img src="https://github.com/user-attachments/assets/10f21c57-9826-46f9-81ca-aa0f47e826e6" width="230">

Wordt hier dus omgezet naar de volgende xml structuur:

```xml
      <ep:uriStructure name="/mmm/{mmm-nummer}/nnn/{nnn-nummer}/ppp/{ppp-nummer}" customPathFacet="">
         <ep:uriPart>
            <ep:entityName original="mmm">mmm</ep:entityName>
            <ep:param is-id="true">
               <ep:name original="mmm-nummer">mmm-nummer</ep:name>
               <ep:documentation>
                  <ep:pattern>
                     <ep:p>Code gevolgd door een volgnummer van 7 cijfers met voorloopnullen</ep:p>
                  </ep:pattern>
               </ep:documentation>
               <ep:data-type>string</ep:data-type>
               <ep:max-length>10</ep:max-length>
               <ep:min-occurs>1</ep:min-occurs>
               <ep:max-occurs>1</ep:max-occurs>
            </ep:param>
            <ep:param>
               <ep:name original="fields">fields</ep:name>
               <ep:documentation>
                  <ep:description>
                     <ep:p>Hiermee kun je de inhoud van de resource naar behoefte aanpassen door een door komma's gescheiden lijst van property namen op te geven.</ep:p>
                  </ep:description>
               </ep:documentation>
               <ep:data-type>string</ep:data-type>
               <ep:min-occurs>1</ep:min-occurs>
               <ep:max-occurs>1</ep:max-occurs>
            </ep:param>
         </ep:uriPart>
         <ep:uriPart>
            <ep:entityName original="nnn">nnn</ep:entityName>
            <ep:param is-id="true">
               ...
            </ep:param>
         </ep:uriPart>
         <ep:uriPart>
            <ep:entityName original="ppp">ppp</ep:entityName>
            <ep:param is-id="true">
               ...
            </ep:param>
         </ep:uriPart>
      </ep:uriStructure>
```

Zoals je ziet staan hier al weer wat meer gegevens in die gebruikt kunnen worden bij het genereren van de parameter 
definities in de OAS specificatie.

Tijdens het genereren van deze structuur wordt tevens gecheckt of er in de Entiteittype class request tree structure niet een van de volgende fouten voorkomt:
* op een of meer van de Entiteittype classes in de request tree structure is geen 'tagged value 'Naam in meervoud' gedefinieerd;
* een van de Entiteittype classes heeft meer dan één association;
* een van de associations van de Entiteittype classes heeft geen tagged value 'Target rol in meervoud';
* een van de associations in de Entiteittype class request tree structure creëert een recursieve relatie.

# Check uri structure

De in beide voorgaande stappen verkregen structuren worden in deze stap met elkaar vergeleken. Hierbij wordt ook bepaald welke parameter in
de structuur uit de tweede stap een path parameter is en welke query parameters zijn. Daardoor is het uiteindelijk ook 
mogelijk om het juiste dataformaat op de path en query parameters te definiëren.

Eventuele fouten in de structuren worden hier ook gedetecteerd. Denk daarbij aan:
* het definiëren van 2 path parameters na elkaar in de naam van de Padtype class zoals `/mmm/{mmm-nummer}/{nnn-nummer}`;
* er komen meer resources in de naam van de Padtype class voor dan in Entiteittype classes van de request tree structure;
* er komt helemaal geen Entiteittype class in de request tree structure voor;
* de naam van de PadType class eindigd op een '/';
* de naam van een of meer van de resources in de naam van de PadType class komt niet overeen met een van de namen van de Entiteittype classes van de request tree structure;
* een property in een van de Entiteittype classes die een path parameter vertegenwoordigd is niet gedefinieerd als een 'id';
* er is geen property in een Entiteittype class die de in de naam van de PadType class gedefinieerde path parameter vertegenwoordigd;
* de request tree bevat een of meer Entiteittype classes die geen onderdeel zijn van de naam van de PadType class.

Tenslotte wordt wederom een vergelijkbare structuur als in de voorgaande stappen gegenereerd. 
