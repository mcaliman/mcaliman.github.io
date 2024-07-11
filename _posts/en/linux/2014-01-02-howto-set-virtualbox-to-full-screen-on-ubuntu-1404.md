---
layout: post
title:  "How to set Virtualbox to full screen on Ubuntu 14.04"
excerpt: ""
category: Linux
date:   2014-01-02
comments: true
share: false
modified: 2024-07-11
published: true
---


If you have installed VirtualBox on Ubuntu 14.04 but the window is small (the resolution is 800x600) working becomes hard. 
The solution is to install VirtualBox Guest Addition, I suggest you forget installing from the cd image and proceed with `apt-get`

```
sudo apt-get install virtualbox-guest-x11
```

once the installation is complete, reboot the system.
