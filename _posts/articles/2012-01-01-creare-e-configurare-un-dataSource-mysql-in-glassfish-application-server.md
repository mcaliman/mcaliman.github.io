---
layout: post
title:  "Creare e configurare un DataSource MySQL in GlassFish Application Server"
excerpt: ""
category: articles
date:   2012-01-01 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java, DataSource, GlassFish, MySQL]
comments: true
share: true
---

Mentre in fisica devi capire come è fatto il mondo, in informatica sei tu a crearlo. Dentro i confini del computer, sei tu il creatore. Controlli – almeno potenzialmente – tutto ciò che vi succede. Se sei abbastanza bravo, puoi essere un Dio. Su piccola scala.
*(Linus Torvalds, Rivoluzionario per caso, 2001)*

1. Effettuare il download del JDBC driver per MySQL dall'indirizzo
   http://dev.mysql.com/downloads/connector/j/3.1.html
2. Estrare il contenuto del file zip.
3. Copiate mysql-connector-java-x.x.x-bin.jar nel path `GLASS_FISH_INSTALL_DIR\lib`.
3. Effettuare lo start di GlassFish Application Server con il comando `asadmin.bat start-domain domain1` dalla directory    `GLASS_FISH_INSTALL_DIR\bin`.
4. Effettuare il login alla console di amministrazione di GlassFish. L'url di default per la console di amministrazione è `http://localhost:4848/login.jsf`.
5. Da menu `Common Task` espandere il menu `Resources`.
6. Espandete il menu `JDBC` sotto `Resources`.
7. Cliccare su `Connection Pools` sotto il menu `JDBC`. La pagine dei `Connection Pools` page verrà visualizzata.
8. Cliccare su `New`.
9. Inserire un nome per il vostro pool di connessioni JDBC . Selezionate `javax.sql.ConnectionPoolDataSource` come `Resource Type` e selezionate `MySQL` come Database vendor.
10. Cliccare su `Next`.
11. Compilare i dettagli in accordo con le vostre nececessità. I campi obbligatori sono.
a. `DatabaseName`
b. `Password`
c. `URL` (il formato dovrà essere jdbc:mysql://localhost:3306/test. Dove test è il nome del vostro database.)
d. `Url` (il formato dovrà essere jdbc:mysql://localhost:3306/test. Dove test è il nome del vostro database.)
e. `ServerName`
f. `User`
12. Cliccare su `Finish`. Ora è possibile tornare alla pagina dei `Connection Pools`.
13. Ciccare sul `Connection Pool` creata per accedere alla pagina `Edit`.
14. Cliccare su `Ping`. Se il vostro connection pool è settato correttamente otterrete il messaggio Ping Succeeded.

15. Ora cliccare su `JDBC Resorces` sotto il menu `JDBC`.
16. Cliccare su `New`.
17. Inserire un `JNDI Name` per il vostro data source e selezionate il pool che avete creato seguendo le istruzioni dei passi precedenti (Pool Name).

18. Cliccare su `OK`. Avete terminato.
Per ottenere una connessione usando un DataSource portete utilizzare il seguente codice di esempio.

{% highlight java %}
Context ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("jdbc/mysqltest");
Connection con = ds.getConnection();
{% endhighlight %}


