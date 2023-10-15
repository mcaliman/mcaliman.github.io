---
layout: post
lang: en
title:  "From Context-Free Grammar (CFG) to Pushdown Automata (PDA)"
excerpt: "Construction of a stack automaton (PDA) from a CF grammar"
category: theoretical-computer-science
date:   2018-04-02 22:45:33
tags: ["Pushdown Automata","Context-Free Grammar"]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 

   Let us assume that the following statement applies

* A CFG can be reduced to Greibach normal form.

We construct the PDA M equivalent to the CFG G transformed to Greibach normal form as follows

1. Q={q}
2. &Sigma;=T
3. &Gamma;=N
4. Z=S
5. <q,&gamma;>&isin;&delta;(q,&sigma;X) sse X::=&sigma;&gamma; is a production of G

In practice, once we have transformed our grammar G into Greibach normal form and called G'=<T,N,P,S> the latter, the equivalent stack automaton M is
`M`=<{q},T,N,&delta;,q,S> where &delta; is constructed transaction by transaction starting with each individual production according to the rule in step 5. i.e. for each production that will necessarily have the form X::=&sigma;&gamma; I create I construct a transaction <q,&gamma;>&isin;&delta;(q,&sigma;X) i.e. (q,&sigma;X) -> <q,&gamma;>

It follows that &forall;u&isin;&Sigma; * , S->* u sse <q,u,S> ->* <q, &epsilon;, &epsilon;> [^footnote1]


[^footnote1]: It can be proved by induction.