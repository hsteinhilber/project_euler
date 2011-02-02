require_relative 'spec_helper'
require 'prime_generator'

describe PrimeGenerator do

  before(:each) do
    @primes = PrimeGenerator.new
  end

  describe "iterating" do

    it "returns 2 as the first result" do
      @primes.first.should == 2
    end

    it "returns 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 in succession" do
      @primes.take(10).should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    end

    it "returns 541 as the 100th prime number" do
      @primes.skip(99).first.should == 541
    end

    it "responds to :each" do
      @primes.should respond_to(:each)
    end

    it "responds to :skip" do
      @primes.should respond_to(:skip)
    end

    it "takes less than 10s to compute the primes below 1,000,000" do
      start_time = Time.now
      @primes.take_while { |v| v < 1_000_000 }
      (Time.now-start_time).should <= 10.0
    end
  end
end
