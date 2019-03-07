---
layout: post
title:  "Pile o Stack"
excerpt: ""
category: "Algorithms and Data Structures"
date:   2014-09-30 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java,Pile o Stack,Strutture Dati]
image:
  path: /images/unsplash/lidya-nada-744078-unsplash.jpg
  -- thumbnail: /images/unsplash/lidya-nada-744078-unsplash.jpg
  caption: "[Photo by Lidya Nada on Unsplash](https://unsplash.com/photos/BnzqQwerUOY?utm_source=unsplash&utm_medium=referralutm_content=creditCopyText)"
comments: true
share: true
---
﻿
Uno dei tipo base più ricorrente è la Pila o Stack, una specifica in pseudolinguaggio è riportata sotto.
{% highlight bash %}
tipo: Pila
dati: una sequenza S di n elementi
operazioni
isEmpty() -> result , result=true sse S=O, false altrimenti
push(elem e) aggiunge e come ultimo elemento di S
pop()-> elem , toglie da S l’ultimo elemento e lo restituisce
top()->elem restituisce l’ultimo elemento di S (senza toglierlo da S)
{% endhighlight %}

In Java potremmo rendere la specifica come un interfaccia 

{% highlight java %}
public interface Pila<E> {
    public boolean isEmpty();
    public void push(E e);
    public E pop();
    public E top();
}
{% endhighlight %}

L’uso dei generics mi permette di non definire l’interfaccia per un tipo specifico.

Anche in questo caso possiamo realizzare un implementazione in vari modi, sia utilizzando strutture indicizzate che collegate.. 

Il JDK fornisce comunque un implementazione di tutto rispetto sia per risolvere il problema degli Stack che delle Queue e lo fa con un unica interfaccia `Deque<E>` da cui derivano le classi concrete `ArrayDeque`, `ConcurrentLinkedDeque`, `LinkedBlockingDeque`, `LinkedList`

Deque definisce metodi sia per realizzare uno Stack che una Queue, vi rimando al javadoc per una trattazione più esauriente e mi limito a riportarne la lista.

* Per il metodo `push(e)` abbiamo `addFirst(e)`
* Per il `pop()` abbiamo `removeFirst()`
* Per il `peek()` o `top()` invece `peekFirst()`


`Deque<E>` implementa l’interfaccia `Queue<E>` , interfaccia implementata anche dalle classi
`AbstractQueue`, `ArrayBlockingQueue`, `ArrayDeque`, `ConcurrentLinkedDeque`, `ConcurrentLinkedQueue`, `DelayQueue`, `LinkedBlockingDeque`, `LinkedBlockingQueue`, `LinkedList`, `LinkedTransferQueue`, `PriorityBlockingQueue`, `PriorityQueue`,`SynchronousQueue`.

La via più facile è utilizzare la vecchia classe `Stack` di `java.util`, ma non ne avremo grandi vantaggi, deriva dalla classe `Vector` ed è disponibile dalla versione 1.0 del JDK
{% highlight java %}
Stack<Integer> lifo = new Stack<>();
for (int i = 1; i <= 10; i++) {
    lifo.push(i);
}
while (!lifo.isEmpty()) {
    System.out.print(lifo.pop());
    System.out.print(',');
}
{% endhighlight %}

La classe consigliata è `ArrayDeque<E>` un semplice caso d’uso è il seguente

{% highlight java %}
Deque<Integer> stack = new ArrayDeque<Integer>();
stack.push(1);
Integer value = stack.pop();
boolean isEmpty = stack.isEmpty();
value = stack.peek();
{% endhighlight %}

