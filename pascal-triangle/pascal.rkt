#lang racket

(require rackunit)

(provide pascal-triangle)

(define (sums l)
  (cond
    [(null? l) '()]
    [(null? (cdr l)) l]
    [else
      (cons (+ (car l) (cadr l))
            (sums (cdr l)))]))

(test-case "sums"
    (check-equal? (sums '()) '())
    (check-equal? (sums '(1)) '(1))
    (check-equal? (sums '(1 1)) '(2 1))
    (check-equal? (sums '(1 2 1)) '(3 3 1))
    (check-equal? (sums '(1 3 3 1)) '(4 6 4 1)))

(define (pascal-triangle n)
  (cond
    [(eq? n 1) '((1))]
    [else
      (letrec ([t (pascal-triangle (sub1 n))]
               [tl (last t)])
        (append
          t
          (list (cons 1 (sums tl)))))]))

(test-case "pascal-triangle"
    (check-equal? (pascal-triangle 1) '((1)))
    (check-equal? (pascal-triangle 2) '((1) (1 1)))
    (check-equal? (pascal-triangle 3) '((1) (1 1) (1 2 1)))
    (check-equal? (pascal-triangle 4) '((1) (1 1) (1 2 1) (1 3 3 1)))
    (check-equal? (pascal-triangle 5) '((1) (1 1) (1 2 1) (1 3 3 1) (1 4 6 4 1))))
