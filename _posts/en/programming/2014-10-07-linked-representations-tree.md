---
layout: post
lang: en
title:  "Tree Linked List"
excerpt: ""
category: Programming
date:   2014-10-07 22:45:33
comments: true
share: false
published: true
---
Continuing with the discussion of trees, representations based on linked structures are normally preferred 

1. more flexible than idicised ones
2. more efficient structure modifications

There are three main ones

Pointer to children
==================
If each node has at most d it is possible to keep in each node a pointer to each of the possible children
In the case from 2 if a child is absent we place the pointer to Null Required space O(n*d) which for d constant is O(n)

Child list
===========
If the maximum number of children is not known a priori it is possible to associate each node with a list of pointers to its children this list can in turn be represented in a linked indexed manner, required space O(n) regardless of the number of children of a node

First child next sibling
================================
As a variant of the previous one without having to keep the additional data structure (the child list)
For each node a pointer to the first child (set to null if there are no children) and a pointer to the next sibling

Required space O(n)
To scan all the children of a node simply go down to the first child and then scan all subsequent siblings by jumping from sibling to sibling.