require_relative 'spec_helper'
require 'problem_005'

describe Problem005 do

  before(:each) do
    @prb = Problem005.new
  end

  describe "least common multiple" do
    
    it "calculates 2 for 1..2" do
      @prb.lcm(1..2).should == 2
    end

    it "calculates 6 for 1..3" do
      @prb.lcm(1..3).should == 6
    end

    it "calculates 12 for 3..4" do
      @prb.lcm(3..4).should == 12
    end

    it "calculates 60 for 3..6" do
      @prb.lcm(3..6).should == 60
    end
  end

  it "calculates the least common multiple of 1..20" do
    @prb.should_receive(:lcm).with(1..20)
    @prb.run
  end
end
