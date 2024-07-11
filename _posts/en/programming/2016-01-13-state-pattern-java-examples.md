---
layout: post
title: "Design Patterns State"
excerpt: "Features and sample Java code reduced to the essentials"
category: Programming
comments: true
share: false
modified: 2024-07-11
published: true
---

You can find an example project on github at this address:
[**https://github.com/mcaliman/JavaPatternsCollection**](https://github.com/mcaliman/JavaPatternsCollection)

Some information on this pattern.

It is a behavioural design pattern (Behavioural patterns provide solutions to the most common 
types of interaction between objects)

It is used when an object must change its behaviour (at **run-time**) according to its internal state.

Avoid using **if-else** conditional block sequences ( [AntiIF Campaign](http://antiifcampaign.com/) )

It provides a systematic and **lose-coupled** way to achieve this.

It consists of a `State` interface, a concrete class `Context` and one or more concrete classes implementing 
the `State` interface.

* `Context` defines the client class interface and holds a reference to a `ConcreteState`.
* `State` defines the interface implemented by `ConcreteState`.
* `ConcreteState` classes encapsulate the logic of the behaviour associated with a given state.

Let's see how it works with a brief example on github
and the code of which I give in this post. 

First we define the interface, it only needs to have an execute method.

```java
public interface State {
   public void execute();
}
```
We want to implement a content management system with three states: **draft**, **published** and **deleted**. 

Our test application may have three buttons to perform the respective actions.

The solution that adopts the State design pattern is one that implements as many concrete `State` classes 
as there are states.

```java
public class DarftState implements State {
   
   @Override
   public void execute() {        
      //stuff...
   }
}
```

Let's create the `Context` class, which must have a reference to an object of type `State`. 
An object of type `Context` will need to have a mechanism for changing the `state` attribute and 
a method that propagates the action performed by the execute method to it.

```java
public class Context {
   private State state;
   public void setState(State state) {
      this.state = state;
   }
   public State getState() {
      return this.state;
   }
   @Override
   public void execute() {
      this.state.execute();
   }
}
```

The `Context` class in our case could also be called Post and contain multiple attributes and methods, 
e.g. containing the reference to the record or content entity whose lifecycle we want to manage.
For the other states I refer you to the code on github whose references are at the top of this post.
Finally, an example of use that changes the state of our object three times.

```java
Context context = new Context();
State darftState = new DarftState();
State publishState = new PublishState();
State deletedState = new DeletedState();

context.setState(darftState);
context.execute();

context.setState(publishState);
context.execute();

context.setState(deletedState);
context.execute();
```
If a new behaviour or state is to be added, we must design a 
new class that implements `State`.

What disadvantages can there be in adopting this pattern? 
It obviously increases the number of classes, but this is preferable in most cases
to a single class with long sequences of conditional `if` (or `switch`) statements. 
A not inconsiderable advantage: in a team of developers
writing individual `ConcreteStates` can be assigned and managed easily compared to the alternative of  
getting your hands on two or more of the same class.