---
layout: post
title:  "Stack"
excerpt: ""
category: Programming
date:   2014-09-30 22:45:33
comments: true
share: false
modified: 2024-07-11
published: true
---

One of the most recurring basic types is the Stack; a pseudolanguage specification is given below.

```
type: Stack
data: a sequence S of n elements
operations
isEmpty() -> result , result=true iff S=O, false otherwise
push(elem e) adds e as the last element of S
pop()-> elem , removes the last element from S and returns it
top()-> elem returns the last element of S (without removing it from S)
```

In Java we could render the specification as an interface

```java
public interface Stack<E> {
    public boolean isEmpty();
    public void push(E e);
    public E pop();
    public E top();
}
```

The use of generics allows me not to define the interface for a specific type.

Again, we can implement this in various ways, either by using indexed or linked structures. 

However, the JDK provides a very respectable implementation of both Stack and Queue, and does so with a single interface `Deque<E>` from which derive the concrete classes `ArrayDeque`, `ConcurrentLinkedDeque`, `LinkedBlockingDeque`, `LinkedList`.

Deque defines methods for making both a Stack and a Queue, I refer you to the javadoc for a more comprehensive discussion and will just list them here.

* For the `push(e)` method we have `addFirst(e)`.
* For the `pop()` we have `removeFirst()`.
* For `peek()` or `top()` instead `peekFirst()`.

`Deque<E>` implements the `Queueue<E>` interface, an interface also implemented by the classes
`AbstractQueue`, `ArrayBlockingQueue`, `ArrayDeque`, `ConcurrentLinkedDeque`, `ConcurrentLinkedQue`, `DelayQue`, `LinkedBlockingDeque`, `LinkedBlockingQue`, `LinkedList`, `LinkedTransferQue`, `PriorityBlockingQue`, `PriorityQue`, `SynchronousQue`.

The easiest way is to use the old `Stack` class from `java.util`, but you won't get much benefit from it; it is derived from the `Vector` class and has been available since version 1.0 of the JDK

```java
Stack<Integer> lifo = new Stack<>();
for (int i = 1; i <= 10; i++) {
    lifo.push(i);
}
while (!lifo.isEmpty()) {
    System.out.print(lifo.pop());
    System.out.print(',');
}
```

The recommended class is `ArrayDeque<E>` a simple use case is as follows

```java
Deque<Integer> stack = new ArrayDeque<Integer>();
stack.push(1);
Integer value = stack.pop();
boolean isEmpty = stack.isEmpty();
value = stack.peek();
```