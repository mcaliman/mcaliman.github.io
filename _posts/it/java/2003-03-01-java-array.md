--- 
layout: post
title:  "Gli Array in Java"
excerpt: "Gli array sono disponibili nella maggior parte dei linguaggi di programmazione perché realizzano 
la più semplice organizzazione di strutture dati complesse"
category: "Java"
date:   2003-03-01
permalink: /java/array/
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, it]
---

Gli array sono disponibili nella maggior parte dei linguaggi di programmazione perché realizzano 
la più semplice organizzazione di strutture dati complesse.

# Dichiarazione e allocazione

Iniziamo con alcune definizioni un po' più formali ma che saranno utili per fissare i concetti essenziali.

Definizione 
Un array è una struttura dati che permette di rappresentare sequenze di elementi dello stesso tipo. 
Gli elementi che compongono un array possono essere individuati specificando la loro posizione.

```java
T[] var = new T[n];
```

Definisce un array di nome `var` di tipo `T` composto da `n` elementi. Gli elementi dell'array sono:

```java
var[0], var[1], ..., var[n-1]
```

`n` è chiamato anche dimensione o lunghezza dell'array;

è possibile anche l'inizializzazione degli elementi contemporaneamente alla definizione

```java
T[] var = {values_0,value_1, ... ,value_n}
```

Quindi, abbiamo i valori dei singoli elementi che equivalgono a

```java
var[0] = value_0 ;var[1] = value_1 ;...var[n] = value_n ;
```

Altrimenti, la dichiarazione può avvenire in 2 fasi

```java
T[] var; var = new T[n] ;
```
oppure

```java
var = new T[] { value_0,value_1, ..., value_n }
```

ogni elemento dell'array può essere usato allo stesso modo di una variabile

dato l'array var { value_0,value_1, ... , value_n }

```java
var[0] = value_0 ; var[1] = value_1 ;
```

Posso modificare il secondo elemento dell'array, cioè var[1] con il valore new_value_1 con l'istruzione

```java
var[1] = new_value_1 ;
```

trasformando var in { value_0,new_value_1, ... , value_n }

Posso assegnare ad una variabile x di tipo compatibile con T l'i-esimo valore di var semplicemente così

```java
T x = var[i] ;
```

in questo modo x assume l'i-esimo valore dell'array var, ovviamente i deve avere un valore 
compreso tra 0 e var.length - 1 che rappresenta la lunghezza dell'array var.

# Array multidimensionali

Gli array visti finora sono monodimensionali, cioè sono sequenze lineari di dati 
omogenei che possono essere associate a un modello vettoriale. In realtà, possiamo avere anche array multidimensionali in cui ogni 
elemento è identificato non da un singolo indice ma da un numero maggiore di indici.

per esempio

```java
T[][] var = new T[n][m];
```

le considerazioni fatte sopra per i tipi monodimensionali sono valide, 
per inizializzare il valore della posizione o coordinate i,j posso scrivere

```java
var[i][j] = a_value ;
```

Per un'inizializzazione rapida (smart), però, posso anche fare

```java
T[][] var = { {value_0, value_1, ... , value_n} , { value_0, value_1, ... , value_m } }
```
