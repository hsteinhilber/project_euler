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

  describe "palindrome?" do

    describe "using a single digit decimal number" do

      it "is a palindrome" do
        5.should be_palindrome
      end
    end

    describe "using a double digit decimal number" do

      it "is a palindrome if both digits are the same" do
        88.should be_palindrome
      end

      it "is not a palindrome if digits differ" do
        89.should_not be_palindrome
      end
    end

    describe "using a triple digit decimal number" do

      it "is a palindrome if all digits are the same" do
        777.should be_palindrome
      end

      it "is a palindrome if only the middle digit differs" do
        787.should be_palindrome
      end

      it "is not a palindrome if first and last digit differ" do
        995.should_not be_palindrome
      end
    end

    describe "using base 2 numbers" do

      it "is a palindrome if bits are reversible" do
        48093.should be_palindrome(2)
      end

      it "is not a palindrome if bits are not reversible" do
        5995.should_not be_palindrome(2)
      end
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

    [0,1,4,6,8,9,10,12,14,15,16,18,20,21,
     22,24,25,26,27,28,30,35,40,42,45,49,50,
     121].each do |n|
      it "is false for #{n}" do
        n.should_not be_prime
      end
    end

    [2,3,5,7,11,13,17,19,23,29,31,541].each do |n|
      it "is true for #{n}" do
        n.should be_prime
      end
    end
  end

  describe "rotations" do

    [ [1,   [1]],
      [13,  [13, 31]],
      [31,  [13, 31]],
      [114, [114,141,411]],
      [200, [2,20,200]],
      [11,  [11]]
    ].each do |n, expected|
      it "returns #{expected} for #{n}" do
        n.rotations.should =~ expected
      end
    end
  end

end
