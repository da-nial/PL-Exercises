#lang racket

(define
  compose (lambda (f g)
            (lambda (x) (f (g x)))
            )
  )

(define mapcar
  (lambda (f xs)
    (cond
      ((eq? xs `()) `()) ;; If the list is empty, return the empty list
      (#t ;; otherwise, apply f to the first element
       (cons (f (car xs))
             ;; and map f on the rest of the list
             (mapcar f (cdr xs))
             )
       )
      )
    )
  )

(define maplist
  (lambda (f xs)
    (cond
      ((eq? xs `()) `()) ;; If the list is empty, return the empty list
      (#t ;; otherwise, apply f to the list . . .
       (cons (f xs)
             ;; and map f on the rest of the list
             (maplist f (cdr xs))
             )
       )
      )
    )
  )

(define compose2 (lambda (g h) (lambda (f xs) (g (lambda (xs) (f (h xs))) xs)))
  )

(define inc (lambda (x) (+ x 1)))