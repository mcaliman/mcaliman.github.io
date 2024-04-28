---
layout: post
lang: en
title:  "Let's delve into methods in Java"
excerpt: ""
category: "Java"
date:   2005-01-02 22:45:33
tags: ["Programming Languages","Java"]
permalink: /java/methods/

comments: true
share:  false
revision: 0
---

# Let's delve into methods in Java

In Java, the definition of a method is composed of two parts:

* **The definition**, which defines its interface.
* **The block**, formed by the commands that implement its behavior.

It is not allowed to declare methods within other methods (to the version)

**Method definition**

The setting of a method can be of two types, depending on whether or not the method can return a value:

* **Methods with return:** the setting must specify the type of value returned.
* **Methods without return:** the setting must use the keyword `void`.

The parameters in the setting constitute the **formal parameters** of the method.

**Method call**

A method is activated by making its call. The call must provide the values to be associated with the formal parameters.

**Static methods and dynamic methods**

A static method is executable from the class in which it is defined. A dynamic method is executable by objects that are instantiable from its definition class.

**Constructor methods**

Constructor methods are special methods that are used to instantiate objects. Constructor methods have the following properties:

* They are **public**.
* They have the same name as the class.
* They do not have a return type.

**Example**

```java
class Person {
    public int age;

    public Person(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }
}

public class Main {
    public static void main(String[] args) {
        Person person = new Person(20);

        // Method with return
        int age = person.getAge();
        System.out.println("The person's age is: " + age);

        // Method without return
        person.changeAge(30);
        System.out.println("The person's age is now: " + person.age);
    }
}


**Notes**

* A method with return must always return a value. If it is not necessary to return any value, you can use the keyword `void`.
* A static method can be called without creating an object of the class in which it is defined.
* A dynamic method can only be called after creating an object of the class in which it is defined.