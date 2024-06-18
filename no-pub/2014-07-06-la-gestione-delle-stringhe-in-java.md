---
layout: post
lang: it
title:  "La gestione delle stringhe in Java"
excerpt: ""
category: "Programming Languages"
tags: [Java]
date:   2014-07-06 22:45:33
comments: true
share: false
published: false
---

> L'ingegnere quantistico Seth Lloyd è convinto che l’universo sia un gigantesco computer.     Speriamo non faccia girare Windows. 
>
> *(Kevin Kelly)*

Le stringhe sono il primo oggetto che normalmente si impara a gestire con un linguaggio di programmazione, in Java per l’oggetto principe in questo caso è String o più propriamente del pachage `java.lang`, a seguire le forme più evolute come `StringBuffer` e `StringBuilder`.

Un oggetto di tipo `String` è immutabile (immutable), cosa significa esattamente?
Immutabile nel senso di memoria. Esso crea nuovi oggetti ogni volta che si creano stringhe o si assegna una nuova stringa / modificare il valore. Ecco perché si consiglia di fare attenzione quando si usano le stringhe.

Prendiamo ad esempio il seguente frammento di codice

```java
String a = new String("hello boys!");
System.out.println(a);
a = "hi guys!";
System.out.println(a);
```

con l’assegnazione `a = "hi guys!"` ho creato un nuovo oggetto di tipo `String`, non ho modificato lo stesso creato con `new String(“hello boys”);` anche se non ho utilizzato il costruttore con parametro.

In Java le stringhe sono quindi costanti, locazioni di memoria che contengono caratteri (come nel linguaggio C), immutabile è sinonimo di immodificabile.

Le stringhe sono oggetti di uso comune quindi i progettisti iniziali hanno pensato bene di realizzare alcune scorciatoie per il loro utilizzo quotidiano che non obbligasse ad utilizzare l’approccio puro ad oggetti attraverso metodi da richiamare sulle istanze.

Torniamo alla nostra stringa semplicemente denominata `a`, l’espressione 

```java
a = "hi" + " guys!";
```

effettua la concatenazione delle stringhe `hi` e `guys!` tramite l’operatore `+`, operatore che normalmente utilizziamo per la somma di due numeri, siamo di fronte all’overloading di un operatore, come in C++.

L’overloading dell operatore `+` ci permette di evitare la forma pura ad oggetti

```java
a = "hi".concat(" guys!");
```

meno pratica, più formale certamente nonché object oriented.
Le due forme 

```java
String b = "bye";
```

e

```java
String c = new String("bye");
```

sono equivalenti, l’assegnazione diretta surroga la chiamata esplicita del costruttore `String(String)` che costruisce un nuovo oggetto di tipo `String` a partire da una stringa esistente passata come parametro.

Gli oggetti di tipo `String` non sono array di caratteri quindi non possiamo applicarvi gli operatori classici degli array come ad esempio `[]` quindi non possiamo fare cose del tipo `string[index]` dove string è un oggetto instanziato dalla classe `String` e index è un intero maggiore o uguale a 0 che che indica la posizione del carattere a cui vogliamo accedere. 
Per essere ancora più chiari, dato l’ oggetto c di tipo `String` del frammento di codice riportato sopra non possiamo scrivere c[0] per accedere al primo elemento che ha valore b, Il compilatore ci segnalerà un errore

```java
Exception in thread "main" java.lang.RuntimeException: Uncompilable source code - array required, but java.lang.String found
```

Non possiamo quindi neppure fare qualcosa come

```java
c[0] = 'c';
```

per sovrascrivere il valore del carattere `b` con il carattere `c`.

Per accedere all’elemento di indice 0 dobbiamo necessariamente utilizzare il metodo `charAt()`

```java
c.charAt(0);
```

che ritornerà il carattere `b` a video, per esempio attraverso l’uso del metodo `System.out.println()` per stampare sulla console.

```java
System.out.println(c.charAt(0));
```

La classe `String` rende disponibile molti metodi tra cui quelli di uso più comune permettono restituire la lunghezza della stringa

```java
int lenofc = c.length();
```

nel nostro caso lenofc conterrà il valore intero 3 dato che `"bye".length()` è 3 e quindi il predicato  `"bye".length()==3` ha valore `true`

Per controllare l’uguaglianza di due stringhe si può invece utilizzare il metodo `equals()` o `equalsIgnoreCase()` nel caso si desideri un controllo case insensitivi.
Le espressioni sotto ritornano entrambe il valore `true` per le variabili booleane b1 e b2

```java
System.out.println(c.charAt(0));
boolean b1 = c.equals("bye");
System.out.println(b1);
boolean b2 = c.equalsIgnoreCase("Bye");
System.out.println(b2);
```

Volendo maggiore flessibilità in un operazione di confronto di stringhe possiamo utilizzare il metodo `compareTo()`  nella forma

```java
int comp = a.compareTo(b): 
```

1. comp == 0 se a è uguale b 
2. comp<0 se a<b, 
3. comp>0 se a>b.

Il valore intero restituito è l'indice del primo carattere diverso.
nel caso di esempio il valore per comp è 6 essendo a uguale a ”hi guys!” e b uguale a ”bye”

attenzione `a.equals(b)` è ovviamente diverso da `a == b` 

Altri metodi di comune utilizzo sono `substring()`, `replace()`, naturalmente anche questi metodi non modificano l’oggetto su cui sono chiamati ma ne creano e ritornano uno nuovo.

