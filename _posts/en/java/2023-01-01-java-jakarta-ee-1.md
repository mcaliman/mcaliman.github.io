---
layout: post
title: "The transition from Java EE to Jakarta EE"
excerpt: "What you need to know"
category: "Java"
date: 2023-01-01
comments: true
share: false
modified: 2024-07-11
published: true
last_review: 2026-04-19
tags: [java, jakarta-ee, en]
---

If you are still stuck on Java EE 8 and missed the project's evolution, it is important to note that in 2017, Oracle [transitioned Java EE](https://www.eclipse.org/org/press-release/java-ee-moving-to-eclipse-foundation.php) to the [Eclipse Foundation](https://www.eclipse.org). This move, coordinated with partners Red Hat and IBM, included the full reference implementation and the Technology Compatibility Kit (TCK).

The shift to [Jakarta EE](https://jakarta.ee/) involves a critical breaking change: migrating all packages from the `javax.*` namespace to `jakarta.*` (necessary because Oracle retained the "Java" trademark). Some sub-packages were also renamed. To simplify this, you can use the [Apache Tomcat migration tool for Jakarta EE](https://github.com/apache/tomcat-jakartaee-migration), which automatically renames Java EE 8 packages to their Jakarta EE 9+ replacements.

