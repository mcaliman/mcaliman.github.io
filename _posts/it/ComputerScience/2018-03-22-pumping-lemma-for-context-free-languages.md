---
layout: post
lang: it
title:  "Il pumping lemma per i linguaggi CF"
excerpt: "La versione del pumping lemma per i linguaggi context-free"
category: "Computer Science"
date:   2018-03-22 22:45:33
tags: [Italian,"Programming Languages","Computer Science"]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 


# Lemma 
`Dato` **L** un linguaggio CF `allora` &exist; n&isin;**N**, 
n costante `tale che` &forall; z&isin;L, \|z\|&ge;n per cui possiamo decomporre z=uvwxy `in modo che`
1. \|vwx\|&le;n
2. \|vx\|>0
3. &forall; i&ge;0 si ha che uv&#8305;wx&#8305;y&isin;L

# Uso
Si usa il lemma per provare che un linguaggio **non è** CF, per farlo occorre mostrare, che fissato un n
arbitrario, &exist; z&isin;L \|z\|&ge;n ma `tale che` `per ogni` possibile decomposizione come uvwxy, con 1. e 2. vincoli uv&#8305;wx&#8305;y&notin;L per qualche i&ge;0

