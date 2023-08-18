#lang racket

(define (append_open_paren s) (string-append s "("))
(define (append_close_paren s) (string-append s ")"))

(define (add_open_paren_next n b s) (add_paren (- n 1) (+ b 1) (append_open_paren s)))
(define (add_close_paren_next n b s) (add_paren (- n 1) (- b 1) (append_close_paren s)))

(define (add_paren n b s) (cond
                            [(= n 0) (list s)]
                            [(= b 0) (add_open_paren_next n b s)]
                            [(< b (- n 1)) (append
                                            (add_open_paren_next n b s)
                                            (add_close_paren_next n b s)
                                            )]
                            [else (add_close_paren_next n b s)]
                            )
  )

(define (generate_all n) (add_paren (* 2 n) 0 ""))

(define (pretty_print ls) (cond
                            [(empty? ls) null]
                            [else (printf "~s\n" (first ls)) (pretty_print (rest ls))]
                            )
  )

(printf "Regular Bracket Sequences\n")
(printf "Length 1\n")
(pretty_print (generate_all 1))
(printf "Length 2\n")
(pretty_print (generate_all 2))
(printf "Length 3\n")
(pretty_print (generate_all 3))
(printf "Length 4\n")
(pretty_print (generate_all 4))
