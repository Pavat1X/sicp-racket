#lang sicp

;;Tree recursions are recursive processes that grow in a tree-like way where recursions are
;;branches of each other. A good example of this is the fibonacci sequence.

(define (fib n)
(cond ((n = 0) 0)
      ((n = 1) 1)
      (else (+ (fib (- n 1)) (fib (- n 2))))))

;;Looking at this implementation, we can see how it evolves into
;;a tree; to compute fib 4, you need fib 3 and fib 2
;;and to compute fib 3, you need fib 2 and fib 1. 
;;This is also why we can use a cache to store branches that are already computed
;;to improve the performance of this fib algorithm 

;;because of its tree-like structure, we can see that
;;this recursive iteration of the fibonacci sequence is of the 
;;time complexity O(2^n). 

;;the complexity is O(2^n) because the recursive tree 
;;generated from fib is pretty much a binary tree
;;as any fib(n) can be broken down into fib(1)s and fib(0)s
;;the branches of fib(1) and fib(0) grow with n in an exponential way

;;mathematically, fib(n) can be approximated by the golden ratio to
;;the power of n divided by sqrt(5)

;;alternatively, we can formulate an iterative process for fib
;;by initializing with fib(1) and fib(0) as the starting point
;;and go from there to calculate the next number in the sequence

;;in the case of SICP, we abstract fib 1 and 0 as a, b and apply 
;;the transformations:
;;a <- a + b
;;b < - a

(define (fib-iter a b count)
      (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fibTwo n)
      (fib-iter 1 0 n))

(fibTwo 10)

;;for such an implementation, the iterative process only has the time complexity
;;of O(n), as the program runs linearly by the number n supplied.
;;looking at it from another implementation

;;RECURSIVE VS ITERATIVE PROCESS IMPLEMENTATIONS

;;It might be straightforward to implement algorithms for both processes for the fibonacci,
;;but what about trickier cases?

;;Consider the problem of representing 1 dollar with dimes, nickels, 
;;half-dollars, quaters, and pennies.

;;this is a permutation problem where the total ways to represent value a with n coins is:
;;the number of ways to represent value a with the first type of coin 
;;plus the number of ways to represent value a - d with n coins, where
;;d is the value a denominated in the first type.

;;Moreover, if the value is negative, there is no representation so number of ways 
;;should be 0. If the value is 0, there should be 1 way, which is none.