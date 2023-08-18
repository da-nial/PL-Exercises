#lang racket
(define (depth n tree) (
                        cond [(= n 1) (car tree)]
                             [(> n 1) (
                                       cond [(and (null? (cadr tree)) (null? (caddr tree)))
                                             `()]
              
                                            [(and (not (null? (cadr tree))) (null? (caddr tree))) 
                                             (cons (depth (- n 1) (cadr tree)) null)]
             
                                            [(and (null? (cadr tree)) (not (null? (caddr tree)))) 
                                             (cons (depth (- n 1) (caddr tree)) null)]
             
                                            [(and (not (null? (cadr tree))) (not (null? (caddr tree))))
                                             (cons (depth (- n 1) (cadr tree)) (depth (- n 1) (caddr tree)))]
                                            )]
                             )
  )

(define sampleTree
  `(A 
    (B 
     (D () ())
     (E () ())
     )
    (C
     ()
     (F
      (G () ())
      ()
      )
     )
    )
  )

(depth 1 sampleTree)
(depth 2 sampleTree)
(depth 3 sampleTree)
