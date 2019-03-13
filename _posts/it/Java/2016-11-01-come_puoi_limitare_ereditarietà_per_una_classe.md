---
layout: post
lang: it
title: Come puoi limitare l'ereditarietà per una classe?
excerpt: ""
modified: 2016-11-01
categories: java
tags: [Java]
#image:
#  feature: so-simple-sample-image-1.jpg
#  credit: WeGraphics
#  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
search_omit: false
updated: true
---

Una delle domande che ti possono capitare ad un colloquio o ad una certificazione o un semplice test riguardo il linguaggio Java è la seguente:
Come puoi limitare l’ereditarietà per una classe?
Le risposte comunemente accettate per questa domanda sono

1. Commentando con `//` o `/* */`
2. Rendendo tutti i costruttori `private`
3. Rendendo la classe `final`
4. Rendendo tutti i metodi `final`

Numero 1:Commentando con `//` o `/* */`
La numero 1. pochi la danno. Eppure probabilmente anche tu usi questa soluzione spesso. Solo che non sembra una risposta da fornire ad un colloquio. Sbagliato. Se ti rende più tranquillo puoi darla come ultima risposta, per me è un bonus. Pensaci, spoiler: trovi di più alla fine del post.

Numero 2:Rendendo tutti i costruttori `private`
La numero 2. riguarda il fatto che se tutti i costruttori sono `private` il gioco dell’ereditarietà non funziona, provate a compilare queste due classi

{% highlight java %}
public class AClass {
   private AClass(){
   }
}
public class BClass extends AClass {
}
{% endhighlight %}

e otterrai questo errore di compilazione

{% highlight java %}
AClass() has private access in AClass
public class BClass extends AClass {
{% endhighlight %}

Numero 3:Rendendo la classe `final`
La numero 3. è usando la parola chiave `final`, prova a compilare le due classi viste sopra così modificate

{% highlight java %}
public final class AClass {
   public AClass(){
   }
}
public class BClass extends AClass {
}
{% endhighlight %}

otterrai

{% highlight java %}
error: cannot inherit from final AClass
{% endhighlight %}

Numero 4:Rendendo tutti i metodi `final`
La quarta ed ultima è rendendo tutti i metodi `final`, osserva la seguente ridefinizione delle classi viste sopra e prova ad effettuare una compilazione.

{% highlight java %}
public class AClass {
    public AClass() {
    }
    public final void method() {
    }
}
public class BClass extends AClass {
    public BClass() {
        super();
    }
    @Override
    public void method() {
    }
}
{% endhighlight %}

Otterrai l’errore

{% highlight java %}
method() in BClass cannot override method() in AClass
    public void method() {
  overridden method is final
{% endhighlight %}

Fai attenzione, la domanda è “Come posso limitare” non “Come posso impedire (del tutto)” l’ereditarietà. La soluzione con il modificare `final` davanti a `class` blocca completamente ogni possibilità di ereditare dalla classe.


Addendum Numero 1
Ecco due interpretazione 

{% highlight java %}
public class BClass /*extends AClass*/ {
    public BClass() {
        super();
    }
    //@Override
    public void method() {
    }
}
{% endhighlight %}
e 
{% highlight java %}
public abstract class AClass {
    public AClass() {
    }
    /*public final void method() {
    }*/
}
{% endhighlight %}

Un pochino borderline lo ammetto, ma scommettiamo che è la più usata?

E anche per oggi è tutto. Come al solito se hai una domanda in merito a questo post, vuoi un approfondimento o hai un argomento che ti interesserebbe che io trattassi nei prossimi post puoi scrivermi.
