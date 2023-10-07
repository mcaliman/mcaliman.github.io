---
layout: post
lang: it
title: "Possiamo eseguire del codice prima del metodo main(String[]) ?"
excerpt: ""
modified: 2016-11-03
category: programming-languages
tags: [Italian,Java]
comments: true
share: true
search_omit: false
updated: true
---

Una delle domande che ti possono capitare ad un colloquio o ad una certificazione o un semplice test riguardo il linguaggio Java è la seguente:
Possiamo eseguire del codice prima del metodo `main(String[])` ?

La risposta è sì. Se utilizziamo un blocco statico di codice nella classe. Il codice contenuto in nel blocco `static` viene eseguito prima della creazione dell’oggetto stesso. 

Tutte le dichiarazioni all'interno di questo blocco `static` saranno eseguite una sola volta durante il caricamento della classe, quindi prima della creazione di oggetti nel metodo principale.

Compila e ed esegui il seguente codice.

```java
public class AClass {
    public AClass() {
        System.out.println("call costuctor AClass()");
    }
    public void method1() {
        System.out.println("call method1");
    }
    public static void main(String[] args) {
        AClass instance = new AClass();
        instance.method1();
    }
}
```

otterrai il seguente output

```java
call costuctor AClass()
call method1
```

modifica ora il codice nel modo seguente

```java
public class AClass {
    static {
        System.out.println("call static block");
    }
    public AClass() {
        System.out.println("call costuctor AClass()");
    }
    public void method1() {
        System.out.println("call method1");
    }
    public static void main(String[] args) {
        AClass instance = new AClass();
        instance.method1();
    }
}
```

otterrai il seguente output

```java
call static block
call costuctor AClass()
call method1
```

Come puoi vedere il codice in `static { }` è stato eseguito ancor prima del costruttore stesso, quindi quando ancora nessuna istanza della classe esisteva.

Ancora una variante del codice appena sopra, le modifiche sono limitate al metodo `main` quindi ti riporto solo quello

```java
    public static void main(String[] args) {
        AClass instance = new AClass();
        instance.method1();
        
        AClass instanceBis = new AClass();
        instanceBis.method1();
    }
```

e l’output prodotto

```java
call static block
call costuctor AClass()
call method1
call costuctor AClass()
call method1
```

Anche in questo caso, nonostante siano state create due istanze della classe `AClass`, l’esecuzione del blocco `static` è limitato ad una sola occorrenza prima all’atto di caricamento della classe.
E anche per oggi è tutto. Come al solito se hai una domanda in merito a questo post, vuoi un approfondimento o hai un argomento che ti interesserebbe che io trattassi nei prossimi post puoi scrivermi.
