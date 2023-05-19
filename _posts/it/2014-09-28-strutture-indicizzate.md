---
layout: post
lang: it
title:  "Strutture indicizzate"
excerpt: ""
category: computer-science
date:   2014-09-28 22:45:33
tags: [Java,Strutture indicizzate,Strutture Dati]
comments: true
share: true
---

Le strutture indicizzate sono collezioni di celle numerate che possono contenere elementi di tipo prestabilito. Assumeremo che in un array di dimensione h gli indici possano andare da 0 a h-1 o da 1 a h.

Normalmente si definiscono due proprietà, una comunemente detta forte l’altra debole.

proprietà forte: gli indici delle celle di un array sono numeri consecutivi.
proprietà debole: non è possibile aggiungere nuove celle ad un array.

Una possibile implementazione di un array ordinato è riportata sotto (ed è un implementazione del tipo di dato dizionario)

classe: ArrayOrdinato implementa Dizionario
dati: un array S di dimensione n contenente n coppie (elem,chiave) S(n) = Tetagrande(n)

In pratica non usiamo indici i (numerici) come  chiave ma come cella dove memorizzare la coppia (e,k)

Vediamo ora le operazioni comunemente definite su un dizionario

insert(elem e,chiave k) T(n) = O(n)

1. Rialloca S aumentando la dimensione n di 1 (cioè |S| = |S| + 1 ed n = n+1)
2. Cerca i t.c. k<=S[i].chiave (è ordinato!)
3. Pone S[j]<-S[j-1] per ogni j in [n-1,i+1] e pone S[i]<-(e,k)

In pratica sapendo che è ordinato basta che riallochiamo di una cella l’array,traslando il contenuto delle celle da i a n nelle nuove posizioni i+1 a n+1.


Identificata la posizione che deve occupare la coppia (e,k) da inserire, traslo le celle da i+1 in modo da liberare la cella i e mantenere l’ordinamento.

delete(chiave k) T(n)=O(n)

1. Trovo l’indice i della coppia con chiave k in S ovvero trovo i t.c. S[i] = (e,k) dove k è quello dato. In altri termini trovo S[i].chiave=k
2. Pone S[j]<-S[j+1] per ogni j, j in i,...,n-2
3. Rialloca S diminuendo la dimensione di 1 (ho tolto un elemento e posso eliminare l’ultima cella dopo che ho traslato gli elementi

search(chiave k) -> elem T(n) = O(log n)

1. Esegue l’algoritmo di ricerca binaria su S per verificare se S contiene k
2. Se trova ritorna elemento altrimenti null

Nel linguaggio Java la naturale implementazione è fornita tramite gli array che possono contenere anche oggetti oltre i tipi base, quindi anche coppie o tuple del tipo `<K,V>` cioè coppie (chiave,valore)

Oltre agli array, struttura di base del linguaggio, possiamo ovviamente utilizzare le liste per esempio gli `ArrayList` che adottano propriò questo tipo di filosofia più alcuni accorgimenti atti a rendere l’implementazione più efficiente.
