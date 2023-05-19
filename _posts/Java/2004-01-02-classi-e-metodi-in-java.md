---
layout: post
lang: it
title:  "Classi e metodi in Java"
excerpt: ""
category: Java
date:   2004-01-02 22:45:33
tags: [OOP]
comments: true
share: true
--- 

Classi e metodi costituiscono le componenti di base della programmazione ad oggetti alla quale forniscono gli 
elementi di incapsulamento e di limitazione di accesso ai dati.

Definizione

Una classe è un modello di entità similari nella struttura e che condividono analoghe proprietà e funzionalità.

Definizione

Gli oggetti sono entità modellabili da una classe e che possono essere generate con un opportuno processo detto di 
istanziazione e le informazione in esse contenute vanno manipolate mediante opportune procedure descritte 
nelle classi di afferenza.

Diamo una definizione di metodo

Definizione

Un metodo rappresenta la procedura realizzativa di una specifica funzionalità della classe o della sua istanza.

La definizione di una classe non comporta necessariamente l'allocazione degli oggetti in grado di rappresentare 
le informazioni descritte nell'oggetto.
Diciamo che piuttosto la definizione di una classe caratterizza mediante le proprie variabili, la struttura delle 
informazioni e le relazioni intercorrenti tra di esse e mediante i propri metodi, 
gli operatori predisposti alla manipolazione di tali informazioni.

Definizione delle classi

In Java la realizzata delle classi  demandata al costrutto class. 
Ogni classe include la definizione di attributi (costanti e variabili) e metodi. 
Quello che riporto sotto  lo scheletro del codice che si andr a scrivere per definire una classe.
{% highlight java %}
class T {
//stuff!
//CONSTANT_DECLARATION_BLOCK;
//VARIABLE_DECLARATION_BLOCK;
//METHOD_DEFINITION_BLOCK;
}
{% endhighlight %}

dove le dichiarazioni dei blocchi sono solo dei segnaposto per evidenziare la struttura di quello che sar 
il contenuto tra le parentesi {,}. class  una parola riservata del linguaggio (come new che abbiamo incontrato
 quando abbiamo parlato degli array) ed  per questo che la enfatizzo come al solito in bold.
 
Tutte le dichiarazioni nelle classi, costanti variabili e metodi possono essere caratterizzate dal modificatore 
public e in tale modo rese accessibili all' esterno della classe, oppure possono essere specificare private 
nel quale caso la loro visibilit e il loro accesso  limitato dalla classe di definizione.
Un livello intermedio  protected, il suo scopo pu essere chiarito solo dopo aver acquisito i rudimenti della
programmazione ad oggetti, in particolare l'ereditariet, per cui per il momento ne accenniamo solo l'esistenza.

Tratteremo in seguito e in dettaglio i modificatori di accesso public, private e protected. Una distinzione va inoltre 
operata tra le entit che saranno pertinenti alle specifiche istanze di una classe e quelle che costituiscono elementi 
dalla classe stessa.

Definizione
di entit di "classe": tutte le costanti, variabili e metodi che sono comuni a tutti gli oggetti istanziabili dalla classe. 
Cio le entit di classe sono comuni a tutti gli oggetti che creo a partire da una definizione di classe.

Definizione
di entit di "istanza: le costanti, variabili e metodi che sono specifiche a ciascun oggetto istanziato dalla classe. 
Cio ogni oggetto ha la sua entit di istanza. Tutte le entit di pertinenza della classe sono individuate dal modificatore 
static (altra parola riservata del linguaggio di programmazione). Il modificatore  omesso nelle definizioni degli attributi 
e dei metodi di istanza per semplicit di esposizione e per concertrarci solo sugli aspetti di struttura fino ad ora esposti.

Per esempio possiamo avere
{% highlight java %}
class T {
   static int x = 10 ;
}
{% endhighlight %}
Che sono di fatto non specificando nessun modificatore di accesso ha una visibilit di default detta di package che discuteremo
in seguito ma di cui si sconsiglia l'uso in quanto poco chiaro.
{% highlight java %}
class T {
   private static int x =1;
}

class T {
   public static int x = 1;
}

class T {
   protected static int x =1
} 
{% endhighlight %}
Solo nella definizione della classe T con modificatore public posso referenziare x c con **T.x** (cioè lo "posso usare"
al di fuori della classe in cui  defininito,cioè in modo pubblico). 

Di fatto ho creato una costante con il valore 1 che posso utilizzare utilizzando **T.x** nel mio codice.
