---
layout: post
lang: en
title:  "The String.format a printf method for Java"
excerpt: ""
category: "Java"
tags: ["Programming Languages","Java"]
date:   2014-07-13 22:45:33
comments: true
share: true
revision: 0
---
At the time of writing, many have not yet upgraded to either Java version 8 or 7. For those who do not know, JDK version 7 already offers the

```java
String.format(String format, Object... args)
```
A fairly complete implementation of the good old `printf`, it doesn't print itself, but allows us to apply formatting to the string we're going to print via the classic static `print()` and `println()` methods of `System.out`.
 
This alone would be enough to get rid of some of the laziness and possible constraints and upgrade to at least Java version 7.
Let's look at the signatures above, we have the format parameters and the variable list of args arguments representing the variables we'll pass in succession to be formatted. Regarding the format method from the official Oracle documentation we have the following description

```java
%[argument_index$][flags][width][.precision]conversion
```
where the optional argument `argument_index` is an integer indicating the position of the argument in the list itself. 
The first argument is referenced with `1$`, the second with `2$`, and so on, pretty easy and intuitive even if you have no experience in C or C++.

Optional `flags` is also the character set that modifies the output format, the valid flags depend on the value for the `conversion` argument.
width` optional non-negative integer indicates the minimum number of characters to write to the otput.
`precision` non-negative integer is used to limit the number of characters, and the specific behaviour is based on the conversion value.
As visible `conversion` is the only mandatory argument and indicates the formatting depends on the data type.
The mechanism is the same as that used in the C language an example may however clarify things better, the instruction

```java
String.format ( "%,6.2f", 352.100)
```
formats our number as a float (type), the comma as separator of the decimal part and precision as per the given parameterisation.

```java
352,10
```
Of course, this is not limited to numeric data types but also applies to dates and strings.