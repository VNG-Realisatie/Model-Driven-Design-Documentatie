---
layout: page-with-side-nav
title: Creatie en omgang met interface classes
---
_**TODO** Check of dit principe ook werkt voor andere componenten dan objecttypes en entiteittypes en of het 
voor SIM en UGM ook werkt._

_**TODO** Dit vergt voor een BSM nog wel een aanpassing in de software aangezien daar nu op dit punt een klein
bugje zit._

# Creatie en omgang met interface classes
Bij het modelleren kan de behoefte ontstaan bepaalde classes in meerdere modellen te gebruiken. Je wil in dat 
geval die classes niet in al die modellen opnieuw modelleren maar slechts eenmaal en ze hergebruiken. Dat levert 
voor het beheer het voordeel op dat dit voor de betreffende classes maar op 1 plaats hoeft te gebeuren. In dit 
document beschrijven we hoe je dat kunt realiseren.

Als eerste moet je een package creëren in het project (SIM, UGM of BSM) niveau waarop je de classes wil kunnen 
hergebruiken. Geef dat package vervolgens een duidelijke, de inhoud omschrijvende, naam en het stereotype 
'Basismodel', tenslotte definieer je op dat package een datum in de tagged value 'release'. In dat package plaats 
je (minimaal) één 'Domein' package waarin je de herbruikbare classes plaatst. Ook daarop definieer je een datum 
in de tagged value 'release'.

Daarna kan je het zojuist vervaardigde 'Basismodel' package verwerken met Imvertor. Dat betekent dat de daarin 
voorkomende classes beschikbaar komen voor andere modellen.

In de modellen waarin je de classes wil hergebruiken creëer je vervolgens een package met dezelfde naam als het 
zojuist vervaardigde 'Basismodel' package. Dat package krijgt het stereotype 'Intern' en de tagged value 'Interne 
release' krijgt dezelfde waarde als de waarde van de tagged value 'release' op het zojuist vervaardigde 'Basismodel'
package. Op die wijze kunnen beide packages aan elkaar worden gelinkt.

In het 'Intern' package kan je nu voor elke class uit het 'Basismodel' package dat je wil hergebruiken een 
'Interface' component aanmaken. Zorg er voor dat die componenten wat betreft de naamgeving gelijk zijn aan de 
gerelateerde classes uit het 'Basismodel' package.

Nu kan je in je model die 'Interface' componenten gebruiken i.p.v. de classes die je daar eerst gebruikte.

<b><span style="color:red">Tip</span></b> <i>Je kunt dit nog beter beheersbaar maken door ergens een template 'Intern' package aan te maken waarin je
voor alle classes in je 'Basismodel' package een 'Interface' component aanmaakt. Die kan je dan steeds in nieuwe 
packages kopiëren waarin je hergebruik wil maken van de classes. Zo hoef je het 'Intern' package niet steeds opnieuw 
aan te maken.</span></i>

Nu kun je de classes in je 'Basismodel' indien gewenst aanpassen en door achtereenvolgens dat 'Basismodel' package 
en de modellen met de 'Intern' packages die dat model gebruiken te verwerken met Imvertor kan je je resultaten, bijv. 
OAS specificaties, updaten.

<b><span style="color:red">Aandachtspunt</span></b> <i>Een intern package moet dezelfde naam hebben als het gerelateerde 'Basismodel' package. Als je 
een 'Basismodel' package met Imvertor wil verwerken en het staat in de Project Browser lager dan een 'Intern' package
met dezelfde naam dan levert dat problemen op. In dat geval zal het 'Intern' package verwerkt worden en het resultaat
niet als gewenst zijn. Geef in zo'n geval het interne package tijdelijk een andere naam.</i>
