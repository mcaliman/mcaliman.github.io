---
layout: post
lang: en
title:  "CFG in Chomsky and Greibach's normal form"
excerpt: "Chomsky and Greibach's context-free grammar in normal form, how they are made and why they are interesting"
category: Programming
date:   2018-03-21 22:45:33
tags: ["Context-Free Grammar"]
comments: true
share: false
published: true
---

> Kleeneliness is next to Gödeliness 

   
# Chomsky
All productions are of the form A::= BC or A::= &sigma;
(&sigma; &isin;T and A,B,C &isin;N).

Knowing them is important for various reasons, for instance they are used in the proof of correctness of lemma pumping for CF languages.


# Greibach
All productions are of the form A::= &sigma;B1...Bn 
(&sigma;&isin;T and A,B1,...,Bn &isin;N, n&ge;0).

One of the reasons to know them is that they are used in algorithms to switch from a CFG to a stack automaton (PDA).

If you want to learn about Noam Chomsky and Sheila Greibach you can go to

1. [https://en.wikipedia.org/wiki/Noam_Chomsky](https://en.wikipedia.org/wiki/Noam_Chomsky) 
2. [https://en.wikipedia.org/wiki/Sheila_Greibach](https://en.wikipedia.org/wiki/Sheila_Greibach)