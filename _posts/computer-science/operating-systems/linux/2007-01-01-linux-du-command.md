---
layout: post
lang: en
title:  "The du Linux command"
excerpt: "How to shows the disk space used"
category: "Operating Systems"
date:   2007-01-01 22:45:33
modified: 2023-03-19
tags: ["Linux"]
comments: true
share: false
revision: 0
---

The `du` command shows the disk space used.

Use:
```bash
du -s -h .
```
Where:

`-s` --summarise display only a total for each argument.


`-h`  --human-readable print sizes in human readable format (e.g., 1K 234M 2G).

`.` Indicates to apply to the current directory.

Example:
```bash
mcaliman@deimos:~# du -s -h .

537M .
```