---
layout: post
lang: en
title: "Can we execute code before the main(String[]) method ?"
excerpt: ""
modified: 2016-11-03
category: "Programming Languages"
tags: [Java]
comments: true
share: true
search_omit: false
updated: true
revision: 0
---
One of the questions you might get at an interview or certification or a simple test concerning the Java language is the following:
Can we execute code before the `main(String[])` method?

The answer is yes. If we use a static block of code in the class. The code in the `static` block is executed before the object itself is created. 

All the declarations inside this `static` block will only be executed once when the class is loaded, so before the object is created in the main method.

Compile and run the following code.

```java
public class AClass {
    public AClass() {
        System.out.println("call costuctor AClass()");
    }
    public void method1() {
        System.out.println("call method1");
    }
    public static void main(String[] args) {
        AClass instance = new AClass();
        instance.method1();
    }
}
```

you will get the following output

```java
call costuctor AClass()
call method1
```

Now change the code as follows

```java
public class AClass {
    static {
        System.out.println("call static block");
    }
    public AClass() {
        System.out.println("call costuctor AClass()");
    }
    public void method1() {
        System.out.println("call method1");
    }
    public static void main(String[] args) {
        AClass instance = new AClass();
        instance.method1();
    }
}
```

you obtain the following output

```java
call static block
call costuctor AClass()
call method1
```

As you can see, the code in `static { }` was executed even before the constructor itself, so when no instance of the class existed yet.

Still a variation of the code just above, the changes are limited to the `main` method, so I'll just quote that

```java
    public static void main(String[] args) {
        AClass instance = new AClass();
        instance.method1();
        
        AClass instanceBis = new AClass();
        instanceBis.method1();
    }
```
and the output produced

```java
call static block
call costuctor AClass()
call method1
call costuctor AClass()
call method1
```

Again, although two instances of the `AClass` class have been created, the execution of the `static` block is limited to a single occurrence first when the class is loaded.
And that's all for today. As usual, if you have a question about this post, want a more in-depth discussion, or have a topic that you would like me to cover in future posts, you can write to me.