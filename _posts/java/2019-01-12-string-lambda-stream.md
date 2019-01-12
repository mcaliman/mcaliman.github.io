---
layout: post
title: "Lavorare con le Stinghe con gli Stream e le Lambda"
excerpt: ""
modified: 2019-01-12
categories: java
tags: [Java]
#image:
#  feature: so-simple-sample-image-1.jpg
#  credit: WeGraphics
#  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
search_omit: false
updated: true
---

Gli oggetti immutabili sono istanze il cui stato non cambia dopo che sono state inizializzate. Per esempio `String` è una classe immutabile e una volta istanziata con il suo valore non cambia più.

Le lambda e gli steam non sono oggeti esotici da utilizzare in complessi algoritmi alla portata solo di ricercatori rinchiusi in laboratori di una multinazionale.
Anche nella vita dello sviluppatore di tutti i giorni possono rendere la vita più facile, ricorda meno codice e più elegante uguale meno bug e mal di testa.
Vediamo qualche semplice caso che riguarda le stringhe.


{% highlight java %}
String string = "abc";
boolean contieneAlmenoUnaC = string.chars().anyMatch(c -> c == 'b');
System.out.println(contieneAlmenoUnaC);//Stampa true

boolean contieneTutteC = string.chars().allMatch(c -> c == 'b');
System.out.println(contieneTutteC);//Stampa false

boolean noneMatch_a = string.chars().noneMatch(c -> c == 'a');
System.out.println(noneMatch_a);//Stampa false

boolean noneMatch_d = string.chars().noneMatch(c -> c == 'd');
System.out.println(noneMatch_d);//Stampa true

{% endhighlight %}

Senza le lambda è lo stream di caratteri ottenibile tramite il nuovo metodo chars()
probabilmente avreste ciclato sui singoli caratteri della stringa controllandolo opportunamente
o usato una regexpr se possibile.

{% highlight java %}
for (int i = 0; i < string.length(); i++) {
    char c = string.charAt(i);
    if (c == 'b') System.out.println("Contiene una b");
}
{% endhighlight %}