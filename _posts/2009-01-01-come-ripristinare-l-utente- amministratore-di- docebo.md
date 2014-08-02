---
layout: post
title:  "Come ripristinare l'utente amministratore di Docebo"
date:   2009-01-01 22:45:33
tags: [Docebo,MySQL,MyISAM,InnoDB]
comments: false
share: true
---

In fase di importazione da file **CSV**, **Docebo** talvolta cancella l’utente admin e non è più possibile accedere al pannello di amministrazione.
Il bug a quanto pare è noto fin dal 2005, ne ho trovato riscontro in rete e su vari forum e gruppi di discussione. 
Al momento non ho individuato patch ufficiali che risolvano il problema,uno dei consigli che ho spesso trovato è quello di ripristinare un backup del database. Una soluzione indolore è ripristinare l’utente admin con le istruzioni che riporto qui sotto. 

{% highlight sql %}
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
{% endhighlight %}

L'anomalia si verifica in modo casuale ed è imputabile a mio parere all'uso dell'engine **MyISAM** in luogo di **InnoDB**.
Le istruzioni vanno eseguire riga per riga nell’ordine dato e solo se l’utente admin è assente dalla tabella core_user e correlate.
Sotto sono riportate le definizioni delle tabelle interessate

#tabella core_user

{% highlight sql %}
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
{% endhighlight %}

#tabella core_group_members 

{% highlight sql %}
create table core_group_members (
idst int(11) not null default '0',
idstMember int(11) not null default '0',
filter varchar(50) not null default '',
unique key unique_relation (idst,idstMember)
) ENGINE=MyISAM default CHARSET=utf8
{% endhighlight %}

Sono interessato ad approfondire il comportamento specifico di docebo in questo contesto,non esitate a contattarmi,la versione utilizzata di **Docebo** è la **3.6.0.3**.

