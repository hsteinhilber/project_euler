require_relative 'spec_helper'
require 'integer'

describe Integer do
  describe "factorial" do

    it "computes 1! as 1" do
      1.fact.should == 1
    end

    it "computes 2! as 2" do
      2.fact.should == 2
    end

    it "computes 5! as 120" do
      5.fact.should == 120
    end
  end

  describe "permutation" do

    it "computes P(1,1) as 1" do
      1.perm(1).should == 1
    end

    it "computes P(8,1) as 8" do
      8.perm(1).should == 8
    end

    it "computes P(8,3) as 336" do
      8.perm(3).should == 336
    end
  end

  describe "combination" do

    it "computes C(1,1) as 1" do
      1.comb(1).should == 1
    end

    it "computes C(8,1) as 8" do
      8.comb(1).should == 8
    end

    it "computes C(8,3) as 56" do
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

  describe "prime factors" do
  
    it "generates { 2 => 1, 3 => 1 } for 6" do
      6.prime_factors.should == { 2 => 1, 3 => 1 }
    end

    it "generates { 2 => 2 } for 4" do
      4.prime_factors.should == { 2 => 2 }
    end

    it "generates { 5 => 2, 11 => 1 }  for 275" do
      275.prime_factors.should == { 5 => 2, 11 => 1 }
    end

    it "generates { 5 => 1, 7 => 1, 13 => 1, 29 => 1 } for 13195" do
      13_195.prime_factors.should == { 5 => 1, 7 => 1, 13 => 1, 29 => 1 }
    end
  end

  describe "proper divisors" do

    it "returns [] for 1" do
      1.divisors.should == []
    end

    it "returns [1] for 2" do
      2.divisors.should == [1]
    end

    it "returns [1,2] for 4" do
      4.divisors.should == [1,2]
    end

    it "returns [1,2,3] for 6" do
      6.divisors.should == [1,2,3]
    end

    it "returns [1,3] for 9" do
      9.divisors.should == [1,3]
    end

    it "returns [1,2,4,5,10,11,20,22,44,55,110] for 220" do
      220.divisors.should == [1,2,4,5,10,11,20,22,44,55,110]
    end

    it "returns [1,2,4,71,142] for 284" do
      284.divisors.should == [1,2,4,71,142]
    end
  end
end
