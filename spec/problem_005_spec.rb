require_relative 'spec_helper'
require 'problem_005'

describe Problem005 do

  before(:each) do
    @prb = Problem005.new
  end

  describe "prime factors" do
  
    it "generates { 2 => 1, 3 => 1 } for 6" do
      @prb.prime_factors(6).should == { 2 => 1, 3 => 1 }
    end

    it "generates { 2 => 2 } for 4" do
      @prb.prime_factors(4).should == { 2 => 2 }
    end

    it "generates { 5 => 2, 11 => 1 }  for 275" do
      @prb.prime_factors(275).should == { 5 => 2, 11 => 1 }
    end

    it "generates { 5 => 1, 7 => 1, 13 => 1, 29 => 1 } for 13195" do
      @prb.prime_factors(13195).should == { 5 => 1, 7 => 1, 13 => 1, 29 => 1 }
    end
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
