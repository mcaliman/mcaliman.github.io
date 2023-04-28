---
layout: post
lang: en
title:  "Linux: The du command"
excerpt: ""
category: computer-science
date:   2007-01-01 22:45:33
modified: 2023-03-19
tags: [Linux]
comments: true
share: true
---

The `du` command shows the disk space used.

Use:
{% highlight bash %}
du -s -h .
{% endhighlight %}
Where:

`-s` indica --summarise display only a total for each argument.


`-h` indica --human-readable print sizes in human readable format (e.g., 1K 234M 2G).

`.` indica di applicare alla directory corrente.

Example:
{% highlight bash %}
mcaliman@deimos:~# du -s -h .

537M .
{% endhighlight %}