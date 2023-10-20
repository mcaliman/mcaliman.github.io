---
layout: post
lang: en
title:  "Functions that implement cycles in R"
excerpt: ""
category: "Programming Languages"
tags: [R]
date:   2016-03-01 22:45:33
comments: true
share: true
revision: 0
---

## Command-Line Loops

The `for`, `while` and loop constructs in general are useful when programming, but are not particularly easy when working interactively from the command line. There are some functions that implement loops to make life easier. These are the `*apply` functions (`lapply`,`sapply`,`apply`,`tapply`,`mapply`)

A useful auxiliary function in combination with the `*apply` functions is `split`.

## lapply
`lapply` accepts three arguments: (1) an X list; (2) a FUN function; (3) other arguments via its ... argument . If X is not a list, it will be forced to a list using `as.list`.
The actual loop is done internally in C code (so pay attention to the data side of profiling).
`lapply` always returns a list, regardless of the input class .

```r
f <- function(x) {x=x+1}
l <- 1:4
y <- lapply(x,f)
y
[[1]]
[1] 2

[[2]]
[1] 3

[[3]]
[1] 4

[[4]]
[1] 5

```


## sapply
`sapply` attempts to simplify the result of `lappy` if possible.
If the result is a list where each element is of length 1, a vector is returned
If the result is a list where each element is a vector of the same length ( > 1 ) , an array is returned.
If `sapply` fails to simplify, a list is returned.

```r
> z<-sapply(x,f)
> z
[1] 2 3 4 5
```

Convenient, isn't it?

## apply
`apply` is used for evaluating a function (often anonymous in nature) to the columns or rows of an array.
It is most often used to apply a function to the rows or columns of an array
It is not faster than writing a for loop, but it works in a single line.

```r
> str(apply)
function (X, MARGIN, FUN, ...) 
```
MARGIN is an integer vector indicating which margins are to be "maintained".
The example below will hopefully make this clearer (rnorm is only needed to populate an array with a normal distribution)

```r
x <- matrix(rnorm(200), 20, 10)
> x <- matrix(rnorm(200), 20, 10)
> x
            [,1]        [,2]       [,3]         [,4]        [,5]        [,6]
 [1,]  0.3963635 -0.62742303  0.8559908  0.041758983  0.27968550 -1.51067608
 [2,]  2.7989429 -0.31108344  1.1125721  0.493892152 -0.99877881 -0.03635573
 [3,]  1.2729939  0.68517518 -0.5754894  0.001258338  0.89842612  0.76899917
 [4,] -0.1972043  0.14728076  0.5571848 -2.317407366 -0.94433394  0.22643282
 [5,] -1.0229955 -0.88704721 -0.2349964 -0.583044998 -0.38175450  0.79859082
 [6,] -2.2307039 -0.88393872 -1.1304861 -0.980230092 -1.19778042 -0.43944938
 [7,] -0.3239625 -0.07626231 -0.9167339  0.801793737  0.04583193 -0.44677327
 [8,] -2.1721930 -1.82162706 -0.1360091 -0.182583486  0.55254262 -0.55473856
 [9,]  0.5550490  0.17079315  0.3854185 -0.373603391 -1.23080985 -0.21907699
[10,] -1.2234382 -1.87715072  0.6801925 -0.017450599  0.58342107  1.06882246
[11,]  0.6361036  0.97475767 -0.3576995 -0.976218424 -0.31131696 -0.68747609
[12,] -0.8353006  0.10183363 -0.0431286  0.806635605  0.03548096  0.21567848
[13,] -0.5288823 -0.63436779  0.6056696  1.327055934  1.14380212  1.37146119
[14,] -1.9836052 -0.73356595 -0.6248551 -2.267205407  0.02242875  0.16491377
[15,]  0.8844882 -0.80770863 -1.9859983 -0.451040532 -0.32321439 -0.01792890
[16,]  1.0193884  2.37281492  2.4778778 -0.360414709 -2.43461189  0.30425171
[17,] -0.8749364  0.08347713  0.8584569  0.517227375 -0.65717674  0.67537576
[18,]  1.2128844 -0.69963544  1.4121788  0.318647904  1.81284950 -2.80769002
[19,] -1.0978996 -0.65164157  0.3670463  0.324967520  0.30765970  1.63676395
[20,] -0.2675550  0.48960663 -0.1027670 -0.120393201 -0.17096206 -0.91307091
             [,7]        [,8]        [,9]       [,10]
 [1,] -2.07670554  1.23033091  0.76424487  1.12007931
 [2,]  0.50517705  0.37403268 -0.45168099  0.33952347
 [3,] -0.61391033 -1.38076619 -0.36363689  0.26394571
 [4,] -0.44591035 -0.49826675 -1.24337397 -0.82563916
 [5,]  1.37051701  0.12793799 -0.85043741  0.61634465
 [6,] -0.28234386  0.81821623  1.77128818  0.51458107
 [7,] -1.38204064  1.33920876  1.18078293 -1.75728697
 [8,] -0.27306276  0.60752641  1.90182306  0.21603295
 [9,] -1.01114509 -0.19292137 -2.46298102  0.39364777
[10,]  0.49441357 -0.92996020  0.68627864  0.77054459
[11,]  0.60748224  0.68570630  0.85982787 -1.03110133
[12,]  0.05768264 -0.02326520 -0.02293647  0.45317369
[13,] -0.44162534  0.01338081 -0.83990493  0.23590051
[14,]  0.19310634 -0.67757005 -0.56180696  1.91955470
[15,]  0.37236650 -2.81973163  0.28650254 -1.45773888
[16,]  0.70371313  1.34526893  0.41251129  0.32920038
[17,]  0.52115092  0.92246177 -0.70595800 -0.74992266
[18,]  0.25084633  1.41506634  0.67849775  1.00418821
[19,] -0.74722596 -0.57426375  0.65830451 -0.01854943
[20,] -2.49597657  0.85960698 -0.18431592  0.34410820
>  apply(x, 2, mean)
 [1] -0.19912313 -0.24928564  0.16022123 -0.19981773 -0.14843056 -0.02009729
 [7] -0.23467453  0.13209995  0.07565145  0.13402934

```
## mapply
mapply` is a multivariate version of apply which applies a function in parallel over a series of arguments .
An example is below, l1 contains the same elements as l2
rep is a function that "replicates" the passed element a required number of times and returns it as a list, e.g.

```r
> rep(1,5)
[1] 1 1 1 1 1
```

```r
l1<-list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

l2<-mapply(rep, 1:4, 4:1)
```


## tapply
`tapply` is used to apply a function to subsets of a vector

```r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, f, mean)
```
## split
`split` takes a vector (or other type of list of objects) and divides it into groups determined by a factor or list of factors.

For example, we split the elements of x >1 and those <=1 into two groups

```r
> split(x,x[]>1)
$`FALSE`
 [1] -1.13857804  0.21853696 -0.25563963  0.51938904  0.24105612  0.13492624
 [7] -0.59042828 -0.52559665  0.67772599  0.79394383  0.81569013  0.48512614
[13]  0.34841619  0.60159291  0.45714304  0.40336332  0.71783361  0.86962872
[19]  0.84581567  0.94133809 -0.36174582  0.83549908  0.05453992

$`TRUE`
[1] 1.343577 1.742792 1.389213 1.252149 1.650007 1.350450 3.162776

```




