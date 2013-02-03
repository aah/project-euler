#!/usr/bin/env rspec
require_relative 'spec_helper'
require_relative '../e001'

describe "problem 1" do
  it "sums multiples of one or more divisors beneath a given limit" do
    sum_of_example_multiples = [3, 5, 6, 9].reduce(:+)
    ProjectEuler::problem_1(limit: 10, divisors: [3, 5]).
      should eq(sum_of_example_multiples)
  end
end
