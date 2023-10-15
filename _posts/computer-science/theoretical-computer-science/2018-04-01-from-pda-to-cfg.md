---
layout: post
lang: en
title:  "From Pushdown Automata (PDA) to Context-Free Grammar (CFG)"
excerpt: "Construction of a Context-Free Grammar from a Pushdown Automata"
category: theoretical-computer-science
date:   2018-04-01 22:45:33
tags: ["Pushdown Automata","Context-Free Grammar"]
comments: true
share: true
---
   
> Kleeneliness is next to Gödeliness 

We will start from the assumption that the following two statements apply.

* It is always possible to construct an equivalent CFG from a PDA.
* For a PDA by increasing the symbols in the stack it is possible to reduce the automaton to one with only one state (Given a PDA M &exist; PDA M' with Q={q} L(M)=L(M'), i.e. an equivalent PDA with only one state capable of recognising the same language) 

So for the construction of the equivalent context-free grammar, we start with a first step of simplifying the stack automaton, making it a single-state automaton.
We can construct the CGF `G`=<T,N,P,S> equivalent to the PDA `M`=<{q},&Sigma;,&Gamma;,&delta;,q,Z> with the following procedure.

1. T=&Sigma; *the alphabet of symbols of the PDA becomes the set of terminals of the CFG*.
2. N=&Gamma; *the alphabet of the PDA stack becomes the set of non-terminals of the CFG*.
3. S=Z *the initial symbol of the PDA stack becomes the axiom of the grammar*.
4. A p&isin;P production 
   1. X::=&sigma;&gamma; `iff` <q,&gamma;>&isin;&delta;(q,&sigma;,X) 
   2. X::=&gamma;Z `iff` <q,&gamma;>&isin;&delta;(q,&epsilon;,X)

More simply by reviewing all the transitions of the automaton 

* `if` <q,&sigma;X> -> <q,&gamma;> `then` we add X::=&sigma;&gamma; to the productions of G
* `if` <q,&epsilon;X> -> <q,&gamma;> `then` we add X::=&gamma;Z to the productions of G

It follows that &forall;u&isin;&Sigma;*, < q,u,Z > &rarr;* <q, &epsilon;, &epsilon;> `iff` Z&rarr;*u [^footnote1]