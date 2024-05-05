---
layout: post
lang: en
title: "Are constructors inheritable?" 
excerpt: "Are constructors inheritable? Can a subclass call the constructor of the parent class?"
modified: 2016-11-02
category: "Java"
tags: ["Programming Languages","Java"]
comments: true
share: false
search_omit: false
---
One of the questions that may occur to you at an interview or certification or a simple test concerning the Java language is the following:
Are constructors inheritable? 
Can a subclass call the constructor of the parent class?

We cannot inherit a constructor. What we can do is create an instance of a subclass using a constructor of the superclass.
Try compiling and executing this code

```java
public class SuperClass {
    public SuperClass() {
        System.out.println("SuperClass()");
    }
    public void method1() {
        System.out.println("SuperClass.method1()");
    }
}

public class SubClass extends SuperClass {
    public SubClass() {
        System.out.println("SubClass()");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();
    }
}
```
You will get the following output 

```java
SuperClass()
SubClass()
SuperClass.method1()
```

The constructor of the superclass was implicitly called before that of the subclass. However, the constructor is not inherited, it has only been called; if it were inherited, I could change its behaviour by overriding it, and this would destroy the encapsulation capability of the language.
In other words, you cannot make the call to the parent constructor not be made.
Modifica il codice così

```java

public class SubClass extends SuperClass {
    public SubClass() {
        System.out.println("SubClass()");
    }
    public SubClass(boolean b) {
        System.out.println("SubClass(boolean)");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();
        
        SubClass instance2 = new SubClass(true);
        instance2.method1();
    }
}
```

You will get the following output 

```java
SuperClass()
SubClass()
SuperClass.method1()
SuperClass()
SubClass(boolean)
SuperClass.method1()
```

The code you have just seen is equivalent to this

```java
public class SubClass extends SuperClass {
    public SubClass() {
        super();
        System.out.println("SubClass()");
    }
    public SubClass(boolean b) {
        super();
        System.out.println("SubClass(boolean)");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();

        SubClass instance2 = new SubClass(true);
        instance2.method1();
    }
}
```
which produces the same output. It doesn't matter whether or not you insert the `super()` call which calls the superclass constructor, `super()` will be called anyway.

The existence of `super()` is justified by the fact that your superclass may have multiple constructors, and using `super()` is the only way to enforce which of them will be called.

Modify the code like this

```java
public class SuperClass {
    public SuperClass() {
        System.out.println("SuperClass()");
    }
    public SuperClass(boolean b) {
        System.out.println("SuperClass(boolean)");
    }
    public void method1() {
        System.out.println("SuperClass.method1()");
    }
    public static void main(String[] args) {
        SuperClass instance = new SuperClass();
        instance.method1();
    }
}
public class SubClass extends SuperClass {
    public SubClass() {
        super();
        System.out.println("SubClass()");
    }
    public SubClass(boolean b) {
        super(b);
        System.out.println("SubClass(boolean)");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();
        SubClass instance2 = new SubClass(true);
        instance2.method1();
    }
}
```
if you run the `main` method of `SubClass` you will get this output

```java
SuperClass()
SubClass()
SuperClass.method1()
SuperClass(boolean)
SubClass(boolean)
SuperClass.method1()
```

`super()` allows me to control which superclass constructor to call at runtime.

And that's it for today, too. As usual if you have a question about this post, want a more in-depth discussion, or have a topic you'd like me to cover in future posts you can write to me.