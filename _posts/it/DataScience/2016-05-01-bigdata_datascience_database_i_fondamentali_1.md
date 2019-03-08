---
layout: post
title:  "Big Data, Data Science, Database i fondamentali 1"
excerpt: ""
category: DataScience
date:   2016-05-01 22:45:33
tags: [it]
comments: true
share: true

image:
  path: /images/unsplash/daniele-d-andreti-1131982-unsplash.jpg
  # thumbnail:/images/unsplash/daniele-d-andreti-1131982-unsplash.jpg
  caption: "[Photo by Daniele D'Andreti on Unsplash](https://unsplash.com/photos/RpHarahftoM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)"
---


{% highlight bash %}
{% endhighlight %}

Quando si parla di Big Data si parla di un evoluzione delle basi di dati, ma in grande o meglio si parla di una raccolta di dati così estesa in termini di volume, velocità e varietà da richiedere tecnologie e metodi analitici specifici per l'estrazione di valore.

Questa è la definizione che possiamo trovare da una superficiale ricerca in rete. Potremmo avere a che fare con Big Data anche se la caratteristica fosse solo la varietà o la velocità.

Il Data Scientist, cioè colui che ha una preparazione in Data Science si occupa di analizzare, interpretare dati, e sopratutto deve saperli recuperare e “ripulire” o “preparare” per l’analisi.

Per muoversi in questo ambito a mio parere è imprescindibile un avere una classica formazione sulle basi di dati, rivediamo qualche concetto di base

Abbiamo detto che i Big Data sono basi di dati cresciute un po' troppo, o che comunque hanno almeno una delle tre V viste sopra (volume,velocità,varietà), ma una base di dati a cosa serve? A mettere le informazioni da qualche parte in modo che sia facile e veloce recuperarle in seguito.

Il motivo di renderle recuperabili in futuro è semplice: le informazioni insieme alle persone,il denaro i materiali e gli immobili costituiscono il patrimonio delle risorse di ogni organizzazione, dove organizzazione è inteso nel senso più ampio possibile.

Per gestire le informazioni abbiamo bisogno di qualcosa che le contenga e le gestisca permettendoci di accedervi e manipolarle, questo qualcosa è il ben conosciuto sistema informativo i cui compiti sono appunto quelli di raccogliere,conservare,elaborare,trasformare,distribuire le informazioni. Normalmente utilizzano come sinonimi sistema informatico e sistema informativo, il motivo è semplice, oggi i sistemi informativi sono quasi tutti sistemi informatici, realizzati tramite un sistema informatico, la ma definizione che ne abbiamo dato è indipendente dall’automazione. Avete presente il sistema di classificazione e indicizzazione dei libri nelle biblioteche di una volta?Quello è un sistema informativo, non informatico.

Fino ad ora abbiamo parlato di informazioni, ma cosa sono realmente le informazioni? e i dati? Lasciamo perdere i bit per un momento e affidiamoci ai dizionari o quantomeno a wikipedia.

Le informazioni per prima cosa devono essere qualcosa di utile e comprensibile, un qualcosa che produce una variazione nel patrimonio cognitivo di un soggetto detto percettore dell’informazione.

Se chiedo via mail ad un amico che sta in Cina per un soggiorno di studio che tempo fa li e lui mi risponde usando i caratteri cinesi e io non conosco il cinese non ho nessuna variazione nel mio patrimonio cognitivo, utilità, stesa cosa se apro un file jpeg di una foto delle vacanze con un editor esadecimale che di certo non mi permette di vedere l’immagine della piacevole vacanza passata, vedo solo dei dati, che hanno bisogno di un contesto interpretativo. 

Le basi di dati, i database, sono pieni di dati, il loro compito e proprio contenerli e gestirli, pensate ad una colonna che contiene 10,20,34,38 se non conosco il nome della colonne che si chiama Temperatura mi verrà difficile avere il contesto interpretativo per rendere il dato un informazione quindi qualcosa di utile.

Per inciso una base di dati è una collezione di dati tra loro correlati e per gestirla abbiamo la necessità di un sistema di gestione di base di dati, quello che comunemente conosciamo come Data Base Management System in sigla DBMS o RDBMS quando si vuole sottolineare che il database è relazionale.
 
Quando ci si muove nel mondo dei Big Data spesso i database non sono relazionali per i motivi che vedremo.

