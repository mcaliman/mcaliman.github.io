---
layout: post
lang: it
title: Il design pattern Strategy
excerpt: "Codice di esempio minimale sul pattern Strategy"
modified: 2016-01-02
categories: programming
tags: [Java,jdk8,Design Pattern,Strategy Pattern]
comments: true
share: true
updated: true
---

Il pattern Strategy è uno dei pattern che uso più frequentemente. 
Potete trovare un progetto di esempio su github a questo indirizzo:
[**https://github.com/mcaliman/StrategyPatternJavaExamples**](https://github.com/mcaliman/StrategyPatternJavaExamples)
Per illustrare il funzionamento del pattern, ho realizzatre tre sort che utilizzano il metodo classico di ordinamento
di una `List`. Questo avviene tramite comparatore, il quale utilizza sia le lambda che gli stream.
Lambda e stream non rendono più performante il processo di ordinamento (anche se non lo escludono), il loro
ruolo è quello di rendere più compatto e leggibile l'algoritmo.
Sicuramente l'uso delle lambda e degli stream rendono noi sviluppatori più performanti nel processo di codifica
e questo non è un dato trascurabile.
