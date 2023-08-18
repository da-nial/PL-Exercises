# Programming Languages Course Exercises

This repository contains my solutions to programming problems from my Programming Languages course. All solutions are
written in Racket and SML.

## Racket Problems

### 1. `get_inversions`

Write a function named `get_inversions` which gets an array `A` of integers and returns the number of inversions in the
array. An inversion is a pair of integers `(i, j)` which `i < j` and `A𝑖 > A𝑗`.
Example:

> (get_inversions '(1 2 3 4))
>> 0

> (get_inversions '(4 3 1 5))
>> 3

### 2. `diff_envs`

Let’s define an environment `Env` a mapping from variables to values. Consider a list of pairs in which each pair’s
first
element is a string (variable’s name) and the second element is an integer (value of the variable) as a representation
of an
environment in the Racket language.
For example consider an environment `E` that a mapping from `A --> 2` and from `B --> 3`. The following list is the
representation of `E`:
`'(("A" . 2) ("B" . 3))`.

Write a function named `diff_envs` which gets two environments `E1` and `𝐸2`
and returns a list of keys which two environments have different values for. Note that both environments should include
the different keys but with not the same values.
Example:
> (list (cons "A" 2) (cons "B" 1) (cons "C" 2))
>> '(("A" . 2) ("B" . 1) ("C" . 2))

> (list (cons "B" 1) (cons "C" 4))
>> '(("B" . 1) ("C" . 4))

> (diff_envs (list (cons "A" 2) (cons "B" 1) (cons "C" 2)) (list (cons "B" 1) (cons "C" 4)))
>> '("C")

### 3. `generate_all`

A bracket sequence is called regular if it is possible to obtain correct arithmetic expression by inserting
characters “+” and “1” into this sequence. For example, sequences `“(())()”`, `“()”` and `“(()(()))”` are regular,
while `“)(“`, `“(()”` and `“(()))(“` are not.
Write a function named `generate_all` which gets a number `N` and returns the list of all regular bracket sequence of
length `2 × N`.
Example:
> (generate_all 1)
>> '("()")

> (generate_all 2)
>> '("(())" "()()")

### 4. `depth_tree`

Write a function named depth in Racket that takes a binary tree and an integer n as arguments and returns a list
containing all the nodes in the tree at depth n.

The binary tree is represented as a list where the first element is the root node, the second element is the left
subtree, and the third element is the right subtree. The subtrees may be null or nested binary trees represented the
same way.

The depth of the root node is 1. The depth of the nodes in the left and right subtrees is the depth of the parent + 1.

### 5. `count-if`

Write `count-if`, which takes a predicate function and a list as arguments. This function should count the number of
top-level elements in the list that satisfy the predicate.

### 6. `fringe`

A binary tree is a data structure containing nodes and edges that lead to left and right subtrees. Each node has exactly
one value and two branches in left and right. In Lisp (or in this case, Racket) a binary tree can be represented with a
list where null subtrees are represented with empty lists. For example the following list:

> (7 (2 (1 () ()) (3 () ())) (12 (11 () ()) ()))

represents this tree.

```
    7
   / \
  2   12
 / \  /
1  3 11
```

Define the function fringe in Racket so that it takes a binary tree as an argument and returns a list consisting of the
leaf values. For example, for the above tree, the result would be `(1, 3, 11)`.

### 7. `mapcompfun`

Write `mapcompfun`, which takes 3 lists, composes functions from the first two lists, and then applies each resulting
function to the corresponding item in the third list.

### 8. `intnode_tree`

Write a function named intnode in Racket that takes a tree as an argument and returns a list containing the root value
and all internal node values in pre-order traversal.

### 9. `maplist`

This is the solution to exercise 3.4 from the book "Concepts in Programming Languages" by John C. Mitchell. Example code
and tests are provided.

### 10. fixed_point_combinator

Implement a fixed-point combinator (as you have seen in the lambda-calculus) in Lisp (or in Racket).

## SML Problems

### 1. curry

Define the following higher-order functions in SML.

> Curry: (('a * 'b) --> 'c) --> ('a --> ('b --> 'c)

> UnCurry: ('a --> ('b --> 'c) --> (('a * 'b) --> 'c)

### 2. maptree

The following data type defines a binary tree of any type, and does not include the null tree.

> Datatype 'a tree = LEAF of 'a | NODE of 'a tree * 'a tree

Write a function named maptree that takes a function as an argument, and returns a function that maps trees to trees by
applying the passed-in function to every leaf.

### 3. wbtree

Define a data type `wbtree` in ML for a binary tree where each node and edge stores a weight, and weights are
real-valued numbers. Each node has 0, 1 or 2 children.

A path in the tree is defined to be a sequence of nodes and edges from the root of the tree to one of the leaves. The
weight for a path is defined to be the sum of the weights of all nodes and edges in that path. Write a function named
minPath which returns the path with the minimum weight in a tree.

### 4. Problem Set A

Instructions for this problem set is available at [docs/sml_problem_set_a](docs/sml_problem_set_a.pdf).

### 5. Problem Set B

Instructions for this problem set is available at [docs/sml_problem_set_b](docs/sml_problem_set_b.pdf).

## Credits

To the best of my knowledge, the Racket Problem Set A has been designed by [amsen20](https://github.com/amsen20).