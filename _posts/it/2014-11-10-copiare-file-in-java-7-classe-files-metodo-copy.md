---
layout: post
title:  "Copiare file in Java 7 con la classe Files"
category: articles
date:   2014-11-10 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java,Java7]
comments: true
share: true
---

Parte della disumanità del computer sta nel fatto che, una volta programmato e messo in funzione, si comporta in maniera perfettamente onesta. *(Isaac Asimov, Il vento è cambiato, 1983)*

In un post precedente vi ho mostrato i benefici dell’uso dei channel e del package nio. Ho anche accennato alla possibilità dalla versione 7 del JDK di utilizzare la classe Files per effettuare copie di file in modo immediato. Come al solito vi riporto sotto un semplice metodo che illustra l’esempio di utilizzo del metodo copy.

{% highlight java %}
private static void copy(File source, File dest) throws IOException {
   Files.copy(source.toPath(), dest.toPath());
}
{% endhighlight %}
