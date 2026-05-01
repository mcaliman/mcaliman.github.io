---
layout: post
title:  "From Context-Free Grammar (CFG) to Pushdown Automata (PDA)"
excerpt: "Construction of a stack automaton (PDA) from a CF grammar"
permalink: /programming/context-free-grammar-cfg-pushdown/
category: Programming
date:   2018-04-02
comments: true
share: false
modified: 2026-04-27
published: true
tags: [computer-science, theory, en, Updated]
---

> Kleeneliness is next to Gödeliness 

   Let us assume that the following statement applies:

* A CFG can be reduced to Greibach normal form.

We construct the PDA $M$ equivalent to the CFG $G$ transformed to Greibach normal form as follows:

1. $Q = \{q\}$
2. $\Sigma = T$
3. $\Gamma = N$
4. $Z = S$
5. $\langle q, \gamma \rangle \in \delta(q, \sigma, X)$ iff $X \to \sigma \gamma$ is a production of $G$

In practice, once we have transformed our grammar $G$ into Greibach normal form and called $G' = \langle T, N, P, S \rangle$ the latter, the equivalent stack automaton $M$ is:
$M = \langle \{q\}, T, N, \delta, q, S \rangle$ 

where $\delta$ is constructed transition by transition starting with each individual production according to the rule in step 5. i.e. for each production that will necessarily have the form $X \to \sigma \gamma$, we construct a transition $\langle q, \gamma \rangle \in \delta(q, \sigma, X)$ (i.e., $(q, \sigma, X) \to \langle q, \gamma \rangle$).

It follows that:

$$ \forall u \in \Sigma^*, S \Rightarrow^* u \iff \langle q, u, S \rangle \vdash^* \langle q, \epsilon, \epsilon \rangle $$[^footnote1]

[^footnote1]: It can be proved by induction.
