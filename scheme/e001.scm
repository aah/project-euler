#!/usr/bin/env csi -script
;;; Multiples of 3 & 5
;;; Project Euler, Problem 1
;;; http://projecteuler.net/problem=1

;; If we list all the natural numbers below 10 that are multiples of 3
;; or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.

(use srfi-1)

(define (sum-multiples-below limit divisors)
  (sum (filter (lambda (n) (multiple-of-any? n divisors))
               (range 1 limit))))

(define (sum l)
  (let loop ((l l) (total 0))
    (if (null? l) total
      (loop (cdr l) (+ total (car l))))))

(define (multiple-of-any? n divisors)
  (cond ((null? divisors) #f)
        ((zero? (remainder n (car divisors))))
        (else (multiple-of-any? n (cdr divisors)))))

(define (range start stop)
  (let loop ((start start) (stop (- stop 1)) (acc '()))
    (if (> start stop) acc
      (loop start (- stop 1) (cons stop acc)))))

(print (sum-multiples-below 1000 '(3 5)))
