---
layout: post
lang: en
title: "The Design Pattern Strategy"
excerpt: "Minimal example code on the Strategy pattern"
modified: 2016-01-02
category: Programming
comments: true
share: false
updated: true
published: true
---

The Strategy pattern is one of the patterns I use most frequently. 
You can find an example project on GitHub at this address:

[**https://github.com/mcaliman/JavaPatternsCollection**](https://github.com/mcaliman/JavaPatternsCollection)
To illustrate how the pattern works, I made three sorts using the classic method of sorting
a list. This is done using a comparator, which uses both lambdas and streams.
Lambdas and streams do not make the sorting process more efficient (although they do not exclude it), their
role is to make the algorithm more compact and readable.
Certainly, the use of lambdas and streams make us developers more performant in the coding process
and this is not insignificant.
