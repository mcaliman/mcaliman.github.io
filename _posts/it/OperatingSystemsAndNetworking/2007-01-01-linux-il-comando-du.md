---
layout: post
lang: it
title:  "Linux: il comando du"
excerpt: ""
category: OperatingSystemsAndNetworking
date:   2007-01-01 22:45:33
tags: [Linux]
comments: true
share: true
---

il comando `du` mostra lo spazio disco usato.

Uso:
{% highlight bash %}
du -s -h .
{% endhighlight %}
Dove:

`-s` indica --summarise display only a total for each argument.


`-h` indica --human-readable print sizes in human readable format (e.g., 1K 234M 2G).

`.` indica di applicare alla directory corrente.

Esempio:
{% highlight bash %}
mcaliman@deimos:~# du -s -h .

537M .
{% endhighlight %}