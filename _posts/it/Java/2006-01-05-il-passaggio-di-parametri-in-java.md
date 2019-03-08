---
layout: post
title:  "Il passaggio di parametri in Java"
excerpt: ""
category: java
date:   2006-01-05 22:45:33
tags: [Java]
comments: true
share: true
---
Nella forma pi generica un metodo  caratterizzato da uno o pi parametri formali

T1 p1, T2,p2  Tn pn

un esempio pu essere dato dalla riga sotto

int a,double b,long c,String d

Questi definiscono gli identificatori delle entit su cui il metodo  chiamato ad operare, quali sono conosciuti dal metodo.
Affinch il metodo possa effettuare la propria computazione  necessario che in corrispondenza della sua attivazione i 
parametri formali vengano associati ai calcoli cui la computazione deve essere effettivamente applicata.

Detti valori costituiscono i parametri attuali del metodo.

Di solito i linguaggi di programmazione prevedono due modalit di legame tra i parametri attuale 
quelli formali : 

* passaggio di parametri per valore 
* passaggio di parametri per indirizzo 

#Passaggio di parametri per valore 
Con il passaggio di parametri per valore, 
il parametro formale di un metodo identifica una locazione di memoria locale al metodo chiamato e nella quale 
viene trascritto il valore del corrispondente parametro attuale. 
In questo modo, il metodo lavora su una copia del valore del parametro attuale. 

Ne segue che ogni modifica apportata al parametro formale rimane localizzata nel metodo di pertinenza e 
non pu essere esportata nell'ambiente chiamante. Questo significa che ogni volta che passate un parametro, 
per esempio un intero int a di valore 10 ,e poi nel corso della computazione interna al metodo ne cambiate 
il valore in 11,al rientro della chiamata il suo valore torner ad essere 10.

{% highlight java %}
//dichiarazione e implementazione del metodo m1 che useremo per l'esempio.
private void m1(int value){
   value=11;
   System.out.println("qui il valore di qualunque parametro passato vale 11 : value='"+value);
}
//altro
int a = 10;
m1(a);
System.out.println("a ora vale ancora 10 : a="+a);
{% endhighlight %}

Quindi non posso usare (in java), un metodo per cambiare il valore di una variabile passata come parametro? 
in realt non proprio cos,vedremo che con gli oggetti e gli array questo  possibile (e viene fatto usualmente).
 
Come avrete notato ho cominciato ad introdurre il metodo statico println della classe System che opera sullo 
stream standard out (il vostro video),non entreremo nel dettaglio di System per il momento.

#Passaggio di parametri per indirizzo.

In questo caso il parametro formale di un metodo identifica l'indirizzo di allocazione del corrispondente 
parametro attuale, il quale deve essere una variabile. Il metodo viene quindi chiamato ad operare direttamente sulla 
variabile allocata nel contesto del chiamante, pertanto ogni modifica apportata del metodo al parametro formale viene 
esportato ripercuotendosi sul corrispondente parametro attuale.

Formalmente, Java applica il passaggio per valore a tutti i metodi, ma qualora il parametro sia costituito 
da un array o da un oggetto il risultato ottenuto  simile a quello ottenuto il passaggio per indirizzo, infatti
in questo caso il parametro copiato  proprio l'indirizzo dell'array o dell'oggetto in questione. 
Quindi le modifiche apportate a un array o a un oggetto da un metodo si ripercuotono sul contesto del chiamante. 
Non  possibile invece esportare da un metodo un oggetto o array di nuova creazione se non con il comando return.
