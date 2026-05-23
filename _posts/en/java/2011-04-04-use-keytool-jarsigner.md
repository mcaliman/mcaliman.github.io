---
layout: post
title: "Use of keytool and jarsigner"
excerpt: "How to use the JDK keytool and jarsigner utilities for signing JARs"
category: Java
date: 2011-04-24
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, en, code]
permalink: /java/use-keytool-jarsigner/
---


To extract a certificate that we already know is on our keyring:

```bash
keytool -export -alias mycompanyalias -file mycompany.crt
```

To sign our `jar` with the above certificate:

```bash
jarsigner mycompany.jar mycompanyalias
```
