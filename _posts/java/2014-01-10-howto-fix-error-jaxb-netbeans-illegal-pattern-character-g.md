---
layout: post
lang: en
title:  "HOWTO FIX error 'illegal pattern character g' JAXB in NetBeans ."
excerpt: ""
category: "Java"
tags: ["Programming Languages","Java"]
date:   2014-01-10 22:45:33
comments: true
share: true
revision: 0
---



Present in version 6.9 but also in version 7.4.

```java
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
```

It is fixed by adding

```bash 
"-J-Duser.language=en"  
```

to the `netbeans_default_options` property in the `netbeans.conf` file


