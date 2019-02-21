---
layout: post
title: Java e il protocollo UDP
excerpt: ""
description: "Introduzione ad uno dei protocolli piu' utilizzati in internet, lo User Datagram Protocol,publicato su MokaByte Numero 39,Marzo 2000,di Massimo Caliman e Nicola Merello."
category: java
tags: [Articoli disponibili in lingua italiana,lang_it,Java,UPD,Mokabyte]
comments: true
share: true
image:
  path: /images/unsplash/sergi-kabrera-705414-unsplash.jpg
  thumbnail: /images/unsplash/sergi-kabrera-705414-unsplasht-thumbnail.jpg
  caption: "[Photo by Sergi Kabrera on Unsplash](https://unsplash.com/photos/2xU7rYxsTiM?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)"
---

Introduzione ad uno dei protocolli piu' utilizzati in internet, lo User Datagram Protocol,
publicato su **MokaByte Numero 39,Marzo 2000,di Massimo Caliman e Nicola Merello**

Nonostante che l'importanza di Java stia crescendo e che l' interesse nei confronti del Networking sia
sempre maggiore, la programmazione di rete in Java è ancora per molti aspetti oscura.
Eppure è molto semplice, in questo articolo ci concentreremo su tutto cio' che ha che fare con il
protocollo UDP e le classi Java.

#Introduzione
Spesso si preferisce ancora scrivere applicazioni di questo tipo ancora in C/C++ (e in alcuni casi
limitati, questo è effettivamente consigliabile) ma si può farlo benissimo anche in Java ed è più facile e
veloce.

Per affrontare questo articolo, non è necessario essere specialisti della rete, una conoscenza dei concetti
basilari della rete e' comunque richiesta, dato che si fara' riferimento ai termini piu' comuni che si
incontrano quando ci si avventura in questa branca della programmazione.

Cominciamo con una note dolente : la rete e' l'area meno supportata dalla maggior parte delle
implementazioni Java, non ci sono errori rilevanti relativi al Networking ma, se si puo' scegliere
l'implementazione e quindi la piattaforma, e' meglio optare per quella della Sun per Solaris.
A questo punto il lettore potrebbe, assalito da qualche dubbio, chiedersi perche' dovrebbe avventurasi
nella programmazione di rete in Java. Basta dare uno sguardo alla lista delle classi che il linguaggio offre
per trattare problematiche di rete per rispondere a questa domanda.

Java (in particolare il package java.net) fornisce delle ottime astrazioni alle problematiche di rete e non
bisogna essere dei guru della rete. Attenzione pero', Java attualmente conosce le reti basate su sistemi IP,
quindi altre (minori) architetture rimangono fuori ma non e' assolutamente un problema, dato che ormai IP oltre
a essere lo standard di Internet (quello con la I maiuscola, la grande rete) sta ormai per divenire anche
quello delle piccole internet aziendali..
In rete i dati viaggiano per mezzo di pacchetti chiamati datagram. Nelle reti IP ogni datagramma contiene
un intestazione lunga dai 20byte ai 60 byte ed un insieme di dati che contiene fino a 65.515byte.
      
#L'User Datagram Protocol ovvero UDP

UDP (User Datagram Protocol )e' un protocollo di trasporto semplice, senza connessione, che si basa sul
trasferimento di datagrammi. Potete trovare la sua descrizione completa nel documento `RFC768` . Qui ne daremo
solo una breve descrizione per poter cominciare subito a sperimentare con le classi Java . Ogni operazione di
output di un processo che usa il trasporto UDP produce un datagramma UDP, che viene Viene incapsulato in un
datagramma IP I protocollo UDP non e' affidabile: invia i datagrammi ma non garantisce che arrivino a
destinazione sono quindi gli applicativi che lo utilizzano che devono preoccuparsi dell'affidabilita' del
servizio. La testata UDP e' relativamente semplice.
         
{% highlight java %}
0       7 8     15 16    23 24      31 
+--------+--------+--------+--------+ 
| Source | Destination              | 
| Port   | Port                     | 
+--------+--------+--------+--------+ 
|        |                          | 
| Length | Checksum                 | 
+--------+--------+--------+--------+ 
| 
| data octets ... 
+---------------- ...

{% endhighlight %}


