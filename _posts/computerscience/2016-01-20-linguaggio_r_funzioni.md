---
layout: post
title:  "le funzioni in R"
excerpt: ""
category: computerscience
date:   2016-01-20 22:45:33
tags: [datascience,R]
comments: true
share: true
---

Le funzioni sono create usando la direttiva `function()` e memorizzate come qualsiasi altro oggetto in R. 
In particolare sono oggetti di classe funzione.

{% highlight bash %}
f <- function(<arguments>) {
   # corpo della funzione
}
{% endhighlight %}

Le funzioni in R sono `first class objects`, il che significa che possono essere trattate come qualsiasi altro oggetto in R: possono essere passati come argomenti per altre funzioni e possono essere nidificate (in questo modo si può definire una funzione all'interno di un'altra funzione),il valore di ritorno di una funzione è l'ultima espressione da valutare nel corpo della funzione.

## Argomenti di una funzione

Gli argomenti formali sono argomenti inclusi nella definizione di una funzione
Non tutte le chiamate a una funzione si avvalgono di tutti gli argomenti formali, in quanto
un argomento di una funzione potrebbe essere mancante o potrebbero avere valori di default.

## Il matching degli argomenti 
Qualcosa che trovo veramente comodo: il match degli argomenti di una funzione può avvenire per posizione o per nome
Le seguenti chiamate sono equivalenti

{% highlight bash %}
dati <- rnorm(100)
sd(dati)
sd(x = dati)
sd(x = dati, na.rm = FALSE)
sd(na.rm = FALSE, x = dati)
sd(na.rm = FALSE, dati)
{% endhighlight %}

Anche se è permesso, non vi sconsiglio di giocare troppo con l'ordine naturale (ordine della definizione di funzione) degli argomenti,serve solo a fare confusione.

E' possibile combinare corrispondenza posizionale con corrispondenza in base al nome .
Quando un argomento viene accompagnato dal nome,viene tolto della lista degli argomenti e gli argomenti senza nome rimanenti sono abbinati nell'ordine in cui sono elencati nella definizione della funzione. 

Personalmente, data una funzione, trovo più utile utilizzare solo o l’una o l’altra (o solo per posizione o solo per nome), ma se vi doveste trovare di fronte a codice scritto con questa modalità mixed è utile conoscere le regole del gioco.

## definire una funzione
{% highlight bash %}
f <- function(a, b = 1, c = 2, d = NULL) {
}
{% endhighlight %}
Oltre a non specificare un valore di default , è possibile anche impostare un valore di argomento NULL .

## Lazy Evaluation
Gli argomenti a funzioni vengono valutate lazy, in modo che siano valutati solo quando necessario .

{% highlight bash %}
f <- function(a, b) {
   a^2
}
f(2)
## [1] 4
{% endhighlight %}

Questa funzione non utilizza effettivamente l'argomento b e chiamare f (2) non produrrà un errore.

Mentre per l'esempio sotto l'errore viene prodotto per ovvie ragioni.

{% highlight bash %}
f <- function(a, b) {
   print(a)
   print(b)
}
f(45)
## [1] 45
## Error: argument "b" is missing, with no default
{% endhighlight %}

Esiste poi l'argomento ... ma di questo parleremo in un altro post.



