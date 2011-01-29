require_relative 'spec_helper'
require 'problem_001'

describe Problem001 do

  before(:each) do
    @prb = Problem001.new
  end

  describe "iterating multiples" do
   
    it "returns 3 for the first value" do
      value = nil
      @prb.values(4) { |n| value = n }
      value.should == 3
    end

    it "returns 5 for the second value" do
      value = nil
      @prb.values(6) { |n| value = n }
      value.should == 5
    end

    it "returns 3, 5, 6, 9, 10, 12, 15, 18 for values less than 20" do
      values = []
      @prb.values(20) { |n| values << n }
      values.should == [3,5,6,9,10,12,15,18]
    end
  end

  describe "summing values" do

    it "returns 23 for values less than 10" do
      @prb.sum_values(10).should == 23
    end

    it "returns 78 for values less than 20" do
      @prb.sum_values(20).should == 78
    end
  end

  describe "solving problem" do

    it "returns the result of summing_values for max = 1000" do
      @prb.should_receive(:sum_values).with(1000)
      @prb.run
    end
  end
end
