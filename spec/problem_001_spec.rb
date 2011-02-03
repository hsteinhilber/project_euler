require_relative 'spec_helper'
require 'problem_001'

describe Problem001 do

  before(:each) do
    @prb = Problem001.new
  end

  describe "iterating values" do
    it "has 3 as the first value" do
      @prb.first.should == 3
    end

    it "has 5 as the second value" do 
      @prb.take(2).should == [3,5]
    end

    it "has values 3, 5, 6, 9 less than 10" do
      @prb.take_while { |n| n < 10 }.should == [3,5,6,9]
    end

    it "has values 3, 5, 6, 9, 10, 12, 15, 18 less than 20" do
      @prb.take_while { |n| n < 20 }.should == [3,5,6,9,10,12,15,18]
    end
  end
  
  describe "summing values" do
    it "has 23 as the result of less than 10" do
      @prb.sum_to(10).should == 23
    end

    it "has 78 as the result of less than 20" do
      @prb.sum_to(20).should == 78
    end
  end

  it "sums the values less than 1000" do
    @prb.should_receive(:sum_to).with(1000)
    @prb.run
  end
end
