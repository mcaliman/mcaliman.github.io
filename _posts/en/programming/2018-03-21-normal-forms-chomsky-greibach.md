---
layout: post
title:  "CFG in Chomsky and Greibach's Normal Form"
excerpt: "Chomsky and Greibach's context-free grammar in normal form, how they are made and why they are interesting"
category: Programming
date:   2018-03-21
comments: true
share: false
modified: 2026-04-27
published: true
tags: [computer-science, theory, en, Updated]
permalink: /programming/cfg-chomsky-greibachs-normal/
---

> Kleeneliness is next to Gödeliness 

# Chomsky Normal Form

All productions are of the form $A \to BC$ or $A \to \sigma$ (where $\sigma \in T$ and $A, B, C \in N$).

Knowing them is important for various reasons; for instance, they are used in the proof of correctness of the Pumping Lemma for CF languages.

# Greibach Normal Form

All productions are of the form $A \to \sigma B\_1 \dots B\_n$ (where $\sigma \in T$ and $A, B\_1, \dots, B\_n \in N$, $n \ge 0$).

One of the reasons to know them is that they are used in algorithms to switch from a CFG to a Pushdown Automaton (PDA).

If you want to learn about Noam Chomsky and Sheila Greibach, you can go to:

1. [https://en.wikipedia.org/wiki/Noam_Chomsky](https://en.wikipedia.org/wiki/Noam_Chomsky) 
2. [https://en.wikipedia.org/wiki/Sheila_Greibach](https://en.wikipedia.org/wiki/Sheila_Greibach)

Revision: 2026-04-25
