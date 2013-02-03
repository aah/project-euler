#!/usr/bin/env rspec
require_relative '../spec_helper'
require_relative '../../lib/lazy_series'

describe Enumerator::Lazy do
  before(:each) do
    @lazy_range = (1..10).lazy
  end

  context "#below" do
    it "consumes values while less than some max" do
      @lazy_range.below(5).to_a.should eq([1, 2, 3, 4])
    end
  end

  context "#even" do
    it "selects the even-valued terms of a sequence" do
      @lazy_range.even.to_a.should eq([2, 4, 6, 8, 10])
    end
  end

  context "#sum" do
    it "sums the values of a lazy enumerator" do
      @lazy_range.sum.should eq((1..10).reduce(:+))
    end
  end
end
