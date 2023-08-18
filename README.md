# Programming Languages Course Exercises

This repository contains my solutions to programming problems from my Programming Languages course. All solutions are
written in Racket and SML.

## Racket Problems

### 1. get_inversions

Write a function named 𝑔𝑒𝑡 𝑖𝑛𝑣𝑒𝑟𝑠𝑖𝑜𝑛𝑠 which gets an array 𝐴 of integers and returns the number of inversions in the
Array.
Aninversionisapairofintegers𝑖,𝑗which𝑖 < 𝑗and𝐴𝑖 >𝐴𝑗.
Example:

> (get_inversions '(1 2 3 4))
> 0

> (get_inversions '(4 3 1 5))
> 3

### 2. diff_envs

Let’s define an environment 𝐸𝑛𝑣 a mapping from variables to values. Consider a list of pairs in which each pair’s first
element is a string (variable’s name) and second element is an integer (variable’s value) as a presentation of an
environment in racket language.
For example consider an environment 𝐸 a mapping from 𝐴 to 2 and from 𝐵 to 3, following list is the presentation of 𝐸:
'(("A" . 2) ("B" . 3))

Write a function named 𝑑𝑖𝑓𝑓 𝑒𝑛𝑣𝑠 which gets two environments 𝐸1 and 𝐸2
and returns a list of keys which two environments have different values for. Note that both environments should include
the different keys but with not the same values.
Example:
> (list (cons "A" 2) (cons "B" 1) (cons "C" 2))
'(("A" . 2) ("B" . 1) ("C" . 2))

> (list (cons "B" 1) (cons "C" 4))
'(("B" . 1) ("C" . 4))

> (diff_envs (list (cons "A" 2) (cons "B" 1) (cons "C" 2)) (list
(cons "B" 1) (cons "C" 4)))
'("C")

### 3. generate_all

A bracket sequence is called regular if it is possible to obtain correct arithmetic expression by inserting
characters “+” and “1” into this sequence. For example, sequences “(())()”, “()” and “(()(()))” are regular,
while “)(“, “(()” and “(()))(“ are not.
Write a function named 𝑔𝑒𝑛𝑒𝑟𝑎𝑡𝑒 𝑎𝑙𝑙 which gets a number 𝑁 and returns
list of all regular bracket sequence of length 2 × 𝑁.
Example:
> (generate_all 1)
'("()")

> (generate_all 2)
'("(())" "()()")

### 4. depth_three

### 5. count-if

Write count-if, which takes a predicate function and a list as arguments. This function should count the number of
top-level elements in the list that satisfy the predicate.

### 6. fringe

### 7. mapcompfun

### 8. intnode_tree

### 9. maplist

## SML Problems

### 1. curry

### 2. maptree

### 3. wbtree

### 4. Problem Set A

### 5. Problem Set B