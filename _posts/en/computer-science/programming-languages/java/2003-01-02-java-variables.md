--- 
layout: post
lang: en
title:  "Variables and assignment commands"
excerpt: ""
category: programming-languages
date:   2003-01-02 22:45:33
tags: [English,Java]
comments: true
share: true
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

Per i tipi di dato byte, short, int, long il simbolo / rappresenta il quoto dell' operazione

Per inserire un apice o un doppio apice dentro una stringa si scrive \' e \" rispettivamente

Aggiungiamo anche per completezza anche i simboli:
  && and logico o congiunzione 
  || or logico o disgiunzione 
  !  not o negazione

Come gi accennato nel caso di una assegnazione del tipo 

```java
T var = expr 
```

abbiamo detto che expr deve avere tipo compatibile con T (non necessariamente lo stesso)  utile a questo punto dare 
la definizione di promozione e casting per tipi che definiscono i casi in cui il tipo di var e expr possono non coincidere 
ma essere comunque corretti e applicabili.

Definizione
Qualora tanto il tipo della variabile quanto il tipo dell' espressione rappresentino dati numerici e il tipo di expr  sottoinsieme 
del tipo di var prima dell' assegnazione avviene una conversione automatica detta promozione.
Per esempio:

```java
int i ; 
byte j ; 
i = j ;
```

Diamo ora invece una definizione di casting:

Definizione

Se il tipo di var e tipo di expr prevedono valori comuni ( tipicamente TypeOf (expr ) sottoinsieme TypeOf (var)) si pu pensare la 
conversione esplicita detta casting cio : TypeOf(expr) --> TypeOf(var). Questo se i valori numerici sono corretti e compatibili.

Per esempio:

```java
int i; 
byte j; 
j = (byte) i;
```
corretto solo se `i`  minore o uguasle del valore massimo disponibile per byte.
