---
layout: post
title:  "How to swap two variables at once with Python"
excerpt: "Swapping two variables in a single statement using Python tuples"
category: Python
permalink: /python/swap-two-variables-once/
date:   2014-09-01
comments: false
share: false
modified: 2024-07-11
published: true
tags: [python, scripting, en, code]
---

Has it ever occurred to you to write something like this?

```java
swap(x,y) 
```

but just because if you are maniacal about code readability and write yourself a random swap method every time... and you don't like to drown in 100+ lines of code something like this

```java
temp = x ;
x= y;
y= temp;
``` 
with Python just do 

```python
x,y = y,x 
``` 

magic, no? The beauty of tuples.
