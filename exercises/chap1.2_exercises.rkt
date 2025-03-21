#lang sicp

;;1.9 compare these two implementations of add and see which has a recursive and iterative process
;;for the function call (add 4 5)

(define (add a b)
(if (= a 0) b (inc (+ (dec a) b))))


;;(add 4 5)
;;(inc (+ (dec 4) 5)) -> (inc (+ 3 5)) -> (inc 8) -> 9

;;expand and collapse behavior detected -> recursive

(define (addAlt a b)
(if (= a 0) b (+ (dec a) (inc b))))

;;(addAlt 4 5)
;;(+ (dec 4) (inc 5)) -> (+ 3 6) -> 9
;;iterative 


;;1.10 evaluate the following implementation of Ackermann's function

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;;A(x, y) { y = 0: 0, x = 0: 2y, y = 1: 2, A(x - 1, A(x, y - 1))

;;first case: (A 1 10)
;;eval to -> (A (- 1 1) A(1 (- 10 1)))

;;(A 0 (A 1 9)) -> (* 2 (A 1 9)) -> (* 2 (A ( - 1 1 ) (A 1 (- 9 1)))) ->
;;(* 2 (* 2 (A (- 1 1 ) (- 8 1)))) -> will be reduced to (* 2) until 8 becomes 0
;;-> this takes 10 times overall so reduce to 2^10 = 1024


;;second case: (A 2 4)
;;eval to -> (A (- 2 1) (A 2 (- 4 1))) -> (A 1 (A (-2 1) (A 2 (- 3 1))))
;;-> (A (- 1 1) (A 1 (- (A 1 (- (A 2 2) 1))))) -> (A 0 (A 1 (- (A 2 2) 1)))
;;-> (* 2 (A 1 (- (A 2 2 ) 1))) -> (* 2 (A (- 1 1) (A 1 ( - (- (A 2 2 ) 1) 1))))
;;-> (* 2 (A 0 )) -> expand and reduce in a recursive process

;;Formalize based on findings
;;f(n) = A(0, n) = 2n
;;g(n) = A(1, n) = 2^n
;;h(n) = A(2, n) = 


;;Exercise 1.11

(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

(f 10)


;;exercise 1.12

(define (tri n)
    (if (= n 0)
        1
        (+ (expt 2 n) (tri (- n 1)))))

;;So funny how I couldn't think of this - basically, I can just instantiate
;;the first recursion with the exponential term 2^n and then add it to 
;;the function itself to start the recursion process from there!!W

(tri 3)