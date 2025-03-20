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