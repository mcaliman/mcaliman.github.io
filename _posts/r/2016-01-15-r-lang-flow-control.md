---
layout: post
lang: en
title:  "The control structures of R"
excerpt: "Managing the programme execution flow with R"
category: "R" 
tags: ["R","Programming Languages"]
date:   2016-01-15 22:45:33
comments: true
share: true
revision: 0
---

Control structures in R allow the flow of program execution to be controlled according to runtime conditions in a manner not unlike any other imperative language (such as C, Java, Python), let's take a quick look at the reserved words dedicated to control structures

* `if`, `else`: testing a condition
* `for`: executing a loop for a fixed number of times
* while: executing a loop while/as long as the condition is true
* `repeat`: executing an infinite loop
* `break`: interrupts execution of a loop
* `next`: skips an iteration of a loop (the continuation of C or Java for that matter)
* `return`: exits a function or loop
Most control structures are not used in interactive sessions, but rather when writing functions or
longer expressions. Let us take a detailed look at the various constructs.
## if,else

```r
if(<condition>) { 
  # do something branch if
} else {
  # do something branch else
}
if(<condition1>) {
  # do something if condition 1
} else if(<condition2>) {
  # do something if condition 2
} else {
  # does something in all other cases
}
```

An example of if else

```r
if(x > 10) {
  y <- 0
} else {
  y <- 1
}
```

## for
The for uses a variable as an iterator (the variable i in the example) and assigns successive values from a sequence or vector. 
For's are commonly used for iterating over the elements of an object (list, vector, etc. )

```r
for(i in 1:10) {
   print(i)
}
```

This loop takes the variable i and in each iteration of the loop uses its values 1, 2, 3, ..., 10, and exits

these 3 loops have the same behaviour

```r
x <- c("a", "b", "c", "d")
for(i in 1:4) {
   print(x[i])
}
for(i in seq_along(x)) {
   print(x[i])
}
for(letter in x) {
   print(letter)
}
for(i in 1:4) print(x[i])
```
for loops can of course be nested as in any other programming language.

```r
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
   for(j in seq_len(ncol(x))) {
      print(x[i, j])
   }
}
```

and likewise care must be taken when nesting for more than 3 or 4 levels as it often makes a code fragment unreadable.

## while

While loops begin by testing a condition, if it is true, then they execute the body of the loop. Once the loop body is executed, the condition is tested again, and so on .

```r
count <- 0
while(count < 10) {
   print(count)
   count <- count + 1
}
```


## repeat

`repeat` starts an infinite loop; the only way to get out of a repeat loop is to call `break`.

```r

repeat {
   x <- f()
   if(x<10) {
      break
   } else {
      x <- x-1
   }
}
```

## next, return
next is used to skip an iteration of a loop

```r
for(i in 1:100) {
   if(i <= 20) {
      ## skip 20 iterations
      next
   }
   ## does null
}
```

return signals that a function has terminated and must return a value