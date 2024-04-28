---
layout: post
lang: en
title: "Cool APIs and where to find them: the Objects.toString() method"
excerpt: "Less code to handle null strings. Convert a string if null to an empty string."
modified: 2019-11-03
category: "Java"
tags: ["Programming Languages","Java"]
comments: true
share:  false
search_omit: false
updated: true
revision: 0
---
If you have 'stuff' like this in your code 
```java
string == null ? "" : string;
```
or
```java
if(string== null) string= ```;
```
or, more intelligently, you created a method like
```java
String ifNullThenEmpty(String string) { return string == null ? "" : string;}
```
and maybe even smarter you stuck it all in a Utilities class as a static method...

...Don't worry, I've done it too, it's not a crime, Alan Turing won't come and pull your feet while you sleep, nor will you find James Gosling sleeping on the landing the next morning so he can insult you before you cross the threshold.

If you use a version of Java from Java 7 onwards, you don't need it, even if it's simple, why reinvent the wheel? Has Oracle already prepared it for you? Use it (full stop). 

The `Objects` class contains a method `String toString(Object o, String nullDefault)`
which you can use as `Objects.toString(string,"")` if you statically import it, you can directly write `toString(string,"")`.

Simple, clean, and you don't have to test it; someone has already done it for you.

If you haven't already, take the time to look at the other methods this class offers.