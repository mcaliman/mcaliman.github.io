---
layout: post
lang: en
title:  "MySQL: How to speed up restore operations from mysql dump"
excerpt: ""
category: databases
date:   2011-01-01 22:45:33
tags: [MySQL]
comments: true
share: true
revision: 0
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
