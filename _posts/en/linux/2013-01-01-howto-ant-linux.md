---
layout: post
title:  "How to install Ant on Linux"
excerpt: ""
category: Linux
comments: true
share: false
date: 2013-01-01
modified: 2024-07-11
published: true
---

> “Software is like sex: it’s better when it’s free.”
>
> – Linus Torvalds

Let's see how to install ant, which is a requirement for installing GlassFish on Linux.
Download the tar.gz file from the website and transfer it to `/usr/local`
Unzip the file  `apache-ant-1.7.1-bin.tar.gz` with the command:



```
tar xvfz apache-ant-1.7.1-bin.tar.gz
```

Create our usual symbolic link with the command `ln`
```
ln -s apache-ant-1.7.1 ant
```

Add the environment variables to `/root/.bashrc`  (or to our non-root user's home directory)

```
ANT_HOME=/usr/local/ant
export ANT_HOME
PATH=$ANT_HOME/bin:.:$PATH
export PATH
```

Once you have completed these steps, you can start using Ant to build your Java projects.
