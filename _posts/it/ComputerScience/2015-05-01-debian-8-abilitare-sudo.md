---
layout: post
title:  "Abilitare il comando sudo su debian 8"
excerpt: ""
category: "Computer Science"
date:   2015-05-01 22:45:33
tags: [linux,debian,debian 8]
comments: true
share: true
---

Parte della disumanità del computer sta nel fatto che, una volta programmato e messo in funzione, si comporta in maniera perfettamente onesta. *(Isaac Asimov, Il vento è cambiato, 1983)*

Ultimamente sto tornando ad apprezzare la distribuzione debian. Non ho smesso di essere un fan di ubuntu che uso per ogni cosa sia per il mio portatile personale che per i server di lavoro. La motivazione iniziale è stata piuttosto casuale: cercavo una distribuzione che fosse adatta al mio `HP Proliant ML110 G5`. Il problema che si presentava con la `Ubuntu 14.04 LTS desktop` era imputabile alla scheda grafica integrata sulla scheda madre, una `Matrox Graphics MGA G200 AGP`. A quando pare di funzionare correttamente con la 14.04 desktop proprio non voleva saperne.  Le performance di gnome erano devastanti.

Installata la `debian 8` il problema non si è manifestato, ottime performance, ero abituato però ad usare il comando `sudo` e di default la debian non lo ha, ne installato, ne attivato per l’utente principale creato in fase di installazione. Ottenere ogni volta i permessi necessari diventando `root` era piuttosto fastidioso. Ecco quindi sotto le istruzioni per attivare sudo

Per prima cosa diventiamo `root`

{% highlight bash %}
su root
{% endhighlight %}


poi installiamo sudo 

{% highlight bash %}
apt-get install sudo
{% endhighlight %}

a questo punto modificare il fils `/etc/sudoers` con il comando visudo aggiungendo

{% highlight bash %}
<username> ALL=(ALL) ALL 
{% endhighlight %}

nel mio caso

{% highlight bash %}
mcaliman ALL=(ALL) ALL 
{% endhighlight %}

dopo la riga `#includedir /etc/sudoers.d`. Ora potete utilizzare sudo come d’abitudine su ubuntu.
