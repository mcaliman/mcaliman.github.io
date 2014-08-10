---
layout: post
title:  "Come trovare il jar dove è contenuta una determinata classe (deployed in GlassFish)."
category: articles
date:   2014-01-03 22:45:33
tags: [Java,GlassFish]
comments: false
share: true
---

I Greci dicevano di una persona incolta: "Non sa leggere né nuotare"; oggi bisognerebbe aggiungere: "né usare un elaboratore".
*(Primo Levi e Tullio Regge, Dialogo, 1984)*

Possiamo individuare il jar per la classe `Base64` (ad esempio) con il codice.

{% highlight java %}
System.out.println(Base64.class.getProtectionDomain().getCodeSource().getLocation());
{% endhighlight %}

