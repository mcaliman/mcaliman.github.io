---
layout: post
title: "The du Linux command"
excerpt: "How to show the disk space used"
category: Linux
date: 2007-01-01
comments: true
share: false
modified: 2024-07-11
published: true
tags: [linux, sysadmin, en, code]
permalink: /linux/linux-du-command/
---


The `du` command shows the disk space used.

Use:
```bash
du -s -h .
```
Where:

`-s` (`--summarize`): Display only a total for each argument.

`-h` (`--human-readable`): Print sizes in human-readable format (e.g., 1K 234M 2G).

`.`: Indicates the current directory.

Example:
```bash
mcaliman@deimos:~# du -s -h .

537M .
```
