---
layout: post
lang: it
title:  "Alberi in Java"
excerpt: ""
category: programming-languages
date:   2014-10-05 22:45:33
tags: [Italian,"Data Structures"]
comments: true
share: true
---
﻿Dopo i post sulle strutture dati elementari passiamo a trattare gli alberi, prima di entrare nel dettaglio di come implementare strutture dati di questo tipo ne approfondiamo l’aspetto teorico.

Per prima cosa ne vediamo la definzione classica

Un albero (radicato) è una coppia `T=(N,A)` costituita da un insieme `N` di nodi e da un insieme `A` di archi, `A` è sottoinsieme proprio di `NxN` (cioè del prodotto cartesiano di `N` per `N`), gli archi infatti sono coppie di nodi e il concetto di arco ne modella la relazione esistente.

Esiste una nomenclatura piuttosto intuitiva riguardo gli Alberi

In un albero ogni nodo v (tranne la radice) ha un solo genitore (o padre) u tale che (u,v) appartiene ad A (l’insieme degli archi)

Un nodo può avere 1 o più figli v t.c. (u,v) appartiene ad A e il loro numero è detto grado

Con queste definizioni abbiamo già fissato alcuni concetti importanti

Seguono le definizioni per 
radice
foglie
nodi interni
antenati
discendenti
profondità

i nodi con lo stesso padre vengono detti fratelli

alberi con foglie tutte sullo stesso livello vengono detti alberi completi

Un specifica base del tipo di dati Albero deve comprendere necessariamente operazioni come quelle riportate sotto
```
tipo
   Albero
dati
   Un insieme di nodi N e uno di archi A
operazioni
   numNodi() -> intero (restituisce il numero di nodi presenti nell’albero)
   grado(nodo v)-> intero (restituisce il numero di figli del nodo v)
   padre(nodo v) -> nodo (restituisce il padre del nodo v o null se v è la radice)
   figli(nodo v) -> <nodo,nodo,...,nodo> (resitituisce uno dopo l’altro i figli del nodo v)
   aggiungiNodo(nodo u) -> nodo (inserisce un nuovo nodo v come figlio di u nell’albero e lo restituisce, se v è il primo nodo 
                           ad essere inserito nell’albero esso diventa radice e u viene ignorato)
   aggiungiSottoalbero(Albero a,nodo u) (inserisce nell’albero il sottoalbero a in modo che la radice di a diventi figlia di u)
   rimuoviSottoalbero(nodo v)->Albero (stacca e restituisce l’intero sottoalbero radicato in v,
   l’operazione cancella dall’albero il nodo v e tutti i suoi discendenti)
```

A questo punto passare dalla specifica in pseudocodice ad una in linguaggio Java è immediato. 

```java
interface NodoInf {
      //stuff
}

interface AlberoInf {
   int numNodi();
   int grado(Nodo v);
   Nodo padre(Nodo v);
   List<Nodo> figli(Nodo v);
   Nodo aggiungiNodo(Nodo u);
   void aggiungiSottoalbero(Albero a,Nodo u) ;
   Albero rimuoviSottoalbero(Nodo v);
}
```

Una struttura di questo tipo che non si porti dietro un certo contenuto informativo è di per se poco utile, Nodo dovrebbe infatti contenere come proprietà per esempio una chiave, un etichettà. Pensiamo ad esempio ad una struttura ad albero per rappresentare l’albero genealogico di una famigla.

Utilizzando i generics sarebbe infatti più interessante lavorare con classi di questo tipo
`Tree<T>` e `Node<T>`.

Nel JDK sono presenti implemetazioni interessanti come `javax.swing.tree.TreeModel` e `javax.swing.tree.TreeNode` utilizzata nelle Swing per la realizzazione delle GUI in ambiente desktop.

Esistono diverse possibili rappresentazioni per gli alberi sia basate su strutture indicizzate che collegate, quale scegliere dipende dal tipo di problemi che pensiamo di dover risolvere, se pensiamo che l’operazione più frequente o critica sia per esempio risalire ai figli di un nodo ne utilizzeremo una, se la l’operazione più critica e navigare per livelli l’albero ne utilizzeremo una ottimizzata per questo tipo di problema.
