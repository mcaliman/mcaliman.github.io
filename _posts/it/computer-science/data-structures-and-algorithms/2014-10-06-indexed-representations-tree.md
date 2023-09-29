---
layout: post
lang: it
title:  "Alberi rappresentazioni indicizzate"
excerpt: ""
category: data-structures-and-algorithms
date:   2014-10-06 22:45:33
tags: [Italian,"Computer Science"]
comments: true
share: true
---
Rappresentazioni indicizzate
Basate su array vettore padri e vettori posizionali entrambe richiedono spazio O(n)


Vettori padri
=============
La più semplice
Sia T = (N,A) albero con n nodi numerati da 0 a n-1 un vettore padri è un vettore P di dim n le cui celle contengono coppie (info,parent) per ogni indice v appartenente a [0,n-1]
p[v].info è il contenuto informativo del nodo v
p[v].parent = u sse vi è un arco (u,v) in A
Se invece v è la radice p[v].parent=null
usando il vettore dei padri da ogni nodo è possibile risalire in tempo O(1) al proprio padre mentre trovare un figlio richiede una scansione dell’array in tempo O(n)


Vettore posizionale
===================
Nel caso particolare degli alberi d-ari completi con d>=2 è possibile una rappresentazione indicizzata dove ogni nodo ha una posizione prestabilita.

Sia T=(N,A) albero d-ario, n nodi numerabili da 1 a n
p vettore di dimensione n  t.c. p[v] contiene l’informazione associata al nodo v e t.c l’informazione associata all’i-esimo figlio di v è in posizione p[d*v+i] per i in [0,(d-1)]

Per semplicità la posizione 0 dell’array non è utilizzata lo spazio richiesto per n nodi è quindi n +1

* da ogni nodo v è possibile risalire in tempo O(1) sia al proprio padre (che ha indice floor ceil v/d se v diversa da radice) che a uno qualunque dei figli
* per ogni v nodo, l’operazione padre(v) può quindi essere realizzata in tempo costante mentre l’operazione figli(v) richiede tempo O(grado(v))
