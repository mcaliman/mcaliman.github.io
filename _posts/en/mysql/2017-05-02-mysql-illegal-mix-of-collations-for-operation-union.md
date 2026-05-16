--- 
layout: post
title: "MySQL: Illegal mix of collations for operation union"
excerpt: "About MySQL error illegal mix of collations for operation union"
category: MySQL
date:   2017-05-02
comments: true
share: false
modified: 2024-07-11
published: true
tags: [mysql, database, en, code]
---
Well, you probably have different collations in some MySQL views; try to force the collation like this:```sql  
SET character_set_client = 'utf8mb4';
SET character_set_connection = 'utf8mb4';
SET collation_connection = 'utf8mb4_unicode_ci'; 

drop view if exists myviewwithproblem;
create view myviewwithproblem as ... 
```

obviously force to UTF-8 if you want this collation.
