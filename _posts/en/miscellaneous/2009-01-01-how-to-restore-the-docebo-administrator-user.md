---
layout: post
title:  "How to restore the Docebo administrator user"
excerpt: ""
category: Miscellaneous
comments: true
share: false
date: 2009-01-01
modified: 2024-07-11
published: true
---

When importing from CSV files, Docebo sometimes deletes the admin user and it is no longer possible to access the administration panel.
The bug has been known since 2005, I have found evidence of it on the net and various forums and discussion groups. 
At the moment I have not found any official patches that solve the problem, one of the tips I have often found is to restore a backup of the database. A painless solution is to restore the admin user with the instructions below.

```sql
insert into core_user (
idst,
userid,
firstname,
lastname,
pass,
email,
photo,
avata,
signature,
level,
lastenter,
valid,
pwd_expire_at,
register_date
) values (
last_insert_id(),
'/admin',
'',
'',
md5('TheAdminPassword'),
'theadminmail@mydomain.eu',
'',
'',
'',
'0',
null,
'1',
'0000-00-00 00:00:00',
'0000-00-00 00:00:00');

insert into core_group_members (idst,idstMember,filter) 
values ('1',last_insert_id(),'');
insert into core_group_members (idst,idstMember,filter) 
values ('2',last_insert_id(),'');
insert into core_group_members (idst,idstMember,filter) 
values ('3',last_insert_id(),'');
```

The anomaly occurs randomly and is attributable in my opinion to the use of the `MyISAM` engine instead of `InnoDB`.
The instructions must be executed line by line in the given order and only if the admin user is absent from the core_user and related tables.
Below are the definitions of the affected tables

# core_user

```sql
create table core_user (
idst int(11) not null default '0',
userid varchar(255) not null default '',
firstname varchar(255) not null default '',
lastname varchar(255) not null default '',
pass varchar(50) not null default '',
email varchar(255) not null default '',
photo varchar(255) not null default '',
avatar varchar(255) not null default '',
signature text not null,
level int(11) not null default '0',
lastenter datetime default null,
valid tinyint(1) not null default '1',
pwd_expire_at datetime not null default '0000-00-00 00:00:00',
register_date datetime not null default '0000-00-00 00:00:00',
checkprivacy varchar(5) default 'no',
primary key  (idst),
unique key userid (userid)
) ENGINE=MyISAM default CHARSET=utf8
```

#  core_group_members 

```sql
create table core_group_members (
idst int(11) not null default '0',
idstMember int(11) not null default '0',
filter varchar(50) not null default '',
unique key unique_relation (idst,idstMember)
) ENGINE=MyISAM default CHARSET=utf8
```

I am interested in learning more about the specific behaviour of docebo in this context,please do not hesitate to contact me,the version used of `Docebo` is `3.6.0.3`.
