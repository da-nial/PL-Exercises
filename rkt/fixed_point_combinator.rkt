#lang racket


(define
  fixedPoint (lambda (a) (
                          (lambda (f) (a (lambda (x) ((f f) x))))
                          (lambda (f) (a (lambda (x) ((f f) x))))
                          )
               )
  )

(define fib
  (fixedPoint (lambda (fib)
                (lambda (n)
                  (if (<= n 1) n (+ (fib (- n 1)) (fib (- n 2))))
                  )
                )
              ) 
  )


(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
(fib 9)
(fib 10)