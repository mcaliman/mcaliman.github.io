---
layout: post
lang: en
title:  "Functions in R"
excerpt: ""
category: "R" 
tags: ["R","Programming Languages"]
date:   2016-01-20 22:45:33
comments: true
share: false
revision: 0
---

> Computer Science is no more about computers than astronomy is about telescopes.
>
> – Edsger W. Dijkstra
Functions are created using the `function()` directive and stored like any other object in R. 
Specifically, they are objects of class function.

```r
f <- function(<arguments>) {
   # function body
}
```
Functions in R are `first class objects`, which means they can be treated like any other object in R: they can be passed as arguments to other functions, and they can be nested (so you can define a function inside another function), the return value of a function is the last expression to be evaluated in the body of the function.
## Arguments of a function

Formal arguments are arguments included in the definition of a function
Not all calls to a function make use of all formal arguments, as
a function argument may be missing or may have default values.

## The matching of arguments 
Something I find really convenient: matching the arguments of a function can be done by position or by name
The following calls are equivalent

```r
dati <- rnorm(100)
sd(dati)
sd(x = dati)
sd(x = dati, na.rm = FALSE)
sd(na.rm = FALSE, x = dati)
sd(na.rm = FALSE, dati)
```
Although it is allowed, I do not advise you to play around too much with the natural order (order of the function definition) of the arguments, it only serves to make confusion.

It is possible to combine positional correspondence with correspondence by name.
When an argument is matched by name, it is removed from the list of arguments and the remaining unnamed arguments are matched in the order in which they are listed in the function definition. 

Personally, given a function, I find it more useful to use only one or the other (either positional matching or name matching), but should you be faced with code written in this mixed mode, it is useful to know the rules of the game.
## define a function
```
f <- function(a, b = 1, c = 2, d = NULL) {
}
```

In addition to not specifying a default value, it is also possible to set a NULL argument value.
## Lazy Evaluation
Arguments to functions are evaluated lazy, so that they are evaluated only when necessary .

```r
f <- function(a, b) {
   a^2
}
f(2)
## [1] 4
```

This function does not actually use the argument b and calling f(2) will not produce an error.

Whereas in the example below the error is produced for obvious reasons.

```r
f <- function(a, b) {
   print(a)
   print(b)
}
f(45)
## [1] 45
## Error: argument "b" is missing, with no default
```
Then there is the topic ... but we will talk about that in another post.



