require_relative 'spec_helper'
require 'problem_021'

describe Problem021 do
  
  before(:each) do
    @prb = Problem021.new
  end

  describe "dsum" do

    it "sums the divisors of 1 as 0" do
      @prb.dsum(1).should == 0
    end

    it "sums the divisors of 2 as 1" do
      @prb.dsum(2).should == 1
    end
    
    it "sums the divisors of 4 as 3" do
      @prb.dsum(4).should == 3
    end

    it "sums the divisors of 6 as 6" do
      @prb.dsum(6).should == 6
    end

    it "sums the divisors of 9 as 4" do
      @prb.dsum(9).should == 4
    end

    it "sums the divisors of 220 as 284" do
      @prb.dsum(220).should == 284
    end
     
    it "sums the divisors of 284 as 220" do
      @prb.dsum(284).should == 220
    end
  end

  describe "amicable pairs" do

    it "returns nil as the pair of 1" do
      @prb.amicable_pair(1).should be_nil
    end

    it "returns nil as the pair of 6" do
      @prb.amicable_pair(6).should be_nil
    end

    it "returns nil as the pair of 9" do
      @prb.amicable_pair(9).should be_nil
    end

    it "returns 284 as the pair of 220" do
      @prb.amicable_pair(284).should == 220
    end

    it "returns 220 as the pair of 284" do
      @prb.amicable_pair(220).should == 284
    end
  end

  describe "find pairs" do
    
    it "returns [220, 284] for 200..300" do
      @prb.find_pairs(200..300).should == [220,284]
    end

    it "returns [] for 0..100" do
      @prb.find_pairs(0..100).should == []
    end
  end

  it "adds all amicable pairs from 1 to 10,000" do
    @prb.should_receive(:find_pairs).with(1..10_000).and_return([1,2,3,4,5])
    @prb.run.should == 15
  end
end
