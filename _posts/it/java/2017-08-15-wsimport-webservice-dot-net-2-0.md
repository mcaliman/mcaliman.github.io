--- 
layout: post
title: "wsimport e Webservice .Net 2.0"
excerpt: ""
category: "Java"
date:   2015-08-15
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, it]
---

Aggiornamento 2017: Con NetBeans 8.2 il problema di seguito sembra essere gestito in modo completamente trasparente dalla procedura di generazione delle classi dal wsdl (wizard di NB8.2).

Amo i web service.
Occupandomi di integrazione di applicazioni, applicazioni B2B e, più in generale, di architetture SOA, mi capita spesso di dover creare sistemi le cui funzionalità sono il risultato dell'interazione di vari web service, alcuni sviluppati da me, altri da terze parti o disponibili sul mercato.
Amo i web service, ma...
Li amo un po' meno quando dalle applicazioni Java EE devo avere a che fare con web service realizzati in .NET 2.0. Al momento in cui scrivo questo post, i framework sono arrivati alla versione 4 e oltre già da un po', e con quelli non ci sono più grossi problemi. La parola magica è "retrocompatibilità, dobbiamo rimanere retrocompatibili, scusate": l'ho sentita molte volte e, mettendo i panni di chi sviluppa applicazioni nel mondo Microsoft, lo capisco perfettamente. 

In questo caso, i problemi che si presentano sono più o meno sempre gli stessi e il mio IDE preferito NetBeans non mi semplifica più la vita, quindi meglio armarsi di terminale e riscoprire il JDK (Java Development Kit) e i suoi strumenti come wsimport.

Tipo di errore 1

Quando il wizard di NetBeans 8 sta creando le nostre classi client, restituisce righe di errore del tipo seguente:

[ERROR] A class/interface with the same name X is already in use. Use a class customization to resolve this conflict.
  line NNN of file:/Y:/NetBeansProjects/Application/xml-resources/web-service-references/service/wsdl/service.wsdl

C'è un conflitto di nomi.
NetBeans lancia semplicemente wsimport e tutto ciò che fa è dirci che potrebbe essere meglio usare l'opzione -B-XautoNameResolution. Farlo dall'IDE non è intuitivo, puoi anche provare a giocherellare con gli attributi dei riferimenti web service (WebService Reference / Edit WebService Attribute) e vedere se riesci ad impostare l'opzione nei WsImport Option (infatti se trovi il modo posta/scrivi, sarò felice di integrare il post con le tue osservazioni); se invece non sei così avventuroso e l'orgoglio nerd riemerge, apri il terminale e digita:

wsimport -d e:\mydir -extension -Xnocompile -Xendorsed -B-XautoNameResolution -keep -s e:\mydir -encoding UTF-8 -verbose E:/mydir/service.wsdl -wsdllocation file:/E:/mydir/service.wsdl

Quindi importa le classi generate nel tuo IDE preferito e continua con il lavoro.

Un suggerimento: l'opzione -p <mycustompackage> non è presente per un motivo ben preciso e puoi sempre fare refactoring del codice in seguito.

Tipo di errore 2

Un altro problema si manifesta con l'errore

[ERROR] undefined element declaration 's:schema'

preceduto dal warning

[WARNING] src-resolve: Cannot resolve the name 's:schema' to a(n) 'element declaration' component.

Quando NetBeans chiama wsimport nella forma

 wsimport -d E:\NetBeansProjects\JavaApplication18\build\generated\jax-wsCache\WebService -extension -Xnocompile -Xendorsed -keep -s E:\NetBeansProjects\JavaApplication18\build\generated\jax-wsCache\WebService -encoding UTF-8 -catalog E:\NetBeansProjects\JavaApplication18\catalog.xml -verbose E:\NetBeansProjects\JavaApplication18\xml-resources\web-service-references\WebService\wsdl\xx.yy.zz\WebService.asmx.wsdl -wsdllocation http://xx.yy.zz/webservice.asmx?WSDL
WSDL parsing...

Una soluzione è dire a wsimport come trattare quella definizione e il riferimento s:schema

wsimport -b http://www.w3.org/2001/XMLSchema.xsd -b E:/tmp/customization.xjb E:/tmp/webservice.wsdl

I contenuti del file customization.xjb sono mostrati di seguito
```xml
<?xml version="1.0" encoding="UTF-8"?>
<bindings xmlns="http://java.sun.com/xml/ns/jaxb"
          xmlns:xsd="http://www.w3.org/2001/XMLSchema"
          xmlns:xjc="http://java.sun.com/xml/ns/jaxb/xjc"
          version="2.0">

  <globalBindings>
    <xjc:simple />
  </globalBindings>

  <bindings scd="~xsd:complexType">
    <class name="ComplexTypeType"/>
  </bindings>

  <bindings scd="~xsd:simpleType">
    <class name="SimpleTypeType"/>
  </bindings>

  <bindings scd="~xsd:group">
    <class name="GroupType"/>
  </bindings>

  <bindings scd="~xsd:attributeGroup">
    <class name="AttributeGroupType"/>
  </bindings>

  <bindings scd="~xsd:element">
    <class name="ElementType"/>
  </bindings>

  <bindings scd="~xsd:attribute">
    <class name="attributeType"/>
  </bindings>
</bindings>
```
Se ti ho fatto risparmiare qualche ora passata a googlare/imprecare in Klingon/cercare conforto nel caffè, fammelo sapere.
