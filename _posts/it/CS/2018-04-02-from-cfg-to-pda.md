---
layout: post
lang: it
title:  "Da CFG a PDA"
excerpt: "Costruzione di un automa a pila (PDA) partendo da una grammatica CF"
category: ComputerScience
date:   2018-04-02 22:45:33
tags: [Italian,Programming languages]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 


Assumiamo che valga la seguente affermazione

* Una CFG può essere ridotta in forma normale di Greibach.

Costruiamo il PDA M equivalente alla CFG G trasformata in forma normale di Greibach così

1. Q={q}
2. &Sigma;=T
3. &Gamma;=N
4. Z=S
5. <q,&gamma;>&isin;&delta;(q,&sigma;X) sse X::=&sigma;&gamma; è una produzione di G

In pratica, una volta trasformata in forma normale di Greibach la nostra grammatica G e detta G'=<T,N,P,S> quest'ultima, l'automa a pila equivalente M è
`M`=<{q},T,N,&delta;,q,S> dove &delta; è costuita transazione per transazione partendo da ogni singola produzione secondo la regola del punto 5. ovvero per ogni produzione che avrà necessariamente la forma X::=&sigma;&gamma; creo costruisco una transazione <q,&gamma;>&isin;&delta;(q,&sigma;X)  cioè (q,&sigma;X) -> <q,&gamma;>

Segue che &forall;u&isin;&Sigma; * , S->* u sse <q,u,S> ->* <q, &epsilon;, &epsilon;> [^footnote1]


[^footnote1]: Si può provare per induzione.
