---
layout: post
lang: en
title:  "How to swap two variables at once with Python"
excerpt: ""
category: "Python"
tags: ["Programming Languages","Python"]
date:   2014-09-01 22:45:33
comments: true
share: true
revision: 0
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
with Pyhton just do 

```python
x,y = y,x, 
``` 

magic, no? The beauty of tuples.