#User Datagram Header Format
I campi Source Porte e Destination Port sono ovviamente la sorgente e la destinazione del pacchetto. Il
campo Length e' la lunghezza dell'intero datagramma UDP (testata + dati) in byte. Il valore minimo e' 8, ma in
realta' questo campo non viene gestito dal protocollo, il quale sa che la lunghezza totale e' la lunghezza di
un datagramma IP meno i 20 byte della testata IP. Il campo Checksum e' opzionale. Il checksum e' un campo di
controllo end-to-end: e' calcolato dal mittente e verificato dal ricevitore del pacchetto. Se il pacchetto UDP
e' errato, viene scartato silenziosamente, senza generazione di messaggi d'errore. L'opzionalita' dei checksum
di UDP implica una velocita' maggiore delle operazioni se disabilitata, ma puo' naturalmente fornire sorgenti
irrecuperabili di errori, specie su una rete non Ethernet o quando il datagramma UDP transiti da router.

#Casi d'uso del protocollo UDP
Se si lavora nel campo dell' integrazione di dispositivi per la rilevazione di campo e computer (ad esempio
sensori di temperatura o piu' generici rilevatori di campo, da quelli classici per le tessere badge ai piu'
recenti di impronte digitali) ci si trovera' molto probabilmente a dover utilizzare il protocollo UDP. Perche'
il protocollo UDP e non il piu' affidabile TCP/IP o addirittura http (cosi magari tiriamo in ballo le Servlet)? 
Perche' il protocollo UDP e' piu' facile da implementare a livello di firmware, quindi costa meno ai
costruttori in termini di sviluppo ecc.

#Ed e' gia UDP
UDP e' il cugino povero di TCP, molto veloce ma poco affidabile. Quando lo usiamo per inviare dei dati non
possiamo in nessun modo sapere se sono arrivati, ne se sono arrivati nell'ordine nel quale sono partiti. Dove
si usa UDP ? Si puo' usare per implementare un protocollo di trasferimento file come ad esempio NSF (Network
File System, la sua ultima versione puo' usare sia TCP che UDP), TFTP (Trivial FTP) ed altri (il multicasting
si affida a UDP per la sperimentazione). Con UDP e' l'applicazione che si deve preoccupare della affidabilita',
prendendosi cura dei pacchetti mancanti o fuori sequenza cio' significa molto lavoro, si puo' fare ma prima e'
conveniente pensare se si poteva usare TCP. Le classi fondamentali che si devono conoscere con UDP sono
DatagramPacket e DatagramSocket. Il package e' sempre il solito java.net, che e' stato trattato piu' che bene
sia su Mokabyte che in molti testi, ma attenzione ci sono differenze (delle modifiche) tra la sua
implementazione dal JDK1.1 al JDK1.2. Chi utilizza il Jbuilder3 della Imprise per lo sviluppo puo' andare nell'
help in linea alla sezione Networking Features e poi selezionare Change in JDK 1.1.

#Finalmente un po' di codice!
E' adesso cominciamo a scrivere un po' di codice (chissa' perche' noi programmatori abbiamo sempre fretta
di cominciare a massacrare le nostre tastiere). Supponiamo di avere una personal collegato in rete ad uno di
questi dispositivi ambientali, dobbiamo aprire un socket sulla stessa porta sulla quale il dispositivo e' in
ascolto :

{% highlight java %}
private DatagramSocket serverSocket ; 
private int serverPort ; serverSocket = new DatagramSocket(serverPort) ;
{% endhighlight %}

Ora che abbiamo il nostro oggetto socket per l'UDP (notare che si utilizza per questa ragione un
DatagramSocket) Settiamo il timeout a 5 secondi, da notare che il timeout di default varia da browser a browser
se si decide di usare delle Applet, invece con le applicazioni ,che consiglio, le cose sono piu' facili.

{% highlight java %}
serverSocket.setSoTimeout(5000) ;
{% endhighlight %}

Adesso supponiamo di voler spedire un segnale al nostro dispositivo (ad esempio il classico segnale di
inizializzazione) per fare questo dobbiamo costruire un oggetto di tipo DatagramPacket. A tale scopo usiamo il
costruttore di cui useremo la seguente versione (vedremo poi nell'approfondimento perche')

{% highlight java %}
DatagramPacket(byte[] buf, int length, InetAddress address, int port) 
DatagramPacket packet = new DatagramPacket(data,data.length,address, serverPort);
{% endhighlight %}

Quindi inviamolo al nostro dispositivo

{% highlight java %}
serverSocket.send(packet);
{% endhighlight %}

A questo punto, direi che la prossima cosa da fare e' aspettare il segnale di ritorno dal nostro
dispositivo, che dovrebbe essere un echo nel migliore dei casi, un messaggio di errore o altro, dipende dal
dispositivo e dell' architettura del sistema scelto permettendo.

Creiamo il DatagramPacket vuoto che conterra' il pacchetto ritornato, ricordandoci che il protocollo UDP
non e' sicuro, e quindi spetta a noi (qualora sia possibile, e non sempre lo e') gestire a livello software un
eventuale sistema di controllo degli errori.

