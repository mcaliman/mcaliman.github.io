---
layout: post
lang: it
title:  "Generic visit algorithm for a tree"
excerpt: ""
category: "Computer Science"
date:   2014-10-10 22:45:33
tags: [Italian,"Data Structures","Algorithms"]
comments: true
share: true
---


Uno dei compiti più comuni da svolgere su un albero è quello di effettuare una sua visita, cioè passare in rassegna ogni suo nodo. Con il termine in linguaggio naturale "passare in rassegna” intendiamo “applicare una qualche funzione” al nodo in esame fosse anche la semplice stampa a video che esso è stato visitato.

Il procedimento di visita più generico possibile è visibile nell'algoritmo in pseudocodice riportato sotto

```java
proc generic_tree_visit(node r)
   S ← { r }
   while S ≠ ∅  do
       u ← get node from S
       visit(u)
       S ← S ∪ { children of u}
   od
endproc
```

l’algortimo mantiene istante per istante in `S` i nodi che rappresentano i punti di ramificazione rimasti in sospeso e da cui la visita deve proseguire, diremo che questi nodi sono aperti e formano una frangia dell’albero, un nodo diventa chiuso quando è rimosso da `S`.

Rispetto ai costi in termini di spazio occupato in memoria e tempo per l’esecuzione abbiamo il teorema seguente.

teorema: l'algoritmo di visita generica applicato alla radice di un albero con n nodi termina in `O(n)` iterazioni e lo spazio usato è `O(n)`.

Ciò è evidente di per se ed è dimostrabile formalmente. La dimostrazione esula gli scopi di questo post che sono solo quelli di porre le basi a quelli successivi che ne approfondiscono gli aspetti teorici e pratici.
