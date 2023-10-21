--- 
layout: post
lang: en
title:  "Variables and assignment commands"
excerpt: ""
category: "Java"
date:   2003-01-02 22:45:33
tags: ["Programming Languages","Java"]
comments: true
share: true
revision: 0
---

Let us first give a sufficiently formal definition for our purposes of a variable:
Definition of variable
A variable a pair consisting of a name, the variable identifier and a value.

```java
T var = value ;
```

Variables in a programme store data that are processed during execution.
During the execution of the programme the variable values are modified (otherwise they would be constants).
Variables are born, live and die; it is our job to take care of them, their life, their visibility (scope).
Let us treat them well,give them a respectable name so that they do not hate us and make us spend sleepless nights.
Before a variable can be used, it must be declared; the declaration of a variable is necessary to reserve a memory space in which to write its value.
of memory in which to write its value, the declaration defines the type of the variable.

```java
T var;
```

where `T` is the type, for example **int** , double and others.
You can have as types, basic types which are not objects, or objects ( `T` becomes a class name). 
Below are some examples of variable declarations:

```java
int x ; double y ;
```

I can also assign a value to the variable:

```java
int x = 5 ; double y = 60 ;
```

The type of the variable values is used to determine how much memory to reserve for the variable, in the case of the int type it is 4 bytes.
If we were to represent the declarations graphicall

```java
int x = 0 ; 
int y = 2 ; 
int z ; 
```

x 0 y 2 z -
where - indicates that z has been declared but not initialised i.e. it has not been assigned a value.

Let us now give a sufficiently formal definition for our purposes of an assignment command.

Definition of an assignment command

An assignment command is an instruction whose purpose is to change the value of a variable.
It also assigns a value to a variable that had only been declared and therefore had an undefined value.

```java
var = expr;
```

Where var the name of the variable and expr an expression whose type is compatible with the type of var.
The command has the effect of replacing the value of the variable whose name appears to the left (left-value) of the equals sign 
with the value appearing on the right.
Expressions are syntactic entities composed of variable names, constants and operation signs 
to determine the order in which the operands are evaluated.

```java
x = 12;
```

assigns the variable x the value 12;

```java
y = (x+1)/2;
```
an example of an expression.

We have talked about variable types so far without giving a formal definition, let's run for cover:

Data Type Definition 

A data type consists of a set of values and a set of operations applicable to those values.

As mentioned earlier the data types in java belong to 2 main categories :

* Primitive types : boolean, byte, short, int, long, float, double, char
* Class types : String etc.

The following table gives for each type of value the operations that can be applied.

* boolean : false and true 
* byte : integers [-27,27-1] ( decimal, octal , hexadecimal) operations : + , - , *, / , %. 
* short : integers [-215, 215-1] ( decimal, octal , hexadecimal operations: + , - , * , / , %. 
* int natural numbers [-231,231-1] ( decimal, octal , hexadecimal) operations: + , - , * , / , %. 
* long natural numbers [-263,263-1] ( decimal, octal , hexadecimal) operations: + , - , * , / , %. 
* float real numbers in 32-bit IEEE754 format fixed and floating point notation: + , - , * , /. 
* double real numbers in 64-bit IEEE754 format fixed and floating point notation:+, -, *, /. 
* char characters, Unicode notation symbols between superscripts no operation. 
* String : Sequence of characters, Unicode notation symbols between double quotes no operation + (concatenation)

The 4 arithmetic operations are represented by the symbols + , - , * , /.

For byte, short, int, long data types, the symbol / represents the quote of the operation.

To insert a superscript or double superscript inside a string you write \' and \" respectively

We also add the symbols for completeness:
  && and logical or conjunction 
  || or logical or disjunction 
  ! not or negation

As already mentioned in the case of an assignment of the type

```java
T var = expr 
```

we said that expr must have compatible type with T (not necessarily the same) useful at this point to give 
the definition of promotion and casting for types that define cases where the type of var and expr may not coincide 
but still be correct and applicable.

Definition
If both the variable type and the expression type represent numeric data and the expr type is a subset 
of the var type before assignment, an automatic conversion called promotion takes place.
For example:

```java
int i ; 
byte j ; 
i = j ;
```
Let us now instead give a definition of casting:

Definition

If the type of var and type of expr have common values (typically TypeOf(expr) subset TypeOf(var)) we can think of the 
explicit conversion called casting i.e.: TypeOf(expr) --> TypeOf(var). This is if the numeric values are correct and compatible.

For example:

```java
int i; 
byte j; 
j = (byte) i;
```
correct only if it is less than or equal to the maximum value available per byte.
