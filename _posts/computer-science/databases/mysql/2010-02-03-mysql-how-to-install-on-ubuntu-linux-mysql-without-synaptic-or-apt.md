---
layout: post
lang: en
title:  "MySQL: how to install on ubuntu linux mysql without synaptic or apt"
excerpt: ""
category: "Databases"
date:   2011-02-03 22:45:33
tags: [MySQL]
comments: true
share: true
revision: 1
---
We download the `tar.gz` from the mysql site www.mysql.com
place it in `/usr/local` unpack the `tar.gz` with the command

```bash
tar -xzf mysql-5.1.31-linux-i686-glibc23.tar.gz
```

(we have assumed from a real case that the version is 5.1.31, in which case the file name is `mysql-5.1.31-linux-i686-glibc23.tar.gz`) we create the mysql symlink

```bash
ln -s mysql-5.1.31-linux-i686-glibc23 mysql
```

create users/groups

```bash
groupadd mysql
useradd -g mysql mysql
```

initialise the db
```bash
cd mysql
./scripts/mysql_install_db --user=mysql
```

we add the necessary permissions to the directories

```bash
chown -R root:mysql .
chown -R mysql:mysql data
```

start the mysql daemon in the background with the command
```bash
./bin/mysqld_safe --user=mysql &
```

we configure the environment variables in `/root/.bashrc` (or in your home) add the lines

```bash
MYSQL=/usr/local/mysql
export MYSQL
PATH=$MYSQL/bin:.:$PATH
export PATH
```

we also add the lines in `/etc/init.d/bootmisc.sh` to handle the automatic start-up of the mysql service

```bash
MYSQL=/usr/local/mysql
export MYSQL
PATH=$MYSQL/bin:.:$PATH
export PATH
```