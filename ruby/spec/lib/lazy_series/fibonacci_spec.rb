#!/usr/bin/env rspec
require_relative '../../spec_helper'
require_relative '../../../lib/lazy_series/fibonacci'

describe LazySeries::Fibonacci do
  it "generates the terms of the Fibonacci series" do
    first_ten_fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    LazySeries::Fibonacci.terms.take(10).to_a.should eq(first_ten_fibs)
  end
end
