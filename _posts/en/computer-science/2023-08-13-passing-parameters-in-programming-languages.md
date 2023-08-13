--- 
layout: post
lang: en
title: "Passing Parameters to Methods/Functions/Procedure in Programming Languages"
excerpt: ""
category: "Computer Science"
date:   2023-08-13 22:45:33
modified: 2023-08-13 22:45:33
tags: [English]
comments: true
share: true
---

In a programming language, parameters are variables that are used to pass information into or out of a method (or a function or procedure). There are 2 main ways to pass parameters: **by value** and **by reference**.

# Pass by value

When a parameter is passed by value, the value of the parameter is copied into the method. If the value of the parameter is changed in the method, the change will not be reflected in the value of the original parameter.

For istance, the following pseudocode passes an integer by value to a method:

```
proc foo(by val number)
  number = 10
endproc

number = 5
foo(number)
print(number) # the output is 5
```
In the above pseudocode, the `foo()` method is called with the value `5` as an argument. The value `5` is copied into the `number` variable inside the method. The `number` variable is then set to the value `10`. However, the change in the value of `number` is not reflected in the value of the original `number`. When the `foo()` method terminates, the value of `number` is still `5`.

# Pass by reference

When a parameter is passed by reference, the reference to the parameter is copied into the method. If the value of the parameter is changed in the method, the change will be reflected in the value of the original parameter.

For example, the following pseudocode passes an object by reference to a method:

```pascal
proc foo(by ref person)
  person.name = "Mark"
endproc 

person = Person("Luke")
foo(person)
print(person.name) # Prints Mark
```

In the above pseudocode, the `foo()` method is called with the object `person` as an argument. The reference to the object `person` is copied into the `person` variable inside the method. The `person` variable is then used to change the `name` of the object. The change in the `name` of the object is reflected in the original object. When the `foo()` method terminates, the `name` of the object is still `Mark`.

The type of parameter passing to use depends on the type of parameter and the operation that needs to be performed. If you need to change the value of the parameter in the method, you need to use pass by reference. If you do not need to change the value of the parameter in the method, you can use pass by value.

