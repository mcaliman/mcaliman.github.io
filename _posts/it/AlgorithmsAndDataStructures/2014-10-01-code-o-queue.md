---
layout: post
title:  "Code o Queue"
excerpt: ""
category: AlgorithmsAndDataStructures
date:   2014-10-01 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java,Code o Queue,Strutture Dati]
image:
  path: /images/unsplash/lidya-nada-744078-unsplash.jpg
  -- thumbnail: /images/unsplash/lidya-nada-744078-unsplash.jpg
  caption: "[Photo by Lidya Nada on Unsplash](https://unsplash.com/photos/BnzqQwerUOY?utm_source=unsplash&utm_medium=referralutm_content=creditCopyText)"
comments: true
share: true
---

Riprendiamo la trattazione delle strutture dati elementari. Nei post precedenti abbiamo visto le strutture indicizzate,quelle collegate e le Pile o Stack,uno altro dei tipo base più ricorrenti è la Coda o Queue, una specifica in pseudolinguaggio è riportata sotto.
{% highlight bash %}
tipo Coda
dati
una sequenza S di n elementi
operazioni
isEmpty()->result, restituisce true se S è vuota, false altrimenti
enqueue(elem e), aggiunge e come ultimo elemento di S
dequeue()->elem, toglie da S il primo elemento e lo restituisce
first()->elem, restituisce il primo elemento di S (senza toglierlo da S)
{% endhighlight %}

Una naturale implementazione in Java della specifica è fornita da un interfaccia come quella seguente

{% highlight java %}
public interface Coda<E> {
    public boolean isEmpty();
    public void enqueue(E e);
    public E dequeue();
    public E first();
}
{% endhighlight %}

Anche in questo caso possiamo realizzare un implementazione in vari modi, sia utilizzando strutture indicizzate che collegate. 

Come per il gli Stack la via più naturale e veloce è quella di utilizzare le classi concrete derivanti dall’interfaccia Java `Deque`.
Anche in questo caso possiamo utilizzare i metodi di Deque relativi al suo comportamento come Queue.

{% highlight java %}
addLast(e)
offerLast(e)
removeFirst()
pollFirst()
getFirst()
peekFirst()
{% endhighlight %}

Un classe wrapper che renda più facile l’utilizzo è la seguente (utilizza `LinkedList` in luogo di `ArrayDeque`)

{% highlight java %}
public class QueueImpl<E> {

    private LinkedList<E> list = new LinkedList<>();

    public void enqueue(E item) {
        list.addLast(item);
    }
    public E dequeue() {
        return list.poll();
    }
    public boolean isEmpty() {
        return !list.isEmpty();
    }
    public int size() {
        return list.size();
    }
}
{% endhighlight %}
