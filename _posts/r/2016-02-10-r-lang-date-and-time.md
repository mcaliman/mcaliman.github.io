---
layout: post
lang: en
title:  "Date, time and interval objects in R"
excerpt: ""
category: "R" 
tags: ["R","Programming Languages"]
date:   2016-02-10 22:45:33
comments: true
share: true
revision: 0
---


## The Date Class
R has a special representation of date and time objects, dates are represented by the `Date` class, times and intervals by the `POSIXct` or `POSIXlt` classes. 
Dates are stored internally as the number of days since 1/1/1970 while times and intervals are stored internally as the number of seconds elapsed since 1/1/1970

## Classes for Times and Intervals
Dates are represented by the `Date` class and can be coerced (known as cast in other languages) by a string of characters as follows

```r
x <- as.Date("1970-01-01")
x
[1] "1970-01-01"
> class(x)
[1] "Date"
```
Times and time intervals are represented using the classes
`POSIXct` and `POSIXlt` classes 

* `POSIXct` under the "bonnet" is just a large integer and is used when you want to store times in something like a data frame

* `POSIXlt` has "detro" a list and stores a variety of other useful information such as day of the week, day of the year , month (and is most useful when you need to do manipulations)

There are a number of generic functions for date and time type objects

* `weekdays` : returns the day of the week
* `months` : returns the name of the month
* `quarters` : returns the number of the quarter ("Q1", "Q2", "Q3", "Q4")

times can be obtained from a character string using the functions `as.POSIXlt` or `as.POSIXct`.

```
t1 <- Sys.time()
posix1<- as.POSIXlt(t1)
posix1$sec # takes the seconds part, I can do this because I built it as POSIXlt 
```

or I can use the `POSIXct` format.



if dates are written in a different format, the `strptime` function can be used 

```r
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
#returns "2012-01-10 10:40:00 EST" "2011-12-09 09:10:00 EST" and interestingly I applied it to a list
```


## Operations on Date and POSIX* type objects

You can use the mathematical operations `+` and `-` on dates and times as well as comparison operations such as `==` and `<=`
```r
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
x <- as.Date("2012-01-01");y <- strptime("January 10, 2012 10:40", "%B %d, %Y %H:%M")
x-y

Error in x - y : non-numeric argument transformed into binary operator
Also: Warning message:
Incompatible methods ("-.Date", "-.POSIXt") for "-" 

x <- as.POSIXlt(x) # the types were incompatible I transform everything to POSIXlt
x-y
Time difference of -9.402778 days

# unclass also tells us that the only attribute we can draw on is the one we have already obtained, namely the difference in days
> unclass(difference)
[1] -9.402778
attr(, "units")
[1] "days"

# as anticipated I can also apply the sorting operators
x>y
[1] FALSE

```

also keeps track of leap years, daylight saving time and time zones.

```r
> x <- as.Date("2012-03-01") 
> y <- as.Date("2012-02-28")
> x-y
Time difference of 2 days
```

```r
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
Time difference of 1 hour
```