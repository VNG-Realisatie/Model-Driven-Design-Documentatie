---
layout: page-with-side-nav
title: Berekenen van endpoint path en de path-, query-parameters
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

In het kader van dit verhaal is met name de Padtype class en de daarmee een berichttype class gemeen hebbende Entiteittype 
class welke met een associatie met de naam 'request' aan de berichttype gekoppeld is van belang. Beide classes hebben nl. 
een relatie. De eerste definieert dus zoals gezegd het pad van een bericht (incl. een evt. path parameter). De tweede 
definieert de evt. query parameters, de typering daarvan en die van de pad parameter. In enkele gevallen worden de query 
parameters overigens niet gedefinieerd maar afgeleid. Daarover later meer.

Om dit allemaal goed te kunnen doen moet de tree structuur die wordt uitgedrukt in de Padtype class overeenkomen met de tree 
structuur die wordt gemodelleerd met de eerder genoemde Entiteittype class en de daar weer aan gekoppelde Entiteittype classes.
Het YamlCompiler stylesheet 'EP-2-XML-4-JSON-header-mapping.xsl' bevat daartoe functies waarmee beide tree structuren tegen
elkaar kunnen worden gehouden en vergeleken. Alleen als die vergelijking slaagt vindt verdere verwerking plaats.

In het eerder genoemde stylesheet vindt de vergelijking in de volgende 3 stappen plaats:

* **determine uri structure**<br/>In deze stap wordt de naam van de Padtype class vertaald naar een machine leesbare vorm;
* **calculate uri structure**<br/>Zet de tree structure van de Entiteittype class(es) om naar eenzelfde machine leesbare
vorm;
* **check uri structure**<br/>De in beide voorgaande stappen verkregen structuren worden met elkaar vergeleken. Daarbij wordt
wederom een vergelijkbare structuur als in de voorgaande stappen gegenereerd. Hierbij wordt ook bepaald welke parameter in
de structuur uit de tweede stap een path parameter is en welke query parameters zijn.
