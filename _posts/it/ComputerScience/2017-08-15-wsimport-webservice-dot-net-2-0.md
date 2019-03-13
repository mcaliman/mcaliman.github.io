--- 
layout: post
lang: it
title: "wsimport e Webservice .Net 2.0"
excerpt: ""
category: ComputerScience
date:   2015-08-15 22:45:33
modified: 2017-08-15 22:45:33
tags: [Webservices,Java,.NET]
comments: true
share: true
---

Aggiornamento 2017: Con NetBeans 8.2 il problema sotto esposto sembra gestito in totale trasparenza dalla procedura di generazione delle classi dal wsdl (wizard di NB8.2).

Adoro i webservice.
Occupandomi di integrazione di applicazioni, applicazioni B2B e più in generale architetture SOA mi capita spesso di dover creare sistemi le cui funzionalità sono il risultato dell'interazioni di diversi servizi web, alcuni sviluppati da me altri da terze parti o disponibili sul mercato .
Adoro i webservice ma...
Li amo un po' meno quando da applicazioni Java EE ho a che fare con webservice made in .NET 2.0 . Al momento in cui scrivo questo post il framework sono alla versione 4 e oltre da un bel po' e con quelli grossi problemi non ce ne più.  La parola magica è “retrocompatibilità, dobbiamo rimanere retrocompatibili ci spiace” l’ho sentita molte volte, e se mi metto nei panni di chi sviluppa applicazioni nel mondo Microsoft la comprendo perfettamente. 

In questo caso i problemi che si presentano sono comunque più o meno gli stessi e il mio IDE preferito NetBeans non mi facilita più la vita, meglio quindo armarsi di terminale e riscoprire il JDK (Java Development Kit) e i suoi strumenti come wsimport.

L’errore tipo 1

Quando il wizard di NetBeans 8 in fase di creazione delle nostre classi client ci restituisce le righe di errore del tipo sotto

[ERROR] A class/interface with the same name X is already in use. Use a class customization to resolve this conflict.
  line NNN of file:/Y:/NetBeansProjects/Application/xml-resources/web-service-references/service/wsdl/service.wsdl

C’è un conflitto di naming..

NetBeans non fa altro che lanciare wsimport e lui non fa altro che dirci che forse è meglio utilizzare l’opzione -B-XautoNameResolution. Farlo da IDE non è immediato,potete anche provare a smanettare con gli attributi del riferimento al webservice (WebService Reference / Edit WebService Attribute) e vedere se si riesce a impostare l’opzione nei WsImport Option (anzi se trovate un modo postate/scrivete sarà lieto di integrare il post con le vostre osservazioni), se invece non siete così avventurieri e l’orgoglio nerd riemerge aprite il terminale e digitate

wsimport  -d e:\mydir -extension -Xnocompile -Xendorsed -B-XautoNameResolution  -keep -s e:\mydir -encoding UTF-8  -verbose E:/mydir/service.wsdl  -wsdllocation file:/E:/mydir/service.wsdl

Importate poi le classi generate nel vostro IDE preferito e proseguite con il lavoro.

Un consiglio l’opzione -p <mycustompackage> non è presente per un motivo ben preciso ed è sempre possibile rifattorizzare il codice in seguito.
L’errore tipo 2

Un altro problema si manifesta con l’errore


[ERROR] undefined element declaration 's:schema'

preceduto dall’avvertimento

[WARNING] src-resolve: Cannot resolve the name 's:schema' to a(n) 'element declaration' component.

A fronte di una chiamata da parte di NetBeans di wsimport nella forma

 wsimport -d E:\NetBeansProjects\JavaApplication18\build\generated\jax-wsCache\WebService -extension -Xnocompile -Xendorsed -keep -s E:\NetBeansProjects\JavaApplication18\build\generated\jax-wsCache\WebService -encoding UTF-8 -catalog E:\NetBeansProjects\JavaApplication18\catalog.xml -verbose E:\NetBeansProjects\JavaApplication18\xml-resources\web-service-references\WebService\wsdl\xx.yy.zz\WebService.asmx.wsdl -wsdllocation http://xx.yy.zz/webservice.asmx?WSDL
parsing WSDL...

Una soluzione è dire a wsimport come trattare quella definizione e riferimento a s:schema

wsimport -b  http://www.w3.org/2001/XMLSchema.xsd  -b  E:/tmp/customization.xjb  E:/tmp/webservice.wsdl

Il contenuto del file customization.xjb è riportato sotto

{% highlight xml %} 
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
{% endhighlight %}
Se vi ho risparmiato qualche ora a googlare/imprecare in klingon/annegare nel caffè fatemelo sapere. 
