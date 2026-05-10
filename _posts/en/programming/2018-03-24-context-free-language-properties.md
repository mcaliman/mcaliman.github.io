---
layout: post
title:  "Context-Free Languages Properties"
excerpt: "Context-free language properties and considerations"
category: Programming
date:   2018-03-24
comments: true
share: false
modified: 2026-04-27
published: true
tags: [computer-science, theory, en, Updated, peer-review-2026-05-10-2]
permalink: /programming/context-free-languages-properties/
---
   
> Kleeneliness is next to Gödeliness 

The programming languages we use are not actually CFs, strange to say, since we describe their syntax by means of CFGs. While this remains true, they are not strictly CFs because a CFG is not enough to describe them; we must also specify contextual constraints. This is what we do when we specify constraints on how the declaration of a function must be before it can be called (to simplify, considerably: number, type and order of parameters), precedence of operators, rules describing how the name of a variable must be constructed, and so on.

# Properties of CF languages

1. They are closed with respect to:
    1. Union
    2. Concatenation
    3. Kleene's Closure
2. They are **not** closed with respect to the operations of:
    1. Intersection
    2. Complement

For CF languages, the membership problem is decidable. In fact, given a CF language $L$, there exists a CFG $G$ in Greibach normal form that generates it. Then, given a string $u$, if it is generated, it is done in $\vert u \vert$ steps.

The above translates into the fact that to see if $u$ belongs to $L$, it is sufficient to generate all the derivations in $\vert u \vert$ steps.

The above algorithm has exponential complexity, although more efficient algorithms of complexity $O(\vert u \vert^3)$ and $O(\vert u \vert^{2.8})$ exist.

The value of these algorithms is theoretical in that parsing in practice is performed for particular classes of grammars for which it is feasible in a more efficient manner (for regular languages, the time is linear).

Revision: 2026-04-25
