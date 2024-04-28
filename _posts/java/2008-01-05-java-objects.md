---
layout: post
lang: en
title:  "Objects in Java"
excerpt: ""
category: "Java"
date:   2008-01-05 22:45:33
tags: ["Programming Languages","Java"]
permalink: /java/objects/
comments: true
share:  false
revision: 0
---

From each class it is possible to obtain one or more entities through the instance, each of which constitutes one
copy of the data structure described by the class in its dynamic components and of which it shares the information access methods.

Definition
An object creates a class instance whose data structure it reflects and shares methods.

The instantiation of multiple objects of the same class therefore involves the duplication of the same data structure, even though they represent differentiated information.
To this end, each object must include a copy of the attributes defined in its relevant class as instance attributes;
have dynamic methods derived from those classes; have guaranteed access to all the static components of the class;
constitute a closed entity whose attributes cannot be accessed except through the object's own methods.
The last descriptive property highlights a further aspect that characterizes objects, that of constituting completely isolated entities
defined in its own semantics and completely autonomous from a computational point of view.

```java
class T {
   TA1 var ;
   static TB1 glbB1;
   void mAk(){
   //stuff!
   }
   static void mBk(){
   //stuff!
   }
}
```

Suppose that objects obj1 and obj2 of class T are instantiated.
Both the obj1 object and the obj2 object have a local copy of the var instance attributes and the mAk() dynamic methods.
However, they do not have their own copies of the gblBk class attributes and the mBk() methods as they are qualified as static.
However, they can refer directly to these entities which are specific to class T since they constitute instances of it.
All objects that you intend to use in a program must be declared.
The declaration of the identifiers (also called references) of the objects of a class is similar to the usual variable declarations.
It consists in specifying the class of reference which then becomes the type, followed by the list of objects identifying them

```java
T obj1, obj2,...,objN;
```

Once objects are declared, they must be instantiated and initialized. Instantiating an object consists of creating it in memory,
and more precisely in the heap, of an entity containing a copy of the instance variables and dynamic methods of the relevant class.
Definition (of heap) The heap constitutes that part of the memory that is reserved for containing the dynamic data of the programs.
In current systems, the memory reserved for each application is divided into a static part, a stack and a heap.
The allocation made by the new operator applied to the class constructor is the address of the allocated entity assigned
to the object identifier.

```java
obj = new T();
```

obviously I can do everything in one go.

```java
T obj = new T();
```

declared and instantiated et voil!

#Messages, messages and more messages.

Classes and objects constitute an execution environment for the computational processes described by their methods.
The main problem of OOP lies in the need to trigger in these entities the computations that are required by the application.
This objective is achieved by creating an exclusive support based on the exchange of messages, in the context of which the object must be considered
like an entity capable of: forwarding messages to other objects; receive messages and process those messages using its own methods.

Definition
A message constitutes the request to activate a method specific to an object or class,
to be carried out on an appropriate set of information communicated to the recipient entity.

Forwarding a message requires the specific destination of the message to be concatenated with the identifier of the method to be activated
equipped with the appropriate current parameters.
We underline the fact that messages can be forwarded to the classes for the activation of static methods,
while messages can be forwarded to objects for the execution of dynamic methods.

In both cases the syntax is similar:

```java
T.m1();
obj.m2();
```

Once the requested method has been completed, the entity receiving the message can return any data provided to the sender object
from the computation of the method. It seems superfluous to point out that the exchange of messages provides the means through which objects of
different classes are put in a position to interact with each other. It allows the relevant classes to present themselves as interacting models,
whose overall architecture can contribute to the definition of models characterized by a greater level of complexity.

The transfer of information between objects achieved in Java by exchanging messages.
Do I call methods (possibly passing them other objects as formal parameters) on objects (possibly returning values ​​that are other objects)?
exchange messages between objects..

These include the activation, in the recipient object, of the method specified by the message and the possible export to the sender object
of the results of carrying out these methods. As we have seen, the passing of parameters is always foreseen by the Java programming language
by value and this means that the values ​​of the formal parameters at the time of activation of a method are lost when the method completes the
its execution. Any export of information from a method can therefore occur exclusively via the return command.

This behavior perfectly adheres to the semantics of passing by value when a parameter consists of a primitive data type.
If the parameter consists of an object (or an array, which constitutes a special case) the passage by value however presents
collateral effects (or side effects) which make it in some respects similar to passing by address. This is a consequence of the way Java
allocates objects: the creation of an object in fact causes the allocation of a relevant class in the heap. This instance made accessible
via an address identifier called handle (or reference) that is associated with the instantiated object.
When an object is passed as a parameter to a method, only the value of its handle is copied into the formal parameter and so on
allows the method to modify the contents of the object itself, making those changes permanent, regardless of whether at that point
 the value of the formal parameter is destroyed.
It is clear how wrong it is to create a new object instance within the method and assign it to the formal parameter: the handle would in fact
removed when returning control to the calling module, this requires the return command.

Translated into code

```java
T p = new T();
void m(T p){
    p = new T(); //Why?
}
```

let's decline our generic example into a more practical one using the String class (which apparently serves to work on strings, now that
we have some more theoretical tools we can start working with real objects) let's hypothetically suppose we have a String object p like this
declared and instantiated

```java
String p = new String("You can't fool Mr. Handle!");
```
and that you have defined a method m as reported below.

```java
void m(String p){
   p = new String("damn mr.handle!");
}
```

and let's consider the following block of code

```java
String p = new String("You can't fool Mr. Handle!");
System.out.println(p);
m(p);
System.out.println(p);
```
on our console we would see "don't care mr.handle!" printed twice. Now let's see how we could solve it
the problem with using the return command. First we should have changed the signature of our m() method so that
could return a value of the type compatible with the formal parameter. So we would no longer have void as the return type but T.

Let's see the new version of the m method that is right for us.

```java
T m(T p){
   p = new T(); 
   return p;
   
}
```
and the new way of use
```java
T p = new T();
p = m(p);
```



```java

String m(String p){
   p = new String("damn mr.handle!");
   return p;
}


String p = new String("You can't fool Mr. Handle!");
System.out.println(p);
//print You can't fool Mr. Handle!
p = m(p);
System.out.println(p);
//print damn mr.handle!
```

Writing a method in these ways to modify the value of a string is not very sensible or clean if we want, but
it made us understand something more about some fundamental concepts.

