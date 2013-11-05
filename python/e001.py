#!/usr/bin/env python3
"""Multiples of 3 and 5
Project Euler, Problem 1
http://projecteuler.net/problem=1

If we list all the natural numbers below 10 that are multiples of 3 or
5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""
from fractions import gcd
from functools import reduce
from itertools import chain, count, takewhile


def sum_multiples_below(limit, divisors):
    """Sum multiples of one or more divisors below a given limit.
    >>> sum_multiples_below(10, [3, 5]) == 23
    True
    >>> sum_multiples_below(100, [1]) == sum(range(100))
    True
    """
    return (sum(multiples_below(limit, divisors)) -
            sum(repeated_values(limit, divisors)))


def multiples_below(limit, divisors):
    """Make an iterator that returns all natural multiples of each
    divisor, in order, below some limit (with duplication).
    >>> list(multiples_below(16, [3, 5]))
    [3, 6, 9, 12, 15, 5, 10, 15]
    """
    return chain.from_iterable(bounded(multiples(d), limit) for d in divisors)


def multiples(divisor):
    """Make an iterator that returns the natural multiples of a divisor.
    >>> from itertools import islice
    >>> [i for i in islice(multiples(3), 5)]
    [3, 6, 9, 12, 15]
    """
    return count(divisor, divisor)


def repeated_values(limit, divisors):
    """Make an iterator that returns all common, natural multiples of a
    list of divisors.
    >>> list(repeated_values(50, [4, 6]))
    [12, 24, 36, 48]
    """
    return [] if len(divisors) == 1 else multiples_below(limit, [lcm(divisors)])


def bounded(g, n):
    """Make an iterator containing the terms of g up to n.
    >>> [i for i in bounded(count(), 5)]
    [0, 1, 2, 3, 4]
    """
    return takewhile(lambda x: x < n, g)


def lcm(divisors):
    """Return the least common multiple of a list of divisors.
    >>> lcm([3, 5])
    15
    """
    return reduce(lambda a, b: a * b // gcd(a, b), divisors)


def main():
    print(sum_multiples_below(1000, [3, 5]))


if __name__ == '__main__':
    import doctest
    doctest.testmod()
    main()
