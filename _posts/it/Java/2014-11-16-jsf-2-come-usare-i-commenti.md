---
layout: post
lang: it
title:  "JSF 2 Come usare i commenti"
excerpt: ""
category: java
date:   2014-11-16 22:45:33
tags: [Java,JavaServerFaces,JSF2]
comments: false
share: true
---

Parte della disumanità del computer sta nel fatto che, una volta programmato e messo in funzione, si comporta in maniera perfettamente onesta. *(Isaac Asimov, Il vento è cambiato, 1983)*

Premesso che è sempre possibile usare i tag classici di commento `<!--` e `-- >` in html ma questi di default vengono renderizzati, e nel caso il codice commentato sia una funzionalità nascosta per la release rilasciata, non ancora ufficiale, o una parte di EL o tag JSF questo potrebbe risultare imbarazzante se non rappresentare un buco alla sicurezza.

Essenzialmente esistono due metodi, vediamoli.

Settare `facelets.SKIP_COMMENTS`

Nel file `web.xml` della nostra applicazione settiamo il parametro `facelets.SKIP_COMMENTS` a `true`.

{% highlight xml %}
<context-param>
   <param-name>facelets.SKIP_COMMENTS</param-name>
   <param-value>true</param-value>
</context-param>
{% endhighlight %}

Attenzione però, nessun commento html verrà renderizzato, e a volte vogliamo avere un maggior controllo su quali commenti esporre o meno (qualcuno potrebbe esserci utile)
Usare il tag `ui:remove`
Il tag `ui:remove` è quello che fa per me, lo uso spesso e mi da tutta la flessibilità e sicurezza che richiedono le applicazioni enterprise. L’utilizzo è banale e sotto potete vederne un esempio

{% highlight xml %}
<ui:remove>
  <!-- Anche questo commento non verrà renderizzato -->
  <h:commandButton type="button" value="#{msg.buttonLabel}" />
</ui:remove>
{% endhighlight %}

Ciò che è delimitato dal tag verrà trattato alla stregua di un commento da un compilatore.
