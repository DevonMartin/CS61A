;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
    (cdr (cdr s))
)

(define (cadr s)
    (car (cdr s))
)

(define (caddr s)
    (car (cddr s))
)

(define (sign x)
    (cond 
        ((< x 0) -1)
        ((= x 0) 0)
        ((> x 0) 1)
    )
)

(define (square x) 
    (* x x)
)

(define (pow b n)
    (cond
        ((= n 1) b) 
        ((even? n) (square (pow b (quotient n 2))))
        ((odd? n) (* b (square (pow b (/ (- n 1) 2)))))
    )
)

(define (unique s)
    (cond
        ((null? s) nil)
        (else (cons (car s) (filter (lambda (x) (not (eq? x (car s)))) (unique (cdr s)))))
    )
)