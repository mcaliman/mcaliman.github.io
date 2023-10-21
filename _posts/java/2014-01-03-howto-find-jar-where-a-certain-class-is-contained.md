---
layout: post
lang: en
title:  "How to find jar file where a certain class is contained (deployed in GlassFish)."
excerpt: ""
category: "Programming Languages"
tags: [Java]
date:   2014-01-03 22:45:33
comments: true
share: true
revision: 0
---

> The Greeks used to say of an uncultured person: 'He can neither read nor swim'; today we should add: 'nor use a computer'.
>
> <cite>Primo Levi and Tullio Regge, Dialogue, 1984</cite>

you can locate the jar for the `Base64` class (for example) with the code.

```java
System.out.println(Base64.class.getProtectionDomain().getCodeSource().getLocation());
```

