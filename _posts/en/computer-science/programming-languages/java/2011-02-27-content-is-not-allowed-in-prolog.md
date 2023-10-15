---
layout: post
lang: en
title:  "The Content is not allowed in prolog error"
excerpt: ""
category: programming-languages
tags: [Java]
date:   2011-02-27 22:45:33
comments: true
share: true
---
Every XML document we work on should be formatted correctly, saved with the right encoding, etc.
A classic case is the message "Content is not allowed in prolog" (`SAXParseException`).
Let's edit the file by hand with a (hexadecimal) editor and remove "ef bb bf" at the top.
Since we are using Java much better to put a small work-around of just two lines of code :

```java
Matcher matcher = (Pattern.compile("^([\\W]+)<")).matcher( xmlString.trim() );
xmlString = matcher.replaceFirst("<");
```

This is before passing it to our `SAXBuilder` object.

```java
SAXBuilder builder = new SAXBuilder();
Document document = builder.build(new StringReader(xmlString));
```