--- 
layout: post
lang: en
title:  "Java Array"
excerpt: "Arrays are available in most programming languages because they realise 
the simplest organisation of complex data structures"
category: "Java"
date:   2003-03-01 22:45:33
tags: ["Programming Languages","Java"]
permalink: /java/array/
comments: true
share: false
---


Arrays are available in most programming languages because they realise 
the simplest organisation of complex data structures.

# Declaration and allocation

Let us begin with some definitions that are a little more formal but which will be useful to fix the essential concepts.

Definition 
An array is a data structure that allows sequences of data of the same type to be represented. 
The elements that make up an array can be found by specifying their position.

Translated with www.DeepL.com/Translator (free version)

```java
T[] var = new T[n];
```

defines an array of name `var` and type `T` of `n` elements, the elements of the array are

```java
var[0], var[1], ... , var[n-1]
```

`n` also called the size or length of the array;

initialisation of elements at the same time as definition is also possible

```java
T[] var = {values_0,value_1, ... ,value_n}
```

Hence, we have the values of the individual elements equal to

```java
var[0] = value_0 ;var[1] = value_1 ;...var[n] = value_n ;
```

Otherwise, the declaration may take place in 2 stages

```java
T[] var; var = new T[n] ;
```
or

```java
var = new T[] { value_0,value_1, ..., value_n }
```

each element of the array can be used in the same way as a variable

given the array var { value_0,value_1, ... , value_n }

```java
var[0] = value_0 ; var[1] = value_1 ;
```

I can modify the second element of the array, i.e. var[1] with value new_value_1 with the instruction

```java
var[1] = new_value_1 ;
```

transforming var into { value_0,new_value_1, ... , value_n }

I can assign to a variable x of type compatible with T the i-th value of var simply like this

```java
T x = var[i] ;
```

in this way x has the i-th value of the array var , obviously i must have a value 
between 0 and var.lenght0-1 representing the length of the array var.

# Multidimensional arrays

The arrays seen so far are one-dimensional, i.e. they are linear sequences of data 
that are homogeneous and can be associated with a vector model. In reality, we can also have multidimensional arrays in which each 
element identified not by a single index but by a larger number of indexes.

for instance

```java
T[][] var = new var [n][m];
```


the considerations made above for one-dimensional types apply, 
to initialise the position value or coordinate i,j I can write

```java
var[i][j] = a_value ;
```

For smart initialisation, however, I can also do

```java
T[][] var = { {value_0, value_1, ... , value_n} , { value_0, value_1, ... , value_m } }
```

