---
layout: post
title:  "DFS (Depth-First Search)"
excerpt: "Depth-First Search (DFS) traversal algorithm for trees"
category: Programming
date:   2014-10-12
comments: true
share: false
modified: 2024-07-11
published: true
tags: [data-structures, algorithms, en, code]
permalink: /programming/dfs-depth-first-search/
---

Starting from the generic algorithm shown and using a stack to represent `S`, we obtain depth-first search (or DFS):

```
procedure DFS(node r)
   Stack S
   S.push(r)
   while not S.isEmpty()  do
      u ← S.pop()
       if u ≠ null then
            visit(u)
            S.push(right_child_of(u))
            S.push(left_child_of(u))
       fi
   od
end 
```

In a depth-first traversal, we continue the traversal from the last remaining node.
Since we stack first the right-hand child of each node and then the left-hand child, we tend to follow all the left-hand children going deep until the first left-hand leaf is reached. In general, we will only visit each right-hand subtree in a node when the left-hand subtree has been visited altogether.

By reversing the order in which we add the children we have the symmetrical variant

The recursive deep-visit version shown below is much more elegant:
the stack does not appear explicitly in the algorithm as it is the stack of records for activating recursive calls to keep nodes open.

There are the obvious variations if we alter the order of the visit and child addition instructions in the S-stack.
* preorder traversal: We visit the root first, then the left child, and then the right child.
* symmetrical traversal: Left child first, then the root, and then the right child.
* post-order traversal: First the left child, then the right child, and finally the root.

```
-- DFS recursive visit
procedure DFS(node r)
     if r = null then return
     visit(r)
     DFS(left_child_of(r))
     DFS(right_child_of(r))
end
```
