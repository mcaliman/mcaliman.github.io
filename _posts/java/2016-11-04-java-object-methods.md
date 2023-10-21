---
layout: post
lang: en
title: "What are the methods of the Object class?"
excerpt: 
modified: 2016-11-04
category: "Java"
tags: ["Programming Languages","Java"]
comments: true
share: true
search_omit: false
updated: true
revision: 0
---




One of the questions you may be asked at an interview or certification or a simple test concerning the Java language is the following:
What are the methods of the `Object` class?


`clone()` - This method helps us create and return a copy of the object on which the method is called.
equals()` - Helps us make a comparison 
`finalize()` - Called by the garbage collector on an object when it is being finalised
`getClass()` - Returns the class at runtime of the object.
hashCode()` - Returns the hash code value for the object.
`toString()` - returns a string representation of the object.
`notify()`, `notifyAll()`, and `wait()` - Helps synchronize the activities of independently running threads in the program 


If you look at this code

```java
public class TClass extends Object {


    public TClass() {
        System.out.println("call costructor TClass()!");
    }


    public static void main(String[] args) {
        TClass instance = new TClass();
    }
}
```


You'll notice that the class extends `Object`; there is no need to make this relationship explicit since all objects are derived from `Object`. Our object class `TClass` inherits the default implementation of the methods listed above. In most cases the default implementation is insufficient if not completely useless; in some cases the implementation is not present.


This is the code for the `Object` class, for brevity I've removed most of the javadoc

```java
/*
 * Copyright (c) 1994, 2012, Oracle and/or its affiliates. All rights reserved.
 * ORACLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package java.lang;


public class Object {


    private static native void registerNatives();
    static {
        registerNatives();
    }


    public final native Class<?> getClass();
    public native int hashCode();
    public boolean equals(Object obj) {
        return (this == obj);
    }
    protected native Object clone() throws CloneNotSupportedException;
    public String toString() {
        return getClass().getName() + "@" + Integer.toHexString(hashCode());
    }
    public final native void notify();
    public final native void notifyAll();
    public final native void wait(long timeout) throws InterruptedException;
    public final void wait(long timeout, int nanos) throws InterruptedException {
        if (timeout < 0) {
            throw new IllegalArgumentException("timeout value is negative");
        }
        if (nanos < 0 || nanos > 999999) {
            throw new IllegalArgumentException(
                                "nanosecond timeout value out of range");
        }


        if (nanos > 0) {
            timeout++;
        }


        wait(timeout);
    }
    public final void wait() throws InterruptedException {
        wait(0);
    }


    protected void finalize() throws Throwable { }
}
```

At a quick glance we can say that

```java
public final native Class<?> getClass();
```
has an `native` implementation, it is `final` and so you can't override it, the reasons are obvious, think what it would mean from a security point of view if you could do that.

By contrast `hashCode`, also `native`, provides an implementation but you can override it and create your own mechanism for generating the hash code

```java
public native int hashCode();
```


The `equals()` method

```java 
public boolean equals(Object obj) {
        return (this == obj);
 }
```

provides a very simple default implementation, it checks if the object is the same or not (not if its properties have the same values, which is much more useful, but that's normal, it's up to us to implement such behaviour, it's not necessarily the case that two objects are the same only if they have the same attributes).


As for `clone()` instead 

```java
protected native Object clone() throws CloneNotSupportedException;
```

we immediately notice that the method has to be handled, for example if we want to use the default native implementation we have to make our class implement the `Cloneable` interface.

```java
public class TClass implements Cloneable {
```

since all classes extend `Object` we have omitted `extends Object`
The `toString()` method is one of my favourites, if handled properly it makes development and testing convenient

```java

 public String toString() {
        return getClass().getName() + "@" + Integer.toHexString(hashCode());
    }
```

It is evident that its default implementation is trivial.


The `notify()`, `notifyAll()`, `wait()` methods in their different overloaded versions deserve a separate treatment.


The `finalize()` method has an empty implementation

```java
protected void finalize() throws Throwable { }
```

Beware, you are unlikely to override `finalize()`, and it is the JVM or rather the GC that decides whether and how much to call it anyway.