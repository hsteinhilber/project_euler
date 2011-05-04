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

    [
      ["1", { }],
      ["2", { 2 => 1 }],
      ["3", { 3 => 1 }],
      ["4", { 2 => 2 }],
      ["5", { 5 => 1 }],
      ["6", { 2 => 1, 3 => 1 }],
      ["7", { 7 => 1 }],
      ["8", { 2 => 3 }],
      ["9", { 3 => 2 }],
      ["10", { 2 => 1, 5 => 1 }],
      ["2*3*5*7*11*11", { 2 => 1, 3 => 1, 5 => 1, 7 => 1, 11 => 2 }],
      ["8191*131071", { 8191 => 1, 131071 => 1 }],
      ["2**19-1", { 2**19-1 => 1 }],
      ["2**100", { 2 => 100 }],
      ["2**31-1", { 2**31-1 => 1 }]
    ].each do |expression, factors|
      it "generates #{factors} for #{expression}" do
        n = eval expression
        n.prime_factors.should == factors
      end
    end
  end

  describe "proper divisors" do

    it "returns [] for 0" do
      0.divisors.should == []
    end

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

  describe "primality" do

    it "is false for negative numbers" do
      -10.should_not be_prime
    end

    it "is false for 0" do
      0.should_not be_prime
    end

    it "is false for 1" do
      1.should_not be_prime
    end

    it "is true for 2" do
      2.should be_prime
    end

    it "is true for 3" do
      3.should be_prime
    end

    it "is false for even numbers greater than 2" do
      [4,6,8,10,12,14].each { |n| n.should_not be_prime }
    end

    it "is true for 5, 7" do
      [5,7].each { |n| n.should be_prime }
    end

    it "is false for odd multiples of 3" do
      [9,15,21,27,33].each { |n| n.should_not be_prime }
    end

    it "is true for 11, 13, 17, 19" do
      [11,13,17,19].each { |n| n.should be_prime }
    end

    it "is false for multiples of 5 and 7" do
      [30,35,40,42,45,49,50].each { |n| n.should_not be_prime }
    end

    it "is false for 121" do
      121.should_not be_prime
    end

    it "is true for 541" do
      541.should be_prime
    end
  end

  describe "rotations" do

    it "returns [1] for 1" do
      1.rotations.should =~ [1]
    end

    it "returns [13,31] for 13" do
      13.rotations.should =~ [13,31]
    end

    it "returns [13,31] for 31" do
      31.rotations.should =~ [13,31]
    end

    it "returns [114,141,411] for 114" do
      114.rotations.should =~ [114,141,411]
    end

    it "returns [2,20,200] for 200" do
      200.rotations.should =~ [2,20,200]
    end

    it "returns [11] for 11" do
      11.rotations.should =~ [11]
    end
  end

end
