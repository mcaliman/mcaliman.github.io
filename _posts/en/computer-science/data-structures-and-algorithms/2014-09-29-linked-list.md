---
layout: post
lang: en
title:  "Linked List"
excerpt: ""
category: data-structures-and-algorithms
date:   2014-09-29 22:45:33
tags: [English,"Data Structures","Computer Science","Java"]
comments: true
share: true
---
  
The basic constituents of a linked structure are the records, which like array cells are numbered and each contains a collection of objects. The numbers associated with the records are their in-memory addresses (thus global within the programme and not local as in the case of arrays).
Memory addresses are not necessarily consecutive and are constructed dynamically.

If a record `A` contains the address of another record `B` we will say that there is a link between `A` and `B` made by a pointer.
Pointers allow you to explore a linked structure by jumping from record to record, and there must be a record from which you can reach all the others. 
Such a record allows easy insertion and deletion of elements. The structure is updated via pointers (much more versatile than arrays).

strong property: it is possible to add or remove records to a linked structure
weak property: the addresses of records in a linked structure are not necessarily consecutive

To delete records if I do not already have an address, however, I must perform a search.

A specification for this type of structure is given below
class` LinkedList `implements` Dictionary
`data`: S(n) = ThetaGrande (n)
A collection of `n` records each containing a quadruple `(elem, key,next, prev)`
`next` and `prev` pointers to the next and previous `records` in the collection. 

We also keep a list pointer containing the address of a `record` if the collection is not empty and null otherwise.

operation:

```bash
insert(elem e,key k) T(n)=O(1)
1.a record p is created with element e, key k
2.if list=null then
   p.next<-p
   p.prev<-p
   list<-p
else 
   link the record p between list and list.next by making
   p.next<-list.next
   list.next.prev<-p
   p.prev<-list
   list.next<-p
```
Since this is a doubly linked structure (`doubly linked list`), certain limiting cases must be taken into account during implementation, such as deletion of the only element in the list, etc.
``bash
delete(key k) T(n)=O(n)
1. find the record p with key k as in the search
2. perform
  p.prev.next<-p.next (the next of the previous of p points to the successor of p)
  p.next.prev<-p.prev (the prev of the successor of p points to the predecessor of p)
3.destroy the record p
```

```bash
search(key k) -> elem T(n)=O(n)
if list = null then return null
else 
scan the structure by jumping from record to record with p<-p.next until it becomes p=list 
checking if any p has key k if so we return the element found otherwise `null
```
To realise an implementation in Java from the specification seen above we first need to create a class to model the records, but to do this we also need to model the information content with an Info or Tuple class, let us simplify at this early stage and assume that both the key (integer) and the value (string) are attributes of the record class itself. 

In other words, we avoid handling something like this
``java
public class Tuple<K,V> {
    public K key;
    public V value;
    
    public Tuple() {
    
    }
    public Tuple(K k,V v) {
        key = k;
        value = v;
    }
}
```

We come to our ``Record`` class
``java
public class Record {
    public Integer key;
    public String value;
    public Record prev;
    public Record next;
}
```

We could have already adopted a generic version such as
``java
public class RecordGen<K,V> {
    public K key;
    public V value;
    public Record next;
    public Record prev;
}
```