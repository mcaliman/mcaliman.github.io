---
layout: post
title: "Download di file remoti con Python #2"
excerpt: "Proseguiamo nell'automatizione e vediamo come decompripre i file .gz"
modified: 2019-03-05
categories: python
tags: [Python]
image:
  path: /images/unsplash/andrew-yardley-1258543-unsplash.jpg
  -- thumbnail: /images/unsplash/andrew-yardley-1258543-unsplash.jpg
  caption: "[Photo by Andrew Yardley on Unsplash](https://unsplash.com/photos/QB6HWhQuspU?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)"


comments: true
share: true
search_omit: false
updated: true
---

Nel precedente post abbiamo visto come scaricare dei generici file da remoto con python. In questo post, consideriamo invece che i file siamo dei file compressi (.gz) contenenti,per esempio, i dump sql di alcuni nostri database, per poterli ripristinare in locale abbiamo anche la necessità di decomprimerli. Il codice prevede alcune limitazioni, come ad esempio che ogni del tipo nomefile.sql.gz contega solo il file nomefile.sql.
Ci sono varie opzioni per effettuare questa operazione, tra le quali quella di richiamare gzip in una shell, nel codice sotto adottiamo una soluzione 'nativa' tramite la libreria gzip che ci permette di effettuare l'unzip e shutil che ci fornisce il modo di salvare il nosto file decompress.

La chiamata unzip(local_file_path, local_file_path.replace('.gz', '')) passera alla funzione unzip il nome del file .gz appena scaricato e il nome da dare al file decompresso (eliminando dal nome del file originale l'estensione gz)

Terminata l'esecuizione a fronte di un file dump1.sql.gz scaricato in locale, troveremo anche il file dump1.sql decompresso e pronto da dare in pasto al nostro database.

Il codice completo, è come al solito riportato qui sotto.

{% highlight python %}
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
{% endhighlight %}

Vedremo nei prossimi post come effettuare il restore del dump e qualcosa in più.
E anche per oggi è tutto.