---
layout: post
title:  "Use of keytool and jarsigner"
excerpt: ""
category: "Java"
permalink: /java/jdk/jarsigner/keytool/
date:   2011-04-24
comments: true
share: false
modified: 2024-07-11
published: true
---

To extract a certificate that we already know is on our keyring

```bash
keytool -export -alias mycompanyalias -file mycompany.crt
```

to sign our `jar` with the above certificate

```bash
jarsigner mycompany.jar mycompanyalias
```