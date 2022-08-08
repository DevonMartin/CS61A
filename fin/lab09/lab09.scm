;; Scheme ;;

(define (over-or-under a b)
    (cond
        ((< a b) -1)
        ((= a b) 0)
        ((> a b) 1)
    )
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

(define (filter-lst fn lst)
    (cond
        ((null? lst) 
            nil
        )
        ((fn (car lst))
            (define ans (list (car lst)))
            (append ans (filter-lst fn (cdr lst)))
        )
        (#t 
            (filter-lst fn (cdr lst))
        )
    )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

(define (make-adder n)
  (lambda (x) (+ n x))
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13

;; Extra questions

(define lst
    (list (list 1) 2 (list 3 4) 5)
)

(define (composed f g)
  (lambda (x) (f (g x)))
)

(define (remove item lst)
  (cond
      ((null? lst) nil)
      ((not (= item (car lst)))
          (define ans (list (car lst)))
          (append ans (remove item (cdr lst)))
      )
      (#t (remove item (cdr lst)))
  )
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
    (cond
        ((null? s) s)
        (#t
            (define ans (list (car s)))
            (append ans (filter (lambda (x) (not (= x (car s)))) (no-repeats (cdr s))))
        )
    )
)

(define (substitute s old new)
    (cond
        ((null? s) s)
        ((pair? (car s))
            (append (list (substitute (car s) old new)) (substitute (cdr s) old new))
        )
        ((eq? (car s) old)
            (append (list new) (substitute (cdr s) old new))
        )
        (#t
            (append (list (car s)) (substitute (cdr s) old new))
        )
    )
)


(define (sub-all s olds news)
    (cond
        ((null? olds) s)
        (#t
            (define s (substitute s (car olds) (car news)))
            (sub-all s (cdr olds) (cdr news))
        )
    )
)