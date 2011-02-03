require_relative 'spec_helper'
require 'problem_012'

describe Problem012 do

  before(:each) do
    @prb = Problem012.new
  end

  describe "iterating" do

    it "has 1 as the first number" do
      @prb.first.should == 1
    end

    it "has 1, 3, 6, 10, 15, 21, 28, 36, 45, 55 as the first ten numbers" do
      @prb.take(10).should == [1,3,6,10,15,21,28,36,45,55]
    end

    it "has 5050 as the 100th number" do
      @prb.take(100).max.should == 5050
    end
  end

  describe "factoring" do

    it "calculates 1 factor for 1" do
      1.factors.should == 1
    end

    it "calculates 2 factors for 3" do
      3.factors.should == 2
    end

    it "calculates 4 factors for 6" do
      6.factors.should == 4
    end

    it "calculates 4 factors for 21" do
      21.factors.should == 4
    end

    it "calculates 6 factors for 28" do
      28.factors.should == 6
    end

    it "calculates 12 factors for 5050" do
      5050.factors.should == 12
    end
  end

  it "finds the first value whose factor count is greater than 500" do
    good_value = double(Integer)
    good_value.should_receive(:factors).and_return(500)
    bad_value = double(Integer)
    bad_value.should_receive(:factors).and_return(499)

    @prb.should_receive(:each).and_yield(3).
                               and_yield(bad_value).
                               and_yield(good_value).
                               and_yield(6)
    @prb.run.should == good_value
  end
end
