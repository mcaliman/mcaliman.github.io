--- 
layout: post
title:  "Variabili Java e Assegnazione"
excerpt: "Variabili e comandi di assegnazione"
category: "Java"
date:   2003-01-02
permalink: /java/variables/
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial]
---

Diamo prima una definizione di variabile sufficientemente formale per i nostri scopi:
Definizione di variabile
Una variabile è una coppia formata da un nome, l'identificatore della variabile, e da un valore.

```java
T var = value ;
```

Le variabili in un programma memorizzano i dati che vengono elaborati durante l'esecuzione.
Durante l'esecuzione del programma i valori delle variabili vengono modificati (altrimenti sarebbero costanti).
Le variabili nascono, vivono e muoiono; è nostro compito prendercene cura, della loro vita, della loro visibilità (scope).
Trattiamole bene, diamo loro un nome di tutto rispetto per far sì che non ci odino e non ci facciano passare notti insonni.
Prima che una variabile possa essere utilizzata, deve essere dichiarata; la dichiarazione di una variabile è necessaria per riservare uno spazio di memoria in cui scrivere il suo valore. La dichiarazione definisce il tipo della variabile.

```java
T var;
```

dove `T` è il tipo, per esempio **int** , double e altri.
Si possono avere come tipi, tipi di base che non sono oggetti, o oggetti ( `T` diventa il nome di una classe). 
Di seguito alcuni esempi di dichiarazioni di variabili:

```java
int x ; double y ;
```

Posso anche assegnare un valore alla variabile:

```java
int x = 5 ; double y = 60 ;
```

Il tipo dei valori della variabile è usato per determinare quanta memoria riservare per la variabile, nel caso del tipo int si tratta di 4 byte.
Se dovessimo rappresentare graficamente le dichiarazioni

```java
int x = 0 ; 
int y = 2 ; 
int z ; 
```

x 0 y 2 z -
dove - indica che z è stata dichiarata ma non inizializzata, cioè non le è stato assegnato alcun valore.

Diamo ora una definizione di un comando di assegnazione sufficientemente formale per i nostri scopi.

Definizione di un comando di assegnazione

Un comando di assegnazione è un'istruzione il cui scopo è modificare il valore di una variabile.
Assegna anche un valore a una variabile che era stata solo dichiarata e perciò aveva un valore indefinito.

```java
var = expr;
```

Dove var è il nome della variabile ed expr un'espressione il cui tipo è compatibile con il tipo di var.
Il comando ha l'effetto di sostituire il valore della variabile il cui nome compare a sinistra (left-value) del segno di uguale 
con il valore che appare a destra.
Le espressioni sono entità sintattiche composte da nomi di variabili, costanti e segni di operazione 
per determinare l'ordine in cui gli operandi sono valutati.

```java
x = 12;
```

assegna alla variabile x il valore 12;

```java
y = (x+1)/2;
```
un esempio di espressione.

Abbiamo parlato finora dei tipi di variabili senza darne una definizione formale, corriamo ai ripari:

Definizione del Tipo di Dato 

Un tipo di dato consiste in un insieme di valori e un insieme di operazioni applicabili a tali valori.

Come accennato in precedenza, i tipi di dati in java appartengono a 2 categorie principali:

* Tipi primitivi: boolean, byte, short, int, long, float, double, char
* Tipi classe: String ecc.

La seguente tabella riporta per ogni tipo di valore le operazioni che possono essere applicate.

* boolean : false e true 
* byte : interi [-27,27-1] ( decimale, ottale , esadecimale) operazioni : + , - , *, / , %. 
* short : interi [-215, 215-1] ( decimale, ottale , esadecimale) operazioni: + , - , * , / , %. 
* int numeri naturali [-231,231-1] ( decimale, ottale , esadecimale) operazioni: + , - , * , / , %. 
* long numeri naturali [-263,263-1] ( decimale, ottale , esadecimale) operazioni: + , - , * , / , %. 
* float numeri reali in formato IEEE754 a 32 bit notazione a virgola fissa e mobile: + , - , * , /. 
* double numeri reali in formato IEEE754 a 64 bit notazione a virgola fissa e mobile: +, -, *, /. 
* char caratteri, simboli della notazione Unicode tra apici singoli nessuna operazione. 
* String : Sequenza di caratteri, simboli della notazione Unicode tra doppie virgolette nessuna operazione + (concatenazione)

Le 4 operazioni aritmetiche sono rappresentate dai simboli + , - , * , /.

Per i tipi di dati byte, short, int, long, il simbolo / rappresenta il quoziente dell'operazione.

Per inserire un apice singolo o doppio all'interno di una stringa si scrive rispettivamente \' e \"

Aggiungiamo per completezza anche i simboli:
  && e logico o congiunzione 
  || o logico o disgiunzione 
  ! not o negazione

Come già accennato nel caso di un'assegnazione del tipo

```java
T var = expr 
```

abbiamo detto che expr deve avere tipo compatibile con T (non necessariamente lo stesso). È utile a questo punto dare la definizione di promotion e casting per i tipi che definiscono casi in cui il tipo di var ed expr possono non coincidere ma essere comunque corretti e applicabili.

Definizione
Se sia il tipo della variabile sia il tipo dell'espressione rappresentano dati numerici e il tipo expr è un sottoinsieme 
del tipo var prima dell'assegnazione, avviene una conversione automatica chiamata promotion.
Ad esempio:

```java
int i ; 
byte j ; 
i = j ;
```
Diamo ora invece una definizione di casting:

Definizione

Se il tipo di var e il tipo di expr hanno valori in comune (tipicamente TypeOf(expr) sottoinsieme di TypeOf(var)) possiamo pensare alla 
conversione esplicita chiamata casting e cioè: TypeOf(expr) --> TypeOf(var). Questo a patto che i valori numerici siano corretti e compatibili.

Ad esempio:

```java
int i; 
byte j; 
j = (byte) i;
```
corretto solo se è minore o uguale al valore massimo disponibile per un byte.
