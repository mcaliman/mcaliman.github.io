---
layout: post
lang: it
title:  "Usare HashMap in Java"
excerpt: ""
category: Java
date:   2014-09-27 22:45:33
tags: [Italian,"Data Structures","Computer Science"]
comments: true
share: true
---

﻿Riprendiamo da dove ci eravamo lasciati (vedi post precedente), dopo aver visto un pò di teoria sui dizionari e qualcosa sull’interfaccia `Map` passiamo a esempi pratici. Parleremo esclusivamente della classe concreta `HashMap`, la nuova, per così dire, `Hashtable`.


Prima di iniziare ricordiamo le differenze principali tra le due

1. in `HashMap` è possibile inserire valori `null`, in `HashTable` no
2. `HashTable` è sincronizzata, `HashMap` non lo è.


Se ci pensate bene non sono differenze da poco, ma come vedremo non ci sono motivi per non usare sempre e comunque `HashMap` in luogo di `HashTable`. 

Creiamo e aggiungiamo oggetti nella mappa. Usiamo i Generics e diamond inference 
Anche se obsoleta possiamo usare `Hashtable` con i generic e passarla ad un `HashMap`
ricordiamo che `Hashtable` è `syncronized`, `HashMap` non lo è.

```java
Hashtable<Integer, String> t = new Hashtable<>();
HashMap<Integer, String> map = new HashMap(t);
```

possiamo inizializzare settando il load factor (percentuale delle dimensione)  e la capacità iniziale.

```java
HashMap<Integer, String> map1 = new HashMap(10);//initialiCapacity = 10
HashMap<Integer, String> map2 = new HashMap(10, 5);//initialiCapacity = 10 e load factor=5%
```

aggiungiamo tre elementi stringa con rispettive chiavi intere alla mappa

```java
map.put(1, "Alfa");
map.put(2, "Bravo");
map.put(3, "Charlie");
```

recuperiamo il valore da `HashMap` data la chiave

```java
Integer key = 1;
String value = map.get(key);
System.out.println("Key: " + key + " value: " + value);
```


Iteratiamo sulla `HashMap`        

```java
Iterator<Integer> keySetIterator = map.keySet().iterator();
while (keySetIterator.hasNext()) {
            Integer key1 = keySetIterator.next();
            System.out.println("key: " + key1 + " value: " + map.get(key1));
}
```

ritorna le dimensioni di una `HashMap` e la svuota

```java
System.out.println("Size of Map: " + map.size());
map.clear(); 
System.out.println("Size of Map: " + map.size());
```

controllo se contiene un dato valore o una data chiave

```java
System.out.println("Does HashMap contains 1 as key: " + map.containsKey(1));
System.out.println("Does HashMap contains Bravo as value: " +map.containsValue("Bravo"));
```

controllo se contiene elementi o se è vuota

```java
boolean isEmpty = map.isEmpty();
System.out.println("Is HashMap is empty: " + isEmpty);
```

rimuovo oggetti dalla mappa

```java
key = 2;
value = map.remove(key);
System.out.println("Following value is removed from Map: " + value);
```

Ordinare gli elementi di una mappa.Una `HashMap` non è ordinata ne per chiave ne per valore.         
ma è possibile ordinarla sia rispetto ai valori delle chiavi sia degli elementi a cui le stesse si riferiscono.
Alternativamente, puoi usare una `SortedMap` come `TreeMap`. 
`TreeMap` ha un costruttore che accetta una `Map` ed è possibile creare una mappa ordinata 
in base all'ordine naturale delle chiavi o secondo un odinamento personalizzato definito da un comparatore.
Le chiavi dovrebbe essere naturalmente comparabili e metodo  `compareTo()` non dovrebbe lanciare un'eccezione in nessun caso.                
Non esiste un metodo `Collections.sort()` definita per `Map` 
è solo per liste come `ArrayList`,`LinkedList` ecc.        

```java
System.out.println("Unsorted HashMap: " + map);
TreeMap sortedHashMap = new TreeMap(map);
System.out.println("Sorted HashMap: " + sortedHashMap);


sortedHashMap = new TreeMap(new Comparator<Integer>() {
            @Override
            public int compare(Integer k1, Integer k2) {
                return k2.compareTo(k1);
            }
        }
        );
sortedHashMap.put(1, "Alfa");
sortedHashMap.put(2, "Bravo");
sortedHashMap.put(3, "Charlie");
```

Stampa le chiavi dalla più grande alla più piccola

```java
System.out.println("Sorted HashMap: " + sortedHashMap);
```

Se hai necessità di rendere synchronize una `HashMap` se devi usarla in ambiente multi-threaded.
Se usi il JDK 1.5 o precedenti considera di usare `ConcurrentHashMap` in luogo di un HashMap perchè fornisce una migliore implementazione della gestione dei processi concurrenti. 
Se invece il tuo progetto è rimasto molto indietro come JDK usa `Hashtable`.
Noi useremo `Collections.synchronizedMap(map)`. 
Questo metodo ritorna una versione thread-safe di `Map`

```java
Map synchronizedMap = Collections.synchronizedMap(sortedHashMap);
Set set = synchronizedMap.entrySet();
synchronized (map) {
            Iterator i = set.iterator();
            while (i.hasNext()) {
                Map.Entry me = (Map.Entry) i.next();
                System.out.print(me.getKey() + ": ");
                System.out.println(me.getValue());
            }
}
```

Le Java Collections Framework riserva altre piacevoli sorprese e utilità, vedremo di approfondirle nei prossimi post, come al solito se avete richieste particolari riguardo un dato argomento  (per esempio `WeakHashMap` o `LinkedHashMap`) potete contattarmi via mail.
