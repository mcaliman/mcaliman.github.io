---
layout: post
lang: en
title:  "Passing parameters in Java"
excerpt: ""
category: programming-languages
date:   2006-01-05 22:45:33
tags: [Java]
comments: true
share: true
---

In the most general form, a method is characterized by one or more formal parameters.

```java
T1 p1, T2 p2, Tn pn
```

For example, the following line defines four formal parameters:

```java
int a, double b, long c, String d
```

These parameters define the identifiers of the entities on which the method is called to operate. In order for the method to perform its computation, it is necessary that, at the time of its activation, the formal parameters are associated with the actual parameters to which the computation must be actually applied.

These values constitute the actual parameters of the method.

Programming languages typically provide two modes of binding between the actual and formal parameters:

* **Pass-by-value**
* **Pass-by-reference**

**Pass-by-value**

With pass-by-value, the formal parameter of a method identifies a local memory location in the called method, into which the value of the corresponding actual parameter is copied. In this way, the method works on a copy of the value of the actual parameter.

It follows that any modification made to the formal parameter remains localized in the method of relevance and cannot be exported to the calling environment. This means that every time you pass a parameter, for example an integer `int a` of value 10, and then change its value to 11 during the internal computation of the method, upon returning from the call, its value will return to 10.

```java
// Declaration and implementation of the method m1 that we will use for the example.
private void m1(int value) {
  value = 11;
  System.out.println("Here the value of any passed parameter is 11: value='" + value + "'");
}
// Other
int a = 10;
m1(a);
System.out.println("a still has the value 10: a=" + a);
```

**Pass-by-reference**

In this case, the formal parameter of a method identifies the address of allocation of the corresponding actual parameter, which must be a variable. The method is therefore called to operate directly on the variable allocated in the context of the caller, therefore any modification made by the method to the formal parameter is exported, impacting the corresponding actual parameter.

Formally, Java applies pass-by-value to all methods, but if the parameter is an array or an object, the result is similar to that obtained with pass-by-reference, in fact in this case the copied parameter is the address of the array or object in question. Therefore, the modifications made to an array or object by a method are reflected in the context of the caller. It is not possible, however, to export an object or array of new creation from a method except with the return command.


