---
layout: post
lang: it
title: "API fantastiche e dove trovarle: il metodo Objects.toString()"
excerpt: "Meno codice per gestire le stringhe null. Convertire una stringa se null in stringa vuota."
modified: 2019-11-03
category: Java
tags: [Italian]


comments: true
share: true
search_omit: false
updated: true
---
Se nel tuo codice hai "roba" del genere 
{% highlight java %}
string = string == null ? "" : string;
{% endhighlight %}
oppure
{% highlight java %}
if(string==null) string="";
{% endhighlight %}
oppure, più intelligentemente, hai creato una metodo del tipo
{% highlight java %}
String ifNullThenEmpty(String string) { return string == null ? "" : string;}
{% endhighlight %}
e magari ancor più smart hai infilato tutto in una classe Utilities come metodo statico...

...Non preoccuparti, l'ho fatto anche io, non è un reato, Alan Turing non verrà a tirarti i piedi mentre dormi, ne la mattina seguente troverai James Gosling che dorme sul pianerottolo per poterti insultare prima che tu varchi la soglia di casa.

Però! Se usi una versione di Java dalla 7 in poi, non ne hai bisogno, anche se semplice, perché reinventare la ruota? Oracle lo ha già preparato per te? Usalo (punto). 

La classe `Objects` contiene un metodo `String toString(Object o, String nullDefault)`
che puoi usare come `Objects.toString(string,"")` se poi fai ne fai l'import statico puoi direttamente scrivere `toString(string,"")`.

Semplice, pulito e non lo devi testare, lo ha già fatto qualcuno per te.

Se non lo hai già fatto, prenditi il tempo di dare un occhiata agli altri metodi che offre questa classe.
