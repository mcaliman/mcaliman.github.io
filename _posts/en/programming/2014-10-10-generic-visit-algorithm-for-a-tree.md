---
layout: post
title:  "Generic visit algorithm for a tree"
excerpt: ""
category: Programming
date:   2014-10-10 22:45:33
comments: true
share: false
published: true
---

One of the most common tasks to be performed on a tree is to perform a visit to it, i.e. to review each of its nodes. By the natural language term 'reviewing' we mean 'applying some function' to the node under examination, even if it is simply printing on the screen that it has been visited.

The most generic possible visiting procedure can be seen in the pseudocode algorithm below

```
proc generic_tree_visit(node r)
   S ← { r }
   while S ≠ ∅ do
       u ← get node from S
       visit(u)
       S ← S ∪ { children of u}
   od
end proc
```

the algorithm keeps instant by instant in `S` the nodes representing the branch points left over and from which the visit must continue, we say that these nodes are open and form a fringe of the tree, a node becomes closed when it is removed from `S`.

Concerning costs in terms of space occupied in memory and time for execution we have the following theorem.

Theorem: The generic visiting algorithm applied to the root of a tree with n n nodes terminates in `O(n)` iterations, and the space used is `O(n)`.

This is self-evident in itself and is formally provable. Demonstrating it is beyond the scope of this post, which is only to lay the foundations for subsequent posts which explore the theoretical and practical aspects in more detail.