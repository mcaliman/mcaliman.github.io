---
layout: post
lang: en
title:  "Interfaces with the external world in R"
excerpt: ""
category: R 
date:   2016-04-01 22:45:33
comments: false
share: false
published: true
---

Data are read via connection interfaces . Connections can be to files or urls for example .

* `file`, opens a connection to a file
* `gzfile`, opens a link to a gzipped file
* `bzfile`, opens a link to a file compressed with bzip2
* `url`, opens a link to a web page

To connect to a file

```r
> str(file)
function (description = '', open = '', blocking = TRUE,
encoding = getOption("encoding"))
```

description is the name of the file open is a code indicating

* "r" read only
* "w" write (and initialization of a new file)
* "a" append
* "rb", "wb", "ab" read,write, or append in binary mode (Windows)


In general, shortcuts are powerful tools for navigating files or other external objects. 
In practice, we often do not need to deal with the link interface directly .

```r
con <- file('foo.txt', 'r')
data <- read.csv(con)
close(con)
```

is equivalent to

```r
data <- read.csv("foo.txt")
```

read per line of a text file

```r
con <- gzfile("example.gz")
x <- readLines(con, 10)
```

`writeLines` takes a vector of characters and writes each element one line at a time to a text file.
`readLines` can be useful for line-by-line reading of web pages

```r
con <- url("http://google.com", "r")
x <- readLines(con)
```


