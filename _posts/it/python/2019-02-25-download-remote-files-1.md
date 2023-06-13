---
layout: post
lang: it
title: "Download di file remoti con Python #1"
excerpt: "Automatizziamo compiti ricorrenti come il download di file remoti in locale"
modified: 2019-02-25
categories: Python
tags: [Italian,Python]
comments: true
share: true
search_omit: false
updated: true
---

Ci sono operazioni ricorrenti che continuiamo a effettuare anche quotidianamente solo perchè siamo troppo pigri per automatizzarle oppure perchè tra mille impegni di lavoro ripetiamo a noi stessi il matra "tanto mi porta via SOLO 5 minuti". Ma proprio perchè "pigri" dovremmo cercare di evitare queste operazioni, che oltre che noiose, in una settimana di lavoro possono sottrarci ben 25 minuti di lavoro, minuti che potrebbero essere impiegati, per esempio, a recuperare un ritardo in un task ben più importante, oppure ad effettuare, quel refactoring che continuiamo a posticipare.

Il codice che riporto sotto, ci permette, per esempio, di scaricare tutti i log del nostro application server, per analizzarli, oppure di scaricare i dump dei nostri database di produzione per poterli poi rispristinare (sempre in automatico) sul nostro sistema di sviluppo.

Attenzione: il codice riportato non scarica ricorsiavamente tutto il contenuto di una cartella, comprese sotto directory e loro contenuto, ma se serve, può essere modificato per assolvere anche questo compito.

Per collegarci in remoto via sftp utilizzeremo la libreria paramiko (paramiko.org), per installarla dobbiamo usare pip, avendo installato sia python2 che python3 nel mio caso utilizzero pip3, che dovremmo avere già installato. Paramiko utilizza anche pycrypto, quindi dovremmo installare anch'essa.

```bash
pip3 install pycrypto
pip3 install paramiko
```

Vediamo ora il codice, è piuttosto semplice ma alcune considerazioni sono d'obbligo. 
paramiko non ci da modo di scaricare una directory in blocc, quindi è necessario recuperare
la lista dei file remota e poi iterare su di essa per effettuare il get, controllando che si tratti di un file e non di una directory. 

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

E anche per oggi è tutto.