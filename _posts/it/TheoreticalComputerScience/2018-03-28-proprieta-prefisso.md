---
layout: post
lang: it
title:  "Proprietà del prefisso"
excerpt: "PDA e problemi di riconoscimento di linguaggi con caratteristiche particolari."
category: "Theoretical Computer Science"
date:   2018-03-28 22:45:33
tags: [PDA,CF,CFG]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 

Un linguaggio L [^footnote1] `non` può essere riconosciuto deterministicamente per pila vuota [^footnote2] se esistono due stringhe distinte di L tali che una è prefisso dell'altra. 

In termini più formali se &exist; u,v &isin; L : u è prefisso di v dove il concetto, di prefisso può essere ulteriormente formalizzato come v = ux dove x è una stringa dell'alfabeto a cui appartengono entrambe le stringhe u e v.

L'utilità di questa proprietà è evidente in quanto ci permette di capire se stiamo perdendo del tempo cercando di sviluppare un parser elementare utilizzando un PDA per un dato linguaggio che contiene stringhe del tipo aabb e aabbbb, l'automa si fermerà, per pila vuota, appena consumato il prefisso.

[^footnote1]: La dimostrazione sarà riportata in un prossimo post.
[^footnote2]: Quindi da un automa a pila (PDA)