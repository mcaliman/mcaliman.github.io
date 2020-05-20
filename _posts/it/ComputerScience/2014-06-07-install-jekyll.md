---
layout: post
lang: it
title:  "Installare Jekyll su ubuntu 14.04."
excerpt: ""
category: "Computer Science"
date:   2014-06-07 22:45:33
tags: [Jekyll]
comments: true
share: true
---

Per gli hacker un computer significa anche intrattenimento. Non i giochi, non le belle immagini sulla Rete. Il computer in sé è intrattenimento.
*(Linus Torvalds, in Pekka Himanen, L'etica hacker e lo spirito dell'età dell'informazione, 2001)*

Cosa ci serve

* Ruby.
* RubyGems.
* Ubuntu 14.04.

Per prima cosa installiamo Ruby.

{% highlight bash %}
sudo apt-get install ruby ruby-dev make
{% endhighlight %}

Verifichiamo la versione di ruby installata con il comando.

{% highlight bash %}
ruby -v
{% endhighlight %}

Per essere sicuro che tutto funzioni dovresti ottenere la seguente versione di Ruby.
{% highlight bash %}
ruby 1.9.3p484 (2013-11-22 revision 43786) [x86_64-linux]
{% endhighlight %}

Un piccolo workaround per fixare la gem CoffeeScript... ci serve il compilatore g++...

{% highlight bash %}
sudo apt-get install g++
{% endhighlight %}

... e therubyracer.
{% highlight bash %}
sudo gem install therubyracer --nols-rdoc --no-ri
{% endhighlight %}


Installiamo finalmente jekyll.

{% highlight bash %}
sudo gem install jekyll 
{% endhighlight %}

Verifichiamo la versione di jekyll installata con il comando.

{% highlight bash %}
jekyll -v
{% endhighlight %}

Dovresti ottenere qualcosa come.

{% highlight bash %}
jekyll 2.0.3
{% endhighlight %}

Visita [Jekyll docs][jekyll] per maggiori informazioni su come ottenere il massimo da Jekyll.
 
Trovi Jekyll su GitHub all'indirizzo [Jekyll's GitHub repo][jekyll-gh].

[jekyll-gh]: https://github.com/jekyll/jekyll
[jekyll]:    http://jekyllrb.com
