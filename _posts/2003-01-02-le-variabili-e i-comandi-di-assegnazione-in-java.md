--- 
layout: post
title:  "Le variabili e i comandi di assegnazione"
date:   2003-01-02 22:45:33
category: articles
tags: [Java]
comments: false
share: true
---

Diamo per prima cosa una definizione sufficientemente formale per i nostri scopi di variabile:
Definizione di variabile
Una variabile  una coppia composta da un nome, l'identificativo della variabile e un valore.

{% highlight java %}
T var = value ;
{% endhighlight %}

Le variabili di un programma memorizzano i dati che sono elaborati durante l'esecuzione.
Nel corso dell'esecuzione del programma i valori della variabile sono modificati (se no sarebbero delle costanti).
Le variabili nascono,vivono e muoiono,  compito nostro occuparci di loro,della loro vita,della loro visibilit (scope).
Trattiamole bene,diamogli un nome rispettabile in modo che non ci odino e ci faccia passare notti insonni.
Prima di essere usata una variabile deve essere dichiarata, la dichiarazione di una variabile  necessaria per riservare uno spazio
di memoria in cui scrivere il suo valore, la dichiarazione definisce il tipo della variabile.

{% highlight java %}
T var;
{% endhighlight %}

dove `T`  il tipo, per esempio **int** , double e altro.
Si possono avere come tipi, tipi di base che non sono oggetti oppure oggetti ( `T` diventa un nome di classe). 
Sotto riportiamo alcuni esempi di dichiarazione di variabile:

{% highlight java %}
int x ; double y ;
{% endhighlight %}

Posso anche assegnare un valore alla variabile:

{% highlight java %}
int x = 5 ; double y = 60 ;
{% endhighlight %}

Il tipo dei valori della variabile serve per stabilire quanta memoria riservare alla variabile, nel caso del tipo int sono 4 byte.
Se dovessimo rappresentare graficamente le dichiarazioni:

{% highlight java %}
int x = 0 ; 
int y = 2 ; 
int z ; 
{% endhighlight %}

x 0 y 2 z -

dove - indica che z  stato dichiarato ma non inizializzato cio non gli  stato assegnato un valore.

Diamo ora una definizione sufficientemente formale ai nostri scopi di un comandi di assegnazione.

Definizione di comando di assegnazione

Un comando di assegnazione  un'istruzione avente lo scopo di modificare il valore di una variabile.
Si aggiunga anche di assegnare un valore ad una variabile che era solo stata dichiarata e che quindi aveva valore indefinito.

{% highlight java %}
var = expr;
{% endhighlight %}

Dove var  il nome della variabile e expr una espressione il cui tipo  compatibile con il tipo di var.
Il comando ha l'effetto di sostituire il valore della variabile il cui nome compare a sinistra (left-value) del segno di uguaglianza 
con il valore che compare a destra.
Per espressioni si intende un'entit sintattica composta da nomi di variabili, costanti e segni di operazioni 
per stabilire l'ordine di valutazione degli operandi.

{% highlight java %}
x = 12;
{% endhighlight %}

assegna alla variabile x il valore 12;

{% highlight java %}
y = (x+1)/2;
{% endhighlight %}

 un esempio di espressione.

Abbiamo parlato fino ad ora dei tipi di variabile senza darne una definizione formale, corriamo subito ai ripari:

Definizione di tipo di dato 

Un tipo di dati  costituito da un'insieme di valori e da un' insieme di operazioni applicabile a tale valori.

Come gi accennato prima i tipi di dato in java appartengono a 2 categorie principali :

* Tipi primitivi : boolean, byte, short, int, long, float, double, char
* Tipi classe : String ecc

Segue una tabella che da per ogni tipo di valori che pu assumere le operazioni che si possono applicare.

* boolean : false e true 
* byte : interi [-27,27-1] ( decimale, ottale , esadecimale) operazioni: + , - , *, / , %. 
* short : interi [-215, 215-1] ( decimale, ottale , esadecimale operazioni: + , - , * , / , %. 
* int numeri naturali [-231,231-1] ( decimale, ottale , esadecimale) operazioni: + , - , * , / , %. 
* long numeri naturali [-263,263-1] ( decimale, ottale , esadecimale) operazioni: + , - , * , / , %. 
* float numeri reali in formato IEEE754 a 32 bit notazione a virgola fissa e mobile: +, -, *, /. 
* double numeri reali in formato IEEE754 a 64 bit bit notazione a virgola fissa e mobile:+, -, *, /. 
* char caratteri, Unicode notazione simboli tra apici nessuna operazione. 
* String : Sequenza di caratteri, Unicode notazione simboli tra doppi apici nessuna operazione + (concatenazione)

Le 4 operazioni aritmetiche sono rappresentate dai simboli + , - , * , /.

Per i tipi di dato byte, short, int, long il simbolo / rappresenta il quoto dell' operazione

Per inserire un apice o un doppio apice dentro una stringa si scrive \' e \" rispettivamente

Aggiungiamo anche per completezza anche i simboli:
  && and logico o congiunzione 
  || or logico o disgiunzione 
  !  not o negazione

Come gi accennato nel caso di una assegnazione del tipo 

{% highlight java %}
T var = expr 
{% endhighlight %}

abbiamo detto che expr deve avere tipo compatibile con T (non necessariamente lo stesso)  utile a questo punto dare 
la definizione di promozione e casting per tipi che definiscono i casi in cui il tipo di var e expr possono non coincidere 
ma essere comunque corretti e applicabili.

Definizione
Qualora tanto il tipo della variabile quanto il tipo dell' espressione rappresentino dati numerici e il tipo di expr  sottoinsieme 
del tipo di var prima dell' assegnazione avviene una conversione automatica detta promozione.
Per esempio:

{% highlight java %}
int i ; 
byte j ; 
i = j ;
{% endhighlight %}

Diamo ora invece una definizione di casting:

Definizione

Se il tipo di var e tipo di expr prevedono valori comuni ( tipicamente TypeOf (expr ) sottoinsieme TypeOf (var)) si pu pensare la 
conversione esplicita detta casting cio : TypeOf(expr) --> TypeOf(var). Questo se i valori numerici sono corretti e compatibili.

Per esempio:

{% highlight java %}
int i; 
byte j; 
j = (byte) i;
{% endhighlight %}

 corretto solo se i  minore o uguale del valore massimo disponibile per byte.
