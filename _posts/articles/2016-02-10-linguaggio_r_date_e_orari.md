---
layout: post
title:  "Oggetti data, orari e intervalli di tempo in R"
excerpt: ""
category: articles
date:   2016-02-10 22:45:33
tags: [datascience,R]
comments: true
share: true
---

{% highlight bash %}
{% endhighlight %}

## La classe Date
R ha una speciale rappresentazione di oggetti date e ora,le date sono rappresentate tramite la classe `Date`,orari e intervalli di tempo con le classi `POSIXct` o `POSIXlt`. 
Le date vengono memorizzate internamente come il numero di giorni dal 1/1/1970 mentre gli orari e intervalli sono memorizzati internamente come il numero di secondi trascorsi dal 1/1/1970

## Classi per orari e intervalli di tempo
Le date sono rappresentate dalla classe `Date` e possono essere sottoposte a coercizione (conosciuto con il nome di cast in altri linguaggi) da una stringa di caratteri nel seguente modo

{% highlight bash %}
x <- as.Date("1970-01-01")
x
[1] "1970-01-01"
> class(x)
[1] "Date"
{% endhighlight %}


Orari e intervalli di tempo sono rappresentate utilizzando le classi
`POSIXct` e `POSIXlt` 

* `POSIXct` sotto il “cofano” è solo un grande numero intero e si usa quando si desidera memorizzare orari in qualcosa di simile a un frame di dati

* `POSIXlt` ha “detro” una lista e memorizza una serie di altre informazioni utili come il giorno della settimana, giorno dell'anno , mese , giorno del mese (ed è più utile quando bisogna effettuare manipolazioni)

Ci sono un certo numero di funzioni generiche per gli oggetti di tipo date e orari

* `weekdays` : ritorna il giorno della settimana
* `months` : ritorna il nome del mese
* `quarters` : ritorna il numero del quadrimestre (“Q1”, “Q2”, “Q3”,“Q4”)

gli orari possono essere ottenuti da una stringa di caratteri utilizzando le funzioni `as.POSIXlt` o `as.POSIXct`.

{% highlight bash %}
t1 <- Sys.time()
posix1<- as.POSIXlt(t1)
posix1$sec #prende la parte secondi, posso farlo perchè l'ho costruito come POSIXlt 
{% endhighlight %}

oppure posso utilizzare il format `POSIXct`.

nel caso in cui le date siano scritte in un formato diverso si può usare la funzione `strptime` 

{% highlight bash %}
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
#restituisce "2012-01-10 10:40:00 EST" "2011-12-09 09:10:00 EST" ed è interessante notare che l'ho applicato ad una lista
{% endhighlight %}








## Operazioni su oggetti di tipo Date e POSIX*

È possibile utilizzare le operazioni matematiche `+` e `-` su date e orari e così anche quelli di confronto come `==` e `<=`
{% highlight bash %}
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
x <- as.Date("2012-01-01");y <- strptime("January 10, 2012 10:40", "%B %d, %Y %H:%M")
x-y

Error in x - y : argomento non numerico trasformato in operatore binario
Inoltre: Warning message:
Metodi incompatibili ("-.Date", "-.POSIXt") per "-" 

x <- as.POSIXlt(x) # i tipi erano incompatibili trasformo tutto in POSIXlt
x-y
Time difference of -9.402778 days

# unclass ci dice anche che l'unico attributo a cui possiamo attingere è quello che abbiamo giù ottenuto e cioè la differenza in giorni
> unclass(differenza)
[1] -9.402778
attr(,"units")
[1] "days"

#come anticipato posso applicare anche gli operatori di ordinamento

x>y
[1] FALSE



{% endhighlight %}

tiene anche traccia degli anni bisestili , ora legale e fusi orari .
{% highlight bash %}
> x <- as.Date("2012-03-01") 
> y <- as.Date("2012-02-28")
> x-y
Time difference of 2 days
{% endhighlight %}



{% highlight bash %}
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
Time difference of 1 hours
{% endhighlight %}


