---
layout: post
title:  "La parola riservata this in Java"
category: java
date:   2007-01-05 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java]
comments: true
share: true
---
E' possibile riscontrare due situazioni di interesse legate all'uso dei metodi la cui accurata gestione permette di migliorare 
l'efficienza del codice: 

* omonimia parametri dei metodi e delle variabili della classe in cui i metodo sono definiti 
* molteplicità dei costruttori della classe 


La prima situazione deriva dal fatto che un tipico utilizzo dei metodi consiste nel fornire valori da assegnare alle variabili degli oggetti. 
In tal caso è evidente che i parametri del metodo e i dati membro della classe possiedono la stessa semantica e pertanto non è ragionevole 
identificare gli uni e gli altri con nomi diversi. 

Il problema che ne segue è quello di poter discriminare fra entità diverse che sono individuate con lo stesso identificatore. 

La seconda situazione nasce dalla funzione dei costruttori, il cui scopo è quello di fornire procedure diversificate di 
inizializzazione degli oggetti che possono dipendere da particolari esigenze applicative. 

Tipicamente una classe mette a disposizione un costruttore con valori di default per le variabili degli oggetti e uno o più altri 
costruttori per inizializzazioni specifiche. 

E' ragionevole aspettarsi che la presenza dei molteplici costruttori, similari nelle loro funzionalità, comporti la duplicazione 
di parte del codice o tali metodi con conseguente spreco di memoria. 

Al fine di fronteggiare le situazioni indicate, il linguaggio di programmazione Java mette a disposizione del programmatore la parola riservata this. 

Si tratta di una parola chiave che può essere sfruttata sotto due interpretazioni distinte:

* il riferimento ad un oggetto 
* riferimento ad un altro costruttore 

Nella prima accezione, la parola this è sfruttata nella risoluzione di omonimie tra il parametro di un metodo e il nome di una variabile di istanza:


{% highlight java %}
class T {
   float car;
   void m(float var){
       this.var=var;
   }
}
{% endhighlight %}


Ci forza il compilatore ad interpretare la specifica this.var come un riferimento alla variabile di istanza var dell'oggetto in cui il metodo m()  è attivato.
Pertanto, nel comando this.var=var, l'identificatore var a destra dell'operatore di assegnazione si riferisce al parametro del metodo, 
mentre la specifica this.var collocata a sinistra dello stesso operatore si riferisce all'attributo dell'oggetto. 

La seconda accezione della parola this legata alla presenza di più costruttori. Al fine di ridurre il codice prodotto dal compilatore, 
i costruttori di una classe possono essere ripartiti in un costruttore primario e uno o più altri costruttori secondari. 
Mentre il costruttore primario è di per sè codificato, i costruttori secondari rimandano a quello primario riportandone i parametri
di chiamata nella specifica this. La specifica di richiamo deve essere la prima istruzione che appare nel codice dei costruttori secondari.

{% highlight java %}
class T {
   float var;
   public T(float var){
      this.var=var;
   }
   public T(){
      this(0.03);
   }
}
{% endhighlight %}

