---
layout: post
lang: it
title:  "Uso di keytool e jarsigner"
excerpt: ""
category: programming
date:   2011-04-24 22:45:33
tags: [Java]
comments: true
share: true
---

Per estrarre un certificato che già sappiamo essere nel nostro portachiavi

{% highlight bash %} 
keytool -export -alias mycompanyalias -file mycompany.crt
{% endhighlight %}

per firmare un nostro `jar` con il certificato sopra

{% highlight bash %} 
jarsigner mycompany.jar mycompanyalias
{% endhighlight %}
