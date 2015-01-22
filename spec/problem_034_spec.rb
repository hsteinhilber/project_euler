require_relative 'spec_helper'
require 'problem_034'

describe Problem034 do
  let(:prb) { Problem034.new }

  describe "computing sum of digit!" do

    it "returns 1 for 1" do
      prb.digit_fact([1]).should == 1
    end

    it "returns 2 for 2" do
      prb.digit_fact([2]).should == 2
    end

    it "returns 8 for 301" do
      prb.digit_fact([3,0,1]).should == 8
    end

    it "returns 145 for 145" do
      prb.digit_fact([1,4,5]).should == 145
    end

    it "returns 19 for 3313" do
      prb.digit_fact([3,3,1,3]).should == 19
    end
  end

  describe "iterating numbers" do
    
    it "includes 145" do
      prb.sequence.should include(145)
    end

    it "contains only numbers whose value equals the sum of digit!" do
      prb.sequence.each do |n|
        n.should == prb.digit_fact(n.digits)
      end
    end
  end

  it "computes the sum of the numbers whose value equals the sum of digit!" do
    prb.should_receive(:sequence).and_return([10,20,30])
    prb.run.should == 60
  end
end
