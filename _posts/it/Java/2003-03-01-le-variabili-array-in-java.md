--- 
layout: post
lang: it
title:  "Le variabili array in Java"
excerpt: ""
category: java
date:   2003-03-01 22:45:33
tags: [Java]
comments: true
share: true
---


Gli array sono disponibili nella maggior parte dei linguaggi di programmazione perchè realizzano 
la più semplice organizzazione di strutture dati complesse.

#Dichiarazione e allocazione

Iniziamo con qualche definizione un più formale ma che sarà utile per fissare i concetti essenziali.

Definizione 
Un array  una struttura dati che consente di rappresentare sequenze di dati dello stesso tipo. 
Gli elementi costituenti un array possono essere rintracciati specificando la loro posizione.

{% highlight java %}
T[] var = new T[n];
{% endhighlight %}

definisce un array di nome var e tipo T di n elementi, gli elementi dell' array sono

{% highlight java %}
var[0], var[1], ... , var[n-1]
{% endhighlight %}

n anche detto dimensione o lunghezza dell' array;

possibile anche l'inizializzazione degli elementi contestualmente alla definizione

{% highlight java %}
T[] var = {values_0,value_1, ... ,value_n}
{% endhighlight %}

Per cui si hanno i valori dei singoli elementi pari a

{% highlight java %}
var[0] = value_0 ;var[1] = value_1 ;...var[n] = value_n ;
{% endhighlight %}

altrimenti la dichiarazione può svolgersi in 2 fasi

{% highlight java %}
T[] var; var = new T[n] ;
{% endhighlight %}

oppure

{% highlight java %}
var = new T[] { value_0,value_1, ..., value_n }
{% endhighlight %}

ciascun elemento dell' array può essere usato allo stesso modo di una variabile

dato l'array var { value_0,value_1, ... , value_n }

{% highlight java %}
var[0] = value_0 ; var[1] = value_1 ;
{% endhighlight %}

posso modificare il secondo elemento dell' array , cioè var[1] con valore new_value_1 con l'istruzione

{% highlight java %}
var[1] = new_value_1 ;
{% endhighlight %}

trasformando var in { value_0,new_value_1, ... , value_n }

posso assegnare ad una variabile x del tipo compatibile con T il valore i-esimo di var semplicemente cosi

{% highlight java %}
T x = var[i] ;
{% endhighlight %}

in questo modo x ha il valore i-esimo dell' array var , ovviamente i deve avere un valore 
compreso tra 0 e var.lenght0-1 che rappresenta la lunghezza dell' array var.

#Gli array multidimensionali

Gli array visti sino a questo momento sono di tipo monodimensionale ovvero costituiscono sequenze lineari di dati 
omogenei e associabili ad un modello vettoriale. In realt si possono avere anche array multidimensionali in cui ciascun 
elemento  individuato non da un singolo indice ma da un numero di indici maggiore.

Per esempio la classica matrice

{% highlight java %}
T[][] var = new var [n][m];
{% endhighlight %}

valgono le considerazioni fatte precedentemente per i tipi monodimensionali, 
per inizializzare il valore di posizione o cordinate i,j posso scrivere

{% highlight java %}
var[i][j] = a_value ;
{% endhighlight %}

per l' inizializzazione smart invece posso fare anche

{% highlight java %}
T[][] var = { {value_0, value_1, ... , value_n} , { value_0, value_1, ... , value_m } }
{% endhighlight %}

