#lang racket

(define (intnode tree) (
  cond [(and (null? (right tree)) (null? (left tree)))
          `()]
       [(and (not (null? (right tree))) (null? (left tree)))
          (cons (root tree) (intnode (right tree)))]
       [(and (not (null? (left tree))) (null? (right tree)))
          (cons (root tree) (intnode (left tree)))]
       [true
          (cons (root tree) (cons (intnode (right tree)) (intnode(left tree))))]
 )
)

(define (root tree) (
  car tree
  )
)

(define (right tree) (
  caddr tree
  )
)

(define (left tree) (
  cadr tree
  )
)

(intnode `(A (B (D () ()) (E () ())) (C () (F (G () ()) ()))))