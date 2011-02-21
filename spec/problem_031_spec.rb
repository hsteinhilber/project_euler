require_relative 'spec_helper'
require 'problem_031'

describe Problem031 do
  let(:prb) { Problem031.new }

  describe "computing total coin value" do

    it "gives a 1p piece a value of 1" do
      prb.compute_value(0,0,0,0,0,0,0,1).should == 1
    end

    it "gives a 2p piece a value of 2" do 
      prb.compute_value(0,0,0,0,0,0,1,0).should == 2
    end

    it "gives a 5p piece a value of 5" do
      prb.compute_value(0,0,0,0,0,1,0,0).should == 5
    end

    it "gives a 10p piece a value of 10" do
      prb.compute_value(0,0,0,0,1,0,0,0).should == 10
    end

    it "gives a 20p piece a value of 20" do
      prb.compute_value(0,0,0,1,0,0,0,0).should == 20
    end

    it "gives a 50p piece a value of 50" do
      prb.compute_value(0,0,1,0,0,0,0,0).should == 50
    end

    it "gives a 1L piece a value of 100" do
      prb.compute_value(0,1,0,0,0,0,0,0).should == 100
    end

    it "gives a 2L piece a value of 200" do
      prb.compute_value(1,0,0,0,0,0,0,0).should == 200
    end

    it "gives 1L + 50p + 2x20p + 5p + 2p + 3x1p pieces a value of 200" do
      prb.compute_value(0,1,1,2,0,1,1,3).should == 200
    end
  end

  # TODO: need to test that it iterates only combinations <= 200 total value
  # TODO: need to test that it counts the number of combinations = 200 total value
end
