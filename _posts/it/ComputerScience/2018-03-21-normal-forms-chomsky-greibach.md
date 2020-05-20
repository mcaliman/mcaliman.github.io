---
layout: post
lang: it
title:  "CFG in forma normale di Chomsky e Greibach."
excerpt: "Le grammatiche context-free in forma normale di Chomsky e Greibach, come sono fatte e perchè sono interessanti."
category: "Computer Science"
date:   2018-03-21 22:45:33
tags: [Theoretical Computer Science,CFG,Chomsky,Greibach]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 


# Chomsky
Tutte le produzioni sono della forma A::= BC oppure A::= &sigma;
(&sigma; &isin; T e A,B,C &isin;N).

Conoscerle è importante per vari motidi, per esempio sono utilizzate nella prova di correttezza del pumping lemma per i linguaggi CF.


# Greibach
Tutte le produzioni sono della forma A::= &sigma;B1...Bn 
(&sigma; &isin; T e A,B1,...,Bn &isin;N, n&ge;0).

Uno dei motivi per conoscerle è che sono utilizzate negli algoritmi che permettono di passare da una CFG ad un automa a pila (PDA).

Se volete approndire qualcosa Noam Chomsky e Sheila Greibach potete andare su

1. [https://it.wikipedia.org/wiki/Noam_Chomsky](https://it.wikipedia.org/wiki/Noam_Chomsky) 
2. [https://en.wikipedia.org/wiki/Noam_Chomsky](https://en.wikipedia.org/wiki/Noam_Chomsky) 
3. [https://en.wikipedia.org/wiki/Sheila_Greibach](https://en.wikipedia.org/wiki/Sheila_Greibach)