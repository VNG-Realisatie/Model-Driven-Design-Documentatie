# Creatie en omgang met interface classes
Bij het modelleren kan de behoefte ontstaan bepaalde classes in meerdere modellen te gebruiken. Je wil in dat 
geval die classes niet in al die modellen opnieuw modelleren maar slechts eenmaal en ze hergebruiken. In dit 
document beschrijven we hoe je dat kunt realiseren.

Als eerste moet je een package creëren in het project (SIM, UGM of BSM) het niveau waarop je de classes wil 
kunnen hergebruiken. Geef dat package vervolgens het stereotype 'Basismodel'. In dat package plaats je (minimaal) 
één 'Domein' package waarin je de herbruikbare classes plaatst. Vervolgens definieer je op dat package de volgende
tagged values:
* Release
*

_**TODO** Check of dit principe ook werkt voor andere componenten dan objecttypes en entiteittypes en ook of het 
voor SIM en UGM ook werkt._

_**TODO** In dit document het volgende verwerken. Een intern package moet dezelfde naam moet hebben als het gerelateerde externe package. 
Echter als je een extern package met Imvertor wil verwerken en het staat in de Project Browser onder het gerelateerde interne package dan mag dat weer niet.
Het interne package moet dan tijdelijk een andere naam krijgen._


Vervolgens verwerk je dat 'Basismodel' package met Imvertor. Dat betekent dat die componenten beschikbaar komen voor 
andere modellen.

_**TODO** Dit vergt voor een BSM nog wel een aanpassing in de software aangezien daar nu op dit punt een klein
bugje zit._

In het model waarin je de classes wil hergebruiken creëer je een package met dezelfde naam als het 'Basismodel'
package met de herbruikbare componenten dat je zojuist heb vervaardigd. Dat package krijgt het stereotype 
'Intern' waarin je voor elk component dat je daarin wil hergebruiken en dat in het 'Basismodel' package
aanwezig is een 'Interface' element (met dezelfde naam) opneemt. Om dat package te kunnen verbinden met het 
'Basismodel' package definieer je daarop weer de tagged values:
* Intern project
* Interne naam
* Interne release

Daarna kan je in je berichten die 'Interface' elementen gebruiken i.p.v. de elementen die je daar eerst gebruikte. Als je dat een beetje slim aanpakt dan kan je dat ook nog aardig beheersbaar maken door een template 'Intern' package te maken waarin je voor alle componenten in je BSM 'Basismodel' package een 'Interface' element aanmaakt. Die kan je dan steeds in nieuwe 'Koppelvlak' packages kopiëren.
Daarna kan je de componenten in je 'Basismodel' zo gewenst aanpassen en door achtereenvolgens dat 'Basismodel' package en de 'Koppelvlak' packages die dat model gebruiken te verwerken met Imvertor kan je je OAS specificaties updaten. Als je wil kan ik je wel laten zien hoe dat werkt.

## Beheeruitdagingen
