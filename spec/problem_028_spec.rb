require_relative 'spec_helper'
require 'problem_028'

describe Problem028 do
  let(:prb) { Problem028.new }

  it "raises an error when given an even sized side" do
    lambda { prb.sum_diagonals(2) }.should raise_error
  end

  it "computes the sum of the diagonals of a 1x1 grid is 1" do
    prb.sum_diagonals(1).should == 1
  end

  it "computes the sum of the diagonals of a 3x3 grid is 25" do
    prb.sum_diagonals(3).should == 25
  end

  it "computes the sum of the diagonals of a 5x5 grid is 101" do
    prb.sum_diagonals(5).should == 101
  end

  it "computes the sum of the diagonals of a 7x7 grid is 261" do
    prb.sum_diagonals(7).should == 261
  end

  it "computes the sum of the diagonals of a 1001x1001 grid when run" do
    prb.should_receive(:sum_diagonals).with(1001).and_return 99
    prb.run.should == 99
  end
end
