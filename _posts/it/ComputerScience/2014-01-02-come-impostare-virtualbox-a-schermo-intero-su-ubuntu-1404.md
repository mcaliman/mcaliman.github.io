---
layout: post
title:  "Come impostare Virtualbox a schermo intero su Ubuntu 14.04"
excerpt: ""
category: ComputerScience
date:   2014-01-02 22:45:33
tags: [VirtualBox, Ubuntu]
comments: true
share: true
---

I computer sono come gli Dei del Vecchio Testamento: pieni di regole e nessuna pietà.
*(Joseph Campbell, Il potere del mito, 1988)*

Se avete installato VirtualBox su ubuntu 14.04 ma la finestra è piccola (la risoluzione è 800x600) lavorare diventa veramente arduo. 
La soluzione è installare VirtualBox Guest Addition, vi consiglio di lasciate perdere l’installazione dall’immagine cd e procedete con `apt-get`

{% highlight bash %}
sudo apt-get install virtualbox-guest-x11
{% endhighlight %}

terminata l’installazione riavviate il sistema.
