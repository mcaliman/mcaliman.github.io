--- 
layout: post
title: "Operatore null-coalescing del C# in Java"
excerpt: ""
category: "Java"
date:   2017-06-15
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial]
---

> “Un algoritmo deve essere visto per essere creduto.”
> – Donald Knuth

In C# l'operatore `??` è chiamato `operatore null-coalescing`. 
Ecco un esempio di utilizzo:

```csharp
string result = leftHand ?? rightHand ;
```

Restituisce l'operando di sinistra se non è `null`, altrimenti restituisce l'operando di destra.
Una possibile alternativa in Java al `??` del C# è l'uso di `?`, l'operatore ternario, come segue:

```java
String result = leftHand != null ? leftHand : rightHand; 
```

Oppure, utilizzando un metodo come questo:

```java
String nullCoalescingOperator(String leftHand, String rightHand) {
    return leftHand != null ? leftHand : rightHand;
}
```
