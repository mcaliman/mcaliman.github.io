---
layout: post
lang: it
title:  "Come velocizzare le operazioni di restore da dump sql di mysql"
excerpt: ""
category: MySQL
date:   2011-01-01 22:45:33
tags: [Italian,MySQL]
comments: true
share: true
---

Per velocizzare le operazioni di restore di un dump sql in mysql è possibile procedere come riportato sotto

{% highlight sql %}
set autocommit = 0;
set foreign_key_checks = 0;
source /root/mydump.sql
set foreign_key_checks = 1;
commit;
set autocommit = 1;
{% endhighlight %}
