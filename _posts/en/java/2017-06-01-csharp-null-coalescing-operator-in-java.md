--- 
layout: post
title: "C# null-coalescing operator in Java"
excerpt: ""
category: "Java"
date:   2017-06-15 22:45:33
comments: true
share: false
modified: 2024-07-11
published: true
---

> “An algorithm must be seen to be believed.”
> – Donald Knuth

In C# the `??` operator is called the `null-coalescing operator`. 
Here's an example of use:

```csharp
string result = leftHand ?? rightHand ;
```

It returns the left-hand operand if it is not `null`, otherwise it returns the right-hand operand.
A possible alternative in Java of C# `??` use `?` , the ternary operator, like this:

```java
String result = leftHand != null ? leftHand : rightHand; 
```

Or, by using a method like this:

```java
String nullCoalescingOperator(String leftHand, String rightHand) {
    return leftHand != null ? leftHand : rightHand;
}
```