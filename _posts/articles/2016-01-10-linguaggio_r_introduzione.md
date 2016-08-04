---
layout: post
title:  "Linguaggio R introduzione"
category: articles
date:   2016-01-10 22:45:33
tags: [datascience,R]
comments: true
share: true
---

Ho scoperto il linguaggio di programmazione R quasi per caso e ne sono rimasto affascinato.
La prima cosa da sapere è che R è più di un linguaggio di programmazione, è anche un ambiente di sviluppo completo. 
Basato sul linguaggio S è utilizzato per la gestione e l'analisi statistica di dati per la produzione di grafici ed è disponibile gratuitamente sotto i vincoli della licenza GPL. 

R è un ambiente interattivo (come python): i comandi producono una risposta immediata. 

Una volta che R è stato lanciato, tutte le istruzioni sono eseguibili dalla linea
di comando dell'ambiente, caratterizzata dal prompt `>`
 
la linea di comando viene eseguita premendo il tasto `Invio`. 
Nel suo utilizzo più semplice, può essere utilizzato come calcolatrice (una calcolatrice cresciuta un pò troppo)

{% highlight bash %}
> 2+2*2
[1] 6
> 
{% endhighlight %}


Per costruire un oggetto viene utilizzato il comando `<-`  o  `=` (od anche `->` si avete letto bene, quindi potete fare `x<-a+1` ma anche `a+1->x` ). 

{% highlight bash %}
> x<-1+7
> 1+7->x
> x
[1] 8

> x # stampa x
[1] 8
{% endhighlight %}


Il carattere `#` è il simbolo di commento e tutto ciò che segue viene
ignorato dall'ambiente (vedi le istruzioni appena sopra).

Analogamente a quanto accade in ogni altro linguaggio di programmazione nel momento in cui si decide di creare un oggetto, l’eventuale oggetto preesistente che possiede lo stesso nome verrà sovrascritto.

Una nota importante: R è case sensitive quindi l’oggetto `X` non è l’oggetto `x` (esattamente come accade in C o in Java e Python per esempio e diversamente non accade invece nel linguaggio SQL dove select equivale a Select o SELECT).

Se proviamo a richiamare un oggetto non ancora creato abbiamo la segnalazione 

{% highlight bash %}
> y
Error: Object "y" not found
{% endhighlight %}

oppure in italiano 

{% highlight bash %}
> y
Errore: oggetto "y" non trovato
> 
{% endhighlight %}

Se abbiamo la versione è localizzata in italiano

Come in ogni altro linguaggio di programmazione esiste una lista di parole riservate che non possono essere utilizzate dall'utente a proprio piacimento, ma ovviamente solo per lo scopo per le quali sono state definite.

{% highlight bash %}
FALSE, TRUE, Inf, NA, NaN, NULL, 
break, else, for, function, if,in, next, repeat, while
{% endhighlight %}

Dotato di una grande quantità di funzioni che assolvono ai più comuni
calcoli matematici e statistici R è dotato di un manuale di aiuto in linea per ognuna di esse. 
L’help è visionabile digitando ?<f> o help(<f>) dal prompt dei comandi dove <f> è il nome della funzione.

per esempio `help(mean)` richiama l’help della funzione per il calcolo della media

Forse una delle più semplici funzioni è `rm()` che serve a cancellare gli oggetti (o meglio rimuovere dalla memoria rm sta per remove);
nel suo utilizzo più elementare:

{% highlight bash %}
> x<-2+2
> x
[1] 4
{% endhighlight %}

{% highlight bash %}
> rm(x)
> x
Errore: oggetto "x" non trovato
{% endhighlight %}


Vediamo qualche comando che ci verrà spesso utile.

`getwd()` ritorna la directory di lavoro (get work directory). Tutte le operazioni in R fanno riferimento a questa directory di lavoro se non diversamente specificato.

`dir()` ritorna la lista delle directory (il tipo di ritorno è  un array e quindi possiamo farci tutte le cose interessanti che possiamo fare con un array)

`read.csv("mycsv.csv")` leggere un file csv (e lo rende disponibile in un oggetto se lo assegniamo con l’operatore <- ad una variabile)

Un ultima cosa in questo primo assagggio introduttivo del linguaggio R: Come si creare una funzione (che poi è il costrutto principale in un linguaggio funzionale)? In modo molto semplice:

{% highlight bash %}
f <- function() {
   x<-rnorm(10)
   mean(x)
}
{% endhighlight %}

La funzione denominata f che ho appena definito la posso chiamare con il suo nome seguito dalle parentesi f() il valore ritornato è l’ultimo computato, posso salvare la definizione di funzione con estensione .R e ricaricarla con `source("f.R")`
e dopo con `ls()` avere la lista delle funzioni contenute.

Alcuni file di sistema dell’ambiente di lavoro di R: `.Rhistory` e  `.Rdata`
Il file `.Rhistory` è un file ascii che riporta i codici digitati sul prompt, senza
comunque riportare le risposte di R.
mentre Il file `.Rdata` è lo workspace  che contiene tutti gli oggetti salvati nell'ambiente durante l'attuale sessione, è possibile salvare il workspace utilizzando la funzione `save.image()` altri dettagli su come sfruttare in modo utile `.Rdata` si possono trovare nella documentazione online di R.

