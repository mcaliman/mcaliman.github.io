---
layout: post
title:  "Gli oggetti in Java"
excerpt: ""
category: java
date:   2008-01-05 22:45:33
tags: [Java]
comments: true
share: true
---

Da ogni classe  possibile ottenere mediante l' istanzanziazione una o pi entit, ciascuna delle quali costituisce una 
copia della struttura dati descritta dalla classe nelle sue componenti dinamiche e di cui condivide i metodi di accesso alle informazioni.

Definizione 
Un oggetto realizza un'istanza di classe di cui rispecchia la struttura dati e condivide i metodi.

L'istanziazione di pi oggetti di una stessa classe comporta quindi la duplicazione della stessa struttura dati, pur rappresentando informazioni differenziate.
A tale fine ogni oggetto deve includere una copia degli attributi definiti nella propria classe di afferenza quali attributi di istanza; 
disporre di metodi dinamici derivati da tali classi; avere garantito l'acceso a tutte le componenti statiche della classe; 
costituire un'entit chiusa ai cui attributi non  possibile accedere se non tramite dei metodi propri dell'oggetto.
L'ultima propriet descrittiva evidenzia un ulteriore aspetto che caratterizza gli oggetti, quello di costituire entit isolate, completamente
definite nella propria semantica e completamente autonome dal punto di vista computazionale.
{% highlight java %}
class T {
   TA1 var ;
   static TB1 glbB1;
   void mAk(){
   //stuff!
   }
   static void mBk(){
   //stuff!
   }
}
{% endhighlight %}
Si supponga che vengano istanziati gli oggetti obj1 e obj2 della classe T. 
Sia l'oggetto obj1 che l'oggetto obj2 posseggono una copia locale degli attributi d'istanza var e dei metodi dinamici mAk(). 
Non possiedono invece copie proprie degli attributi di classe gblBk e dei metodi mBk() in quanto qualificati come static. 
A tali entit che sono proprie della classe T possono tuttavia riferire in modo diretto dal momento che ne costituiscono istanze.
Tutti gli oggetti che si intendono utilizzare in un programma vanno dichiarati. 
La dichiarazione degli identificatori (detti anche reference) degli oggetti di una classe  similare alla usuali dichiarazioni di variabile. 
Essa consiste nello specificare la classe di afferenza che ne diventa quindi il tipo, seguita dalla lista degli oggetti identificatori degli stessi.

{% highlight java %}
T obj1, obj2,...,objN;
{% endhighlight %}

Una volta dichiarati gli oggetti, devono essere istanziati e inizializzati. L'istanziazione di un oggetto consiste nella creazione in memoria,
e pi precisamente nella heap, di un'entit contenente una copia delle variabili di istanza e dei metodi dinamici della classe di afferenza.
Definizione (di heap) La heap costituisce quella parte della memoria che  riservata a contenere i dati dinamici dei programmi.
Nei sistemi attuali la memoria riservata ad ogni applicazione  suddivisa in una parte statica, uno stack e una heap. 
L'allocazione  effettuata dall'operatore new applicato al costruttore della classe e l'indirizzo dell'entit allocata  assegnato 
all'identificatore dell'oggetto.

{% highlight java %}
obj = new T();
{% endhighlight %}

ovviamente posso fare tutto in una sol colpo.
{% highlight java %}
T obj = new T();
{% endhighlight %}

dichiarato ed istanziato et voil!

#Messaggi,messaggi e ancora messaggi.

Classi ed oggetti costituiscono un ambiente di esecuzione per i processi computazionali descritti dai loro metodi. 
Il problema principale della OOP risiede nella necessit di innescare in queste entit le computazioni che sono richieste dall'applicazione. 
Tale obiettivo  raggiunto realizzando un supporto esclusivo basato sullo scambio di messaggi, nel cui contesto l'oggetto va considerato
alla stregua di un'entit capace di: inoltrare messaggi ad altri oggetti; ricevere messaggi ed elaborare tali messaggi mediante propri metodi.

Definizione 
Un messaggio costituisce la richiesta di attivazione di un metodo proprio di un oggetto o di una classe, 
da far eseguire su un opportuno insieme di informazioni comunicate all'entit destinataria.

L' inoltro di un messaggio richiede lo specifico destinarsi del messaggio da concatenare con l'identificatore del metodo da attivare 
dotato dagli opportuni parametri attuali. 
Si sottolinea il fatto che che alle classi possono essere inoltrati messaggi per l'attivazione di metodi statici, 
mentre agli oggetti sono inoltrabili messaggi per l'esecuzione di metodi dinamici. 

In entrambi i casi la sintassi  similare :
{% highlight java %}
T.m1();
obj.m2();
{% endhighlight %}

