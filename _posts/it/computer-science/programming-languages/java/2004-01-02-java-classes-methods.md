---
layout: post
lang: it
title:  "Classi e metodi in Java"
excerpt: "Definizione di classi in Java: modificatori di accesso, entità di classe e di istanza"
category: programming-languages
date:   2004-01-02 22:45:33
tags: [Italian,Java]
comments: true
share: true
--- 

Classi e metodi sono gli elementi fondamentali della programmazione ad oggetti. Essi consentono di incapsulare i dati e di limitare l'accesso agli stessi.

# Definizione di classe

Una classe è un modello di entità che hanno la stessa struttura e condividono le stesse proprietà e funzionalità.

# Definizione di oggetto

Un oggetto è un'entità che corrisponde a una classe e che può essere generata attraverso un processo chiamato istanziazione. Le informazioni contenute in un oggetto possono essere manipolate utilizzando le procedure definite nella classe di riferimento.

# Definizione di metodo

Un metodo è un'operazione che può essere eseguita da un oggetto. Esso rappresenta la procedura che implementa una specifica funzionalità della classe o della sua istanza.

La definizione di una classe non comporta necessariamente la creazione di oggetti. Essa descrive semplicemente la struttura delle informazioni e le relazioni tra di esse, nonché le operazioni che possono essere eseguite su tali informazioni.

# Definizione delle classi in Java

In Java, le classi sono definite utilizzando il costrutto class. Ogni classe include la definizione di attributi (costanti e variabili) e metodi.

Lo scheletro di un codice per definire una classe è il seguente:

```java
class T {
// ...
}
```

I blocchi di dichiarazione sono solo dei segnaposto per evidenziare la struttura del contenuto tra le parentesi `{`, `}`. `class` è una parola riservata del linguaggio.

Tutte le dichiarazioni nelle classi, costanti, variabili e metodi, possono essere caratterizzate dal modificatore `public` per renderle accessibili dall'esterno della classe, oppure possono essere specifiche `private` per limitarne la visibilità e l'accesso alla classe di definizione.

Un livello intermedio è `protected`, il cui scopo verrà chiarito in seguito, dopo aver acquisito i rudimenti della programmazione ad oggetti, in particolare l'ereditarietà.

# Modificatori di accesso

I modificatori di accesso `public`, `private` e `protected` definiscono la visibilità di una dichiarazione all'interno di una classe.

`public`: la dichiarazione è accessibile da qualsiasi classe.
`private`: la dichiarazione è accessibile solo dalla classe in cui è definita.
`protected`: la dichiarazione è accessibile dalle classi derivate dalla classe in cui è definita.

# Entità di classe e di istanza

Le entità di classe sono quelle che sono comuni a tutti gli oggetti istanziati dalla classe. Le entità di istanza sono quelle che sono specifiche di ciascun oggetto istanziato dalla classe.


Esempi
```java
Java
// Entità di classe
class T {
    static int x = 10;
}
```

```java
// Entità di istanza
class T {
    int x = 10;
}
```

# Conclusione

In questo articolo abbiamo visto come definire classi in Java. Abbiamo anche visto come utilizzare i modificatori di accesso per controllare la visibilità delle dichiarazioni all'interno di una classe. Infine, abbiamo visto la differenza tra entità di classe e di istanza.