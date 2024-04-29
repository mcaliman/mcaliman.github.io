---
layout: post
lang: en
title:  "Enable the sudo command on debian 8"
excerpt: ""
category: "Operating Systems"
date:   2015-05-01 22:45:33
tags: ["Linux"]
comments: true
share: false
revision: 0
---

> Part of the inhumanity of the computer is that, once it is competently programmed and working smoothly, it is completely honest. 
>
> <cite>Isaac Asimov, The Winds of Change and Other Stories", >1983</cite>


Lately, I have been coming back to appreciate the Debian distribution. I have not stopped being a fan of Ubuntu, which I use for everything from my laptop to my work servers. The initial motivation was rather random: I was looking for a distribution that would be suitable for my `HP Proliant ML110 G5`. The problem with the `Ubuntu 14.04 LTS desktop` was due to the integrated graphics card on the motherboard, a `Matrox Graphics MGA G200 AGP`. Apparently, it just didn't want to work properly with the 14.04 desktop.  Gnome's performance was devastating.

Installed `Debian 8` and the problem did not manifest itself, very good performance, but I was used to using the `sudo` command and by default Debian did not have it, neither installed nor activated for the main user created during installation. Getting the necessary permissions each time by becoming `root` was rather annoying. So below are instructions for activating sudo

First, we become `root`

```bash
su root
```
then install sudo

```bash
apt-get install sudo
```
now edit the `/etc/sudoers` fils with the visudo command by adding

```bash
<username> ALL=(ALL) ALL 
```
in my case

```bash
mcaliman ALL=(ALL) ALL 
```

after the line `#includedir /etc/sudoers.d`. You can now use sudo as usual on ubuntu.
