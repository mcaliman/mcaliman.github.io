---
layout: post
title:  "Pumping Lemma for Context-Free Languages"
excerpt: "The pumping lemma version for context-free languages"
category: Programming
date:   2018-03-22
comments: true
share: false
modified: 2026-04-27
published: true
tags: [computer-science, theory, en, Updated, peer-review-2026-05-10-2]
permalink: /programming/pumping-lemma-context-free-languages/
---

> Kleeneliness is next to Gödeliness 
   
# Lemma 

Given $L$ a CF language, then $\exists n \in \mathbb{N}$, where $n$ is a constant such that $\forall z \in L$, $\vert z \vert \ge n$, we can decompose $z = uvwxy$ such that:

1. $\vert vwx \vert \le n$
2. $\vert vx \vert > 0$
3. $\forall i \ge 0$, we have that $uv^iwx^iy \in L$

# Usage

One uses the lemma to prove that a language **is not** CF. To do so, one must show that for an arbitrary $n$, there exists $z \in L$ with $\vert z \vert \ge n$ such that for every possible decomposition $uvwxy$ satisfying constraints 1 and 2, $uv^iwx^iy \notin L$ for some $i \ge 0$.

Revision: 2026-04-25
