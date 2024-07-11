---
layout: post
title:  "Alphabets, Symbols, Strings and Languages"
excerpt: "What are alphabets, symbols and strings from the point of view of theoretical computer science"
category: Programming
date:   2018-03-20 22:45:33
comments: true
share: false
modified: 2024-07-11
published: true
---

> Kleeneliness is next to Gödeliness  

What is meant by the term `alphabet` in theoretical computer science? 
Simply a set of objects that we call `symbols`. The set must be finite and non-empty.
To indicate an alphabet, we commonly use the capital Greek letters sigma &Sigma;.

In other words, beginning to use some mathematical formalism, we have that &Sigma; &ne; &empty;

An example of an alphabet for binary numbers is &Sigma; = {0,1} , the lower case Greek letter sigma &sigma; is commonly used to indicate generic symbols, with a numeric index if necessary.

We could then represent a 3-symbol alphabet with &Sigma; = {&sigma;0,&sigma;1,&sigma;2} and say that &sigma;0 is a &sigma;1 is b and &sigma;1 is c, hence that &Sigma; = {a,b,c}.

We can write that &sigma;&isin; &Sigma; to indicate that a given symbol &sigma; belongs to the alphabet &Sigma;. Alphabets are sets so we can use all the mathematics pertaining to sets, making our lives easier.

So what are strings? A succession of symbols? Informally we can say that strings are actually a succession of symbols taken from a given alphabet, for example the string '010' representing the binary number 010 is a string on the alphabet &Sigma; = {0,1}.

The lower case Latin letters u,v,w are usually used to indicate generic strings.

Mathematically speaking, a string u on an &Sigma; alphabet is a total function with domain [1,n] and codomain &Sigma; given a certain n, where n is then the length of our string u.

Hence, u:[1,n]->&Sigma; and for example in the case of u = '010' we have that u(1)=0,u(2)=1,u(3)=0 where u(i) is the symbol at position i(-th) of the string u.

Definitely familiar, isn't it? If we think of character arrays, u is our array containing a string and the index identifies the symbol or character we are interested in. This should remind us that computer science is mathematics and how important the latter is.

Returning to the concept of string, there is a special one, the meaning of which will not appear immediately clear nor of any use, but which will play a crucial role later on, its name is string vuolta and commonly in texts it is represented by the lower case Greek letter epsilon &epsilon; and sometimes by the upper case Greek letter lambda &Lambda;. 

Its characteristic is that it has length zero, i.e. if u is a string and in particular is the empty string, we have \|u| = 0 where the vertical bars (the pipes) on either side of the letter indicate the length of the argument, thus \|&epsilon;\|=0 or if you prefer the other representation \|&Lambda;\|=0.

If we wanted to represent all possible strings on a given alphabet &Sigma; we could use the &Sigma;* representation where the asterisk is placed at the same height as an exponent. &Sigma;* is more than just a representation, it represents an operation. 

For now, we are content to know that if &Sigma;= {0,1} which is by definition a finite set, then &Sigma; * is a set with an infinite number of elements, i.e. all the strings that I can construct with the symbols of the alphabet &Sigma; therefore &Sigma; * = {0,1,01,11,10,001,00001,...} where the three dots ... indicate that one can continue indefinitely by generating strings of arbitrary length.

The concept of &Sigma; * or of the set of strings on &Sigma; allows us to take a further step forward and be able to define something whose concept is more familiar to us in our everyday professional (programmer) life, namely the concept of a language on a certain alphabet, commonly a language is indicated by the capital letter L, and contrary to what happens for &Sigma; * , L is not an infinite set, since it is a subset of &Sigma; * , formally L &sub; &Sigma; * , referring to the example seen above for binary numbers we could define a language for binary numbers of strings of length 2 and in this case our L would be the subset of &Sigma;* composed of the strings {00,01,10,11}.

For purely mathematical reasons, we have that both the empty set and the set consisting of the only element of the empty string (i.e. the singleton) are languages on any alphabet.

An interesting aspect is the possibility of modelling as mathematical objects even operations that we can commonly do on strings, such as concatenation.

In addition to the operations that we can do on strings, there are similar operations on languages. Of particular interest are the closure operations or closures, the positive closure represented by a + sign at the exponent L+ and the Kleene closure represented by the asterisk symbol L * . Informally the former is the union of all languages of length 1 to n, the latter of all languages of length 0 to n, so it also includes the string of length 0.

If you want to learn something Stephen Cole Kleene you can go to

1. [https://it.wikipedia.org/wiki/Stephen_Kleene](https://it.wikipedia.org/wiki/Stephen_Kleene)
2. [https://en.wikipedia.org/wiki/Stephen_Cole_Kleene](https://en.wikipedia.org/wiki/Stephen_Cole_Kleene)