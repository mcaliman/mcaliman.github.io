---
layout: post
title: "How to install Ant on Linux"
excerpt: "Step-by-step guide to installing Apache Ant on Linux"
category: Linux
date: 2013-01-01
comments: true
share: false
modified: 2024-07-11
published: true
tags: [linux, sysadmin, en, code]
permalink: /linux/howto-ant-linux/
---


> "Software is like sex: it's better when it's free."
>
> – Linus Torvalds

Let's see how to install Ant, which is a requirement for installing GlassFish on Linux.
Download the `.tar.gz` file from the official website and transfer it to `/usr/local`.
Unzip the `apache-ant-1.7.1-bin.tar.gz` file with the following command:

```
tar xvfz apache-ant-1.7.1-bin.tar.gz
```

Create our usual symbolic link with the command `ln`
```
ln -s apache-ant-1.7.1 ant
```

Add the environment variables to your shell configuration file (e.g., `/root/.bashrc` or `~/.bashrc`):

```
ANT_HOME=/usr/local/ant
export ANT_HOME
PATH=$ANT_HOME/bin:.:$PATH
export PATH
```

Once you have completed these steps, you can start using Ant to build your Java projects.
