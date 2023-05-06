---
layout: post
lang: it
title: "I costruttori sono ereditabili ?" 
excerpt: "I costruttori sono ereditabili? Una sottoclasse può chiamare il costruttore della classe genitore?"
modified: 2016-11-02
categories: programming
tags: [Java]
comments: true
share: true
search_omit: false
updated: true
---

Una delle domande che ti possono capitare ad un colloquio o ad una certificazione o un semplice test riguardo il linguaggio Java è la seguente:
I costruttori sono ereditabili? 
Una sottoclasse può chiamare il costruttore della classe genitore?

Non possiamo ereditare un costruttore. Quello che possiamo fare è creare un'istanza di una sottoclasse utilizzando un costruttore della superclasse.
Prova a compilare ed eseguire questo codice

{% highlight java %}
public class SuperClass {
    public SuperClass() {
        System.out.println("SuperClass()");
    }
    public void method1() {
        System.out.println("SuperClass.method1()");
    }
}

public class SubClass extends SuperClass {
    public SubClass() {
        System.out.println("SubClass()");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();
    }
}
{% endhighlight %}

Otterrai il seguente output 

{% highlight java %}
SuperClass()
SubClass()
SuperClass.method1()
{% endhighlight %}

Il costruttore della superclasse è stato implicitamente chiamato prima di quello della sottoclasse. Il costruttore non è però ereditato, è stato solo chiamato, se fosse ereditato potrei modificarne il comportamente effettuandone l’override e questo distruggerebbe la capacità di incapsulamento del linguaggio.
In altre parole, non puoi far si che non venga effettuata la chiamata al costruttore padre.

Modifica il codice così

{% highlight java %}

public class SubClass extends SuperClass {
    public SubClass() {
        System.out.println("SubClass()");
    }
    public SubClass(boolean b) {
        System.out.println("SubClass(boolean)");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();
        
        SubClass instance2 = new SubClass(true);
        instance2.method1();
    }
}
{% endhighlight %}

otterrai l’output

{% highlight java %}
SuperClass()
SubClass()
SuperClass.method1()
SuperClass()
SubClass(boolean)
SuperClass.method1()
{% endhighlight %}

Il codice che hai appena visto è equivalente a questo

{% highlight java %}
public class SubClass extends SuperClass {
    public SubClass() {
        super();
        System.out.println("SubClass()");
    }
    public SubClass(boolean b) {
        super();
        System.out.println("SubClass(boolean)");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();

        SubClass instance2 = new SubClass(true);
        instance2.method1();
    }
}
{% endhighlight %}

che produce lo stesso output. Non importa inserire o meno la chiamata `super()` che richiama il costruttore della superclasse, `super()` verrà chiamato comunque.

L’esistenza di `super()` è giustificata dal fatto che la tua superclasse potrebbe avere più costruttori e usare `super()` è l’unico modo per poter imporre quale di essi sarà chiamato.

Modifica il codice in questo modo

{% highlight java %}
public class SuperClass {
    public SuperClass() {
        System.out.println("SuperClass()");
    }
    public SuperClass(boolean b) {
        System.out.println("SuperClass(boolean)");
    }
    public void method1() {
        System.out.println("SuperClass.method1()");
    }
    public static void main(String[] args) {
        SuperClass instance = new SuperClass();
        instance.method1();
    }
}
public class SubClass extends SuperClass {
    public SubClass() {
        super();
        System.out.println("SubClass()");
    }
    public SubClass(boolean b) {
        super(b);
        System.out.println("SubClass(boolean)");
    }
    public void method() {
        System.out.println("SubClass.method()");
    }
    public static void main(String[] args) {
        SubClass instance = new SubClass();
        instance.method1();
        SubClass instance2 = new SubClass(true);
        instance2.method1();
    }
}
{% endhighlight %}

se esegui il metodo `main` di `SubClass` otterrai questo output

{% highlight java %}
SuperClass()
SubClass()
SuperClass.method1()
SuperClass(boolean)
SubClass(boolean)
SuperClass.method1()
{% endhighlight %}

`super()` mi permette di pilotare quale costruttore della superclasse chiamare a tempo di esecuzione.

E anche per oggi è tutto. Come al solito se hai una domanda in merito a questo post, vuoi un approfondimento o hai un argomento che ti interesserebbe che io trattassi nei prossimi post puoi scrivermi.
