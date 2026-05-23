---
layout: post
title: "How can you limit inheritance for a class?"
excerpt: "Techniques to restrict class inheritance in Java"
category: Java
date: 2016-11-01
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, oop, en, code]
permalink: /java/can-you-limit-inheritance/
---

One of the questions you might get at an interview or a certification is: How can you limit inheritance for a class?
The commonly accepted answers to this question are:

1. Commenting with `//` or `/* */`
2. By making all constructors `private`.
3. Declaring the class `final`.
4. Declaring all methods `final`.

Number 1: Commenting with `//` or `/* */`
Few people provide this answer, yet you probably use this solution often. It just doesn't seem like an answer to an interview. If it makes you more comfortable, you can give it as the last answer; for me, that's a bonus.

Number 2: Making all constructors `private`
If all constructors are `private`, inheritance does not work. Try compiling these two classes:

```java
public class AClass {
   private AClass(){
   }
}
public class BClass extends AClass {
}
```

and you will receive the following compilation error:

```java
AClass() has private access in AClass
public class BClass extends AClass {
```

Number 3: Making the class `final`
Number 3 is using the `final` keyword; try compiling the two classes modified as follows:

```java
public final class AClass {
   public AClass(){
   }
}
public class BClass extends AClass {
}
```

you will receive the following error:

```java
error: cannot inherit from final AClass
```

Number 4: Making all methods `final`:
Observe the following class redefinitions and try compiling:

```java
public class AClass {
    public AClass() {
    }
    public final void method() {
    }
}
public class BClass extends AClass {
    public BClass() {
        super();
    }
    @Override
    public void method() {
    }
}
```

You will get the following error:

```java
method() in BClass cannot override method() in AClass
    public void method() {
  overridden method is final
```
Be careful, the question is "How can I limit" not "How can I prevent (completely)" inheritance. The solution of adding `final` in front of `class` completely blocks any possibility of inheriting from the class.

Addendum Number 1:
Here are two interpretations:

```
public class BClass /*extends AClass*/ {
    public BClass() {
        super();
    }
    //@Override
    public void method() {
    }
}
```
and
```java
public abstract class AClass {
    public AClass() {
    }
    /*public final void method() {
    }*/
}
```

A little borderline, I admit, but shall we bet that it is the most used?

And that's it for today. As usual, if you have questions or a topic you would like me to cover, feel free to write to me.
