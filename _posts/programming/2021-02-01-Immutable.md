---
layout: post
lang: it
title: "Classi e oggetti immutabili in Java"
excerpt: ""
modified: 2021-02-01
categories: programming
tags: [Java]
comments: true
share: true
search_omit: false
updated: true
---

Gli oggetti immutabili sono istanze il cui stato non cambia dopo che sono state inizializzate. Per esempio `String` è una classe immutabile e una volta istanziata con il suo valore non cambia più.


{% highlight java %}
public final class Immutable {
    private final int value;
    public Immutable(int value) {
        this.value = value;
    }
    public int getValue() {
        return value;
    }
}
{% endhighlight %}

Quali sono i vantaggi dell'immutabilità ?
Principalmente quelli legati alla concorrenza, infatti è difficile garantire la correttezza in oggetti che possono mutare, più thread possono tentare di modificare lo stato dello stesso oggetto, portando alcuni thread a vedere stati differenti a seconda dell’istante in cui vi accedono, sia in lettura che scrittura ovviamente.

# Alcune semplici strategie per creare oggetti immutabili

* Non prevedere setter e getter
* Tutti i campi finali e private
* Non permettere a sottoclassi di effettuare l’override di metodi (classe final)
* Se i campi di istanza includono riferimenti a oggetti mutabili  non permettere a tali oggetti di essere mutati
* Non condividere riferimenti a oggetti mutabili !
* Non prevedere metodi che cambino lo stato dell’oggetto


{% highlight java %}
    public class Mutable {
    
        private int value;
    
        public Mutable() {
        }
    
        public int getValue() {
            return value;
        }
    
        public void setValue(int value) {
            this.value = value;
        }
    
    }
    
    public final class Immutable1 {
    
        private final Mutable mutable;
    
        public Immutable1(Mutable mutable) {
            this.mutable = new Mutable(mutable.getValue());
        }
    }
{% endhighlight %}

# La defensive coping

  La maggior parte delle classi sono mutabili, come approcciare il problema? Creando un wrapper attorno alla classe ed utilizzando ad esempio il metodo clone()
  
{% highlight java %}
      public class Wrapper {
    
        private final Mutable mutable;
    
        public Wrapper(Mutable mutable) {
            this.mutable = mutable.clone();
        }
    
        //Se il chiamante modifica l’oggetto ritornato da getMutable() questo non ha effetto su quello riferito in Wrapper
        public Mutable getMutable() {
            return mutable.clone();
        }
    }
{% endhighlight %}

Ovviamente il tipo originale dell’oggetto `Mutable` è diverso da `Wrapper`, di conseguenza non è possibile semplicemente sostituire l’uno con l’altro all’interno di codice esistente senza dover effettuare modifiche.

# Differenza tra classe immutabile e oggetto immutabile.

Una classe immutabile genera oggetti immutabili per definizione (per il suo design) mentre un oggetto immutabile non necessariamente è instanziato da una classe anch’essa immutabile.

Un esempio di oggetto immutabile

{% highlight java %}
    public final class Immutable2 {
    
        private final String text;
    
        public Immutable2(String text) {
            this.text = text;
        }
    
        public String getText() {
            return this.text;
        }
    }
{% endhighlight %}

oppure anche

{% highlight java %}    
    public final class Immutable3 {
    
        private final String text;
    
        private Immutable3(String text) {
            this.text = text;
        }
    
        public String getText() {
            return this.text;
        }
    
        public static Immutable3 create(String text) {
            return new Immutable3(text);
        }
    }
{% endhighlight %}
    

la ricetta standard per un ogggetto immutabile è in breve così 

1. tutte le proprietà devono essere settabili nel costrutture o in un metodo statico di init (vedi create sopra)
2. Nessun setter, se necessari per qualche motivo dovrebbero sollevare un eccezione
3. tutte le proprietà private e final
4. classe final 
5. Caso in cui si riferenzi oggetti mutabili: usare deep copy per passare i valori al costruttore e per leggerli attraverso metodi di getter

l’istanza è in questo modo naturalmente thread safe, il che attenzione non significa che l’oggetto non sia nullable in se o in una sua parte proprietà.
   