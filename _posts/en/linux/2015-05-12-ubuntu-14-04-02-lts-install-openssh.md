---
layout: post
title: "Ubuntu 14.04.02 LTS 64-bit: how to install OpenSSH"
excerpt: "Installing OpenSSH server on Ubuntu 14.04.02 LTS 64-bit"
category: Linux
date: 2015-05-12
comments: true
share: false
modified: 2024-07-11
published: true
tags: [linux, ubuntu, en, code]
permalink: /linux/ubuntu-140402-lts-64bit/
---


Installing the OpenSSH server and client applications is simple. To install the OpenSSH client application on Ubuntu systems, use this command at a terminal prompt:

```
sudo apt-get install openssh-client
```

To install the OpenSSH server application and its supporting files, use this command at a terminal prompt:

```
sudo apt-get install openssh-server
```

If the DHCP server assigns us a different IP each time, or it simply never occurred to us to need to know this detail, we need to retrieve it using the following command:

```
$ ifconfig 
```

You do not need `root` privileges to run this command. Once we have the IP (e.g., 192.168.1.23), we can try connecting from another machine:

```bash
ssh <username>@<hostip>
```
