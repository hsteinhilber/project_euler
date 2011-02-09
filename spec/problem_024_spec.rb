require_relative 'spec_helper'
require 'problem_024'

describe Problem024 do
  let(:prb) { Problem024.new }

  describe "generating permutations" do

    it "generates 012 as the first permutation for 0,1,2" do
      prb.perm(0,"012").should == "012"
    end

    it "generates 021 as the second permutation for 0,1,2" do
      prb.perm(1,"012").should == "021"
    end

    it "generates 102 as the third permutation for 0,1,2" do
      prb.perm(2,"012").should == "102"
    end

    it "generates 120 as the fourth permutation for 0,1,2" do
      prb.perm(3,"012").should == "120"
    end
    
    it "generates 201 as the fifth permutation for 0,1,2" do
      prb.perm(4,"012").should == "201"
    end

    it "generates 210 as the sixth permutation for 0,1,2" do
      prb.perm(5,"012").should == "210"
    end
  end

  it "requests the 1,000,000th permutation of 0,1,2,3,4,5,6,7,8,9" do
    prb.should_receive(:perm).with(999_999,"0123456789").and_return("9999999999")
    prb.run.should == "9999999999"
  end
end
