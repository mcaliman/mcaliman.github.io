---
layout: post
lang: en
title:  "Pumping lemma for Context Free languages"
excerpt: "The pumping lemma version for context-free languages"
category: "Theoretical Computer Science"
date:   2018-03-22 22:45:33
tags: ["Context-Free Grammar","Pumping Lemma"]
comments: true
share: true
revision: 0
---

> Kleeneliness is next to Gödeliness 
   
# Lemma 
Given **L** a CF language `then` &exist; n&isin;**N**, 
n constant `so that` &forall; z&isin;L, \|z\|&ge;n so that we can decompose z=uvwxy `so that`
1 \|vwx\|&le;n
2 \|vx\|>0
3 &forall; i&ge;0 we have that uv&#8305;wx&#8305;y&isin;L

# Usage
One uses the lemma to prove that a language **is not** CF, to do so one must show, that fixed an arbitrary n
arbitrary, &exist; z&#8305;wx&#8305;y&notin;L \ \|z\&ge;n but `so that` for every possible decomposition such as uvwxy, with 1. and 2. constraints uv&#8305;wx&#8305;y&notin;L for some i&ge;0