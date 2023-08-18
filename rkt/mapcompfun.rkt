#lang racket

(define (mapcompfun fs gs xs) (
  cond [(null? xs) `()]
       [true
            (cons
                ((car fs) ((car gs) (car xs)))
                (mapcompfun (cdr fs) (cdr gs) (cdr xs))
            )
        ]
  )
)

;Test

(define (plus c) (
    lambda (x) (+ x c)
  )
)

(define (multiply c) (
    lambda (x) (* x c)
  )
)
(mapcompfun
        (list (plus 1) (plus 2) (plus 3))
        (list (multiply 1) (multiply 2) (plus 3))
        `(1 2 3)
)
