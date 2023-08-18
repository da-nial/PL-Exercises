#lang racket


(define (diff_envs e1 e2) (
                           cond
                            [(empty? e1) null]
                            [(is_diff (first e1) e2)
                             (append (list (car (first e1))) (diff_envs (rest e1) e2))]
                            [else (diff_envs (rest e1) e2)]
                            )
  )

(define (is_diff p env) (
                         and (not (equal? (cdr p) (get_val (car p) env)))
                             (not (null? (get_val (car p) env)))
                         )
  )

(define (get_val k env)(
                        cond
                         [(empty? env) null]
                         [(equal? (car (first env)) k) (cdr (first env))]
                         [else (get_val k (rest env))]
                         )
  )

(define sample_e1 (list (cons "A" 2) (cons "B" 1) (cons "C" 2)))
(define sample_e2 (list (cons "B" 1) (cons "C" 4)))
(diff_envs sample_e1 sample_e2)

;; (A* different keys) (B* same key and vals) (C* same key, different vals)
(define sample_e3 (list (cons "A1" 2) (cons "B1" 1) (cons "B2" 2) (cons "C1" 2) (cons "C2" 3)))
(define sample_e4 (list (cons "A2" 2) (cons "B1" 1) (cons "B2" 2) (cons "C1" -2) (cons "C2" -3)))
(diff_envs sample_e3 sample_e4)