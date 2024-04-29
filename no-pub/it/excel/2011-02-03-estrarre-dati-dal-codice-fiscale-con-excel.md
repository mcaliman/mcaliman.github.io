---
layout: post
lang: it
title:  "Estrarre dati dal codice fiscale con Excel"
excerpt: ""
category: Excel
date:   2011-02-03 22:45:33
tags: [Italian,Italian Fiscal Code, Codice Fiscale]
comments: true
share: false
---

Assumiamo che il nostro codice fiscale sia contenuto nella cella A1.


Se ci interessa estrarre il sesso dal codice fiscale possiamo utilizzare la seguente formula in Excel:

```
=SE(VALORE((STRINGA.ESTRAI(A1;10;2)))>40;"F";"M")
```
Per estrarre la data di nascita
```
=DATA(VALORE(STRINGA.ESTRAI(A1;7;2))+1900;CONFRONTA(STRINGA.ESTRAI(A1;9;1);
{"a";"b";"c";"d";"e";"h";"l";"m";"p";"r";"s";"t"};0);
SE(VALORE(STRINGA.ESTRAI(A1;10;2))>40;
VALORE(STRINGA.ESTRAI(A1;10;2))-40;VALORE(STRINGA.ESTRAI(A1;10;2))))
```