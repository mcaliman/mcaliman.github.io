---
layout: post
lang: en
title:  "Using HashMap in Java"
excerpt: ""
category: "Programming Languages"
date:   2014-09-27 22:45:33
tags: ["Data Structures","Computer Science"]
comments: true
share: true
revision: 0
---
Picking up where we left off (see previous post), after seeing a bit of theory about dictionaries and something about the `Map` interface, let's move on to practical examples. We'll talk exclusively about the concrete class `HashMap`, the new, so to speak, `Hashtable`.


Before we begin, let's recall the main differences between the two

1. in `HashMap` you can insert `null` values, in `HashTable` you can't
2. `HashTable` is synchronised, `HashMap` is not.


If you think about it, these are no small differences, but as we shall see, there is no reason not to use `HashMap` instead of `HashTable` all the time. 

Let's create and add objects to the map. We use Generics and diamond inference 
Although obsolete, we can use `Hashtable` with generics and pass it to a `HashMap`
remember that `Hashtable` is `syncronized`, `HashMap` is not.

```java
Hashtable<Integer, String> t = new Hashtable<>();
HashMap<Integer, String> map = new HashMap(t);
```

we can initialise by setting the load factor (percentage of size) and initial capacity.
```java
HashMap<Integer, String> map1 = new HashMap(10);//initialiCapacity = 10
HashMap<Integer, String> map2 = new HashMap(10, 5);//initialiCapacity = 10 e load factor=5%
```

We add three string elements with respective integer keys to the map

```java
map.put(1, "Alfa");
map.put(2, "Bravo");
map.put(3, "Charlie");
```

we retrieve the value from `HashMap` given the key

```java
Integer key = 1;
String value = map.get(key);
System.out.println("Key: " + key + " value: " + value);
```


Iterating on the `HashMap      

```java
Iterator<Integer> keySetIterator = map.keySet().iterator();
while (keySetIterator.hasNext()) {
            Integer key1 = keySetIterator.next();
            System.out.println("key: " + key1 + " value: " + map.get(key1));
}
```

returns the size of a `HashMap` and empties it

```java
System.out.println("Size of Map: " + map.size());
map.clear(); 
System.out.println("Size of Map: " + map.size());
```

check whether it contains a given value or key

```java
System.out.println("Does HashMap contains 1 as key: " + map.containsKey(1));
System.out.println("Does HashMap contains Bravo as value: " +map.containsValue("Bravo"));
```

check if it contains elements or is empty

```java
boolean isEmpty = map.isEmpty();
System.out.println("Is HashMap is empty: " + isEmpty);
```

removing objects from the map

```java
key = 2;
value = map.remove(key);
System.out.println("Following value is removed from Map: " + value);
```
Sorting the elements of a map.A `HashMap` is not sorted either by key or by value.         
but you can sort it by both the values of the keys and the elements they refer to.
Alternatively, you can use a `SortedMap` like `TreeMap`. 
`TreeMap` has a constructor which accepts a `Map`, and you can create a sorted map 
according to the natural order of the keys or according to a custom ordering defined by a comparator.
The keys should be naturally comparable, and `compareTo()` method should not throw an exception under any circumstances.                
There is no `Collections.sort()` method defined for `Map` 
it is only for lists like `ArrayList`,`LinkedList` etc. 

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

Print keys from largest to smallest
```java
System.out.println("Sorted HashMap: " + sortedHashMap);
```
You need to synchronise a `HashMap` if you need to use it in a multi-threaded environment.
If you are using JDK 1.5 or earlier consider using `ConcurrentHashMap` instead of a HashMap because it provides a better implementation of concurrent processing. 
If your project is far behind as a JDK use `Hashtable` instead.
We will use `Collections.synchronizedMap(map)`. 
This method returns a thread-safe version of `Map`.

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
The Java Collections Framework holds other pleasant surprises and utilities, we will look at these in more detail in future posts, as usual if you have any particular queries about a given topic (e.g. `WeakHashMap` or `LinkedHashMap`) you can contact me by email.