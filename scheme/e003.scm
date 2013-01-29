#!/usr/bin/env csi -script
;;;; Largest prime factor
;;;; Project Euler, Problem 3
;;;; http://projecteuler.net/problem=3

;;; The prime factors of 13195 are 5, 7, 13 and 29.

;;; What is the largest prime factor of the number 600851475143 ?

(define (largest-prime-factor n)
  (let loop ((n n) (factor 2))
    (cond ((= n factor) factor)
          ((multiple? n factor) (loop (/ n factor) factor))
          (else (loop n (+ factor 1))))))

(define (multiple? n divisor)
  (zero? (remainder n divisor)))

(print (largest-prime-factor 600851475143))
