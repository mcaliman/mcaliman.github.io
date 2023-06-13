---
layout: post
lang: it
title:  "Alfabeti, simboli, stringhe e linguaggi."
excerpt: "Cosa sono gli alfabeti, simboli e stringhe dal punto di vista dell'informatica teorica."
category: ComputerScience
date:   2018-03-20 22:45:33
tags: [Theoretical Computer Science]
comments: true
share: true
---

> Kleeneliness is next to Gödeliness 

Cosa si intende con il termine alfabeto in informatica teorica? 
Semplicemente un insieme di oggetti che chiamiamo simboli. L'insieme deve essere finito e non vuoto.
Per indicare un alfabeto comunemente si utilizza la lettere greca maiuscola sigma &Sigma;.
In altri termini, cominciando ad utilizzare qualche formalismo matematico, abbiamo che &Sigma; &ne; &empty;
Un esempio di alfabeto per i numeri binari è  &Sigma; = {0,1} , per indicare dei simboli generici si utilizza comunemente la lettera greca minuscola sigma &sigma; con un eventuale indice numerico.
Potremmo quindi rappresentare un alfabeto di 3 simboli con  &Sigma; = {&sigma;0,&sigma;1,&sigma;2} e dire che &sigma;0 è a &sigma;1 è b e &sigma;1 è c, quindi che &Sigma; = {a,b,c}.

Possiamo scrivere che &sigma;&isin; &Sigma; per indicare che un dato simbolo &sigma; appartiene all'alfabeto &Sigma;. Gli alfabeti sono insieme quindi possiamo utilizzare tutta matematica che afferisce all'insiemistica, semplificandoci la vita.

Cosa sono quindi le stringhe? Una successione di simboli? Informalmente possiamo dire che effettivamente le stringhe sono una successione di simboli presi da un dato alfabeto, per esempio la stringa '010' che rappresenta il numero binario 010 è una stringa sull'alfabeto 
&Sigma; = {0,1}. 

Per indicare delle generiche stringhe si utilizzano di solito le lettere latine minuscole u,v,w. 

Dal punto di vista matematico una string u su un alfabeto &Sigma; è una funzione totale con dominio [1,n] e codominio &Sigma; dato un certo n, dove n è poi la lunghezza della nostra stringa u.
Quindi, u:[1,n]->&Sigma; e per esempio nel caso di u = '010' abbiamo che u(1)=0,u(2)=1,u(3)=0 dove u(i) è il simbolo alla posizione i(-esima) della stringa u.

Decisamente familiare non trovate? Se pensiamo ad array di caratteri, u è il nostro array che contiene una stringa e l'indice identifica il simbolo o carattere che ci interessa. Questo deve ricordarci che l'informatica è matematica e quanto quest'ultima sia importante.

Torando al concetto di stringa, ne esista uno speciale, il cui significato non apparrà subito chiaro ne di qualche utilità, ma che rivestirà un ruolo cruciale in seguito, il suo nome è stringa vuolta e comunemente nei testi è rappresentata con la lettera greca minuscola epsilon &epsilon; e talvolta con la lettera greca maiuscola lambda &Lambda;. La sua caratteristica è di avere lunghezza zero, ovvero se u è una stringa e in particolare è la stringa vuota, abbiamo \|u\| = 0 dove le sbarre verticali (le pipe) ai lati della lettera indicano la lunghezza dell'argomento, quindi \|&epsilon;\|=0 o se preferite l'altra rappresentazione \|&Lambda;\|=0.

Se volessimo rappresentare tutte le stringhe possibili su un dato alfabeto &Sigma; possiamo utilizzare la rappresentazione &Sigma;* dove l'asterisco è posizionato alla stessa altezza di un esponente. &Sigma;* è molto di più di una semplice rappresentazione, rappresenta un'operazione. Per ora ci accontentiamo di sapere che se &Sigma; = {0,1} che è per definione un insieme finito, allora &Sigma;* è un insieme con un numero infinito di elementi, ovvero tutte le stringhe che posso costruire con i simboli dell'alfabeto &Sigma; quindi &Sigma;* = {0,1,01,11,10,001,00001,...} dove i tre puntini ... indicano che si può proseguire all'infinito generando stringhe di lunghezza arbitraria.

Il concetto di &Sigma;* o dell'insieme dele stringhe su &Sigma; ci permette di fare un fare un ulteriore passo in avanti e poter definire qualcosa il cui concetto ci è più famigliare nella vita professionale (di programmatore) di tutti i giorni, ovvero il concetto di linguaggio su un certo alfabeto, comunemente un linguaggio si indica con la lettera maiuscola L, e contrariamente a quando succede per &Sigma;* , L non è un insieme infinito, in quando è un sottoinsieme di 
&Sigma; * , formalmente L &sub; &Sigma;*, riferendoci alla esempio visto sopra per i numeri binari potremmo definire un linguaggio per i numeri binari di stringhe di lunghezza pari a 2 e in questo caso il nostro L sarebbe il sottoinsieme di &Sigma; * composto dalle stringhe {00,01,10,11}.

Per ragioni squisitamente matematiche abbiamo che sia l'insieme vuoto che l'insieme costituito dal solo elemento della stringa vuota (quindi il singoletto) sono linguaggi su qualsiasi alfabeto.

Un aspetto interessante è la possibilità di modellare come oggetti matematici anche le operazioni che possiamo comunemente fare sulle stringe, come ad esempio la concatenazione.
Oltre alle operazioni che possiamo fare sulle stringhe esistono analoge operazioni sui linguaggi,queste, di particolare interesse sono le operazioni di chiusura o chiusure, la chiusura positiva rappresentata con un segno + all'esponente L+ e la chiusura di Kleene rappresentata con il simbolo di asterisco L*. Informamente la prima è l'unione di tutti i linguaggi di lunghezza da 1 a n, la seconda di tutti i linguaggi di lunghezza da 0 a n, quindi comprende anche la stringa di lunghezza 0.

Se volete approndire qualcosa Stephen Cole Kleene potete andare su
1. [https://it.wikipedia.org/wiki/Stephen_Kleene](https://it.wikipedia.org/wiki/Stephen_Kleene)
2. [https://en.wikipedia.org/wiki/Stephen_Cole_Kleene](https://en.wikipedia.org/wiki/Stephen_Cole_Kleene)
