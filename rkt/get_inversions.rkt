#lang racket


(define (get_inversions arr)
  (cond
    [(empty? arr) 0]
    [else (
           + (count_gt_than (first arr) (rest arr)) (get_inversions (rest arr))
           )]
    )
  )

(define (count_gt_than n arr)
  (cond
    [(empty? arr) 0]
    [else (cond
            [(> n (first arr)) (+ 1 (count_gt_than n (rest arr)))]
            [else (count_gt_than n (rest arr))]
            )]
    )
  )

(count_gt_than 6 `(7 6 9 9 5 11))
(get_inversions '(4 3 1 5))