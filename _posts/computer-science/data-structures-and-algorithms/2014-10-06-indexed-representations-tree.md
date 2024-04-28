---
layout: post
lang: en
title:  "Trees indexed representations"
excerpt: ""
category: "Data Structures And Algorithms"
date:   2014-10-06 22:45:33
tags: ["Computer Science"]
comments: true
share:  false
revision: 0
---

Indexed representations based on parent vector arrays and positional vectors both require `O(n)` space.
Parent vector
=============
The simplest
Let `T = (N,A)` be a tree with `n` nodes numbered `0` to `n-1` a parent vector is a vector `P` of size `n` whose cells contain pairs `(info,parent)` for each index `v` belonging to `[0,n-1]`.

`p[v].info` is the information content of the `v` node
`p[v].parent = u` iff there is an arc `(u,v)` in `A`
If instead `v` is the root `p[v].parent=null` using the vector of fathers from each node it is possible to trace back in time `O(1)` to its father while finding a child requires scanning the array in time `O(n)`


Positional vector
===================
In the special case of complete d-array trees with `d>=2`, an indexed representation is possible where each node has a fixed position.

Let `T=(N,A)` d-ary tree, `n` nodes numerable from `1` to `n`
`p` vector of size `n` such that `p[v]` contains the information associated with node `v`, and such that the information associated with the i-th child of `v` is at position `p[d*v+i] `for `i` in `[0,(d-1)]`.

For simplicity the `0` position in the array is not used the space required for `n` nodes is therefore `n+1`

* from each `v` node it is possible to trace back in time `O(1)` either to its parent (which has index `floor` `ceil` `v/d` if `v` other than root) or to any of its children
* for each `v` node, the `father(v)` operation can then be done in constant time while the `children(v)` operation takes time `O(degree(v))`