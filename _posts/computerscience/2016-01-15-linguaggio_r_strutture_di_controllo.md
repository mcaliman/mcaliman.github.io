---
layout: post
title:  "Le strutture di controllo di R"
excerpt: ""
category: computerscience
date:   2016-01-15 22:45:33
tags: [datascience,R]
comments: true
share: true
---

Le strutture di controllo in R consentono di controllare il flusso di esecuzione del programma, in base alle condizioni a runtime in maniera non dissimile da qualsiasi altro linguaggio imperativo (come C,Java,Python), vediamo velocemente le parole riservate dedicate alle strutture di controllo

* if, else: test di una condizione
* for: esecuzione di un ciclo per un numero prefissato di volte
* while: esecuzione di un ciclo mentre/fintanto che condizione è vera
* repeat: esecuzione di un ciclo infinito
* break: interrompe l’esecuzione di un ciclo
* next: salta un iterazione di un ciclo (il continue del C o Java per intenderci)
* return: esce da una funzione o ciclo

La maggior parte delle strutture di controllo non sono utilizzate in sessioni interattive , ma piuttosto durante la scrittura di funzioni o
espressioni più lunghe. Vediamo in dettaglio i vari costrutti.

## if,else

{% highlight bash %}
if(<condizione>) { 
  # fa qualcosa ramo if
} else {
  # fa qualcosa ramo else
}
if(<condizione1>) {
  # fa qualcosa se condizione 1
} else if(<condizione2>) {
  # fa qualcosa se condizione 2
} else {
  # fa qualcosa in tutti gli altri casi
}
{% endhighlight %}

Un esempio di if else

{% highlight bash %}
if(x > 10) {
  y <- 0
} else {
  y <- 1
}
{% endhighlight %}

## for
Il for usa una variabile come iteratore (la variabile i nell’esempio) e ne assegna i valori successivi da una sequenza o vettore. 
I for sono comunemente utilizzati per l'iterazione sugli elementi di un oggetto (elenco,vector , etc. )

{% highlight bash %}
for(i in 1:10) {
   print(i)
}
{% endhighlight %}

Questo ciclo prende la variabile i e in ogni iterazione del ciclo usa i suoi valori 1, 2, 3, ..., 10, ed esce

questi 3 cicli hanno lo stesso comportamento

{% highlight bash %}
x <- c("a", "b", "c", "d")
for(i in 1:4) {
   print(x[i])
}
for(i in seq_along(x)) {
   print(x[i])
}
for(letter in x) {
   print(letter)
}
for(i in 1:4) print(x[i])
{% endhighlight %}

i cicli for possono ovviamente essere nidificati come in qualsiasi altro linguaggio di programmazione.

{% highlight bash %}
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
   for(j in seq_len(ncol(x))) {
      print(x[i, j])
   }
}
{% endhighlight %}

e allo stesso modo è necessario fare attenzione nel nidificare per più di 3 o 4 livelli in quanto rende spesso illeggibile un frammento di codice.




## while

I cicli while iniziano testando una condizione, se è vera, allora eseguono il corpo del ciclo. Una volta che il ciclo corpo viene eseguita , viene provata la condizione di nuovo , e così via .

{% highlight bash %}
count <- 0
while(count < 10) {
   print(count)
   count <- count + 1
}
{% endhighlight %}


## repeat

`repeat` avvia un ciclo infinito ;  L'unico modo per uscire da un ciclo repeat è quello di chiamare `break`.

{% highlight bash %}

repeat {
   x <- f()
   if(x<10) {
      break
   } else {
      x <- x-1
   }
}
{% endhighlight %}

## next, return
next è usato per saltare un iterarazione di un loop

{% highlight bash %}
for(i in 1:100) {
   if(i <= 20) {
      ## salta 20 iterazioni
      next
   }
   ## non fa nullla
}
{% endhighlight %}

return segnala che una funzione è terminata è deve tornare un valore




