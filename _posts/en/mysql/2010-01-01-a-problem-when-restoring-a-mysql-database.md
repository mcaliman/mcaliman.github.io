---
layout: post
lang: en
title:  "A problem when restoring a MySQL database..."
excerpt: ""
category: MySQL
date:   2010-01-01 22:45:33
tags: [MySQL,English]
comments: true
share: true
---

If you encounter problems when restoring from a mysql dump, try setting these variables before running the `source` command

```sql
set foreign_key_checks=0;
set global max_allowed_packet=16760832;
set global net_buffer_length=16760832;
```

