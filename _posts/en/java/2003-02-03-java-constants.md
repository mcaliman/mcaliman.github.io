---
layout: post
lang: en
title:  "Java Constants"
excerpt: "Symbolic constants in Java"
category: "Java"
tags: ["Programming Languages","Java"]
permalink: /java/constants/
date:   2003-02-03 22:45:33
comments: true
share: false
---

A variable that never changes value is a constant. In Java, you can explicitly declare a variable as a constant by using the `final` keyword. 

For example:

```java
final int M = 3;
```


The word `final` indicates that the variable M of type `int` cannot change its value to `3`. 
In this case `M` is said to be a constant and not a variable.

Constants are useful for creating more flexible and maintainable applications. They help prevent errors when a numeric or other value needs to be used in multiple places within the code.

As is similarly the case in all programming languages, keywords in the 
Java cannot be used as variable or constant names, so words like `final`, `int` and we will see `while`, `do` and others 
cannot be used as variable or constant names. 

We'll see in future posts that I can use `final` in other contexts as well.