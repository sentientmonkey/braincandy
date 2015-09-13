#lang racket/base

(require rackunit)

(define (pascal-triangle n)
  (case n
    [(1) '((1))]
    [(2) (append (pascal-triangle (sub1 n)) '((1 1)))]
    [else
      (letrec ([t (pascal-triangle (sub1 n))]
               [tl (cadr t)])
        (append
          t
          (list
            (cons (car tl)
              (cons (+ (car tl) (cadr tl))
                    (cdr tl))))))]))

(check-equal? (pascal-triangle 1) '((1)))
(check-equal? (pascal-triangle 2) '((1) (1 1)))
(check-equal? (pascal-triangle 3) '((1) (1 1) (1 2 1)))
