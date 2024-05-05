---
layout: post
lang: en
title: "Downloading remote files with Python #2"
excerpt: "Let's continue with the automation and see how to unzip the .gz files"
category: Python
tags: ["Programming Languages","Python"]
permalink: /python/download-remote-files/2/
modified: 2019-03-19
comments: false
share: false
---

In the previous post, we saw how to download generic files remotely with python. In this post, let's consider instead that the files are compressed files (.gz) containing, for example, the sql dumps of some of our databases, in order to restore them locally we also need to decompress them. The code has some limitations, such as that each file of type filename.sql.gz only contains the file filename.sql.
There are various options to perform this operation, including calling gzip in a shell, in the code below we adopt a 'native' solution using the gzip library which allows us to unzip and shutil which provides a way to save our unzipped file.

The call unzip(local_file_path, local_file_path.replace('.gz', '')) will pass to the unzip function the name of the .gz file just downloaded and the name to be given to the unzipped file (removing the gz extension from the original file name)

At the end of the execution, when we have a dump1.sql.gz file downloaded locally, we will also find the dump1.sql file decompressed and ready to feed to our database.

The complete code, as usual, is shown below.

```python
import paramiko
import os.path
import gzip
import shutil

def unzip(zipped, unzipped):
    with gzip.open(zipped, 'rb') as fin:
        with open(unzipped, 'wb') as fout:
            shutil.copyfileobj(fin, fout)

def donwload_remote_files(_host, _host_username, _host_password, _remote_path, _local_path):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname=_host, username=_host_username, password=_host_password)
    print('Connect to: ' + _host)
    sftp = ssh.open_sftp()
    remote_list = sftp.listdir(_remote_path)
    for remote_file in remote_list:
        remote_file_path = _remote_path + remote_file
        local_file_path = _local_path + remote_file
        print(remote_file_path)
        sftp.get(remote_file_path, local_file_path)
        unzip(local_file_path, local_file_path.replace('.gz', ''))    
    print('Download completed.')
    sftp.close()
    ssh.close()


host = 'domain.ext'
host_username = 'user'
host_password = 'passw'

local_path = '/home/mcaliman/test/'
remote_path = '/home/mcaliman/'
donwload_remote_files(host, host_username, host_password, remote_path, local_path)
```

