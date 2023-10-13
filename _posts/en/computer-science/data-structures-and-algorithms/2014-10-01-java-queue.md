---
layout: post
lang: en
title:  "Queue"
excerpt: ""
category: programming-languages
date:   2014-10-01 22:45:33
tags: [English,"Data Structures"]
comments: true
share: true
---
Let us return to the discussion of elementary data structures. In previous posts we have looked at indexed structures, linked structures and Stacks or Stacks, another of the most common basic types is the Queue or Queue, a pseudolanguage specification of which is given below.
```
type Queue
data
a sequence S of n elements
operations
isEmpty()->result, returns true if S is empty, false otherwise
enqueue(elem e), adds e as the last element of S
dequeue()->elem, removes the first element from S and returns it
first()->elem, returns the first element of S (without removing it from S)
```
A natural Java implementation of the specification is provided by an interface like the following one

```java
public interface Coda<E> {
    public boolean isEmpty();
    public void enqueue(E e);
    public E dequeue();
    public E first();
}
```

Again, we can implement this in various ways, either using indexed or linked structures. 

As with the Stack, the most natural and fastest way is to use the concrete classes derived from the Java `Deque` interface.
Again, we can use the methods of Deque related to its behaviour as Queue.

```java
addLast(e)
offerLast(e)
removeFirst()
pollFirst()
getFirst()
peekFirst()
```

A wrapper class that makes it easier to use is the following (uses `LinkedList` instead of `ArrayDeque`)

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