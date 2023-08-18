#lang racket/base

(define (fringe tree) (
  cond
      [
        (and (null? (cadr tree)) (null? (caddr tree)))
        (car(tree))
      ]
      [
        (and (null? (cadr tree)) (not (null? (caddr tree))))
        (fringe (caddr tree))
      ]
      [
        (and (not (null? (cadr tree))) (null? (caddr tree)))
        (fringe (cadr tree))
      ]
      [
        else
        (list (fringe (caddr tree)) (fringe (cadr tree)))
      ]
  )
)

(cdadadr '(7 (2 (1 null null) (3 null null)) (12 (11 null null) null)))

