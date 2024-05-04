---
layout: post
lang: en
title: "I am replacing my old bash scripts with Python #2."
excerpt: "Python script to zip GlassFish logs and archive them by year and month. The script deletes the files after zipping them."
category: "Python"
tags: ["Programming Languages","Python"]
modified: 2023-04-24
comments: true
share: false
search_omit: false
---

Like me, have you also accumulated many bash scripts over the years to automate operations on your systems?

I am gradually replacing all of my bash scripts used to automate backup and analysis tasks on my home server and home laptop with new ones written in Python. I decided to switch because Python offers many more features and libraries than other scripting languages. Additionally, it is much easier to read and maintain.

I am very satisfied with the final result. My new Python scripts are much easier to use and maintain than my old ones.

Python script to zip GlassFish logs and archive them by year and month. The script deletes the files after zipping them.


```python

import os
import zipfile
from datetime import datetime


def archive_glassfish_logs(log_path):
    zip_files = {}
    for file in os.listdir(log_path):
        if file.startswith('server.log_'):
            file_date_str = file.split('server.log_')[1].split('.')[0]
            file_date = datetime.strptime(file_date_str, '%Y-%m-%dT%H-%M-%S')
            zip_name = file_date.strftime('%Y-%m') + '.zip'
            if zip_name not in zip_files:
                zip_files[zip_name] = []
            zip_files[zip_name].append(file)
    # Add a timestamp to zip (do not override zip)
    for zip_name, files in zip_files.items():
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        new_zip_name = zip_name.replace('.zip', '_timestamp_' + timestamp + '.zip')
        with zipfile.ZipFile(os.path.join(log_path, new_zip_name), 'a') as log_zip:
            for file in files:
                log_zip.write(os.path.join(log_path, file), file)
                os.remove(os.path.join(log_path, file))


# Usage example
archive_glassfish_logs("./logs") # GlassFish 4.1.2 log directory

```


