---
layout: post
lang: en
title: "Downloading remote files with Python #1"
excerpt: "Automating recurring tasks such as downloading remote files locally"
category: programming-languages
tags: [Python]
modified: 2019-02-25
comments: true
share: true
search_omit: false
updated: true
revision: 0
---
There are recurring operations that we continue to perform even on a daily basis just because we are too lazy to automate them or because between a thousand work commitments we repeat to ourselves the matra 'it only takes me five minutes'. But it is precisely because we are 'lazy' that we should try to avoid these operations, which, besides being boring, can take up to 25 minutes of work in a working week, minutes that could be used, for example, to catch up on a much more important task, or to carry out the refactoring that we continue to postpone.

The code shown below allows us, for example, to download all the logs of our application server, in order to analyse them, or to download the dumps of our production databases in order to restore them (again automatically) on our development system.

Please note: the code shown does not recursively download the entire contents of a folder, including sub-directories and their contents, but can be modified to perform this task if required.

To connect remotely via sftp we will use the paramiko library (paramiko.org), to install it we must use pip, having installed both python2 and python3 in my case I will use pip3, which we should already have installed. Paramiko also uses pycrypto, so we should also install it.

```bash
pip3 install pycrypto
pip3 install paramiko
```

Let us now look at the code, it is quite simple but some considerations are in order. 
paramiko gives us no way to download a locked directory, so we need to retrieve
the remote file list and then iterate over it to perform the get, checking that it is a file and not a directory.

```python
import paramiko
import os.path

def donwload_remote_files(_host, _host_username, _host_password, _remote_path, _local_path):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname=_host, username=_host_username, password=_host_password)
    print('Connect to: ' + _host)
    sftp = ssh.open_sftp()
    remote_list = sftp.listdir(_remote_path)
    print('Length of `remote_list` = ', len(remote_list))
    for remote_file in remote_list:
        remote_file_path = _remote_path + remote_file
        local_file_path = _local_path + remote_file
        print(remote_file_path)
        if os.path.isfile(remote_file_path):
            sftp.get(remote_file_path, local_file_path)
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
