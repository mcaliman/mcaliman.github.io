---
layout: post
lang: en
title:  "How to install Ant on Linux"
excerpt: ""
category: Linux
date:   2013-01-01 22:45:33
tags: [Ant, Java, Linux, English]
comments: true
share: true
---

Let's see how to install ant, which is a requirement for installing GlassFish on Linux.
1. Download the tar.gz file from the website and transfer it to `/usr/local`
2. Unzip the file  `apache-ant-1.7.1-bin.tar.gz` with the command:

```
tar xvfz apache-ant-1.7.1-bin.tar.gz
```

3.Create our usual symbolic link with the command `ln`
```
ln -s apache-ant-1.7.1 ant
```

4.Add the environment variables to `/root/.bashrc`  (or to our non-root user's home directory)

```
ANT_HOME=/usr/local/ant
export ANT_HOME
PATH=$ANT_HOME/bin:.:$PATH
export PATH
```

Once you have completed these steps, you can start using Ant to build your Java projects.
