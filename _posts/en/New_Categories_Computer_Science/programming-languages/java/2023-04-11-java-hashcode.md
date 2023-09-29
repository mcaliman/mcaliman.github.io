---
layout: post
lang: en
title: "The hashCode method of the Object class in Java"
excerpt: "Learn how the hashCode method works and how to use it correctly"
category: programming-languages
tags: [English,Java]
date: 2023-04-11 11:25:44
comments: true
share: true
updated: true
---
 
The `hashCode` method is a fundamental method of the `Object` class in Java. This method returns an integer value representing the hash code of the object.

The `hashCode` method is mainly used to improve the performance of hash-based data structures, such as `HashMaps`. When you insert an object into a `HashMap`, its hash code is used to determine the location where the object should be stored in the map.

To use the `hashCode` method correctly, it is important to follow some rules. First, the `hashCode` method must be appropriately overridden in subclasses. Additionally, if two objects are equal according to the `equals` method, then they must return the same hash code value.

Here is an example of how to override the `hashCode` method in a subclass:

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
    public int hashCode() {
        return Objects.hash(firstName, lastName, passportNumber);
    }
}
```

In this example, we have overridden the `hashCode` method in the `Human` class to calculate the hash code of a `Human` object based on its `firstName`, `lastName`, and `passportNumber` attributes.

Always remember to use the `hashCode` method correctly when working with objects in Java!