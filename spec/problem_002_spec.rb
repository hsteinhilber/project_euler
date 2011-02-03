require_relative 'spec_helper'
require 'problem_002'

describe Problem002 do

  before(:each) do
    @prb = Problem002.new
  end

  describe "generating sequence" do
    it "has 2 as the first number" do
      @prb.first.should == 2
    end

    it "has 8 as the second number" do
      @prb.take(2).should == [2,8]
    end

    it "has 2, 8, 34, 144 as the first four values in the sequence" do
      @prb.take(4).should == [2,8,34,144]
    end
  end

  describe "summing values" do
    it "has 2 as the sum less than 5" do
      @prb.sum_to(5).should == 2
    end

    it "has 10 as the sum less than 10" do
      @prb.sum_to(10).should == 10
    end

    it "has 188 as the sum less than 150" do
      @prb.sum_to(150).should == 188
    end
  end

  it "sums the values less than 4,000,000 when run" do
    @prb.should_receive(:sum).with(4_000_000)
    @prb.run
  end
end
