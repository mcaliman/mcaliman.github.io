---
layout: post
title:  "GlassFish V3: la console amministrazione prendendo troppo tempo per caricare."
excerpt: ""
category: ComputerScience
date:   2014-01-11 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java, GlassFishV3]
comments: true
share: true
---

Chiedersi se un computer possa pensare non è più interessante del chiedersi se un sottomarino possa nuotare.
*(Edsger Dijkstra, The threats to computing science, 1984)*

La console di amministrazione di GlassFish V3 prendendo troppo tempo per caricare?

1. Aprire il file `%GLASSFISH_HOME/glassfish/domains/domain1/config/domain.xml`

{% highlight xml %}
<java-config> 
     <jvm-options>-Dcom.sun.enterprise.tools.admingui.NO_NETWORK=true</jvm-options>
</java-config> 
{% endhighlight %}

L'aggiunta di questa proprietà può essere anche fatta dal pannello di amministrazione nella sezione per i parametri della JVM 

Questa proprietà a `true` blocca news, notifiche per la registrazione, ecc.

2. Rimuovere il jar per i tool di update (rimuovere e non rinominare l'estensione, effettuatene un backup prima)
Nome del file e path sono riporti di seguito
{% highlight bash %}
%GLASSFISH_HOME/glassfish/modules/console-updatecenter-plugin.jar
{% endhighlight %}

Cancellate poi anche le seguenti directory
{% highlight bash %}
%GLASSFISH_HOME/glassfish/domains/domain1/osgi-cache
%GLASSFISH_HOME/glassfish/domains/domain1/generated
{% endhighlight %}

Ora potete far ripartire il server con `bin/asadmin start-domain` .


