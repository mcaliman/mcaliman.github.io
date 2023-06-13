---
layout: post
lang: it
title:  "Problema in fase di restore di un database mysql"
excerpt: ""
category: MySQL
date:   2010-01-01 22:45:33
tags: [MySQL]
comments: true
share: true
---

Se vi capita di avere problemi in fase di restore da un dump mysql provate a impostare queste variabili prima di lanciare il comando source

{% highlight sql %}
set foreign_key_checks=0;
set global max_allowed_packet=16760832;
set global net_buffer_length=16760832;
{% endhighlight %}

