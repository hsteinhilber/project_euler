require_relative 'spec_helper'
require 'problem_001'

describe Problem001 do

  before(:each) do
    @prb = Problem001.new
  end

  describe "iterating values" do
    it "has 3 as the first value" do
      value = nil
      @prb.maximum = 4
      @prb.each { |n| value = n }
      value.should == 3
    end

    it "has 5 as the second value" do 
      value = nil
      @prb.maximum = 6
      @prb.each { |n| value = n }
      value.should == 5
    end

    it "has values 3, 5, 6, 9 less than 10" do
      values = []
      @prb.maximum = 10
      @prb.each { |n| values << n }
      values.should == [3,5,6,9]
    end

    it "has values 3, 5, 6, 9, 10, 12, 15, 18 less than 20" do
      values = []
      @prb.maximum = 20
      @prb.each { |n| values << n }
      values.should == [3,5,6,9,10,12,15,18]
    end
  end
  
  describe "summing values" do
    it "has 23 as the result of less than 10" do
      @prb.maximum = 10
      @prb.sum.should == 23
    end

    it "has 78 as the result of less than 20" do
      @prb.maximum = 20
      @prb.sum.should == 78
    end
  end

  it "sums the values less than 1000" do
    @prb.should_receive(:maximum=).with(1000)
    @prb.should_receive(:sum)
    @prb.run
  end
end
