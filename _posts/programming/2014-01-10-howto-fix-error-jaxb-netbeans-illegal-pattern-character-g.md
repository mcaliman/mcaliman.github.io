---
layout: post
lang: it
title:  "HOWTO FIX errore 'illegal pattern character g' JAXB in NetBeans ."
excerpt: ""
category: programming
date:   2014-01-10 22:45:33
tags: [Java, JAXB, NetBeans]
comments: true
share: true
---

Il computer non è una macchina intelligente che aiuta le persone stupide, anzi è una macchina stupida che funziona solo nelle mani delle persone intelligenti.
*(Umberto Eco, Come scrivere una tesi di laurea con il personal computer, 1986 (prefazione))*

Presente nella versione 6.9 ma anche nella version 7.4.

{% highlight java %}
\nbproject\xml_binding_build.xml:17: 
java.lang.IllegalArgumentException: Illegal pattern character 'g'
    at java.text.SimpleDateFormat.compile(SimpleDateFormat.java:768)
    at java.text.SimpleDateFormat.initialize(SimpleDateFormat.java:575)
    at java.text.SimpleDateFormat.<init>(SimpleDateFormat.java:500)
    at com.sun.tools.xjc.Options.getPrologComment(Options.java:924)
    at com.sun.tools.xjc.Options.createCodeWriter(Options.java:909)
    at com.sun.tools.xjc.Options.createCodeWriter(Options.java:899)
    at com.sun.tools.xjc.XJC2Task._doXJC(XJC2Task.java:523)
    at com.sun.tools.xjc.XJC2Task.doXJC(XJC2Task.java:454)
    at com.sun.tools.xjc.XJC2Task.execute(XJC2Task.java:379)
    at com.sun.istack.tools.ProtectedTask.execute(ProtectedTask.java:103)
    at org.apache.tools.ant.UnknownElement.execute(UnknownElement.java:291)
    at sun.reflect.GeneratedMethodAccessor51.invoke(Unknown Source)
{% endhighlight %}

Si risolve aggiungendo.  

{% highlight bash %}
"-J-Duser.language=en"  
{% endhighlight %}

al proprietà `netbeans_default_options` nel file `netbeans.conf`


