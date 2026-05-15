---
layout: post
title:  "Tree Linked List"
excerpt: "Linked list representations of tree data structures"
category: Programming
date:   2014-10-07
comments: true
share: false
modified: 2024-07-11
published: true
tags: [data-structures, algorithms, en]
permalink: /programming/tree-linked-list/
---
Continuing with the discussion of trees, representations based on linked structures are normally preferred 

1. more flexible than indexed ones.
2. more efficient structure modifications

There are three main ones

Pointer to children
==================
If each node has at most d it is possible to keep in each node a pointer to each of the possible children
In the case of d>=2, if a child is absent we set the pointer to null. Required space O(n*d), which for constant d is O(n).

Child list
===========
If the maximum number of children is not known a priori it is possible to associate each node with a list of pointers to its children this list can in turn be represented in a linked indexed manner, required space O(n) regardless of the number of children of a node

First child next sibling
================================
As a variant of the previous one without having to keep the additional data structure (the child list)
For each node a pointer to the first child (set to null if there are no children) and a pointer to the next sibling

Required space O(n)
To scan all the children of a node simply go down to the first child and then scan all subsequent siblings by jumping from sibling to sibling.
