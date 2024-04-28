---
layout: post
lang: en
title: "The toString method of the Object class in Java"
excerpt: "Learn how the toString method works and how to use it correctly"
category: "Java"
tags: ["Programming Languages","Java"]
date: 2023-02-07 05:11:55
comments: true
share:  false
updated: true
revision: 0
---
 
The `toString` method is a fundamental method of the `Object` class in Java. This method returns a textual representation of the object.

To use the `toString` method correctly, it is important to follow some rules. First, the `toString` method must be appropriately overridden in subclasses. Additionally, the textual representation returned by the `toString` method should be clear and useful for understanding the state of the object.

If the `toString` method is not overridden in a subclass, its default implementation in the `Object` class will return a string representing the name of the object's class followed by the `@` symbol and the object's hash code in hexadecimal.

Here is an example of how to override the `toString` method in a subclass:

```java
public class Human {
    private String firstName;
    private String lastName;
    private String passportNumber;

    public Human(String firstName, String lastName, String passportNumber) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.passportNumber = passportNumber;
    }

    @Override
    public String toString() {
        return "Human{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", passportNumber='" + passportNumber + '\'' +
                '}';
    }
}
```

In this example, we have overridden the `toString` method in the `Human` class to return a textual representation of a `Human` object that includes its `firstName`, `lastName`, and `passportNumber` attributes.

Always remember to override the `toString` method, it costs little and can help you with debugging and logging!