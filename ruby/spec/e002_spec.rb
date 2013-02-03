#!/usr/bin/env rspec
require_relative 'spec_helper'
require_relative '../e002'

describe "problem 2" do
  it "sums even-valued terms of the Fibonacci sequence" do
    example_fibs = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    sum_of_even_example_fibs = example_fibs.select(&:even?).reduce(:+)
    ProjectEuler::problem_2(100).should eq(sum_of_even_example_fibs)
  end
end
