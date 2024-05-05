---
layout: post
lang: en
title:  "R language introduction"
excerpt: ""
category: "R" 
tags: ["R","Programming Languages"]
date:   2016-01-10 22:45:33
comments: false
share: false
---

> “When debugging, novices insert corrective code; experts remove defective code.”
> 
> – Richard E. Pattis


I discovered the R programming language almost by chance and was fascinated by it.
The first thing to know is that R is more than a programming language, it is also a complete development environment. 
Based on the S language, it is used for the management and statistical analysis of data for the production of graphs and is available free of charge under the constraints of the GPL licence. 

R is an interactive environment (like Python): commands produce an immediate response. 

Once R has been launched, all instructions are executable from the
environment command line, characterised by the `>` prompt.
 
the command line is executed by pressing the `Enter` key. 
At its simplest, it can be used as a calculator (a calculator that has grown a little too big).

```r
> 2+2*2
[1] 6
> 
```


To construct an object the command `<-` or `=` is used (or even `->` yes you read that right, so you can do `x<-a+1` but also `a+1->x` ).

```r
> x<-1+7
> 1+7->x
> x
[1] 8

> x # print x
[1] 8
```


The `#` character is the comment symbol and everything that follows is
ignored by the environment (see the instructions just above).

As with any other programming language, when you decide to create an object, any pre-existing object with the same name will be overwritten.

An important note: R is case sensitive, so the `X` object is not the `x` object (exactly as happens in C or Java and Python for example, and unlike in SQL where select is equivalent to Select or SELECT).

If we try to call an object that hasn't been created yet, we get the message

```r
> y
Error: Object "y" not found
```

As in any other programming language, there is a list of reserved words that the user cannot use at will, but only for the purpose they have been defined.

```r
FALSE, TRUE, Inf, NA, NaN, NULL, 
break, else, for, function, if,in, next, repeat, while
```

Equipped with a large number of functions that perform the most common
mathematical and statistical calculations R comes with an online help manual for each of them. 
The help can be viewed by typing ?<f> or help(<f>) from the command prompt where <f> is the name of the function.

e.g. `help(mean)` calls up the help for the averaging function

Perhaps one of the simplest functions is `rm()` which is used to delete objects (or rather remove from memory rm stands for remove);
in its most basic use:

```r
> x<-2+2
> x
[1] 4
```

```r
> rm(x)
> x
Errore: oggetto "x" non trovato
```
Let's look at some commands that will often come in handy.

`getwd()` returns the working directory (get work directory). All operations in R refer to this working directory unless otherwise specified.

`dir()` returns the list of directories (the return type is an array, so we can do all the interesting things we can do with an array)

`read.csv("mycsv.csv")` read a csv file (and make it available in an object if we assign it with the <- operator to a variable)

One last thing in this first introductory taste of the R language: How do you create a function (which is the main construct in a functional language)? In a very simple way:

```r
f <- function() {
   x<-rnorm(10)
   mean(x)
}
```
The function named f which I have just defined I can call by its name followed by the parentheses f() the returned value is the last one computed, I can save the function definition with the extension .R and reload it with `source("f.R")` and afterwards with `ls()` have the list of functions contained.
and then with `ls()` get the list of functions contained.

Some system files in the R workspace: `.Rhistory` and `.Rdata`.
The file `.Rhistory` is an ascii file which reports the codes typed at the prompt, without
however, reporting R's answers.
while the `.Rdata` file is the workspace which contains all the objects saved in the environment during the current session; you can save the workspace using the `save.image()` function. Further details on how to use `.Rdata` in a useful way can be found in the online R documentation.
