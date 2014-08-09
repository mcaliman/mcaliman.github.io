---
layout: post
title:  "Le costanti simboliche in Java"
category: articles
date:   2003-02-03 22:45:33
tags: [Java]
comments: false
share: true
---

Una variabile che non cambia mai valore è di fatto una costante, si può in java esplicitare un vincolo a tale condizione di immutabilità
tramite la parola chiave **final**.

Per esempio:

{% highlight java %}
final int M = 3;
{% endhighlight %}



La parola **final** indica che la variabile M di tipo **int** non può cambiare il suo valore pari a 3. 
In questo caso si dice che M  una costante e non una variabile.

Le costanti sono utili nel creare applicazioni più flessibili e facilmente manutenzionabili. 
Permettono di evitare errori nel caso un valore numerico o altro debbano essere usati in diversi posti all' interno del codice.
Ovviamente come succede analogamente in tutti i linguaggi di programmazione le parole chiave del linguaggio 
Java non possono essere usate come nomi di variabili o costanti, quindi parole come **final**, **int** e vedremo **while**, **do** e altre 
non possono essere usate come nomi di variabili o costanti. 

Vedremo nei prossimi post che posso usare **final** anche in altri contesti.
