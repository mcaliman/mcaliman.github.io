---
layout: post
lang: en
title:  "Java Dictionaries"
excerpt: "The Java implementation of Dictionaries"
category: Java
date:   2014-09-24 22:45:33
tags: [Italian,Java,"Data Structures","Computer Science"]
comments: true
share: true
---


Nelle vecchie release del linguaggio Java il tipo di dato dizionario veniva realizzato a partire dalla classe `Dictionary<K,V>` del package `java.util`. 

La classe `Dictionary` è il genitore astratto di `Hashtable`, che associa chiavi a valori. 

Ogni chiave e ogni valore è un oggetto. 

In ogni oggetto `Dictionary`, ogni chiave è associata al più ad un valore. 

Dato un dizionario e una chiave, si può recuperare l'elemento associato. Qualsiasi oggetto non `null` può essere utilizzato sia come una chiave che come valore. 

Di norma, il metodo `equals` deve essere implemantato da questa classe per decidere se due chiavi sono uguali.

Benchè non ancora deprecata `Dictionary` può essere considerata obsoleta ormai, in quando `Map` è l’interfaccia standard per questo tipo di collezioni di dati. `Dictionary` permane in quando da essa deriva direttamente la classe concreta `HashTable`.

Tuttora moltissimo codice utilizza ancora `HashTable`, ecco il perchè della sua sopravvivenza, necessaria ai fini della retrocompatibilità.

`Dictionary` è stata comunque "svecchiata" da Sun ora Oracle riprogettandola con i generics, passando in rassegna il javadoc possiamo farci un idea piuttosto precisa della segnatura dei suoi metodi principali.

```java 
abstract Enumeration<V> elements() 
```
ritorna una `Enumaration` dei valori nel dizionario.

```java
abstract V get(Object key) 
```
ritorna il valore con cui è mappata la chiave `key` nel dizionario

```java
abstract boolean isEmpty() 
```
ritorna `true` se il dizionario è vuoto, `false` altrimenti.

```java
abstract Enumeration<K> keys() 
```
ritorna una `Enumaration` delle chiavi presenti nel dizionario.

```java
abstract V put(K key, V value) 
```
mappa la chiave `key` con `value` nel dizionario, cioè inserisce la coppia `key,value` nel dizionario

```java
abstract V remove(Object key) 
```
rimuove la chiave e il valore corrispondente dal dizionario

```java
abstract int size() 
```
ritorna il numero di elementi distinti contenuti nel dizionario (cioè il numero delle chiavi).


Si tratta dei classici metodi di una generica struttura dati di tipo dizionario, approfondiamo l'aspetto teorico rispolverando un pò di nozioni:

Un dizionario è una collezione di elementi a cui sono associate chiavi prese da un universo totalmente ordinato. La nozione di tipo di dato si usa per descrivere le operazioni di interesse su una collezione, in altre parole specifica cosa un'operazione deve fare, non come l'operazione può essere realizzata, questo corrisponde al concetto di interface nel linguaggio Java.

Una specifica in pseudolinguaggio può essere ad esempio quella riportata sotto

**tipo**: 
Dizionario

**dati**: 

Un insieme `S` di coppie (`elemento`,`chiave`)
**operazioni**:

1. `insert(elemento e,chiave k)` : *aggiunge a S una nuova coppia (e,k)*
2. `delete(chiave k)`: *cancella da S la coppia con chiave k*
3. `search(chiave k) -> elemento` : *se la chiave k è presente in S restituisce l’elemento e ad essa associata*

più formalmente, prendendo in prestito le nozioni insiemistiche (perchè `S` è un insieme) abbiamo 
`S={ (e,k) | e&isin;elemento,k&isin;chiave }`

1. `insert(e,k)`     realizza `S = S&#8746;(e,k)`
2. `delete(k)`       realizza `S = S&minus;(e,k) se (e,k)&isin;S`
3. `search(k) -> e`  realizza se `k` in `S` allora ritorna `e`, `null` altrimenti.
           
Oggi di fatto la classe `HashTable` non è più utilizza, le collezioni oggi sono molto più strutturate, pulite ed organiche.

Il posto di `Dictionary` è stato preso da `Map<K,V>`, che è un interfaccia al contrario di `Dictionary` che è invece una classe astratta,`Map` è quindi molto più flessibile dal punto di vista della OOP, o quantomeno della OOP adottata dal linguaggio Java (eredita multipla solo dal punto di vista delle interfacce alla release 7)

Con riferimento al suo javadoc abbiamo i metodi

```java
void clear()
```
svuota la mappa.

```java
boolean containsKey(Object key)
```
ritorna `true` se la mappa contiene elementi per la chiave key.

```java
boolean containsValue(Object value)
```
ritorna `true` se la mappa contiene una o più chiavi per il valore specificato

```java
Set<Map.Entry<K,V>> entrySet()
```
ritorna un `Set` delle coppie (chiave,valore) contenute nella mappa.

```java
boolean equals(Object o)
```
compara l’oggetto specificato con la quelli nella mappa (ugualianza).

```java
V get(Object key)
```
ritorna il valore associato alla chiave key se presente in mappa, `null` altrimenti.

```java
int hashCode()
```
ritorna il codice hash per la mappa.

```java
boolean isEmpty()
```
ritorna `true` se la mappa è vuota.

```java
Set<K> keySet()
```
ritorna un `Set` con le chiavi della mappa (utile per iterare con `Iterator`).

```java
V put(K key, V value)
```
associa il valore specificato con la chiave passata.

```java
void putAll(Map<? extends K,? extends V> m)
```
copia tutti gli elementi della mappa m nella mappa.

```java
V remove(Object key)
```
rimuove la coppia key-value per la key passata, se presente in mappa.

```java
int size()
```
ritorna la dimensione della mappa ovvero il numero di coppie key-value contenute.

```java
Collection<V> values()
```
ritorna una `Collection` con i valori contenuti nella mappa.

Il set di metodi è piuttosto generoso, volendolo confrontare con le tipiche specifiche astratte comuni ad ogni mappa.
Il tipo più comune di implementazioni di `Map` è `HashMap`. 


