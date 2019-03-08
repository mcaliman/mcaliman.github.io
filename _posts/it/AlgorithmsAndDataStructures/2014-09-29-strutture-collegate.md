---
layout: post
title:  "Strutture collegate"
excerpt: ""
category: AlgorithmsAndDataStructures
date:   2014-09-29 22:45:33
tags: [Java,Strutture collegate,Strutture Dati]
image:
  path: /images/unsplash/lidya-nada-744078-unsplash.jpg
  -- thumbnail: /images/unsplash/lidya-nada-744078-unsplash.jpg
  caption: "[Photo by Lidya Nada on Unsplash](https://unsplash.com/photos/BnzqQwerUOY?utm_source=unsplash&utm_medium=referralutm_content=creditCopyText)"
comments: true
share: true
---

I costituenti di base di una struttura collegata sono i record che come le celle degli array sono numerati e contengono ciascuno una collezione di oggetti. I numeri associati ai record sono i loro indirizzi in memoria (quindi globali nell’ambito del programma e non locali come nel caso degli array)
Gli indirizzi in memoria non sono necessariamente consecutivi e sono costruiti in maniera dinamica.

Se un record A contiene l’indirizzo di un altro record B diremo che esiste un collegamento tra A e B realizzato tramite un puntatore.
I puntatori permettono di esplorare una struttura collegata saltando di record in record è importante che ci sia un record da cui è possibile raggiungere tutti gli altri. 
Tale record permette di inserire e cancellare agevolmente elementi. La struttura è aggiornanata tramite i puntatori (molto più sono più versatili degli array).

proprietà forte: è possibile aggiungere o togliere record ad una struttura collegata
proprietà debole: gli indirizzi dei record di una struttura collegata non sono necessariamente consecutivi

Per cancellare record se non ho già indirizzo devo però effettuare una ricerca.

Una specifica per questo tipo di struttura è riportata sotto

classe StrutturaCollegata implementa Dizionario
dati: S(n) = ThetaGrande (n)
Una collezione di n record contenenti ciascuno una quadrupla (elem,chiave,next,prev)
next e prev puntatori al successivo e al precedente record della collezione. Manteniamo inoltre un puntatore list che contiene l’indirizzo di un record se la collezione non è vuota e null altrimenti.

operazioni

{% highlight bash %}
insert(elem e,chiave k) T(n)=O(1)
1.viene creato un record p con elemento e, chiave k
2.if list=null then
   p.next<-p
   p.prev<-p
   list<-p
else 
   si collega il record p tra list e list.next effettuando
   p.next<-list.next
   list.next.prev<-p
   p.prev<-list
   list.next<-p
{% endhighlight %}

trattandosi di una struttura collegata doppiamente linkata (doubly linked list) in fase di implementazione si debbono tenere presenti alcuni casi limite come ad esempio cancellazione dell’unico elemento presente in lista ecc.

{% highlight bash %}
delete(chiave k) T(n)=O(n)
1.si trova il record p con chiave k come nella search
2.si effettua
  p.prev.next<-p.next (il next del precedente di p punta al successore di p)
  p.next.prev<-p.prev (il prev del successore di p punta a prececessore di p)
3.si distrugge il record p
{% endhighlight %}

{% highlight bash %}
search(chiave k) -> elem T(n)=O(n)
if list = null then return null
else 
si scandisce la struttura saltando di record in record con p<-p.next fino a quando non diventa p=list 
verificando se qualche p ha chiave k in caso positivo si restituisce l’elemento trovato altrimenti `null`
{% endhighlight %}

Per realizzare un implementazione in Java a partire dalla specifica vista sopra come prima cosa abbiamo bisogno realizzare una classe per modellare i record, ma per farlo dobbiamo anche modellare il contenuto informativo con una classe Info o Tuple, semplifichiamo in questa prima fase di analisi e supponiamo che sia la chiave (intera) che il valore (stringa) siano attributi della classe record stessa. 

In altre parole evitiamo di gestire qualcosa del genere
{% highlight java %}
public class Tuple<K,V> {
    public K key;
    public V value;
    
    public Tuple() {
    
    }
    public Tuple(K k,V v) {
        key = k;
        value = v;
    }
}
{% endhighlight %}

Veniamo alla nostra classe `Record`
{% highlight java %}
public class Record {
    public Integer key;
    public String value;
    public Record prev;
    public Record next;
}
{% endhighlight %}

Avremmo potuto adottare già una versione generica come ad esempio
{% highlight java %}
public class RecordGen<K,V> {
    public K key;
    public V value;
    public Record next;
    public Record prev;
}
{% endhighlight %}
