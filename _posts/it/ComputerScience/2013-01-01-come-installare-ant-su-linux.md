---
layout: post
title:  "Come installare Ant su linux"
excerpt: ""
category: "Computer Science"
date:   2013-01-01 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Ant, Java, Linux]
comments: true
share: true
---

Non provare mai a spiegare il computer a un profano. È più facile spiegare il sesso a una vergine.
*(Robert Anson Heinlein, La Luna è una severa maestra, 1966)*

Vediamo come installare ant, questo è requisito per l'installazione di GlassFish su linux.
Scarichiamo il tar.gz dal sito e trasferiamolo in `/usr/local`
scompattiamo il file `apache-ant-1.7.1-bin.tar.gz` con il comando

{% highlight bash %}
tar xvfz apache-ant-1.7.1-bin.tar.gz
{% endhighlight %}

creiamo il nostro solito link simbolico con il comando `ln`
{% highlight bash %}
ln -s apache-ant-1.7.1 ant
{% endhighlight %}

aggiungiamo in `/root/.bashrc` (o nella nostra home di utente non root) le variabili di ambiente

{% highlight bash %}
ANT_HOME=/usr/local/ant
export ANT_HOME
PATH=$ANT_HOME/bin:.:$PATH
export PATH
{% endhighlight %}


