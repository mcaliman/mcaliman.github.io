---
layout: post
lang: en
title:  "Context-free languages properties"
excerpt: "Context-free language properties and considerations"
category: Programming
date:   2018-03-24 22:45:33
tags: ["Context-Free Grammar"]
comments: true
share: false
published: true
---
   
> Kleeneliness is next to Gödeliness 

The programming languages we use are not actually CFs, strange to say, since we describe their syntax by means of CFGs, and this is and remains true, they are not CFs because a CFG is not enough to describe them, we must also specify contextual constraints, and this is what we do when we specify constraints on how the declaration of a function must be before it can be called (to simplify, considerably, number, type and order of parameters), precedence of operators, rules describing how the name of a variable must be constructed, and so on.
# Properties of CF languages
1. They are closed with respect to
    1. Union
    2. Concatenation
    3. Kleene's Closure
2. They are not closed with respect to the operations of
    1. Intersection
    2. Complement

For CF languages, the membership problem is decidable, in fact given a CF language L there exists a CFG G in Greibach normal form that generates it then given u a string, if it is generated, it is in \|u\| steps.

The above translates into the fact that to see if u belongs to L it is sufficient to generate all the derivations in \|u\| steps.

The above algorithm has exponential complexity, although more efficient algorithms of complexity O(\|u\|^3) and O(\|u\|^2.8) exist.

The value of these algorithms is theoretical in that parsing in practice is performed for particular classes of grammars for which it is feasible in a more efficient manner (for regular languages, the time is linear)