```java
a.substring(10,18):// restituisce la sottostringa che va da 10  a 17 (18-1) 
a.replace(‘E’,’X’):// restituisce una stringa con tutte le ‘E’  sostituite con ‘X’
```

dato il frammento di codice 

```java
String targa = "ab123cd";
System.out.println(targa.substring(0,2));
System.out.println(targa.substring(2,5));
System.out.println(targa.substring(5,7));
```

avremo stampate nella console le 3 componenti “ab”,“123” e “cd”
verificando che la prima e l’ultima sono costituite esclusivamente da lettere e la seconda solo da numeri abbiamo di fatto realizzato un controllo semplificato del formato di una targa europea.

per essere più completi il codice potrebbe essere il seguente

```java
boolean valid = Character.isLetter(targa.charAt(0)) && 
Character.isLetter(targa.charAt(1)) &&
Character.isDigit(targa.charAt(2)) &&
Character.isDigit(targa.charAt(3)) &&
Character.isDigit(targa.charAt(4)) && 
Character.isLetter(targa.charAt(5)) ;
Character.isLetter(targa.charAt(6)) ;
```

Character è una classe che ci permette di effettuare semplici controlli ma non solo, vi rimando alla documentazione ufficiale per i dettagli.

Per controlli e validazioni sulle stringhe i semplici i metodi fino ad ora esposti sono più che sufficienti, ma nel caso sia abbia necessità di scomodare le espressioni regolari si può ricorrere al metodo `matches()` che presa un espressione regolare regex ritorna `true` se la stringa su cui è richiamato la rispetta.

Per controllare la validità rispetto al formato di una targa europea possiamo utilizzare

```java
boolean isValid = targa.matches("^[a-zA-Z]{2}[0-9]{3,4}[a-zA-Z]{2}$");
```

Per la validazione formale di un indirizzo email possiamo utilizzare per esempio l’espressione regolare

```java
^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$
```

Per la validazione di importi in dollari del tipo $1,234,567.89 | 1234567.89 | $9.99

```java
^(\$|)([1-9]\d{0,2}(\,\d{3})*|([1-9]\d*))(\.\d{2})?$
```

Per quelli in valuta euro nella forma -123123,12 € | 12312432134 | -12.234.123,23

```java
^\s*-?((\d{1,3}(\.(\d){3})*)|\d*)(,\d{1,2})?\s?(\u20AC)?\s*$
```

Data e ora in formato europeo come 29/02/2008 15:30

```java
(((((0[1-9]|[12][0-9]|3[01])/(0[13578]|1[02]))|((0[1-9]|[12][0-9]|30)/(0[469]|11))|((0[1-9]|[1][0-9]|2[0-8]))/02)/([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3}) ((([0-1][0-9])|([2][0-3]))[:][0-5][0-9]$))|(29/02/(([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00)) ((([0-1][0-9])|([2][0-3]))[:][0-5][0-9]$)))
```

Solo date nella della forma 29/02/2008

```java
^(?:(?:0?[1-9])|(?:[12]\d)|3[01])/(?:(?:0?[1-9])|(?:1[012]))/(?:(?:19|20))\d{2}$
```

Per la validazione di formato (non del codice di controllo) di un codice fiscale italiano

```java
^[A-Za-z]{6}[0-9]{2}[A-Za-z]{1}[0-9]{2}[A-Za-z]{1}[0-9]{3}[A-Za-z]{1}$
```

A questo punto abbiamo visto già molto materiale che ci permette di utilizzare con le stringhe per elaborazioni e controlli che si presentano all’ordine del giorno nella carriera di uno sviluppatore.


L’uso di `String` però non si presta nei casi in cui la manipolazione della stessa è l’attività principale, a questo scopo sono presenti le classi `StringBuffer` e `StringBuilder`, ma più conosciuta e anziana in quanto a cittadinanza nel jdk è la `StringBuffer` è ed sincronizzata qualora non sia necessario gestire l’accesso condiviso della risorsa l’utilizzo di StringBuilder garantisce maggiore velocità e ci permettere di non creare una moltitudine di oggetti `String` spazzatura su cui il garbage collector dovrà impiegare stupidamente del tempo.

Per la precisione tutti i metodi di `StringBuffer` sono syncronized ovvero sincronizzati il che la rende thread-safe e meno performante di una sua versione non thread-safe, utilizzate `StringBuilder` nei casi in cui non sia presente criticità legata alla gestione dei thread i metodi esposti sono praticamente gli stessi per entrambe le classi.

I metodi di utilizzo più comuni per entrambe le classi sono rispettivamente `append()`,`insert()` e `delete()` nonchè `charAt()` oltre al metodo `toString()` che ci permette di ottenere una classica stringa dai nostri oggetti di tipo `StringBuffer` e `StringBuilder`.

Un utilizzo comune degli oggetti di tipo `StringBuilder` e `StringBuffer` è la costruzione di stringhe dinamicamente in base a condizioni presenti nel nostro codice.

Sotto un esempio piuttosto semplice di utilizzo elementare per i tre metodi 
```java
StringBuilder buffer = new StringBuilder();
buffer.append("01234567900");
buffer.insert(8, '8');//inserisce 8 alla giusta posizione
buffer.delete(10, 12);//cancella le due ultime cifre
System.out.println(buffer.toString());//Stampa 0123456789
```

Lungi dall’essere una trattazione esaustiva dell’argomento e delle classi `String`,`StringBuffer` e `StringBuilder` quanto presentato copre la maggior parte dei casi d’uso, unica raccomandazione valida sempre e di esaminare la documentazione ufficiale sempre prima di reinventare la ruota. 
