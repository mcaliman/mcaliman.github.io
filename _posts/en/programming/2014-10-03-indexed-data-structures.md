---
layout: post
lang: en
title:  "Structures indexed in depth"
excerpt: ""
category: Programming
date:   2014-10-03 22:45:33
comments: true
share: false
published: true
---

Let's pick up the post on indexed structures for a closer look.
We have seen that the **Java Collection Framework** already provides us with practically any structure we may need for our work. Have you ever been curious to see how these structures are implemented? The source code is public, you can download it along with the JDK with every release, you'll notice that there is often nothing science fiction about the implementation of structures like `ArratList`, for example, the implementation spec seen in pseudocode in the post on indexed structures before this one doesn't differ much in substance. What makes the difference are the optimisations.

Let us go into detail about the pseudocode of the class ArrayOrdered, and see how to develop some real implementation ideas in Java.
We will do this without the illusion of realising something better than the Sun/Oracle implementation is intended.
The insert and delete operations include the reallocation phase of the array, so how do we perform these operations in reality?

A somewhat pedantic first version might be as follows. Let's assume for simplicity of exposition that the array is of simple `int` and we don't have to handle a tuple (element, key).

```java
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
```

The effect is as desired, using a backing array `t`, the `main()` method shows some test calls.

We can use something ready-made like `System.arraycopy()` to achieve a more compact release. For simplicity, I'm only reporting the methods involved in refactoring

```java
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
```
On closer inspection, the rest of the remaining pseudocode is quite explicit, low-level so to speak, and its implementation should represent no special effort.

We'll postpone the remaining considerations and implementations, though partial, to a concluding post, but first I invite you to take a look at the code of `ArrayList` and the like.
