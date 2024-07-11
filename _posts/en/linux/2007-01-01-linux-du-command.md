---
layout: post
title:  "The du Linux command"
excerpt: "How to shows the disk space used"
category: Linux
date:   2007-01-01
comments: true
share: false
modified: 2024-07-11
published: true
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