---
layout: post
title:  "Strutture indicizzate approfondimenti"
excerpt: ""
category: "Algorithms and Data Structures"
date:   2014-10-03 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java,Strutture indicizzate,Strutture Dati]
comments: true
image:
  path: /images/unsplash/lidya-nada-744078-unsplash.jpg
  -- thumbnail: /images/unsplash/lidya-nada-744078-unsplash.jpg
  caption: "[Photo by Lidya Nada on Unsplash](https://unsplash.com/photos/BnzqQwerUOY?utm_source=unsplash&utm_medium=referralutm_content=creditCopyText)"
share: true
---

Riprendiamo il post sulle strutture indicizzate per un approfondimento.
Abbiamo visto che il **Java Collection Framework** ci fornisce già praticamente qualunque struttura di cui possiamo aver bisogno per il nostro lavoro. Avete mai avuto la curiosità di vedere come vengono implementate queste strutture? Il codice sorgente è pubblico, lo potete scaricare insieme al JDK ad ogni release, noterete che spesso e volentieri non vi è nulla di fantascientifico nell’implementazione di strutture come `ArratList`, per esempio la specifica di implementazione vista in pseudocodice nel post sulle strutture indicizzate precedente a questo nella sostanza non vi differisce molto. Quello che fa la differenza sono le ottimizzazioni.

Entriamo nel dettaglio dello pseudocodice della classe ArrayOrdinato, e vediamo come sviluppare alcune idee di implementazione reali in Java.
Lo faremo senza l’illusione di realizzare qualcosa di migliore dell’implementazione di Sun/Oracle si intende.
Le operazioni di insert e delete comprendono la fase di riallocazione dell’array, come effettuare nella realtà queste operazioni?

Una prima versione, un pò pedante potrebbe essere la seguente. Assumiamo per semplicità di esposizione che l’array sia di semplici `int` e non si debba gestire una tupla (elemento,chiave).
{% highlight java %}
public class Realloc {

    int n ;
    int[] S ;
    
    public Realloc(){
        n = 10;
        S = new int[n];
    }


    public void print(){
        for (int i = 0; i < S.length; i++) {
            System.out.println("S["+i+"]="+S[i]);
        }
    }
    
    public void realloc(){
        int[] t = new int[n];
        for (int i = 0; i < n; i++) {
            t[i] = S[i];
        }
        n=n+1;
        S = new int[n];
        for (int i = 0; i < t.length; i++) {
            S[i] = t[i];
        }
    }
    
    public void dealloc(){
        int[] t = new int[n];
        for (int i = 0; i < n; i++) {
            t[i] = S[i];
        }
        n=n-1;
        S = new int[n];
        for (int i = 0; i < t.length-1; i++) {
            S[i] = t[i];
        }
    }
    
    public static void main(String[] args) {
        Realloc r = new Realloc();
        r.print();
        r.S[0]=1;
        
        r.realloc();
        r.print();
        r.dealloc();
        r.print();
    }
}
{% endhighlight %}

L’effetto è quello voluto, usando un array di appoggio `t`, il metodo `main()` mostra alcune chiamate di test.

Possiamo utilizzare qualcosa di già pronto come `System.arraycopy()` per arrivare ad una release più compatta. Per semplicità riporto solo i metodi coinvolti nel refactoring 
{% highlight java %}
public void realloc(){
   int[] t = new int[n];
   System.arraycopy(S, 0, t, 0, n);
   n=n+1;
   S = new int[n];
   System.arraycopy(t, 0, S, 0, t.length);
}
    
public void dealloc(){
   int[] t = new int[n];
   System.arraycopy(S, 0, t, 0, n);
   n=n-1;
   S = new int[n];
   System.arraycopy(t, 0, S, 0, t.length-1);
}
{% endhighlight %}

A guardar bene il resto dello pseudocodice rimanente è piuttosto esplicito, a basso livello per così dire, e la sua implementazione non dovrebbe rappresentare uno sforzo particolare.

Rimandiamo ad un post conclusivo le restanti considerazioni e implementazioni, seppur parziali, ma prima vi invito a dare un occhiata proprio al codice di `ArrayList` ed affini.
