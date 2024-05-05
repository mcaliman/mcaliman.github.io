---
layout: post
lang: en
title: How can you limit inheritance for a class?
excerpt: ""
modified: 2016-11-01
category: "Java"
tags: ["Programming Languages","Java"]
comments: true
share: false
---
One of the questions you might get at an interview or a certification or a simple test concerning the Java language is the following:
How can you limit inheritance for a class?
The commonly accepted answers for this question are

1. Commenting with `//` or `/* */`
2. By making all constructors `private`.
3. Rendering the class `final`
4. Rendering all methods `final`

Number 1:Commenting with `//` or `/* */`
Number 1. Few people give it. Yet you probably also use this solution often. It just doesn't seem like an answer to an interview. Wrong. If it makes you more comfortable you can give it as the last answer, for me that's a bonus. Think about it, spoiler: you'll find more at the end of the post.

Number 2:Making all builders `private`
Number 2. is about the fact that if all constructors are `private` the inheritance game doesn't work, try compiling these two classes

```java
public class AClass {
   private AClass(){
   }
}
public class BClass extends AClass {
}
```

and you will get this compilation error

```java
AClass() has private access in AClass
public class BClass extends AClass {
```

Number 3:Making the class `final`
Number 3. is using the `final` keyword, try compiling the two classes seen above modified as follows

```java
public final class AClass {
   public AClass(){
   }
}
public class BClass extends AClass {
}
```

you will get

```java
error: cannot inherit from final AClass
```

Number 4: Making all methods `final`
The fourth and final one is making all methods `final`, observe the following redefinition of the classes seen above and try compiling.

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

You will get the error

```java
method() in BClass cannot override method() in AClass
    public void method() {
  overridden method is final
```
Be careful, the question is "How can I limit" not "How can I prevent (completely)" inheritance. The solution with editing `final` in front of `class` completely blocks any possibility of inheriting from the class.


Addendum Number 1
Here are two interpretations

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

A little borderline I admit, but shall we bet that it is the most used?

And that's it for today as well. As usual if you have a question about this post, want a follow-up or have a topic you would like me to cover in future posts you can write to me.
