#!/usr/bin/env ruby
# Multiples of 3 and 5
# Project Euler, Problem 1

# If we list all the natural numbers below 10 that are multiples of 3 or
# 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.
require_relative 'lib/lazy_series'

module ProjectEuler
  module_function
  def problem_1(limit: 1e3, divisors: [3, 5])
    LazySeries::Naturals.terms.multiples(divisors).below(limit).sum
  end
end

if __FILE__ == $0
  puts ProjectEuler.problem_1
end
