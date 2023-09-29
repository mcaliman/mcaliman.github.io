---
layout: post
lang: it
title:  "Approfondiamo i metodi in Java"
excerpt: ""
category: programming-languages
date:   2005-01-02 22:45:33
tags: [Italian,Java]
comments: true
share: true
---

#Definizione dei metodi 

In java la definizione di un metodo di compone di due parti

* l'impostazione o segnature che ne definisce l'interfaccia
* il blocco formato dai comandi che ne realizzano il comportamento.

Ovviamente non  lecito dichiarare i metodi all'interno di altri metodi. 
L'intestazione dei metodi può connotarsi in modo diversificato a seconda che un metodo possa o non possa esportare i valori. 
Nel primo caso assume la forma sotto indicata in cui l'espressione restituita dal comando return deve essere di tipo compatibile
con il tipo specificato nell'intestazione

```java
T m (parametri_formali ) {
   statements;
   return expression ;
}
```

Nel caso il metodo non ritorni nessun valore si usa la parola chiave void

```java
void m (parametri_formali){
   statements;
}
```

I parametri nell'impostazione costituiscono i parametri_formali .


T1 p1,T2 p2,,Tn pn 

Un metodo viene attivato effettuandone la chiamata sui parametri attuali esse stabiliscono 
i valori da associare ai parametri formali affinch il metodo possa essere eseguito. La chiamata al metodo assume la forma

m(parametri_attuali) 
m(p1,p2, pn) 

p1,p2,,pn cio i parametri attuali sono forniti da una opportuna lista di variabili o di espressioni che 
devono ovviamente coincidere in numero e tipo con i parametri formali

```java
class T{
   public int s (int x,int y){
     return x+y;
   }
}
```

#Metodi statici e metodi dinamici

Una distinzione fondamentale che riguarda i metodi e che  legata al contesto di attivazione, li discrimina in 
metodi statici e metodi dinamici 

Definizione Si definisce statico un metodo eseguibile dalla classe in cui è definito. 

Definizione 
Si definisce dinamico un metodo eseguibile dagli oggetti che sono instanziabili dalla sua classe di definizione.

Sintatticamente i metodi statici sono individuati dal modificatore static che è invece assente nella definizione di quelli dinamici.
Un metodo statico è un metodo di classe secondo quanto definito in precedenza, analogamente un metodo dinamico è un metodo di 
istanza (di fatto i metodi statici equivalgono alle procedure e funzioni dei linguaggi imperativi quindi non orientati agli oggetti).

Alle distinzioni precedenti si ottiene un'unica tipologia di metodi. L'eccezione  costituita dai metodi costruttori della classe 
i quali costituiscono i metodi che devono essere impiegati per istanziare gli oggetti della classe.

Definizione

Un metodo costruttore di classe  un metodo con le seguenti proprietà :
* dichiarato public ( ma vedremo anche no)
* possiede lo stesso nome della classe
* non ha definito nessun tipo di ritorno
