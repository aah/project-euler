#!/usr/bin/env python3
"""Multiples of 3 and 5
Project Euler, Problem 1
http://projecteuler.net/problem=1

If we list all the natural numbers below 10 that are multiples of 3 or
5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""
from itertools import count, takewhile


def sum_multiples_below(limit, divisors):
    """Sums multiples of one or more divisors below a given limit.
    >>> sum_multiples_below(10, [2, 3]) == sum([2, 3, 4, 6, 8, 9])
    True
    >>> sum_multiples_below(100, [1]) == sum(range(100))
    True
    """
    return sum(bounded(multiples(divisors), limit))


def multiples(divisors):
    """Returns a generator that emits the multiples of one or more divisors.
    >>> from itertools import islice
    >>> [i for i in islice(multiples([3, 5]), 5)]
    [0, 3, 5, 6, 9]
    """
    return (i for i in count() if is_multiple(i, divisors))


def is_multiple(n, divisors):
    """Returns True if n is a multiple of *any* number in a list of divisors.
    >>> is_multiple(9, [2, 3]) and not is_multiple(10, [3, 4])
    True
    """
    return any(not n % d for d in divisors)


def bounded(g, n):
    """Returns an iterator containing the terms of g up to n.
    >>> [i for i in bounded(count(), 5)]
    [0, 1, 2, 3, 4]
    """
    return takewhile(lambda x: x < n, g)


def main():
    print(sum_multiples_below(1000, [3, 5]))


if __name__ == '__main__':
    import doctest
    doctest.testmod()
    main()
