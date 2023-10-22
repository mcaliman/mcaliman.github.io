---
layout: post
lang: en
title: "I am replacing my old bash scripts with Python #1."
excerpt: "Copy a list of directories with their contents to a shared folder."
category: "Python"
tags: ["Programming Languages","Python"]
modified: 2023-04-25
comments: true
share: true
search_omit: false
updated: true
revision: 0
---

Like me, have you also accumulated many bash scripts over the years to automate operations on your systems?

I am gradually replacing all of my bash scripts used to automate backup and analysis tasks on my home server and home laptop with new ones written in Python. I decided to switch because Python offers many more features and libraries than other scripting languages. Additionally, it is much easier to read and maintain.

I am very satisfied with the final result. My new Python scripts are much easier to use and maintain than my old ones.

Here is the first simple copy-backup script rewritten in Python


```python
#
# simple, trivial, but sufficient for my needs for important and frequently used files
# for everything else, there is Veeam Backup
# 
import os
import shutil
from pathlib import Path
from datetime import datetime

now = datetime.now() 
timestamp = now.strftime('%Y%m%d%H%M%S')

shared_drive = "U:\\Phobos7" # Phobos7 is my new Lenovo laptop.

backup_folder = Path(shared_drive) / "Backup" / timestamp

if not backup_folder.exists():
    backup_folder.mkdir()

username = os.getlogin()

folders_to_copy = ["Desktop", "Documents", "Pictures", "Music","github","IdeaProjects"]

for folder in folders_to_copy:
    source_folder = Path.home() / folder
    destination_folder = backup_folder / folder
    shutil.copytree(source_folder, destination_folder, dirs_exist_ok=True)
print("End! Bye Bye.")
```


