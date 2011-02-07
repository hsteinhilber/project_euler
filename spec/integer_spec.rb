require_relative 'spec_helper'
require 'integer'

describe Integer do
  describe "math" do

    it "computes the factorial of 1 as 1" do
      1.fact.should == 1
    end

    it "computes the factorial of 2 as 2" do
      2.fact.should == 2
    end

    it "computes the factorial of 5 as 120" do
      5.fact.should == 120
    end

    it "computes the P(1,1) as 1" do
      1.perm(1).should == 1
    end

    it "computes the P(8,1) as 8" do
      8.perm(1).should == 8
    end

    it "computes the P(8,3) as 336" do
      8.perm(3).should == 336
    end

    it "computes the C(1,1) as 1" do
      1.comb(1).should == 1
    end

    it "computes the C(8,1) as 8" do
      8.comb(1).should == 8
    end

    it "computes the C(8,3) as 56" do
      8.comb(3).should == 56
    end
  end

  describe "digits" do
    it "calculates the digits of 0 as just 0" do
      0.digits.should == [0]
    end

    it "calculates the digits of 1024 as 1, 0, 2, and 4" do
      1024.digits.should == [1,0,2,4]
    end
  end
end
