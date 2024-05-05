---
layout: post
lang: en
title:  "Tree in Java"
excerpt: ""
category: Programming
date:   2014-10-05 22:45:33
tags: ["Data Structures"]
comments: true
share: false
revision: 0
---
After the posts on elementary data structures, we move on to deal with trees. Before going into the details of how to implement data structures of this type, let us delve into the theoretical aspect.

First, let's look at the classic definition

A (rooted) tree is a pair `T=(N,A)` consisting of a set `N` of nodes and a set `A` of arcs, `A` being a proper subset of `NxN` (i.e. of the Cartesian product of `N` by `N`), the arcs in fact being pairs of nodes, and the concept of an arc models the relationship.

There is a rather intuitive nomenclature regarding trees.
In a tree every node `v` (except the root) has only one parent (or father) `u` `such that `(u,v)` belongs to `A` (the set of arcs)

A node may have `1` or more `v` children `such that `(u,v)` belongs to `A` and their number is called degree

With these definitions we have already established some important concepts.

We will not deal here with all the definitions for root, leaves, inner nodes,ancestors,descendants,depth.

Nodes with the same father are called siblings, trees with leaves all on the same level are called complete trees.

A basic specification of the `Tree` data type must necessarily include operations such as those below.


* DATA-TYPE 
   * `Tree`
 
* DATA 
     * `N` = `set of` nodes  
     * `A` = `set of` arcs
* OPERATIONS
   * numberOfNodes() -> int 
      * returns the number of nodes in the `tree`
   * degree(Node `v`) ->int  
      * returns the number of children of node `v` 
   *  parent(Node `v`) -> Node
      * returns the parent of node `v` or `null` if `v` is the `root`
   * (node,node,...,node) children(Node `vv) 
        * returns the children of the `v` node one after the other
   * addNode(Node `u`,Node `v`) -> node
      * inserts a new node `v` as a child of `u` in the tree and returns it, if `v` is the first node to be inserted in the tree it becomes root and `u` is ignored
   * addSubtree(Tree `t`,Node `u`) 
      * inserts the subtree `t` into the tree so that the root of `t` becomes a child of `u`
   * removeSubtree(Node v) -> `Tree` 
      * detaches and returns the entire subtree rooted in `v`, the operation deletes the `v` node and all its descendants from the tree


A questo punto passare dalla specifica in pseudocodice ad una in linguaggio Java è immediato. 

```java
interface Node {
      //stuff
}

interface Tree {
   int numberOfNodes();
   int degree(Node v);
   Node parent(Node v);
   List<Node> children(Node v);
   Node addNode(Node u,Node v);
   void addSubTree(Tree a,Node u) ;
   Tree removeSubTree(Node v);
}
```

Such a structure which does not carry some information content is in itself of little use, `Node` should in fact contain as a property e.g. a key, a label. Think for example of a tree structure to represent the family tree of a family.

Using generics would in fact be more interesting to work with classes of this type
`Tree<T>` and `Node<T>`.

In the JDK, there are interesting implementations such as `javax.swing.tree.TreeModel` and `javax.swing.tree.TreeNode` used in `Swing` for building GUIs in desktop environments.

There are several possible representations for trees, either based on indexed or linked structures; which one we choose depends on the kind of problems we think we need to solve. If we think the most common or critical operation is to find the children of a node, we'll use one; if the most critical operation is to navigate the tree by levels, we'll use one optimised for that.