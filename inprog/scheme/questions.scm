(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
    (define x 0)
    (define l '())
    (define (helper_func s x l)
        (cond 
            (
                (not (null? s))
                (define l (append l (list (list x (car s)))))
                (define x (+ x 1))
                (define s (cdr s))
                (helper_func s x l)
            )
            (else l)
        )
    )
    (helper_func s x l)
)
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
    (define list3 '())
    (define (helper_func comp list1 list2 list3)
        (cond
            (
                (and (not (null? list1)) (not (null? list2)))
                (cond
                    (
                        (comp (car list1) (car list2))
                        (define list3 (append list3 (list (car list1) (car list2))))
                    )
                    (else
                        (define list3 (append list3 (list (car list2) (car list1))))
                    )
                )
                (define list1 (cdr list1))
                (define list2 (cdr list2))
                (helper_func comp list1 list2 list3)
            )
            (else 
                (define list3 (append list3 list1))
                (define list3 (append list3 list2))
                list3
            )
        )
    )
    (helper_func comp list1 list2 list3)
)
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    'replace-this-line
    )
    ; END PROBLEM 17


