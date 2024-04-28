---
layout: post
lang: en
title: "The transition from Java EE to Jakarta EE"
excerpt: "What you need to know"
category: "Java"
tags: ["Programming Languages","Java","Java EE","Jakarta EE"]
date: 2023-01-01 05:11:55
modified: 2023-01-01 05:11:55
comments: true
share:  false
updated: true
revision: 0
---


If you are still stuck on the Java EE8 version and have missed the project's evolutions, it might be useful for you to know that in 2017, Oracle decided to completely transfer Java EE to an open source foundation. In coordination with Java EE partners Red Hat and IBM, it was decided to transfer Java EE along with the full reference implementation and the Technology Compatibility Kit (TCK) to the Eclipse Foundation.

The transition from Java EE to Jakarta EE mainly involves changing all Java EE 8 packages in the `javax.*` namespace to `jakarta.*`. Some sub-packages have also been renamed. There is an Apache Tomcat migration tool for Jakarta EE that automatically performs all the necessary changes to migrate an application from Java EE 8 to Jakarta EE 9 by renaming each Java EE 8 package to its Jakarta EE 9 replacement.


