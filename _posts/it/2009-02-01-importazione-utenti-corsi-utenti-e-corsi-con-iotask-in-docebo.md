---
layout: post
title:  "Importazione utenti,corsi,utenti e corsi con I/O Task in Docebo"
category: articles
date:   2009-01-01 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Docebo]
comments: true
share: true
---

Chi ha necessità di importare utenti,corsi,associazioni tra utenti-corsi in maniera automatica e schedulata avrà necessariamente avuto a che fare con gli I/O Task.
La schedulazione è subordinata alle impostazioni temporali nel pannello di amministrazione I/O Task e al lancio di una url particolare da cron. 
Per la versione in esame (3.6.0.3) non è possibile lanciare nuovamente un task (giornaliero) qualora non fosse andato a buon fine,o semplicemente, se fosse necessario iterarlo nuovamente. Il task viene marcato come eseguito. 
Una delle possibilità per poterlo rieseguire è modificare il campo **last_execution** della tabella **core_taskportando** la data a quella del giorno precedente.
Il comportamento è evidente analizzando i sorgenti

* docebo/doceboCore/class.module/class.iotask.php
* docebo/doceboCore/lib/lib.iotask.php

e le tabelle **core_task**,**core_connection**,**core_connector**.

per una migliore comprensione sotto sono riportate le definizioni delle tabelle interessate

#tabella core_task

{% highlight sql %}
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
{% endhighlight %}

#tabella core_connection

{% highlight sql %}
create table core_connection (
name varchar(50) not null default '',
description varchar(255) default NULL,
type varchar(50) not null default '',
params text,
primary key  (name)
) ENGINE=MyISAM default CHARSET=utf8
{% endhighlight %}

#tabella core_connector

{% highlight sql %}
create table core_connector (
type varchar(25) not null default '',
file varchar(255) not null default '',
class varchar(50) not null default '',
primary key  (type)
) ENGINE=MyISAM default CHARSET=utf8
{% endhighlight %}

In rete non ho trovato al momento patch o informazioni particolareggiate in merito.Sono interessato ad approfondire il comportamento specifico di docebo in questo contesto,quindi non esitate a contattarmi,la versione utilizzata di **Docebo** è la **3.6.0.3**.

