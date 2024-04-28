---
layout: post
lang: en
title:  "SSH Log in without typing in the password."
excerpt: ""
category: "Operating Systems"
date:   2014-01-12 22:45:33
update: 2020-06-29 11:00:00
tags: [Linux, ssh, openssh]
comments: true
share:  false
revision: 0
---

If you want to use `Linux` and `OpenSSH` to automate tasks, and you need to be able to log in automatically from host `A` (phobos ubuntu 18.04) with user `a` (mcaliman) to host `B` (deimos ubuntu 20.04) with user `b` (mcaliman) without entering a password, these are the steps you need to take: 

First log into `A` (phobos) as user `a` (mcaliman) and generate an authentication key pair (do not enter a passphrase)

```
a@A:~> ssh-keygen -t rsa

Generating public/private rsa key pair.
Enter file in which to save the key (/home/a/.ssh/id_rsa): 
Created directory '/home/a/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/a/.ssh/id_rsa.
Your public key has been saved in /home/a/.ssh/id_rsa.pub.
The key fingerprint is:
xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx a@A
```

Now use ssh to create a `~/.ssh` directory as user `b` on `B` 

```
a@A:~> ssh b@B mkdir -p .ssh
b@B's password: 
```

Finally queue the new **public key** of user `a` to `b@B:.ssh/authorized_keys` and enter `b`'s password last

```
a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
b@B's password: 
```

You can now log into `B` as user `b` from `A` as user `a` without a password

```
a@A:~> ssh b@B
```

