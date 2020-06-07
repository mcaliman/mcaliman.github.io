--- 
layout: post
lang: en
title: "C# null-coalescing operator in Java"
excerpt: ""
category: computer-science
date:   2017-06-15 22:45:33
modified: 2017-06-15 22:45:33
tags: [C#,Java]
comments: true
share: true
---
In C# the `??` operator is called the `null-coalescing operator`. 
Here's an example of use:

{% highlight csharp %}
string result = leftHand ?? rightHand ;
{% endhighlight %}

It returns the left-hand operand if it is not `null`, otherwise it returns the right-hand operand.
A possible alternative in Java of C# `??` use `?` , the ternary operator, like this:

{% highlight java %}
String result = leftHand != null ? leftHand : rightHand; 
{% endhighlight %}

Or, by using a method like this:

{% highlight java %}
String nullCoalescingOperator(String leftHand, String rightHand) {
    return leftHand != null ? leftHand : rightHand;
}
{% endhighlight %}