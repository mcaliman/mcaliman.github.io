---
layout: post
lang: en
title:  "BFS Breadth First Search"
excerpt: ""
category: Programming
date:   2014-10-14 22:45:33
tags: ["Algorithms"]
comments: true
share: false
revision: 1
---
  
> "PHP is a minor evil perpetrated and created by incompetent amateurs, whereas Perl is a great and insidious evil perpetrated by skilled but perverted professionals."
(Jon Ribbens)

We start with the generic visitation algorithm and using a queue to represent `S` we obtain breadth-first visitation (Breadth First Search or BFS).

Nodes are visited by levels, first root, then children of the root, then children of the children.

```
algorithm BFS(node r)
   Queue C
   C.enqueue(r)
   while not C.isEmpty() do 
       u ← C.dequeue()
       if u ≠ null then
           visit(u)
           C.enqueue(leftChildOf(u))
           C.enqueue(rightChildOf(u))  
```