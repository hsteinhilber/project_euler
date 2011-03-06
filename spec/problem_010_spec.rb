require_relative 'spec_helper'
require 'problem_010'

describe Problem010 do

  before(:each) do
    @prb = Problem010.new
  end

  it "returns an empty set for primes below 2" do
    @prb.primes_below(2).should be_none
  end

  it "calculates a list of primes below a given number" do
    @prb.primes_below(10).should == [2, 3, 5, 7]
  end

  it "calculates the sum of primes below 2,000,000" do
    @prb.should_receive(:primes_below).with(2_000_000).and_return([2,3,5,7])
    @prb.run.should == 17
  end
end
