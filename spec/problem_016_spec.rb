require_relative 'spec_helper'
require 'problem_016'

describe Problem016 do

  before(:each) do
    @prb = Problem016.new
  end

  describe "summing digits" do

    it "returns 0 for 0" do
      @prb.sum_digits(0).should == 0
    end

    it "returns 1 for 1" do
      @prb.sum_digits(1).should == 1
    end

    it "returns 2 for 11" do 
      @prb.sum_digits(11).should == 2
    end

    it "returns 11 for 506" do
      @prb.sum_digits(506).should == 11
    end

    it "returns 11 for 605" do
      @prb.sum_digits(605).should == 11
    end
  end

  it "sums the digits of 2^1000 and returns the result" do
    @prb.should_receive(:sum_digits).with(2**1000).and_return(15)
    @prb.run.should == 15
  end

end

