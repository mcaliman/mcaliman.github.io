---
layout: post
lang: en
title:  "Considerations on recursion"
excerpt: ""
category: programming-languages
date:   2014-08-14 22:45:33
tags: ["Recursion"]
comments: true
share: true
revision: 0
---


In programming languages, the repetition of commands or statements is achieved by loops, usually realised with constructs such as `for`, `foreach` and `white`. For particular problems, recursion is a valid alternative, more elegant, natural and simple to implement.
We have recursion when a function (in Java a method) calls itself.
A classical example of recursion is the factorial function: given a number n we denote by `n!` the result of the product of all the integers from `1` to `n`, by convention the factorial of `0`, i.e. the `0!` is equal to `1`.

The factorial can be calculated recursively by observing that `!n = n * !(n-1)`.
A possible implementation in Java is

```java
public static int factorial(int n){
   if(n==0) return 1;
   else return n*factorial(n-1);
}
```

By using the recursive definition of a problem and implementing it via recursive method calls, we can avoid complex analyses and the use of nested loops. In other words, we do not necessarily give up efficiency and achieve more readable and compact code.

There are three forms of recursion

1. linear
2. binary
3. multiple

The simplest is linear, an example of which we have just seen: the factorial calculation. From the point of view of definition, we can say that we are in the presence of linear recursion when recursive methods are defined in such a way as to make at most one recursive call each time they are called.

In other words, and more formally, when we have schemes of this type.

```java
int m(int i){
   if(g(i) return x;
   return m(f(i) + y;
}
```
A further example of linear recursion is the sum of elements of a list

```java
int sum(int[] a,n){
   if(n=1) return a[0];
   else sum(a,n-1) + a[n-1]        
}
```

The inversion of an array, or rather the order of its elements

```java
void reverse(int[] a,i,j){
   if(i<j) {
        swap(a[i],a[j]);
       reverse(a,i+1,j-1);        
   }
   return;        
}
```The reverse method makes use of linear recursion and makes use of tail recursion, i.e. the recursive call is the last operation performed by the method.

Binary recursion occurs when two recursive calls are made. A classic example is the Fibonacci sequence.

```java
f[0] = 0
f[1] = 1
f[i] = f[i-1] + f[i-2] (per ogni i>1)
```

An example implementation in Java is as follows

```java
int fibonacci(int k){
   if(k<=1) return k;
   else return fibonacci(k-1) + fibonacci(k-2);
}
```
Finally, multiple recursion is but a generalisation of binary recursion, in that it is defined as such when more than two recursive calls are made.

On several occasions during my career I have heard recursion spoken of as and worse than the devil, something extremely complex and dangerous, but the worst damage I have personally seen caused by iterative methods with half a dozen nested loops and guard conditions in while constructs so complex as to be incomprehensible, let alone debuggable.