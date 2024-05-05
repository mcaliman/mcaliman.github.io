---
layout: post
lang: en
title:  "Classes and methods in Java"
excerpt: "Defining classes in Java: access modifiers, class and instance entities"
category: "Java"
date:   2004-01-02 22:45:33
tags: ["Programming Languages","Java"]
permalink: /java/classes/
comments: true
share: false
--- 
Classes and methods are the fundamental elements of object-oriented programming. They enable data to be encapsulated and access to data to be restricted.

# Class definition

A class is a model of entities that have the same structure and share the same properties and functionality.

# Object definition

An object is an entity that corresponds to a class and can be generated through a process called instantiation. The information contained in an object can be manipulated using the procedures defined in the referenced class.

# Method Definition

A method is an operation that can be performed by an object. It represents the procedure that implements a specific functionality of the class or its instance.

The definition of a class does not necessarily involve the creation of objects. It simply describes the structure of information and the relationships between them, as well as the operations that can be performed on that information.

# Defining classes in Java

In Java, classes are defined using the class construct. Each class includes the definition of attributes (constants and variables) and methods.

The skeleton of a code to define a class is as follows:
```java
class T {
// ...
}
```
Declaration blocks are just placeholders to highlight the structure of the content between the brackets `{`, `}`. `class` is a reserved word in the language.

All declarations in classes, constants, variables and methods, can be characterised by the `public` modifier to make them accessible from outside the class, or they can be specified `private` to restrict their visibility and access to the defining class.

An intermediate level is `protected`, the purpose of which will be clarified later, after we have mastered the rudiments of object-oriented programming, particularly inheritance.

# Access Modifiers

The access modifiers `public`, `private` and `protected` define the visibility of a declaration within a class.

`public`: the declaration is accessible from any class.
private`: the declaration is accessible only from the class in which it is defined.
protected`: the declaration is accessible from classes derived from the class in which it is defined.

# Class and instance entities

Class entities are those that are common to all objects instantiated by the class. Instance entities are those that are specific to each object instantiated by the class.


Examples

```java
Java
// Class Entity
class T {
    static int x = 10;
}
```

```java
// Instance Entity
class T {
    int x = 10;
}
```

# Conclusion

In this article, we have seen how to define classes in Java. We have also seen how to use access modifiers to control the visibility of declarations within a class. Finally, we have seen the difference between class and instance entities.