---
layout: post
title: "The java.time.temporal.ChronoUnit class"
excerpt: "Calculating the difference between two dates with ChronoUnit"
modified: 2018-01-01
category: "Java"
comments: true
share: false
published: true
---

In Java calculating the difference in years, months, and days requires a few lines of code, with Java 8 it is possible to do this without external libraries and with just one instruction.

```java
//Two dates, difference in days, months and years using java.time.temporal.ChronoUnit and java.time.LocalDate
LocalDate startDate = LocalDate.of(1972, Month.MARCH, 25);//Easy to use!!
LocalDate endDate = LocalDate.of(2017, 3, 25);//Easy to use! 
System.out.println("Two dates, difference in days, months and years");
System.out.println("years: " + ChronoUnit.YEARS.between(startDate, endDate));
System.out.println("months: " + ChronoUnit.MONTHS.between(startDate, endDate));
System.out.println("days: " + ChronoUnit.DAYS.between(startDate, endDate));
```     
   