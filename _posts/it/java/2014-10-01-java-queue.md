---
layout: post
lang: it
title:  "Code o Queue"
excerpt: ""
category: Java
date:   2014-10-01 22:45:33
tags: [Italian,"Data Structures"]
comments: true
share: true
---

Riprendiamo la trattazione delle strutture dati elementari. Nei post precedenti abbiamo visto le strutture indicizzate,quelle collegate e le Pile o Stack,uno altro dei tipo base più ricorrenti è la Coda o Queue, una specifica in pseudolinguaggio è riportata sotto.
```
tipo Coda
dati
una sequenza S di n elementi
operazioni
isEmpty()->result, restituisce true se S è vuota, false altrimenti
enqueue(elem e), aggiunge e come ultimo elemento di S
dequeue()->elem, toglie da S il primo elemento e lo restituisce
first()->elem, restituisce il primo elemento di S (senza toglierlo da S)
```

Una naturale implementazione in Java della specifica è fornita da un interfaccia come quella seguente

```java
public interface Coda<E> {
    public boolean isEmpty();
    public void enqueue(E e);
    public E dequeue();
    public E first();
}
```

Anche in questo caso possiamo realizzare un implementazione in vari modi, sia utilizzando strutture indicizzate che collegate. 

Come per il gli Stack la via più naturale e veloce è quella di utilizzare le classi concrete derivanti dall’interfaccia Java `Deque`.
Anche in questo caso possiamo utilizzare i metodi di Deque relativi al suo comportamento come Queue.

```java
addLast(e)
offerLast(e)
removeFirst()
pollFirst()
getFirst()
peekFirst()
```

Un classe wrapper che renda più facile l’utilizzo è la seguente (utilizza `LinkedList` in luogo di `ArrayDeque`)

```java
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
```
