---
layout: post
lang: it
title:  "Quel maledetto Content is not allowed in prolog"
excerpt: ""
category: programming-languages
tags: [Java]
date:   2011-02-27 22:45:33
comments: true
share: true
---
Ogni documento XML su cui lavoriamo dovrebbe essere formattato correttamente, salvato con il giusto encoding ecc.
Un caso classico è il messaggio "Content is not allowed in prolog" (`SAXParseException`)
Editiamo a mano il file con un editor (esadecimale) e togliamo in testa "ef bb bf".
Visto che usiamo Java molto meglio mettere un piccolo work-around di appena due righe di codice :
```java
Matcher matcher = (Pattern.compile("^([\\W]+)<")).matcher( xmlString.trim() );
xmlString = matcher.replaceFirst("<");
```

Questo prima di passare il tutto al nostro oggetto `SAXBuilder`

```java
SAXBuilder builder = new SAXBuilder();
Document document = builder.build(new StringReader(xmlString));
```