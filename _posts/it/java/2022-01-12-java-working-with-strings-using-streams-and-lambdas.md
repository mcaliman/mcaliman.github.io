---
layout: post
lang: it
title: "Working with Strings using Streams and Lambdas."
excerpt: ""
modified: 2022-01-12
categories: Java
tags: [Italian]
comments: true
share: true
search_omit: false
updated: true
---

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

Senza le lambda e gli stream di caratteri, ottenibile tramite il nuovo metodo chars(),
probabilmente avreste ciclato sui singoli caratteri della stringa controllandoli uno alla volta,
oppure avreste usato se possibile una regexpr.

Esempio della vecchia scuola 
{% highlight java %}
for (int i = 0; i < string.length(); i++) {
    char c = string.charAt(i);
    if (c == 'b') System.out.println("Contiene una b");
}
{% endhighlight %}