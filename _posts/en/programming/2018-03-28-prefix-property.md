---
layout: post
title:  "Prefix Property"
excerpt: "Pushdown Automata (PDA) and language recognition problems with special features"
category: Programming
date:   2018-03-28 22:45:33
comments: true
share: false
modified: 2024-07-11
published: true
---
   
> Kleeneliness is next to Gödeliness
 
A language L [^footnote1] `not` can be deterministically recognised by empty stack [^footnote2] if there exist two distinct strings of L such that one is prefixed by the other. 

In more formal terms if &exist; u,v &isin; L : u is prefixed by v where the concept, of prefix can be further formalised as v = ux where x is a string of the alphabet to which both strings u and v belong.

The usefulness of this property is obvious as it allows us to realise that if we are wasting time trying to develop an elementary parser using a PDA for a given language that contains strings of the type aabb and aabbbb, the automaton will stop, by empty stack, as soon as the prefix is consumed.

[^footnote1]: This will be demonstrated in a future post.
[^footnote2]: So from a Pushdown Automata (PDA)