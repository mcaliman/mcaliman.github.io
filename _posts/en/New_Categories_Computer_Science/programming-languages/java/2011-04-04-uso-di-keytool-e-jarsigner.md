---
layout: post
lang: it
title:  "Uso di keytool e jarsigner"
excerpt: ""
category: programming-languages
tags: [English,Java]
date:   2011-04-24 22:45:33
comments: true
share: true
---

Per estrarre un certificato che già sappiamo essere nel nostro portachiavi

```bash
keytool -export -alias mycompanyalias -file mycompany.crt
```

per firmare un nostro `jar` con il certificato sopra

```bash
jarsigner mycompany.jar mycompanyalias
```