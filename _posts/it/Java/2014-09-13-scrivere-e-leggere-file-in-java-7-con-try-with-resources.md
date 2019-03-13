---
layout: post
lang: it
title:  "Scrivere e leggere file in Java 7 con try-with-resources"
excerpt: ""
category: java
date:   2014-09-13 22:45:33
tags: [Java,JDK7]
comments: true
share: true
---

Leggere e scrivere file in Java 7 sfruttando il nuovo costrutto try-with-resource manleva lo sviluppatore dal compito di chiudere correttamente gli stream, sotto potete trovare due metodi di esempio.


Per scrivere un file
{% highlight java %}
protected boolean write(String name, String text) {
        boolean completed;
        try (Writer writer = 
new BufferedWriter(
new OutputStreamWriter(new FileOutputStream(name), "utf-8"))) 
{
            writer.write(text);
            completed = true;
        } catch (IOException e) {
            completed = false;
            logger.log(Level.SEVERE, "", e);
        }
        return completed;
    }
{% endhighlight %}


e per leggerne il contenuto


{% highlight java %}
public String read(String name) {
        String text = null;
        try (BufferedReader buffer = new BufferedReader(new FileReader(name))) {
            StringBuilder string = new StringBuilder();
            String line = buffer.readLine();
            while (line != null) {
                string.append(line).append(System.lineSeparator());
                line = buffer.readLine();
            }
            text = string.toString();
        } catch (FileNotFoundException e) {
            logger.log(Level.SEVERE, "", e);
        } catch (IOException e) {
             logger.log(Level.SEVERE, "", e);
        }
        return text;
    }
{% endhighlight %}


Quando il blocco try termina lo Stream verrà chiuso automaticamente. Questo è possibile perché le classi utilizzate nel blocco try-with-resources implementano l'interfaccia Java java.lang.AutoCloseable . 


Tutte le classi che implementano questa interfaccia possono essere utilizzati all'interno del try-with-resources.


L’interfaccia AutoClosable ha un solo metodo close() 


{% highlight java %}
public interface AutoClosable {

   public void close() throws Exception;
}
{% endhighlight %}


Implementare AutoClosable su un nostro oggetto non richiede molto sforzo come si può vedere da codice di esempio che riporto qui sotto.
{% highlight java %}
public class AutoClosableExampleObject implements AutoCloseable {

   @Override
   public void close() throws Exception {
      //do stuff and close
   }
}
{% endhighlight %}


Se non vogliamo catturare l’eccezzione basta omettere la parte catch del blocco ed essa si propagherà come se fosse non gestita (proprio così un try senza catch e senza finally). Ad essere sinceri il codice sopra avrebbe potuto beneficiare di altre novità della versione 7 come ad esempio i catch con gestione multipla di eccezioni ma di questo ed altro si parlerà in un prossimo post.
