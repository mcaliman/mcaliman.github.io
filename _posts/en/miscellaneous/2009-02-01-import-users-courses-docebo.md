---
layout: post
lang: en
title:  "Importing users and courses with I/O Task in Docebo"
excerpt: ""
category: Miscellaneous
date:   2009-01-01 22:45:33
tags: [Docebo,"LMS (Learning Management System)"]
comments: true
share: false
published: true
---

Those who need to import users, courses, and user-course associations in an automatic and scheduled manner will necessarily have had to deal with I/O Tasks.
Scheduling is subject to time settings in the I/O Task administration panel and the launch of a particular URL from cron. 
For the version under review (`3.6.0.3`), it is not possible to re-launch a (daily) task if it has failed, or if it simply needs to be iterated again. The task is marked as executed. 
One possibility for re-executing it is to modify the `last_execution` field of the `core_task` table by changing the date to that of the previous day.
The behaviour is evident by analysing the sources

* docebo/doceboCore/class.module/class.iotask.php
* docebo/doceboCore/lib/lib.iotask.php

and the tables `core_task`,`core_connection`,`core_connector`.

for better understanding below are the definitions of the tables concerned

# core_task

```sql
create table core_task (
name varchar(50) not null default '',
description varchar(255) not null default '',
conn_source varchar(50) not null default '',
conn_destination varchar(50) not null default '',
schedule_type enum('at','any') not null default 'at',
schedule varchar(50) not null default '',
import_type varchar(50) not null default '',
map text not null,
last_execution datetime default null,
sequence int(3) not null,
primary key  (name)
) ENGINE=MyISAM default CHARSET=utf8
```

# core_connection

```sql
create table core_connection (
name varchar(50) not null default '',
description varchar(255) default NULL,
type varchar(50) not null default '',
params text,
primary key  (name)
) ENGINE=MyISAM default CHARSET=utf8
```

# core_connector

```sql
create table core_connector (
type varchar(25) not null default '',
file varchar(255) not null default '',
class varchar(50) not null default '',
primary key  (type)
) ENGINE=MyISAM default CHARSET=utf8
```

I am interested in learning more about the specific behaviour of docebo in this context,please do not hesitate to contact me,the version used of `Docebo` is `3.6.0.3`.
