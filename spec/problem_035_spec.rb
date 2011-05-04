require_relative 'spec_helper'
require 'problem_035'

describe Problem035 do

  describe "finding circular primes" do
    
    it "returns 2,3,5,and 7 for values less than 10" do
      Problem035.circular_primes_under(10).should =~ [2,3,5,7]
    end

    it "returns 2,3,5,7,11,13,17,31,37,71,73,79,and 97 for values less than 100" do
      Problem035.circular_primes_under(100).should =~ 
        [2,3,5,7,11,13,17,31,37,71,73,79,97]
    end
  end

  it "requests all circular primes less than 1,000,000" do
    Problem035.should_receive(:circular_primes_under).with(1_000_000).and_return([2])
    Problem035.run
  end

  it "returns the number of circular primes returned" do
    Problem035.should_receive(:circular_primes_under).and_return([1,2,3,4])
    Problem035.run.should == 4
  end
end
