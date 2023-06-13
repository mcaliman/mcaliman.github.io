---
layout: post
lang: it
title:  "Alberi rappresentazioni collegate"
excerpt: ""
category: ComputerScience
date:   2014-10-07 22:45:33
tags: [Italian,Data Structures,Tree]
comments: true
share: true
---

Proseguendo nella trattazione degli alberi normalmente si preferiscono le rappresentazioni basate su strutture collegate 
1. più flessibile di quelle idicizzate
2. modifiche alla struttura più efficienti

Le principali sono tre

Puntatore ai figli
==================
Se ogni nodo ha al più grado d è possibile mantenere in ogni nodo un puntatore a ciscuno dei possibili figli
Nel caso da 2 se un figlio è assente si pone il puntatore a Null Spazio richiesto O(n*d) che per d costante è O(n)

Lista figli
===========
Se il numero massimo di figli non è noto a priori è possibile associare ad ogni nodo una lista di puntatori ai suoi figli questa lista può essere a sua volta rappresentata in maniera indicizzata collegata, spazio richiesto O(n) indipendentemente dal numero di figli di un nodo

Primo figlio fratello successivo
================================
Come variante alla precedente senza dover tenere la struttura dati addizionale (la lista figli)
Per ogni nodo un puntatore al primo figlio (posto a null se non ci sono figli) e un puntatore al fratello successivo

Spazio richiesto O(n)
Per scandire tutti i figli di un nodo basta scendere sul primo figlio e poi scandire tutti i fratelli successivi saltando di fratello in fratello.
