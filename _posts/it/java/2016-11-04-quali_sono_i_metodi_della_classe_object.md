---
layout: post
lang: it
title: "Quali sono i metodi della classe Object?"
excerpt: 
modified: 2016-11-04
categories: Java
tags: [Italian,Java]
comments: true
share: true
search_omit: false
updated: true
---

﻿Quali sono i metodi della classe Object?


Una delle domande che ti possono capitare ad un colloquio o ad una certificazione o un semplice test riguardo il linguaggio Java è la seguente:


Quali sono i metodi della classe Object?


clone() – Questo metodo ci aiuta a creare e ritornare una copia dell’oggetto su cui il metodo è richiamato.
equals() – Ci aiuta a effettuare una comparazione 
finalize() – Invocato dal garbage collector su un’ oggetto quando viene messa in atto la sua finalizzazione
getClass() – Ritorna la classe a runtime dell’oggetto.
hashCode() – Ritorna il valore del  codice hash per l’oggetto.
toString() – ritorna una rappresentazione come stringa dell’oggetto
notify(), notifyAll(), and wait() – Aiuta a sincronizzare le attività di thread in esecuzione in modo indipendente nel programma 


Se osservi questo codice


public class TClass extends Object {


    public TClass() {
        System.out.println("call costructor TClass()!");
    }


    public static void main(String[] args) {
        TClass instance = new TClass();
    }
}




noterai che la classe estende Object, non è necessario esplicitare questa relazione in quanto tutti gli oggetti derivano da Object. Il nostro oggetto di classe TClass eredita l’implementazione di default dei metodi elencati sopra. Nella maggior parte dei casi l’implementazione di default è insufficiente se non del tutto inutile, in alcuni casi l’implementazione non è presente.


Questo è il codice della classe Object, per brevità ho eliminato la maggior parte dei javadoc


/*
 * Copyright (c) 1994, 2012, Oracle and/or its affiliates. All rights reserved.
 * ORACLE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package java.lang;


public class Object {


    private static native void registerNatives();
    static {
        registerNatives();
    }


    public final native Class<?> getClass();
    public native int hashCode();
    public boolean equals(Object obj) {
        return (this == obj);
    }
    protected native Object clone() throws CloneNotSupportedException;
    public String toString() {
        return getClass().getName() + "@" + Integer.toHexString(hashCode());
    }
    public final native void notify();
    public final native void notifyAll();
    public final native void wait(long timeout) throws InterruptedException;
    public final void wait(long timeout, int nanos) throws InterruptedException {
        if (timeout < 0) {
            throw new IllegalArgumentException("timeout value is negative");
        }
        if (nanos < 0 || nanos > 999999) {
            throw new IllegalArgumentException(
                                "nanosecond timeout value out of range");
        }


        if (nanos > 0) {
            timeout++;
        }


        wait(timeout);
    }
    public final void wait() throws InterruptedException {
        wait(0);
    }


    protected void finalize() throws Throwable { }
}


Da un rapido sguardo possiamo dire che 


public final native Class<?> getClass();


ha un implementazione nativa, è final e quindi non ci è possibile fare l’override, le motivazioni sono evidenti, pensa a cosa potrebbe comportare dal punto della sicurezza se fosse possibile farlo.


diversamente hashCode, sempre nativo, fornisce un'implementazione ma è possibile effettuarne l'override e crearsi il proprio meccanismo per generare il codice hash


public native int hashCode();




Il metodo equals()
 
public boolean equals(Object obj) {
        return (this == obj);
 }


fornisce un'implementazione di default molto semplice, controlla se l’oggetto è lo stesso o meno (non se le sue proprietà hanno gli stessi valori, cosa molto più utile, ma ciò è normale, spetta a noi implementare un comportamento del genere, non è detto che per noi due oggetti siano necessariamente uguali solo se hanno i relativi attributi uguali).


Per quanto riguarda invece clone() 


protected native Object clone() throws CloneNotSupportedException;


notiamo immediatamente che il metodo va gestito, per esempio se vogliamo utilizzare l’implementazione di default nativa dobbiamo far sì che la nostra classe implementi l'interfaccia Cloneable.


public class TClass implements Cloneable {


dato che tutti le classi estendono Object abbiamo omesso extends Object


Il metodo toString() è uno dei miei preferito, se gestito opportunamente rende lo sviluppo e il testing comodo


 public String toString() {
        return getClass().getName() + "@" + Integer.toHexString(hashCode());
    }


E’ evidente che la sua implementazione di default sia triviale.


i metodi notify(), notifyAll(),wait() nelle sue differenti versioni possibili grazie all’ overloading meritano un trattamento a parte fine post.


Il metodo finalize() ha un implementazione vuota


protected void finalize() throws Throwable { }


Attenzione, difficilmente vi capiterà di fare l’override di finalize() e comunque sarà la JVM o meglio il GC a decidere se e quanto chiamarla.


E anche per oggi è tutto. Come al solito se hai una domanda in merito a questo post, vuoi un approfondimento o hai un argomento che ti interesserebbe che io trattassi nei prossimi post puoi scrivermi.
