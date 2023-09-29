---
layout: post
lang: it
title:  "Proprietà dei linguaggi CF"
excerpt: "Proprietà e considerazioni sui linguaggi context-free"
category: theoretical-computer-science
date:   2018-03-24 22:45:33
tags: [Italian,"Programming Languages","Computer Science"]
comments: true
share: true
---
   
> Kleeneliness is next to Gödeliness 

I linguaggi di programmazione che utilizziamo in realtà non sono CF, strano a dirsi,dato che descriviamo la loro sintassi tramite delle CFG, e ciò è e resta vero, non sono CF in quanto non è sufficiente una CFG per descriverli, dobbiamo specificare anche dei vincoli contestuali, e ciò è quanto facciamo quando specifichiamo dei vincoli su come deve essere la dichiarazione di una funziona prima di poterne effettuare la chiamata (per semplificare, notevolmente, numero, tipo e ordine dei parametri), precedenza degli operatori, regole che descrivono come deve essere costruito il nome di una variabile, e così via.


# Proprietà dei linguaggi CF
1. Sono chiusi rispetto alle operazioni di
    1. Unione
    2. Concatenazione
    3. Chiusura di Kleene
2. Non sono chiusi invece rispetto alle operazioni di
    1. Intersezione
    2. Complemento

Per i linguaggi CF, il problema di appartenenza risula decidibile, infatti dato un linguaggio CF L esiste una CFG G in forma normale di Greibach che lo genera allora data u una stringa, se questa è generata, lo è in \|u\| passi.

Quanto riportato sopra, si traduce nel fatto che, per vedere se u appartiene ad L basta generare tutte le derivazioni in \|u\| passi.

L'algoritmo di cui sopra ha complessità esponenziale, anche se esistono algoritmi più efficienti di complessita O(\|u\|^3) e O(\|u\|^2.8)

Il valore di questi algoritmi è teorico in quando il parsing nella pratica è effettuato per particolari classi di grammatiche per cui è fattibile in modo più efficiente (per i linguaggi regolari il tempo è lineare)
