---
layout: post
lang: it
title:  "JSF 2 forzare gli id generati dai tag"
excerpt: ""
category: programming-languages
date:   2014-11-09 22:45:33
tags: [Italian,Java Server Faces]
comments: true
share: true
---


Quando usiamo tag come `inputHidden` o `form`, cioè componenti standard HTML delle JSF, gli attributi `id` del corrispondente 
tag HTML sono generati in automatico secondo regole precise.

ad esempio

```xml
<h:form id="form1">
   <t:inputHidden id="field1"/>
</h:form>
```

da luogo a questo codice HTML

```html
<input type="hidden" name="form:field1"/>
```

Ovviamente non siamo costretti a valorizzare l’attributo `id`, il rendering delle Java Server Faces si occupano di generarne in automatico di appropriati ed univoci.

Quando vogliamo però referenziare un dato componente tramite il suo `id`, sia che si tratti di CSS o di Javascript questo comportamente ci impedisce di farlo (quantomeno ci rende la vita difficile, pensate a referenziare qualcosa come `#form:field1` con JQuery, escape?).

In casi come questo possiamo dichiarare gli `id` e a livello di `form` specificare l’attributo `prependId="false"`. Applicato al codice visto sopra abbiamo

```xml
<h:form id="form1" prependId="false">
   <t:inputHidden id="field1"/>
</h:form>
```

che darà luogo a 

```html
<input type="hidden" name="field1"/>
```


Verrebbe la tentazione di utilizzarlo sempre, anche se non è necessario per interazioni con js o css. L’attributo si dovrà usare con attenzione, si può ottenere un errore di `id` duplicato se si utilizza troppo spesso. In altre parole se non strettamente necessario, lasciamo che sia JSF a occuparsi di questi dettagli e a generare `id` univoci per i nostri tag.