Una volta completato il metodo richiesto, l'entit destinataria del messaggio pu restituire all'oggetto mittente gli eventuali dati forniti 
dalla computazione del metodo. Sembra superfluo sottolineare che lo scambio di messaggi fornisce lo strumento attraverso il quale oggetti di 
classe diverse sono messi in condizione di interagire tra loro. Ci permette alle relative classi di proporsi esse stesse quali modelli interagenti, 
la cui architettura d'insieme pu concorrere alla definizione di modelli caratterizzati da maggior livello di complessit. 

Il trasferimento di informazioni tra oggetti  realizzato in java mediante lo scambio di messaggi.
Chiamo metodi (eventualmente passandogli altri oggetti come parametri formali) su oggetti (eventualmente facendomi ritornare valori che sono altri oggetti) ? 
scambi messaggi tra oggetti.. 

Questi comprendono l'attivazione, nell'oggetto destinatario, del metodo specificato dal messaggio e l'eventuale esportazione nell'oggetto mittente 
dei risultati dell'esecuzione di tali metodi. Come si  visto, il passaggio di parametri previsto dal linguaggio di programmazione Java  sempre 
per valore e ci comporta che i valori dei parametri formali al momento dell'attivazione di un metodo vengano perduti quando il metodo completa la 
sua esecuzione. Qualsiasi esportazione di informazione da un metodo pu quindi avvenire esclusivamente per il tramite del comando return. 

Tale comportamento  perfettamente aderente alla semantica del passaggio per valore quando un parametro  costituito da un tipo di dato primitivo. 
Qualora il parametro sia costituito da un oggetto (o da un array, che ne costituisce un caso particolare) il passaggio per valore presenta tuttavia 
degli effetti collaterali (o side effect) che lo rendono per certi aspetti simile al passaggio per indirizzo. Ci  conseguenza del modo in cui Java 
alloca gli oggetti: la creazione di un oggetto infatti causa l'allocazione nella heap di una classe di afferenza. Tale istanza  resa accessibile 
mediante un identificatore di indirizzo denominato handle (o reference) che  associato all'oggetto istanziato.
Nel momento in cui un oggetto  passato quale parametro ad un metodo, solamente il valore del suo handle viene copiato nel parametro formale e ci 
permette al metodo di modificare il contenuto dell'oggetto stesso, rendendo tali modifiche permanenti, indipendentemente dal fatto che a quel punto
 il valore del parametro formale venga distrutto.
Palese quanto sia errato creare all' interno del metodo una nuova istanza di oggetto e assegnarla al parametro formale: l'handle verrebbe infatti 
rimosso in fase di restituzione del controllo al modulo chiamante, per questo  necessario il comando return.

Tradotto in codice
{% highlight java %}
T p = new T();
void m(T p){
    p = new T(); //ma perchè?!ditemi perchè!
}
{% endhighlight %}

decliniamo il nostro esempio generico in uno più pratico usando la classe String (che guarda un po serve per lavorare sulle stringhe,ora che 
abbiamo qualche attrezzo teorico in più possiamo cominciare a lavorare con oggetti reali) supponiamo per ipotesi di avere un oggetto String p così 
dichiarato e istanziato
{% highlight java %}
String p = new String("non si frega mr.handle!");
{% endhighlight %}
e di aver definito un metodo m come sotto riportato.

{% highlight java %}
void m(String p){
   p = new String("maledetto mr.handle!");
}
{% endhighlight %}

e consideriamo il seguente blocco di codice

{% highlight java %}
String p = new String("non si frega mr.handle!");
System.out.println(p);
m(p);
System.out.println(p);
{% endhighlight %}

sulla nostra console vedremmo stampato per due volte "non si frega mr.handle!" Vediamo ora come avremmo potuto risolvere 
il problema con l'uso del comando return. Innanzitutto avremmo dovuto modificare la segnatura del nostro metodo m() i modo che 
potesse ritornare un valore del tipo compatibile con il parametro formale. Quindi non avremmo pi void come tipo di ritorno ma T. 

Vediamo la nuova versione del metodo m che fa al caso nostro.
{% highlight java %}
T m(T p){
   p = new T(); 
   return p;
   //attenzione non ho fregato mr.handle,ma ho ottenuto l'effetto pratico che mi interessava
      //se cos vi piace...
}
{% endhighlight %}

e la nuova modalità di utilizzo

{% highlight java %}
T p = new T();
p = m(p);
{% endhighlight %}

decliniamo nuovamente l'esempio sulle stringhe

{% highlight java %}
//nuova versione del nostro metodo "m"
String m(String p){
   p = new String("maledetto mr.handle!");
   return p;
}

//nuova chiamata del nostro metodo
String p = new String("non si frega mr.handle!");
System.out.println(p);
//qui stampo "non si frega mr.handle!"
p = m(p);
System.out.println(p);
//qui stampo "maledetto mr.handle!"
{% endhighlight %}

Scrivere un metodo in questi modi per modificare il valore di una stringa non è molto sensato ne pulito se vogliamo, ma 
ci ha fatto capire qualcosa di più su alcuni concetti fondamentali.
