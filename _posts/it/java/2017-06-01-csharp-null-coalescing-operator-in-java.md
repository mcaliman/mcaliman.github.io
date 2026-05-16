--- 
layout: post
title: "Operatore null-coalescing del C# in Java"
excerpt: "Come implementare il pattern dell'operatore null-coalescing di C# in Java"
category: "Java"
date:   2017-06-15
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, tutorial, it, code]
---

> “Un algoritmo deve essere visto per essere creduto.”
> – Donald Knuth

In C# l'operatore `??` è chiamato `operatore null-coalescing`. 
Ecco un esempio di utilizzo:

```csharp
string result = leftHand ?? rightHand ;
```

Restituisce l'operando di sinistra se non è `null`, altrimenti restituisce l'operando di destra.
In Java, un'alternativa all'operatore `??` di C# è l'operatore ternario `? :`, utilizzato come segue:

```java
String result = leftHand != null ? leftHand : rightHand; 
```

Oppure, utilizzando un metodo come questo:

```java
String nullCoalescingOperator(String leftHand, String rightHand) {
    return leftHand != null ? leftHand : rightHand;
}
```
