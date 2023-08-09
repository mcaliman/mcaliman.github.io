---
layout: post
lang: it
title:  "Come ti swappo due variabili in un colpo solo con Python"
excerpt: ""
category: Python
date:   2014-09-01 22:45:33
tags: [Italian,Python]
comments: true
share: true
---

Vi è mai capitato di scrivere qualcosa del genere ?
```java
swap(x,y) 
```

ma giusto perché se siete maniacali della leggibilità del codice e vi scrivete ogni volta un metodo swap del caso... e non amate annegare in 100+ righe di codice qualcosa come questo

```java
temp = x ;
x= y;
y= temp;
``` 
con Pyhton basta fare 

```python
x,y = y,x, 
``` 

magico no? Il bello delle tuple.
