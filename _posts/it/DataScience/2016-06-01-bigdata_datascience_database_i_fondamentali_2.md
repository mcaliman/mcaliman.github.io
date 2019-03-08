---
layout: post
title:  "Big Data, Data Science, Database i fondamentali 2"
excerpt: ""
category: DataScience
date:   2016-06-01 22:45:33
tags: [it]
comments: true
share: true

image:
  path: /images/unsplash/daniele-d-andreti-1131967-unsplash.jpg
  # thumbnail:/images/unsplash/daniele-d-andreti-1131967-unsplash.jpg
  caption: "[Photo by Daniele D'Andreti on Unsplash](https://unsplash.com/photos/RpHarahftoM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)"

---
{% highlight bash %}
{% endhighlight %}

Prima dei DBMS come si faceva? O meglio come si fa ancora in molte sistemi ancora in uso? La parte del re la facevano i sistemi operativi, le applicazioni salvano su file, in un qualche formato, spesso proprietario,e una o più applicazioni dedicate si occupavano di leggere,scrivere,modificare e cancellare i dati. La cosa tutto sommato funzionava bene se tutto risiedeva su una sola macchina e non doveva comunicare con il resto del mondo, cioè quando non vi erano problemi di accesso concorrente ai dati. In generale i problemi erano di ridondanza,inconsistenza,difficoltà di accesso ai dati,accesso concorrente e protezione dei dati.

I sistemi DBMS hanno risolto questi problemi permettendo una rappresentazione dei dati centralizzata e condivisa.

Quando si parla di BigData si parla, anche, di database non relazionali NRDBMS o NoSQL, senza schema, ma esattamente come possiamo definire lo schema o schema logico di una database? Come la descrizione della struttura della base di dati, un astrazione al alto livello detto modello dei dati. Lo schema non ci dice cosa contiene la base di dati ma come è fatta astraendo l’implementazione usando un qualche formalismo ad alto livello, per esempio lo schema di una base di dati di una rubrica telefonica potrebbe essere descritta come: nome (stringa di 30),cognome(stringa di 30),telefono(intero di 20)

E quando vogliamo riferirci ai dati e non alla struttura? In tale caso parliamo di istanza della base di dati, cioè insieme dei dati in dato momento, dato che le basi di dati variano nel tempo a seguito di inserimenti,modifiche e cancellazioni.



