---
layout: post
lang: it
title:  "Turing Machine"
excerpt: "Concetti e informazioni di base sulle Macchine di Turing, linguaggio accettato, linguaggi ricorsivamente enumerabili e ricorsivi"
category: computer-science
date:   2018-04-07 22:45:33
modified: 2019-05-12 22:45:33
tags: [Turing Machine,Linguaggi ricorsivamente enumerabili,Linguaggi ricorsivi]
comments: true
share: true
updated: true
---

> Kleeneliness is next to Gödeliness 

# Macchine di Turing deterministiche (DTM)

Una Macchina di Turing (d'ora innanzi abbreviata con `TM`) è un t-upa di 6 elementi &rang;Q,&Sigma;,&Gamma;,q<sub>0</sub>,B,F&lang;  dove
* Q insieme di `stati` (finito)
* &Sigma; alfabeto di `input`
* &Gamma; alfabeto del `nastro` &Sigma;&sube;&Gamma;
* &delta;:Q&#x2A2F;&Gamma;&rarr;Q&#x2A2F;&Gamma;&#x2A2F;{L,R} funzione parziale detta `funzione di transizione`
* q<sub>0</sub>&isin;Q `stato iniziale`
* B&isin;(&Gamma;\&Sigma;) `simbolo speciale` (Blank)
* F&sube;Q insieme `stati finali`

&delta;(q,X)=&rang;q',Y,D&lang; dove q' è prossimo stato, Y sovrascrive X e D&isin;{L,R}
si può dare una rappresentazione tabellare tramite una `matrice di transizione` equivalente alla lista delle 5-uple &rang;q,X,q',Y,D&lang; 
per definire il funzionamento si ricorre alla `descrizione istantanea` (o `configurazione`) di una TM tramite la
tripla &rho;=&alpha;q&beta; dove

* &alpha;&isin;&Gamma;* simboli a sinistra della testina
* &beta;&isin;&Gamma;*  simboli a destra della testina
* q stato della testina

se &beta;&ne;&epsilon; il simbolo puntato dalla testina è il primo simbolo di &beta;. altrimenti la testina punta a B (blank)

Singolo passo di esecuzione:
Dato M=&rang;Q,&Sigma;,&Gamma;,q<sub>0</sub>,B,F&lang; una TM def la relazione &rho;&#8866;<sub>M</sub>&rho;'
indotta dalla funzione di transizione &delta; definita per casi nel seguente modo.
Dati &alpha;,&beta;&isin;&Gamma;* e x,y,z&isin;&Gamma; si ha

* &alpha;qX&beta;&#8866;<sub>M</sub> &alpha;Yq'&beta;     se &delta;(q,X)=&rang;q',Y,R&lang;
* &alpha;q&#8866;<sub>M</sub> &alpha;Yq'                  se &delta;(q,B)=&rang;q',Y,R&lang;
* &alpha;ZqX&beta;&#8866;<sub>M</sub> &alpha;q'ZY&beta;   se &delta;(q,X)=&rang;q',Y,L&lang;
* qX&beta; &#8866;<sub>M</sub> q'BY&beta;                 se &delta;(q,X)=&rang;q',Y,L&lang;

La `relazione di raggiungibilità` &#8866;<sub>M</sub>* tra configurazioni è definita come la chiusura riflessiva e transitiva della relazione &#8866;<sub>M</sub>
ossia &rho;&#8866;<sub>M</sub>*q' &hArr; vi è una sequenza &rho;<sub>0</sub>,...,&rho;<sub>n</sub>&ge;0 t.c.
&rho;<sub>i</sub>&#8866;<sub>M</sub>&rho;<sub>i-1</sub> per i&isin;[1,n-1] , &rho;<sub>0</sub>=&rho;<sub>i</sub>,&rho;<sub>n</sub>=&rho;'

# Linguaggio accettato da una TM
Dato M=&rang;Q,&Sigma;,&Gamma;,q<sub>0</sub>,B,F&lang; una TM, il linguaggio L(M)&sube;&Sigma;* accettato da M è definito come
L(M)={u&isin;&Sigma;* | q<sub>0</sub>u&#8866;&alpha;q&beta;,q&isin;F}
sulle stringhe non accettate la computazione potrebbe non terminare.
Alternativa senza stati finali è dove la stringa è accettata &hArr; la computazione corrispondente termina.

# Linguaggi ricorsivamente enumerabili (r.e)
Un linguaggio è r.e. se è accettato da una TM, su qualche stringa potrebbe accadere (se non nel linguaggio) che la TM non termini.

# Linguaggi ricorsivi
Un linguaggio è ricorsivo se è accettato da una TM che termina su ogni input