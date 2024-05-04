---
layout: post
lang: en
title: "Working with Strings using Streams and Lambdas."
excerpt: ""
modified: 2022-01-12
category: "Java"
tags: ["Programming Languages","Java"]
comments: true
share: false
search_omit: false
---

Lambdas and steams are not exotic objects to be used in complex algorithms within the reach only of researchers locked away in the labs of a multinational corporation.
Even in the life of the everyday developer, they can make life easier, remember less code and more elegance equals fewer bugs and headaches.
Let us look at a few simple cases involving strings.

```java
String string = ``abc'';
boolean containsAtLeastOneC = string.chars().anyMatch(c -> c == 'b');
System.out.println(containsAtLeastOneC);//print true

boolean allC = string.chars().allMatch(c -> c == 'b');
System.out.println(allC);//print false

boolean noneMatch_a = string.chars().noneMatch(c -> c == 'a');
System.out.println(noneMatch_a);//print false

boolean noneMatch_d = string.chars().noneMatch(c -> c == 'd');
System.out.println(noneMatch_d);//print true
```

Without the lambdas and character streams, which can be obtained via the new chars() method,
you would probably have cycled over the individual characters in the string, checking them one at a time,
or you would have used a regexpr if possible.

Old-school example 

```java
for (int i = 0; i < string.length(); i++) {
    char c = string.charAt(i);
    if (c == 'b') System.out.println("Contains one b");
}
```