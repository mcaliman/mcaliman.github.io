---
layout: post
title:  "From Pushdown Automata (PDA) to Context-Free Grammar (CFG)"
excerpt: "Construction of a Context-Free Grammar from a Pushdown Automata"
category: Programming
date:   2018-04-01
comments: true
share: false
modified: 2026-04-27
published: true
tags: [computer-science, theory, en, Updated, peer-review-2026-05-10-2]
permalink: /programming/pushdown-automata-pda-context-free/
---
   
> Kleeneliness is next to Gödeliness 

We will start from the assumption that the following two statements apply:

* It is always possible to construct an equivalent CFG from a PDA.
* For a PDA, by increasing the symbols in the stack, it is possible to reduce the automaton to one with only one state (Given a PDA $M$, $\exists$ PDA $M'$ with $Q=\{q\}$ such that $L(M)=L(M')$, i.e., an equivalent PDA with only one state capable of recognizing the same language).

So for the construction of the equivalent context-free grammar, we start with a first step of simplifying the stack automaton, making it a single-state automaton.
We can construct the CFG $G = \langle T, N, P, S \rangle$ equivalent to the PDA $M = \langle \{q\}, \Sigma, \Gamma, \delta, q, Z \rangle$ with the following procedure:

1. $T = \Sigma$ (*the alphabet of symbols of the PDA becomes the set of terminals of the CFG*).
2. $N = \Gamma$ (*the alphabet of the PDA stack becomes the set of non-terminals of the CFG*).
3. $S = Z$ (*the initial symbol of the PDA stack becomes the axiom of the grammar*).
4. A production $p \in P$ is added according to:
   1. $X \to \sigma \gamma$ $\iff$ $\langle q, \gamma \rangle \in \delta(q, \sigma, X)$ 
   2. $X \to \gamma Z$ $\iff$ $\langle q, \gamma \rangle \in \delta(q, \epsilon, X)$

More simply by reviewing all the transitions of the automaton:

* if $(q, \sigma, X) \to \langle q, \gamma \rangle$, then we add $X \to \sigma \gamma$ to the productions of $G$
* if $(q, \epsilon, X) \to \langle q, \gamma \rangle$, then we add $X \to \gamma Z$ to the productions of $G$

It follows that:

$$ \forall u \in \Sigma^\*, \langle q, u, Z \rangle \vdash^\* \langle q, \epsilon, \epsilon \rangle \iff Z \Rightarrow^\* u $$

[^footnote1]

[^footnote1]: It can be proved by induction.

Revision: 2026-04-25
