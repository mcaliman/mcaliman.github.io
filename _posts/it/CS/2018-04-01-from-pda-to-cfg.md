---
layout: post
lang: it
title:  "Da PDA a CFG"
excerpt: "Costruzione di una grammatica CF partendo da un automa a pila (PDA)"
category: ComputerScience
date:   2018-04-01 22:45:33
tags: [Italian,"Programming Languages","Computer Science"]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 

Partiremo dall'assunto che valgano le seguenti due affermazioni.

* Da un PDA è sempre possibile costruire una CFG equivalente.
* Per un PDA aumentando i simboli nella pila di è possibile ridurre l'automa ad uno con un solo stato (Dato un PDA M &exist; PDA M' con Q={q} : L(M)=L(M'), cioè un PDA equivalente con unico stato in grado di riconoscere lo stesso linguaggio) 

Quindi per la costruzione della grammatica libera dal contesto equivalente partiamo da una prima fase di semplificazione dell'automa a pila, rendendolo un automa con un unico stato.

Possiamo costruire la CGF `G`=<T,N,P,S> equivalente al PDA `M`=<{q},&Sigma;,&Gamma;,&delta;,q,Z> con il seguente procedimento.

1. T=&Sigma; *l'alfabeto dei simboli del PDA diventa l'insieme dei terminali della CFG*
2. N=&Gamma; *l'alfabeto della pila del PDA diventa l'insieme dei non terminali della CFG*
3. S=Z *il simbolo iniziale della pila del PDA diventa l'assioma della grammatica.*
4. Una produzione p&isin;P 
   1. X::=&sigma;&gamma; `sse` <q,&gamma;>&isin;&delta;(q,&sigma;,X) 
   2. X::=&gamma;Z `sse` <q,&gamma;>&isin;&delta;(q,&epsilon;,X)

Più semplicemente passando in rassegna tutte le transizioni dell'automa 

* `se` <q,&sigma;X> -> <q,&gamma;> `allora` aggiungiamo X::=&sigma;&gamma; alle produzioni di G
* `se` <q,&epsilon;X> -> <q,&gamma;> `allora` aggiungiamo X::=&gamma;Z alle produzioni di G

Segue che &forall;u&isin;&Sigma;*, < q,u,Z > &rarr;* <q, &epsilon;, &epsilon;> sse Z&rarr;*u [^footnote1]


[^footnote1]: Si può provare per induzione.