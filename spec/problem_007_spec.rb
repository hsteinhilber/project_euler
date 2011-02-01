require_relative 'spec_helper'
require 'problem_007'

describe Problem007 do

  before(:each) do
    @prb = Problem007.new
  end

  describe "n-th prime" do

    it "calculates the first prime as 2" do
      @prb.nth_prime(1).should == 2
    end

    it "calculates the fifth prime as 11" do
      @prb.nth_prime(5).should == 11
    end

    it "calculates the 25th prime as 97" do
      @prb.nth_prime(25).should == 97
    end
  end

  it "calculates the value of the 10,001st prime" do
    @prb.should_receive(:nth_prime).with(10_001)
    @prb.run 
  end
end
