#!/usr/bin/env rspec
require_relative '../../spec_helper'
require_relative '../../../lib/lazy_series/naturals'

describe LazySeries::Naturals do
  it "generates the natural numbers from 1" do
    LazySeries::Naturals.terms.take(10).to_a.should eq((1..10).to_a)
  end

  it "generates the natural numbers from an arbitrary starting point" do
    LazySeries::Naturals.terms(start: 7).take(10).to_a.should eq((7..16).to_a)
  end
end
