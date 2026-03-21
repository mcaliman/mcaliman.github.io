---
layout: post
title: "La classe java.time.temporal.ChronoUnit"
excerpt: "Calcolare la differenza tra due date con ChronoUnit"
category: "Java"
comments: true
share: false
modified: 2024-07-11
published: true
tags: [java, oop]
---

In Java calcolare la differenza in anni, mesi e giorni richiede alcune righe di codice; con Java 8 è possibile farlo senza librerie esterne e con una sola istruzione.

```java
//Due date, differenza in giorni, mesi e anni usando java.time.temporal.ChronoUnit e java.time.LocalDate
LocalDate startDate = LocalDate.of(1972, Month.MARCH, 25);//Facile da usare!!
LocalDate endDate = LocalDate.of(2017, 3, 25);//Facile da usare! 
System.out.println("Due date, differenza in giorni, mesi e anni");
System.out.println("anni: " + ChronoUnit.YEARS.between(startDate, endDate));
System.out.println("mesi: " + ChronoUnit.MONTHS.between(startDate, endDate));
System.out.println("giorni: " + ChronoUnit.DAYS.between(startDate, endDate));
```     
