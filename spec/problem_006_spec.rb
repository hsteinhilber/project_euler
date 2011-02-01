require_relative 'spec_helper'
require 'problem_006'

describe Problem006 do

  before(:each) do
    @prb = Problem006.new
  end

  describe "sum of the squares" do

    it "calculates 29 for 2..4" do
      @prb.sum_of_squares(2..4).should == 29
    end

    it "calculates 385 for 1..10" do
      @prb.sum_of_squares(1..10).should == 385
    end
  end

  describe "square of the sum" do

    it "calculates 81 for 2..4" do
      @prb.square_of_sum(2..4).should == 81
    end

    it "calculates 3025 for 1..10" do
      @prb.square_of_sum(1..10).should == 3025
    end
  end

  it "calculates the difference of sum of squares and the square of the sum for 1.100" do
    @prb.should_receive(:sum_of_squares).with(1..100).and_return(16)
    @prb.should_receive(:square_of_sum).with(1..100).and_return(100)
    @prb.run.should == 84
  end
end
