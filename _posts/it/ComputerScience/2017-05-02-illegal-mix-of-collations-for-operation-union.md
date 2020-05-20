--- 
layout: post
lang: en
title: "Illegal mix of collations for operation union"
excerpt: "About MySQL error illegal mix of collations for operation union"
category: "Computer Science"
date:   2017-05-02 22:45:33
modified: 2017-05-03 22:45:33
tags: [SQL,MySQL]
comments: true
share: true
---
Well, you probably have different collations in some mysql views, try to force collation like this 
{% highlight sql %} 
SET character_set_client = 'utf8mb4';
SET character_set_connection = 'utf8mb4';
SET collation_connection = 'utf8mb4_unicode_ci'; 

drop view if exists myviewwithproblem;
create view myviewwithproblem as … da da etc etc
{% endhighlight %}

obviously force to uft8 if you want this collation.