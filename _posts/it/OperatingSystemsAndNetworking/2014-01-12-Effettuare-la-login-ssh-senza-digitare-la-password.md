---
layout: post
title:  "Effettuare la login SSH senza digitare la password."
excerpt: ""
category: OperatingSystemsAndNetworking
date:   2014-01-12 22:45:33
tags: [linux, ssh, openssh]
comments: true
share: true
---

Se si vuole usare `Linux` e `OpenSSH` per automatizzare delle attività e si ha la necessità di poter effettuare la login automatica dal un host `A` con utente `a` ad un host `B` con utente `b` senza inserire nessuna password questi sono i passo necessari: 

Per prima cosa effettuare la login in su `A` come utente `a` e genera una coppia di chiavi di autenticazione (non inserire un passphrase)

{% highlight bash %}
a@A:~> ssh-keygen -t rsa

Generating public/private rsa key pair.
Enter file in which to save the key (/home/a/.ssh/id_rsa): 
Created directory '/home/a/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/a/.ssh/id_rsa.
Your public key has been saved in /home/a/.ssh/id_rsa.pub.
The key fingerprint is:
xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx a@A
{% endhighlight %}

Ora usa ssh per creare una directory `~/.ssh` come utente `b` su `B` 

{% highlight bash %}
a@A:~> ssh b@B mkdir -p .ssh
b@B's password: 
{% endhighlight %}

Infine accoda la nuova **public key** dell'utente `a` su `b@B:.ssh/authorized_keys` e inserisci la password di `b` l'ultima volta

{% highlight bash %}
a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
b@B's password: 
{% endhighlight %}

Da questo momento puoi effettuare la login in `B` come utente `b` da `A` come utente `a` senza password

{% highlight bash %}
a@A:~> ssh b@B
{% endhighlight %}


