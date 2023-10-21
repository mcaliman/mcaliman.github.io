---
layout: post
lang: en
title:  "Use of keytool and jarsigner"
excerpt: ""
category: "Java"
tags: ["Programming Languages","Java"]
date:   2011-04-24 22:45:33
comments: true
share: true
revision: 0
---

To extract a certificate that we already know is on our keyring

```bash
keytool -export -alias mycompanyalias -file mycompany.crt
```

to sign our `jar` with the above certificate

```bash
jarsigner mycompany.jar mycompanyalias
```