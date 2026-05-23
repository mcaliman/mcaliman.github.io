---
layout: post
title: "DFS (Depth-First Search)"
excerpt: "Depth-First Search (DFS) traversal algorithm for trees"
category: Programming
date: 2014-10-12
comments: true
share: false
modified: 2024-07-11
published: true
tags: [data-structures, algorithms, en, code]
permalink: /programming/dfs-depth-first-search/
---


Starting from the generic algorithm shown and using a stack to represent $S$, we obtain depth-first search (or DFS):

$$
\begin{array}{l}
\mathbf{procedure} \ \text{DFS}(r) \\
\quad S \gets \text{empty stack} \\
\quad S.\text{PUSH}(r) \\
\quad \mathbf{while} \ \neg S.\text{IS\_EMPTY}() \ \mathbf{do} \\
\quad\quad u \gets S.\text{POP}() \\
\quad\quad \mathbf{if} \ u \neq \text{null} \ \mathbf{then} \\
\quad\quad\quad \text{VISIT}(u) \\
\quad\quad\quad S.\text{PUSH}(\text{RIGHT\_CHILD\_OF}(u)) \\
\quad\quad\quad S.\text{PUSH}(\text{LEFT\_CHILD\_OF}(u)) \\
\quad\quad \mathbf{end\ if} \\
\quad \mathbf{end\ while} \\
\mathbf{end\ procedure}
\end{array}
$$


In a depth-first traversal, we continue the traversal from the last remaining node.
Since we stack first the right-hand child of each node and then the left-hand child, we tend to follow all the left-hand children going deep until the first left-hand leaf is reached. In general, we will only visit each right-hand subtree in a node when the left-hand subtree has been visited altogether.

By reversing the order in which we add the children we have the symmetrical variant

The recursive deep-visit version shown below is much more elegant:
the stack does not appear explicitly in the algorithm as it is the stack of records for activating recursive calls to keep nodes open.

There are the obvious variations if we alter the order of the visit and child addition instructions in the stack $S$.
* preorder traversal: We visit the root first, then the left child, and then the right child.
* symmetrical traversal: Left child first, then the root, and then the right child.
* post-order traversal: First the left child, then the right child, and finally the root.

$$
\begin{array}{l}
\mathbf{procedure} \ \text{DFS}(r) \\
\quad \mathbf{if} \ r = \text{null} \ \mathbf{then} \\
\quad\quad \mathbf{return} \\
\quad \mathbf{end\ if} \\
\quad \text{VISIT}(r) \\
\quad \text{DFS}(\text{LEFT\_CHILD\_OF}(r)) \\
\quad \text{DFS}(\text{RIGHT\_CHILD\_OF}(r)) \\
\mathbf{end\ procedure}
\end{array}
$$

