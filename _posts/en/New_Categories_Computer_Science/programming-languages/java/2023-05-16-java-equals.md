---
layout: post
lang: en
title: "The equals() method of the Object class in Java"
excerpt: "Learn how the equals method works and how to use it correctly"
category: programming-languages
tags: [English,Java]
date: 2023-05-16 05:25:44
comments: true
share: true
updated: true
---
The equals method is a fundamental method of the Object class in Java. This method allows you to compare two objects to determine if they are equal.
To use the equals method correctly, it is important to follow some rules. First, the equals method must be appropriately overridden in subclasses. Additionally, the `equals` method must be reflexive, symmetric, transitive and consistent.

The `equals` method must be reflexive, symmetric, transitive and consistent. These properties are called equivalence properties and are important to ensure that the `equals` method works correctly.

- Reflexivity: for any non-null object `x`, `x.equals(x)` must return `true`.
- Symmetry: for any pair of non-null objects `x` and `y`, `x.equals(y)` must return `true` if and only if `y.equals(x)` returns `true`.
- Transitivity: for any triplet of non-null objects `x`, `y`, and `z`, if `x.equals(y)` returns `true` and `y.equals(z)` returns `true`, then `x.equals(z)` must also return `true`.
- Consistency: for any pair of non-null objects `x` and `y`, multiple calls to `x.equals(y)` must consistently return the same value, unless the information used in equality comparisons is modified.

These algebraic properties help ensure that the `equals` method works predictably and consistently when used to compare objects in Java.

Here is an example of how to override the `equals` method in a subclass:

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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Human human = (Human) o;
        return Objects.equals(firstName, human.firstName) &&
                Objects.equals(lastName, human.lastName) &&
                Objects.equals(passportNumber, human.passportNumber);
    }
}

```

In this example, we have overridden the `equals` method in the Human class to compare two Human objects based on their `firstName`, `lastName`, and `passportNumber` attributes.
Always remember to use the equals method correctly when working with objects in Java!

 