{% highlight java %}
DatagramPacket packet = new DatagramPacket(new byte[512],512);
{% endhighlight %}

Per metterci in ascolto sul socket utilizziamo il metodo receice, che e' bloccante, cio' blocca il flusso
del programma finche' non riceve un pacchetto o scade il timeout, sollevando un eccezione.

{% highlight java %}
try { 
   serverSocket.receive(packet); 
}catch(java.io.InterruptedIOException e){
    // gestiamo il timeout 
}
{% endhighlight %}

Infine e' sempre buona norma rimettere le cose al loro posto prima di chiudere l'applicazione, che tradotto
significa che dobbiamo chiudere il socket con il metodo close.

{% highlight java %}
serverSocket.close() ;
{% endhighlight %}

Abbiamo visto come sia relativamente facile lavorare con UDP e Java, ben inteso l'argomento e' ben piu'
esteso, ma al contrario del piu' diffuso e sicuro TCP/IP, bisogna tagliare le soluzioni su misura, di caso in
caso, con un occhio di riguardo ai dispositivi con cui si deve colloquiare. Infatti essi dettano le regole del
gioco e lo fanno a proprio vantaggio, o meglio questo e' quello che fanno i loro costruttori. Un ultima nota
prima di passare all'approfondimento : cercate di non disseminare di oggetti DatagramPacket le vostre
applicazioni, progettate sempre classi wrapper, vi rendera' molto piu' facile la vita quando dovrete fare i
conti con qualche classe deprecata o qualche baco della liberia, inoltre fate sempre dei test conoscitivi in
modo da sapere prima come si comporta la vostra implementazione di UDP su sistemi operativi diversi come NT,
quando ad esempio la JVM va in crash ma il socket non ne vuole sapere di chiudersi e altre sorpresine di mamma
Sun.

#L'approfondimento
Dopo gli stralci di codice visti sopra, cerchiamo un approccio piu' ragionato e sistematico a quanto ci e'
dato da Java per implementare UDP. Cominciamo con la classe `DatagramPacket` : `DatagramPacket` ha due costruttori:
uno si usa per ricevere dati dalla rete, l'altro per inviarli, sotto sono riportate le loro segnature.

{% highlight java %}
public DatagramPacket(byte[] buff, int len)
{% endhighlight %}

in questo caso i dati si troveranno in buff


{% highlight java %}
public DatagramPacket(byte[] buff, int len, InetAddress addr, int port)
{% endhighlight %}

in quest' altro si crea un datagramma per inviare il pacchetto di byte buff all' host di indirizzo addr e
alla porta port Per operare su un oggetto di DatagramPacket si sono poi i seguenti metodi :

{% highlight java %}
public synchronized InetAddress getAddress() 
public synchronized int getPort() 
public synchronized byte[] getData() public synchronized int getLength()
{% endhighlight %}

La classe DatagramSocket invece serve per inviare o ricevere un datagramma, anche qui troviamo diversi
costruttori :

{% highlight java %}
public DatagramSocket() throws SocketException
{% endhighlight %}
legato ad una porta anonima, in quanto la porta di destinazione e' parte del DatagramPacket.

{% highlight java %}
public DatagramSocket(int port) throws SocketException 
public DatagramSocket(int port, InetAddres addr) throws SocketException
{% endhighlight %}

vi sono poi i metodi :

{% highlight java %}
public void send(DatagramPacket o) throws IOException 
public void receive(DatagramPacket p) throws IOException 
public int getLocalPort() 
public void close()
{% endhighlight %}

che ovviamente libera la porta occupata da quel socket Infine le opzioni per settare il timeout

{% highlight java %}
public synchronized void setSoTimeout(int timeout) throws SocketException
{% endhighlight %}

e per conoscerne il valore

{% highlight java %}
public synchronized int getSoTimeout() throws IOException
{% endhighlight %}

#Conclusione

Abbiamo visto come sia facile e produttivo realizzare applicazioni che implementano il protocollo UDP con
Java, ne abbiamo individuato i punti di forza e le debolezza. Probabilmente chi ha a che fare come gli autori
con software di questa tipologia, vedra' presto passare i costruttori verso i piu' evoluti TCP o HTTP, esistono
gia' infatti interessanti esempio di rilevatori di campo che utilizzano questi protocolli, specialmente http,
ma a parte i mercati USA, che tanto per cambiare sono sempre un decennio avanti a noi (dopotutto hanno iniziato
prima), dove sono ormai lo standard di fatto, in casa nostra si sentira' parlare di UDP ancora per molto.
Quindi occhio ai datagrammi.
