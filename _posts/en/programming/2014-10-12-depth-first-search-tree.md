---
layout: post
title:  "DFS o Depth First Search"
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

Starting from the generic tree traversal algorithm, if we use a stack $S$ to store the active nodes, we obtain the Depth-First Search (DFS) algorithm:

$$
\begin{array}{l}
\mathbf{procedure} \ \text{DFS}(r) \\
\quad S \gets \text{empty stack} \\
\quad S.\text{PUSH}(r) \\
\quad \mathbf{while} \ \neg S.\text{IS\_EMPTY}() \ \mathbf{do} \\
\quad\quad u \gets S.\text{POP}() \\
\quad\quad \mathbf{if} \ u \neq \text{null} \ \mathbf{then} \\
\quad\quad\quad \text{VISIT}(u) \\
\quad\quad\quad S.\text{PUSH}(\text{RIGHT\_CHILD}(u)) \\
\quad\quad\quad S.\text{PUSH}(\text{LEFT\_CHILD}(u)) \\
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

def dfs(r):
    s = [r]
    while s:
        u = s.pop()
        if u:
            visit(u)
            s.append(right_child(u))
            s.append(left_child(u))

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
    
    print("Iterative DFS traversal:")
    dfs(root)
    print()  # Newline
```

In a depth-first traversal, we continue exploration from the last node added to the stack $S$ (following a Last-In, First-Out or LIFO order).

Since we push the right child of each node onto the stack $S$ first, followed by the left child, the left child will be popped and visited first. This causes the algorithm to traverse deep along the leftmost path until it reaches a leaf node. Consequently, a right subtree is only visited after the corresponding left subtree has been fully explored.

By reversing the order in which the children are pushed onto the stack $S$, we obtain the symmetrical variant.

The recursive version of DFS is much more elegant, as the stack is managed implicitly via the system's call stack (activation records):

$$
\begin{array}{l}
\mathbf{procedure} \ \text{DFS}(r) \\
\quad \mathbf{if} \ r = \text{null} \ \mathbf{then} \\
\quad\quad \mathbf{return} \\
\quad \mathbf{end\ if} \\
\quad \text{VISIT}(r) \\
\quad \text{DFS}(\text{LEFT\_CHILD}(r)) \\
\quad \text{DFS}(\text{RIGHT\_CHILD}(r)) \\
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

def dfs(r):
    if r:
        visit(r)
        dfs(left_child(r))
        dfs(right_child(r))

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
    
    print("Recursive DFS traversal:")
    dfs(root)
    print()  # Newline
```

Depending on when the node $r$ is visited relative to its children, we obtain different tree traversal orders:
* **Pre-order traversal**: we visit the root $r$ first, then the left child, and finally the right child.
* **In-order (symmetrical) traversal**: we visit the left child first, then the root $r$, and finally the right child.
* **Post-order traversal**: we visit the left child first, then the right child, and finally the root $r$.
