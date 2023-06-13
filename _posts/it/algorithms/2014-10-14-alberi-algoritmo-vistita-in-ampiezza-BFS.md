---
layout: post
lang: it
title:  "Algoritmo di visita in ampiezza per un albero (BFS o Breadth First Search)"
excerpt: ""
category: Algorithms
date:   2014-10-14 22:45:33
tags: [Data Structures,Tree]
comments: true
share: true
---

> "PHP is a minor evil perpetrated and created by incompetent amateurs, whereas Perl is a great and insidious evil perpetrated by skilled but perverted professionals."
(Jon Ribbens)

Partiamo dal algoritmo di generico di visita e usando una coda per rappresentare `S` otteniamo visita in ampiezza (Breadth First Search o BFS).

I nodi vengono visitati per livelli,prima radice,poi figli della radice,poi i figli dei figli.

{% highlight java %}
proc BFS(nodo r)
   Queue C
   C.enqueue(r)
   while not C.isEmpty() do 
       u ← C.dequeue()
       if u ≠ null then
           visit(u)
           C.enqueue(left_child_of(u))
           C.enqueue(right_child_of(u))
       fi	
   od
endproc 
{% endhighlight %}
