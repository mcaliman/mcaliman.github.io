---
layout: post
title:  "Prefix Property"
excerpt: "Pushdown Automata (PDA) and language recognition problems with special features"
category: Programming
date:   2018-03-28
comments: true
share: false
modified: 2026-04-27
published: true
tags: [computer-science, theory, en, Updated]
permalink: /programming/prefix-property/
---
   
> Kleeneliness is next to Gödeliness

A language $L$ [^footnote1] **cannot** be deterministically recognized by empty stack [^footnote2] if there exist two distinct strings of $L$ such that one is a prefix of the other. 

In more formal terms: if $\exists u, v \in L, u \neq v$, such that $v$ is prefixed with $u$. The concept of a prefix can be further formalized as $v = ux$, where $x$ is a non-empty string ($x \neq \epsilon$) of the alphabet to which both strings $u$ and $v$ belong.

The usefulness of this property is obvious as it helps us realize that if we are trying to develop an elementary parser using a PDA for a given language that contains strings such as `aabb` and `aabbbb`, the automaton will stop (by empty stack) as soon as the prefix is consumed.

[^footnote1]: This will be demonstrated in a future post.
[^footnote2]: So from a Deterministic Pushdown Automaton (DPDA).


