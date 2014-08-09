---
layout: post
title:  "Il metodo String.format una printf per Java"
category: articles
date:   2014-07-13 22:45:33
tags: [Java, String]
comments: false
share: true
---
﻿
Alla data in cui scrivo, molti non sono ancora passati nè alla versione 8 di Java nè tantomeno alla 7, per chi non lo sapesse già la versione 7 del JDK, offre il metodo 

{% highlight java %}
String.format(String format, Object... args)
{% endhighlight %}

Un implementazione direi completa del caro e vecchio printf, non stampa di per sè ma ci permette di applicare la formattazione alla stringa che andremo poi a stampare tramite i classici metodi staticiprint() e println() di System.out.
 
Già questo basterebbe per togliersi un po' di pigrizia ed eventuali vincoli e passare almeno alla versione 7 di Java.
Vediamo la segnature riportata sopra, abbiamo i parametri format e la lista variabile di argomenti args che rappresentano le variabili che passeremo in successione e che saranno formattate. Riguardo il metodo format dalla documentazione ufficiale Oracle abbiamo la seguente descrizione

{% highlight java %}
%[argument_index$][flags][width][.precision]conversion
{% endhighlight %}

dove l’argomento opzionale argument_index  è un intero che indica la posizione dell’argomento nella lista stessa. 
Il primo argomento e referenziato con 1$ il secondo con 2$ e così via, piuttosto facile e intuitivo anche se non si ha esperienza in C o C++.

flags opzionale anch'esso è il set di caratteri che modifica il formato dell’output i flag  validi dipendono dal valore per l’argomento conversion.

width opzionale intero non negativo indica il numero minimo di caratteri da scrivere sull’otput.

precision intero non negativo è utilizzato per limitare il numero di caratteri e il comportamento specifico è in base a valore di conversion.

Come visibile conversion è l’unico argomento obbligatorio ed indica la formattazione dipende dal tipo del dato.

Il meccanismo è lo stesso utilizzato nel linguaggio C un esempio può comunque chiarire meglio le idee, l’istruzione

{% highlight java %}
String.format ( "%,6.2f", 352.100)
{% endhighlight %}


formatta il nostro numero come un float (type), la virgola come separatore della parte decimale e precisione come da parametrizzazione data.

{% highlight java %}
352,10
{% endhighlight %}

Ovviamente tutto ciò non è limitato ai tipi di dato numerici ma vale anche per date e stringhe.
