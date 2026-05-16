---
layout: post
title:  "The Content is not allowed in prolog error"
excerpt: "Every XML document we work on should be formatted correctly, saved with the right encoding, etc"
category: "Java"
date:   2011-02-27
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, en, code]
---
Every XML document we work on should be formatted correctly, saved with the right encoding, etc.
A classic case is the message "Content is not allowed in prolog" (`SAXParseException`).
You could edit the file by hand with a (hexadecimal) editor and remove "ef bb bf" at the top.
However, since we are using Java, it is much better to use a small workaround of just two lines of code:

```java
Matcher matcher = (Pattern.compile("^([\\W]+)<")).matcher(xmlString.trim());
xmlString = matcher.replaceFirst("<");
```

This is before passing it to our `SAXBuilder` object.

```java
SAXBuilder builder = new SAXBuilder();
Document document = builder.build(new StringReader(xmlString));
```
