---
layout: post
title:  "Algoritmo di visita in profondità per un albero (DFS o Depth First Search)"
excerpt: ""
category: AlgorithmsAndDataStructures
date:   2014-10-12 22:45:33
tags: [Java,Algoritmi,Alberi]
image:
  path: /images/unsplash/lidya-nada-744078-unsplash.jpg
  -- thumbnail: /images/unsplash/lidya-nada-744078-unsplash.jpg
  caption: "[Photo by Lidya Nada on Unsplash](https://unsplash.com/photos/BnzqQwerUOY?utm_source=unsplash&utm_medium=referralutm_content=creditCopyText)"
comments: true
share: true
---

"La scienza è ciò che comprendiamo abbastanza bene da spiegarla a un computer. L'arte è tutto il resto"
*(Donald Knuth)*

Partendo dall’algoritmo generico mostrato e usando per rappresentare `S` una Pila/Stack otteniamo la visita in profondità (o DFS cioè depth first search)

{% highlight java %}
proc DFS(node r)
   Stack S
   S.push(r)
   while not S.isEmpty()  do
      u ← S.pop()
       if u ≠ null then
            visit(u)
            S.push(right_child_of(u))
            S.push(left_child_of(u))
       fi
   od
endproc 
{% endhighlight %}

in una visita in profondità si prosegue la visita dall’ultimo nodo lasciato in sospeso
poiché mettiamo in pila prima il figlio destro di ogni nodo e poi quello sinistro tenderemo a seguire tutti i figli sinistri andando in profondità fino a che non si raggiunge la prima foglia sinistra in generale si passerà a visitare ogni sotto-albero destro in un nodo solo quando il sotto-albero sinistro è stato complessivamente visitato


Invertendo l’ordine in cui aggiungiamo i figli abbiamo la variante simmetrica

La versione di visita in profondità ricorsiva mostrata sotto è molto più elegante:
la pila non appare esplicitamente nell’algoritmo in quanto è la pila di record di attivazione  delle chiamate ricorsive per mantenere i nodi aperti.

Esitono le ovvie varianti se alteriamo l'ordine delle istruzioni di visita e di aggiunta dei figli nella Pila S.
* visita in preordine = si visita prima la radice poi figlio sinistra e poi destra
* visita simmetrica   = si effettua prima sinistra,poi radice e poi destra
* visita in post ordine = prima sinistra,poi destra e infine radice

{% highlight java %}
//DFS recursive visit
proc DFS(node r)
     if r = null then return
     visit(u)
     DFS(left_child_of(r))
     DFS(right_child_of(r))
endproc
{% endhighlight %}
