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
---
Well, you probably have different collations in some mysql views, try to force collation like this 
```sql  
SET character_set_client = 'utf8mb4';
SET character_set_connection = 'utf8mb4';
SET collation_connection = 'utf8mb4_unicode_ci'; 

drop view if exists myviewwithproblem;
create view myviewwithproblem as … da da etc etc
```

obviously force to uft8 if you want this collation.