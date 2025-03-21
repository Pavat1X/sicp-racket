#lang sicp

;;Starting chapter 2 of SICP 

;;PROCEDURES AND PROCESSES

;;As programmers, we control the computer by calling processes within our programs. These processes
;;create procedures, which we must understand the workings of.

;;This chapter will cover simple shapes and forms of procedures

;;LINEAR RECURSION AND ITERATION

;;an iterative process that we learned in high school is the factorial, which can be
;;defined by the following function:

; f(n) = n(n-1)(n-2).....(3)(2)(1)

; we can write this programmatically

(define (factorial n) 
    (if (= n 1)
    1
    (* n (factorial (- n 1)))))

;; we can use the substitution model that we have learned in chapter 1 to deduce how 
;; this procedure will work

;; factorial(n) {n = 1: 1, n != 1: n * factorial(n-1)

;;factorial(1) = 1
;;factorial(2) = (* 2 (foctorial 1))
;;factorial(3) = (* 3 (factorial 2)) -> (* 3 (* 2 factorial(1))) - > (* 3 (* 2 1))

;;Computational Thinking in action: another way to approach the factorial problem

;;we can think of the factorial iteration process as incrementing a product with a counter
;;going from 1,2,3 to n.

;;product <- counter * product
;;counter <- counter + 1



(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter(* counter product) (+ counter 1) max-count)))

(define (factorial-new n)
    (fact-iter 1 1 n))

(factorial-new 10)

;;the two implementations look the same at face value, however, the 'shape' of 
;;both processes differ.

;;let's analyze deeper by substitution, recall that that first process evolves as such:
;;factorial(3) = (* 3 (factorial 2)) -> (* 3 (* 2 factorial(1))) - > (* 3 (* 2 1)) -> (* 3 2)

;;As you can see from above, the first implementation expands and then contracts:
;;all factorials are substituted into their primitive operations and calculated into 
;;final products. We can say that this is a chain of deferred operations of the same kind -
;;RECURSION

;;now, let's look at the second implementation
;;(factorial-new 3) = (fact-iter 1 1 3) -> (fact-iter 1 2 3 ) -> (fact-iter 2 3 3) 
;;-> (fact-iter 6 3 3): counter at max count, process terminates, final answer is 6

;; as you can see, it is an ITERATIVE process

;;The scale of both processes grow linearly with n (number of recursive function calls 
;;correspond to n, and number of iterations correspond to n). Hence they are
;;linear recursive and linear iterative processes.

;;note that a recursive process != recursive procedure. Recursive procedures are 
;;self function calls while a recursive process refers to how a program evolves during runtime


