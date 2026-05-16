---
layout: post
title: "Are constructors inheritable?" 
excerpt: "Are constructors inheritable? Can a subclass call the constructor of the parent class?"
category: "Java"
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, en, code]
---
One of the questions that may occur to you at an interview, certification, or a simple test concerning the Java language is the following:
Are constructors inheritable? 
Can a subclass call the constructor of the parent class?

We cannot inherit a constructor. What we can do is create an instance of a subclass using a constructor of the superclass.
Try compiling and executing this code:

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

You will get the following output:

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

You will get the following output:

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

Modify the code as follows:

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
if you run the `main` method of `SubClass` you will get this output:

```java
SuperClass()
SubClass()
SuperClass.method1()
SuperClass(boolean)
SubClass(boolean)
SuperClass.method1()
```

`super()` allows me to control which superclass constructor to call at runtime.

And that's it for today. As usual, if you have questions or a topic you would like me to cover, feel free to write to me.
