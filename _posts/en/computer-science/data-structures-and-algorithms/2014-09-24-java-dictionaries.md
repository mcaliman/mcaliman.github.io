---
layout: post
lang: en
title:  "Java Dictionaries"
excerpt: "The Java implementation of Dictionaries"
category: programming-languages
date:   2014-09-24 22:45:33
tags: [English,Java,"Data Structures","Computer Science"]
comments: true
share: true
---

In older releases of the Java language, the dictionary data type was realised from the `Dictionary<K,V>` class of the `java.util` package. 

The `Dictionary` class is the abstract parent of `Hashtable`, which associates keys with values. 

Each key and each value is an object. 

In each `Dictionary` object, each key is associated with at most one value. 

Given a dictionary and a key, the associated element can be retrieved. Any non `null` object can be used as either a key or a value. 

By default, the `equals` method must be implemented by this class to decide whether two keys are equal.

Although not yet deprecated `Dictionary` can be considered obsolete now, since `Map` is the standard interface for this kind of data collection. `Dictionary` remains since the concrete class `HashTable` is derived directly from it.

A lot of code still uses `HashTable`, hence its survival, necessary for backward compatibility.

However, `Dictionary` has been "freshened up" by Sun now Oracle by redesigning it with generics, and by reviewing the javadoc, we can get a pretty good idea of the signatures of its main methods.

```java 
abstract Enumeration<V> elements() 
```
returns an `Enumeration` of the values in the dictionary.

```java
abstract V get(Object key) 
```
returns the value to which the `key` is mapped in the dictionary

```java
abstract boolean isEmpty() 
```
returns `true` if the dictionary is empty, `false` otherwise.

```java
abstract Enumeration<K> keys() 
```
returns an `Enumeration` of the keys in the dictionary.

```java
abstract V put(K key, V value) 
```
maps the key `key` to `value` in the dictionary, i.e. inserts the pair `key,value` into the dictionary

```java
abstract V remove(Object key) 
```
removes the key and the corresponding value from the dictionary

```java
abstract int size() 
```
returns the number of distinct elements contained in the dictionary (i.e. the number of keys).


These are the classic methods of a generic data structure of the dictionary type, let's delve into the theoretical aspect by brushing up on some notions:

A dictionary is a collection of elements to which keys taken from a totally ordered universe are associated. The notion of a datatype is used to describe the operations of interest on a collection, in other words it specifies what an operation must do, not how the operation can be carried out, this corresponds to the concept of interface in the Java language.

A pseudolanguage specification might be, for example, as follows

**type**: 
Dictionary

**data**: 

A set `S` of pairs (`element`,`key`).
**operations**:

1. `insert(element e,key k)` : *add a new pair (e,k)* to S.
2. `delete(key k)`: *deletes the pair with key k from S*.
3. `search(key k) -> element` : *if key k is present in S returns the element and associated with it*

more formally, borrowing set notions (because `S` is a set) we have 
`S={ (e,k) | e&isin;element,k&isin;key }`

1. `insert(e,k)` realizes `S = S&#8746;(e,k)`
2. `delete(k)` realises `S = S&minus;(e,k) if (e,k)&isin;S`
3. `search(k) -> e` realises if `k` in `S` then returns `e`, `null` otherwise.
           
Today in fact the `HashTable` class is no longer used, collections today are much more structured, clean and organic.

The place of `Dictionary` has been taken by `Map<K,V>`, which is an interface as opposed to `Dictionary` which is instead an abstract class,`Map` is therefore much more flexible from the point of view of OOP, or at least the OOP adopted by the Java language (it inherits multiple interfaces only from the point of view of interfaces at release 7)

Referring to its javadoc we have the methods

```java
void clear()
```
empty the map.
```java
boolean containsKey(Object key)
```
returns `true` if the map contains elements for the key key.

```java
boolean containsValue(Object value)
```
returns `true` if the map contains one or more keys for the specified value

```java
Set<Map.Entry<K,V>> entrySet()
```
returns a `Set` of the pairs (key,value) contained in the map.

```java
boolean equals(Object o)
```
compares the specified object with the one in the map (equality).

```java
V get(Object key)
```
returns the value associated with the key key if present in the map, `null` otherwise.

```java
int hashCode()
```
returns the hash code for the map.

```java
boolean isEmpty()
```
returns `true` if the map is empty.

```java
Set<K> keySet()
```
returns a `Set` with the map keys (useful for iterating with `Iterator`).

```java
V put(K key, V value)
```
associa il valore specificato alla chiave passata.

```java
void putAll(Map<? extends K,? extends V> m)
```
copies all elements of map m into the map.

```java
V remove(Object key)
```
removes the key-value pair for the passed key, if present in the map.

```java
int size()
```
returns the size of the map, i.e. the number of key-value pairs it contains.

```java
Collection<V> values()
```
returns a `Collection` with the values contained in the map.

The set of methods is quite generous, if you want to compare it to the typical abstract specification common to every map.
The most common type of `Map` implementation is `HashMap`.


