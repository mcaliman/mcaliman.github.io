---
layout: post
lang: en
title:  "Indexed structures"
excerpt: ""
category: Programming
date:   2014-09-28 22:45:33
tags: ["Data Structures"]
comments: true
share: false
revision: 0
---
Indexed structures are collections of numbered cells that may contain elements of a predetermined type. We will assume that in an array of size h the indices can range from 0 to h-1 or 1 to h.

Normally, two properties are defined, one commonly called strong and the other weak.

strong property: the cell indices of an array are consecutive numbers.
weak property: no new cells can be added to an array.

A possible implementation of an ordered array is shown below (and is an implementation of the dictionary data type)

class: ArrayOrdered implements Dictionary
data: an array S of size n containing n pairs (elem,key) S(n) = Tetagrande(n)

In practice, we do not use index i (numeric) as the key but as the cell in which to store the pair (e,k)

Let us now look at commonly defined operations on a dictionary

insert(elem e,key k) T(n) = O(n)

1. Reallocates S by increasing the size n by 1 (i.e. |S| = |S| + 1 and n = n+1)
2. Search for t.c. k<=S[i].key (it is ordered!)
3. Place S[j]<-S[j-1] for every j in [n-1,i+1] and place S[i]<-(e,k)

In practice, knowing that it is sorted, we simply reallocate the array by one cell, moving the contents of cells i to n to the new positions i+1 to n+1.


Having identified the position to be occupied by the pair (e,k) to be inserted, I move the cells from i+1 so as to free cell i and maintain the sorting.

delete(key k) T(n)=O(n)

1. I find the index i of the pair with key k in S i.e. I find t.c. S[i] = (e,k) where k is the given one. In other words I find S[i].key=k
2. Pose S[j]<-S[j+1] for each j, j in i,...,n-2
3. Reallocates S by decreasing the size by 1 (I have removed an element and can delete the last cell after I have shifted the elements

search(key k) -> elem T(n) = O(log n)

1. Runs the binary search algorithm on S to check whether S contains k
2. If it finds returns element otherwise null

In the Java language the natural implementation is provided by arrays, which can also contain objects beyond the basic types, so even pairs or tuples of the type `<K,V>` i.e. pairs (key,value)

In addition to arrays, the basic structure of the language, we can of course use lists, e.g. ArrayLists, which adopt precisely this type of philosophy plus a few tricks to make the implementation more efficient.