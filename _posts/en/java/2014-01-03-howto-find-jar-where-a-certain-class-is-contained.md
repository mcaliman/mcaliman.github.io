---
layout: post
title:  "How to find jar file where a certain class is contained (deployed in GlassFish)."
excerpt: "Locating the JAR file containing a specific class deployed in GlassFish"
category: "Java"
permalink: /java/find-jar-file-where/
date:   2014-01-03
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, oop, en]
---

> The Greeks used to say of an uncultured person: 'He can neither read nor swim'; today we should add: 'nor use a computer'.
>
> <cite>Primo Levi and Tullio Regge, Dialogue, 1984</cite>

You can locate the jar for the `Base64` class (for example) with the code.

```java
System.out.println(Base64.class.getProtectionDomain().getCodeSource().getLocation());
```

