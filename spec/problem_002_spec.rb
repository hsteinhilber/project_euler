require_relative 'spec_helper'
require 'problem_002'

describe Problem002 do

  before(:each) do
    @prb = Problem002.new
  end

  describe "generating sequence" do
    it "has 2 as the first number" do
      value = nil
      @prb.maximum = 5
      @prb.each { |n| value = n }
      value.should == 2
    end

    it "has 8 as the second number" do
      value = nil
      @prb.maximum = 10
      @prb.each { |n| value = n }
      value.should == 8
    end

    it "has 2, 8, 34, 144 as the sequence less than 150" do
      values = []
      @prb.maximum = 150
      @prb.each { |n| values << n }
      values.should == [2,8,34,144]
    end
  end

  describe "summing values" do
    it "has 2 as the sum less than 5" do
      @prb.maximum = 5
      @prb.sum.should == 2
    end

    it "has 10 as the sum less than 10" do
      @prb.maximum = 10
      @prb.sum.should == 10
    end

    it "has 188 as the sum less than 150" do
      @prb.maximum = 150
      @prb.sum.should == 188
    end
  end

  it "sums the values less than 4,000,000 when run" do
    @prb.should_receive(:sum_to).with(4_000_000)
    @prb.run
  end
end
