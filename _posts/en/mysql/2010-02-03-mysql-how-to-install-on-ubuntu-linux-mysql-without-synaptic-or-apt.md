---
layout: post
title:  "MySQL: how to install on Ubuntu Linux MySQL without Synaptic or apt"
excerpt: "Installing MySQL on Ubuntu Linux without using Synaptic or apt"
category: MySQL
date:   2011-02-03
comments: true
share: false
modified: 2024-07-11
published: true
tags: [mysql, database, en, code]
permalink: /mysql/mysql-install-ubuntu-linux/
---
Download the `.tar.gz` from the MySQL website (www.mysql.com):
place it in `/usr/local` and unpack the `.tar.gz` with the following command:

```bash
tar -xzf mysql-5.1.31-linux-i686-glibc23.tar.gz
```

(We have assumed from a real case that the version is 5.1.31, in which case the file name is `mysql-5.1.31-linux-i686-glibc23.tar.gz`). Create the MySQL symbolic link:

```bash
ln -s mysql-5.1.31-linux-i686-glibc23 mysql
```

Create the users and groups:

```bash
groupadd mysql
useradd -g mysql mysql
```

Initialize the database:
```bash
cd mysql
./scripts/mysql_install_db --user=mysql
```

Add the necessary permissions to the directories:

```bash
chown -R root:mysql .
chown -R mysql:mysql data
```

Start the MySQL daemon in the background with the following command:
```bash
./bin/mysqld_safe --user=mysql &
```

Configure the environment variables in your shell configuration file (e.g., `/root/.bashrc` or `~/.bashrc`) by adding the following lines:

```bash
MYSQL=/usr/local/mysql
export MYSQL
PATH=$MYSQL/bin:.:$PATH
export PATH
```

Also, add these lines to `/etc/init.d/bootmisc.sh` to handle the automatic start-up of the MySQL service:

```bash
MYSQL=/usr/local/mysql
export MYSQL
PATH=$MYSQL/bin:.:$PATH
export PATH
```
