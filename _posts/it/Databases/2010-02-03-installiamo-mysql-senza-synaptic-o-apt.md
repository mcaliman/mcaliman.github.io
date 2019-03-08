---
layout: post
title:  "Installiamo mysql senza synaptic o apt"
excerpt: ""
category: Databases
date:   2011-02-03 22:45:33
tags: [MySQL]
comments: true
share: true
---
Scarichiamo il tar.gz dal sito di mysql www.mysql.com
posizioniamolo in /usr/local scompattiamo il tar.gz con il comando

{% highlight bash %}
tar -xzf mysql-5.1.31-linux-i686-glibc23.tar.gz
{% endhighlight %}

(abbiamo assunto da un caso reale che la versione sia la 5.1.31, in questo caso il nome del file è
mysql-5.1.31-linux-i686-glibc23.tar.gz) creaimo il link simbolico mysql

{% highlight bash %}
ln -s mysql-5.1.31-linux-i686-glibc23 mysql
{% endhighlight %}

creaimo utenti/gruppi

{% highlight bash %}
groupadd mysql
useradd -g mysql mysql
{% endhighlight %}

inizializiamo il db
{% highlight bash %}
cd mysql
./scripts/mysql_install_db --user=mysql
{% endhighlight %}

aggiungiamo i permessi necessari alle directory

{% highlight bash %}
chown -R root:mysql .
chown -R mysql:mysql data
{% endhighlight %}

facciamo partire il demone di mysql in background con il comando
{% highlight bash %}
./bin/mysqld_safe --user=mysql &
{% endhighlight %}

configuriamo le variabili di ambiente
in /root/.bashrc (o nella propria home)
aggiungiamo le righe

{% highlight bash %}
MYSQL=/usr/local/mysql
export MYSQL
PATH=$MYSQL/bin:.:$PATH
export PATH
{% endhighlight %}

aggiungiamo le righe anche in 
/etc/init.d/bootmisc.sh
per poter gestire l'avvio automatico del servizio di mysql

{% highlight bash %}
MYSQL=/usr/local/mysql
export MYSQL
PATH=$MYSQL/bin:.:$PATH
export PATH
{% endhighlight %}

