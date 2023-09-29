---
layout: post
lang: it
title: Il design pattern State
excerpt: "Caratteristiche e codice di esempio ridotto all'essenziale"
modified: 2016-01-30
category: programming-languages
tags: [Italian,Design Pattern]
comments: true
share: true
search_omit: false
updated: true
---

Potete trovare un progetto di esempio su github a questo indirizzo:
[**https://github.com/mcaliman/StatePatternJavaExamples**](https://github.com/mcaliman/StatePatternJavaExamples)

Qualche informazione su questo pattern.

E' un design pattern comportamentale (I pattern comportamentali forniscono soluzione alle più comuni 
tipologie di interazione tra gli oggetti) 

E' usato quando un oggetto deve cambiare il proprio comportamento (a **run-time**) in base al suo stato interno.

Evita di utilizzare sequenze di blocchi condizionali **if-else** ( [Campagna AntiIF](http://antiifcampaign.com/) ) 

Fornisce un modo sistematico e **lose-coupled** per raggiungere questo obiettivo.

Si compone di una interfaccia `State`, una classe concreta `Context` e una o più classi concrete che implementano 
l'interfaccia `State`.

* `Context` definisce l'interfaccia della classe client e mantiene un riferimento ad un `ConcreteState`.
* `State`  definisce l'interfaccia implementata dai `ConcreteState`.
* Le classi `ConcreteState` incapsulano la logica del comportamento associato ad un determinato stato.

Vediamo di comprendere come funziona con un breve esempio su github
e di cui riporto il codice in questo post. 

Per prima cosa definiamo l'interfaccia, è sufficiente che abbia solo un metodo execute. 

```java
public interface State {
   public void execute();
}
```

Vogliamo implementare un sistema di gestione dei contenuti con tre stati: **draft**, **published** e **deleted**. 

La nostra applicazione di prova potrà avere tre bottoni per eseguire le rispettive azioni.

La soluzione che adotta il design pattern State è quella che implementa tante classi concrete di `State` 
quanti sono gli stati previsti.

```java
public class DarftState implements State {
   /**
    * Salva il contenuto in stato bozza e non fa altro. 
    * Se non esiste il contenuto, lo crea effettuando la creazione del record,
    * altrimenti cambia stato al record reimpostandolo a draft e salvando
    * le modifiche del testo, metadati ecc.
    */
   @Override
   public void execute() {        
      //stuff...
   }
}
```

Creiamo la classe `Context` che deve avere un riferimento ad un oggetto di tipo `State`. 
Un oggetto di tipo `Context` dovrà avere un meccanismo per cambiare l'attributo `state` e 
un metodo che propaga ad esso l'azione realizzata dal metodo execute.

```java
public class Context {
   private State state;
   public void setState(State state) {
      this.state = state;
   }
   public State getState() {
      return this.state;
   }
   @Override
   public void execute() {
      this.state.execute();
   }
}
```

La classe `Context` nel nostro caso potrebbe anche chiamarsi Post e contenere più attributi e metodi, 
per esempio contenere il riferimento al record o entity del contenuto di cui si vuole gestire il ciclo di vita.
Per gli altri stati vi rimando al codice su github i cui riferimenti sono in testa a questo post.
Per finire un esempio di utilizzo che cambia tre volte stato al nostro oggetto.

```java
Context context = new Context();
State darftState = new DarftState();
State publishState = new PublishState();
State deletedState = new DeletedState();

context.setState(darftState);
context.execute();

context.setState(publishState);
context.execute();

context.setState(deletedState);
context.execute();
```

Se si deve aggiungere un nuovo comportamento o stato dobbiamo progettare una 
nuova classe che implementi `State`.

Quali svantaggi può avere l’adozione di questo pattern? 
Evidentemente aumentano il numero di classi ma questo è preferibile nella maggioranza dei casi
a una unica classe con lunghe sequenze di istruzioni condizionali `if` (o `switch`). 
Un vantaggio per nulla indifferente: in un team di sviluppatori
la scrittura dei singoli `ConcreteState` può essere assegnata e gestita facilmente rispetto all'alternativa di  
mettere le mani in due o più sullo stessa unica classe.
