---
layout: post
lang: it
title: "La classe java.time.temporal.ChronoUnit"
excerpt: "Calcolare la differenza tra due date con ChronoUnit"
modified: 2018-01-01
categories: java
tags: [Java 8]
#image:
#  feature: so-simple-sample-image-1.jpg
#  credit: WeGraphics
#  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
search_omit: false
updated: true
---

In Java calcolare la differenza in anni,mesi,giorni richiede qualche riga di codice, con Java 8 è possibile fare tutto senza librerie esterne e con una sola istruzione.

{% highlight java %}
//Two dates, difference in days, months and years using java.time.temporal.ChronoUnit and java.time.LocalDate
LocalDate startDate = LocalDate.of(1972, Month.MARCH, 25);//Easy to use!!
LocalDate endDate = LocalDate.of(2017, 3, 25);//Easy to use! 
System.out.println("Two dates, difference in days, months and years");
System.out.println("years: " + ChronoUnit.YEARS.between(startDate, endDate));
System.out.println("months: " + ChronoUnit.MONTHS.between(startDate, endDate));
System.out.println("days: " + ChronoUnit.DAYS.between(startDate, endDate));
{% endhighlight %}     
   