---
layout: post
title:  "MySQL: How to speed up restore operations from mysql dump"
excerpt: ""
category: MySQL
date:   2011-01-01
comments: true
share: false
modified: 2024-07-11
published: true
---

To speed up the operation of restoring a sql dump in mysql, you can proceed as follows

```sql
set autocommit = 0;
set foreign_key_checks = 0;
source /root/mydump.sql
set foreign_key_checks = 1;
commit;
set autocommit = 1;
```
