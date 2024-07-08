---
layout: post
lang: en
title:  "DFS o Depth First Search"
excerpt: ""
category: Programming
date:   2014-10-12 22:45:33
comments: true
share: false
published: true
---



Starting from the generic algorithm shown and using a Stack/Stack to represent `S`, we obtain the depth first search (or DFS)

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

in a visit in depth we continue the visit from the last node left over
since we stack first the right-hand child of each node and then the left-hand child we tend to follow all the left-hand children going deep until the first left-hand leaf is reached in general we will only visit each right-hand subtree in a node when the left-hand subtree has been visited altogether


By reversing the order in which we add the children we have the symmetrical variant

The recursive deep-visit version shown below is much more elegant:
the stack does not appear explicitly in the algorithm as it is the stack of records for activating recursive calls to keep nodes open.

There are the obvious variations if we alter the order of the visit and child addition instructions in the S-stack.
* preorder visit = we visit the root first then left child and then right child
* symmetrical visit = left first,then root and then right
* visit in post order = first left,then right and finally root

```
-- DFS recursive visit
procedure DFS(node r)
     if r = null then return
     visit(u)
     DFS(left_child_of(r))
     DFS(right_child_of(r))
end
```
