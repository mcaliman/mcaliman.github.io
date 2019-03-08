---
layout: post
title:  "Quel maledetto Content is not allowed in prolog"
excerpt: ""
category: ComputerScience
date:   2011-02-27 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java]
comments: true
share: true
---
Ogni documento XML su cui lavoriamo dovrebbe essere formattato correttamente, salvato con il giusto encoding ecc.
Un caso classico è il messaggio "Content is not allowed in prolog" (`SAXParseException`)
Editiamo a mano il file con un editor (esadecimale) e togliamo in testa "ef bb bf".
Visto che usiamo Java molto meglio mettere un piccolo work-around di appena due righe di codice :
{% highlight java %}
Matcher matcher = (Pattern.compile("^([\\W]+)<")).matcher( xmlString.trim() );
xmlString = matcher.replaceFirst("<");
{% endhighlight %}

Questo prima di passare il tutto al nostro oggetto `SAXBuilder`

{% highlight java %}
SAXBuilder builder = new SAXBuilder();
Document document = builder.build(new StringReader(xmlString));
{% endhighlight %}
