---
layout: post
title: "How to install subversion (svn) on Ubuntu 14.04.02 LTS"
excerpt: "Installing Subversion (SVN) on Ubuntu 14.04.02 LTS"
category: Linux
date: 2015-05-15
comments: true
share: false
modified: 2024-07-11
published: true
tags: [linux, ubuntu, en, code]
permalink: /linux/ubuntu-14.04.02-LTS-install-subversion/
---


> When debugging, novices insert corrective code; experts remove defective code.
> 
> – Richard E. Pattis

Here again, `apt` is more than generous:
```
$ sudo apt-get install subversion
```

We do not install with Apache because we will access svn via ssh in a much more secure way.
First, we create the directory that will host our project and repository:
```
mkdir /var/svn/MyApplication
```

We "inform" SVN that this directory is a repository:
```
svnadmin create /var/svn/MyApplication
```

At this point from our favorite IDE, we can check out or initialize the repository when we have it locally. The repository URL is in the following format:
```
svn+ssh://svnserver/var/svn/MyApplication
```
