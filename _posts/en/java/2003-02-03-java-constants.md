---
layout: post
title: "Java Constants"
excerpt: "Symbolic constants in Java"
category: Java
date: 2003-02-03
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, en, code]
permalink: /java/constants/
---


A variable that never changes value is a constant. In Java, you can explicitly declare a variable as a constant by using the `final` keyword. 

For example:

```java
final int M = 3;
```

The word `final` indicates that the variable M of type `int` cannot change its value to `3`. 
In this case `M` is said to be a constant and not a variable.

Constants are useful for creating more flexible and maintainable applications. They help prevent errors when a numeric or other value needs to be used in multiple places within the code.

As is the case in all programming languages, keywords in Java cannot be used as variable or constant names. Therefore, words like `final`, `int`, and as we will see, `while`, `do`, and others cannot be used. 

We'll see in future posts that I can use `final` in other contexts as well.
