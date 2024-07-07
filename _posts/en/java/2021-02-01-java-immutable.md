---
layout: post
lang: en
title: "Immutable classes and objects in Java"
excerpt: ""
modified: 2021-02-01
category: "Java"
tags: ["Programming Languages","Java"]
comments: true
share: false
published: true
---

Immutable objects are instances whose state does not change after they have been initialised. For example `String` is an immutable class, and once instantiated with its value it no longer changes.

```java
public final class Immutable {
    private final int value;
    public Immutable(int value) {
        this.value = value;
    }
    public int getValue() {
        return value;
    }
}
```
What are the advantages of immutability?
Mainly those related to concurrency, in fact it is difficult to guarantee correctness in objects that may change, several threads may attempt to change the state of the same object, leading some threads to see different states depending on the instant they access it, both reading and writing of course.

# Some simple strategies for creating immutable objects

* No setters and getters
* All end fields and private
* Do not allow subclasses to override methods (class final)
* If instance fields include references to mutable objects do not allow those objects to be mutated
* Do not share references to mutable objects !
* Do not provide methods that change the state of the object


```java
    public class Mutable {
    
        private int value;
    
        public Mutable() {
        }
    
        public int getValue() {
            return value;
        }
    
        public void setValue(int value) {
            this.value = value;
        }
    
    }
    
    public final class Immutable1 {
    
        private final Mutable mutable;
    
        public Immutable1(Mutable mutable) {
            this.mutable = new Mutable(mutable.getValue());
        }
    }
```

# Defensive coping

  Most classes are mutable, so how do we approach the problem? By creating a wrapper around the class and using e.g. the clone() method
  
```java
      public class Wrapper {
    
        private final Mutable mutable;
    
        public Wrapper(Mutable mutable) {
            this.mutable = mutable.clone();
        }
    
       //If the caller modifies the object returned by getMutable() this has no effect on the object referred to in Wrapper
        public Mutable getMutable() {
            return mutable.clone();
        }
    }
```
Obviously the original type of the `Mutable` object is different from `Wrapper`, so you can't simply replace one with the other within existing code without making changes.

# Difference between an immutable class and an immutable object.

An immutable class generates immutable objects by definition (by its design) whereas an immutable object is not necessarily instantiated by a class that is also immutable.

An example of an immutable object

```java
    public final class Immutable2 {
    
        private final String text;
    
        public Immutable2(String text) {
            this.text = text;
        }
    
        public String getText() {
            return this.text;
        }
    }
```

or

```java 
    public final class Immutable3 {
    
        private final String text;
    
        private Immutable3(String text) {
            this.text = text;
        }
    
        public String getText() {
            return this.text;
        }
    
        public static Immutable3 create(String text) {
            return new Immutable3(text);
        }
    }
```
    
the standard recipe for an immutable object is in short as follows 

1. all properties must be set in the constructor or in a static init method (see create above)
2. No setters, if needed for some reason they should raise an exception
3. all properties private and final
4. final class 
5. If you refer to mutable objects: use deep copy to pass values to the constructor and to read them through getter methods

the instance is in this way naturally thread safe, which mind you does not mean that the object is nullable itself or any of its properties.