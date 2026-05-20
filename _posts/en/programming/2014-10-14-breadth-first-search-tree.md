---
layout: post
title:  "BFS Breadth First Search"
excerpt: "Breadth-First Search (BFS) traversal algorithm for trees"
category: Programming
date:   2014-10-14
comments: true
share: false
modified: 2024-07-11
published: true
tags: [data-structures, algorithms, en, code]
permalink: /programming/bfs-breadth-first-search/
---
  
> "PHP is a minor evil perpetrated and created by incompetent amateurs, whereas Perl is a great and insidious evil perpetrated by skilled but perverted professionals."
(Jon Ribbens)

We start with the generic tree traversal algorithm, if we use a queue $C$ to store the active nodes, we obtain the Breadth-First Search (BFS) algorithm:

$$
\begin{array}{l}
\mathbf{procedure} \ \text{BFS}(r) \\
\quad C \gets \text{empty queue} \\
\quad C.\text{ENQUEUE}(r) \\
\quad \mathbf{while} \ \neg C.\text{IS\_EMPTY}() \ \mathbf{do} \\
\quad\quad u \gets C.\text{DEQUEUE}() \\
\quad\quad \mathbf{if} \ u \neq \text{null} \ \mathbf{then} \\
\quad\quad\quad \text{VISIT}(u) \\
\quad\quad\quad C.\text{ENQUEUE}(\text{LEFT\_CHILD}(u)) \\
\quad\quad\quad C.\text{ENQUEUE}(\text{RIGHT\_CHILD}(u)) \\
\quad\quad \mathbf{end\ if} \\
\quad \mathbf{end\ while} \\
\mathbf{end\ procedure}
\end{array}
$$

```python
class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def left_child(node):
    return node.left

def right_child(node):
    return node.right

def visit(node):
    print(node.value, end=" ")

def bfs(r):
    # Using a list as a queue (FIFO)
    # pop(0) removes from the front
    q = [r]
    while q:
        u = q.pop(0)
        if u:
            visit(u)
            q.append(left_child(u))
            q.append(right_child(u))

if __name__ == "__main__":
    # Constructing a sample binary tree:
    #        1
    #       / \
    #      2   3
    #     / \
    #    4   5
    root = Node(1, 
                Node(2, Node(4), Node(5)), 
                Node(3))
    
    print("BFS traversal:")
    bfs(root)
    print()  # Newline
```

Nodes are visited by level: first the root $r$, then the children of the root, then the children of the children.
