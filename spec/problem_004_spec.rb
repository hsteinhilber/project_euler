require_relative 'spec_helper'
require 'problem_004'

describe Problem004 do

  before(:each) do
    @prb = Problem004.new
  end

  describe "iteration" do

    it "should contain all of the multiples n * m in the given range" do
      @prb.multiples(5..10).should include(25,30,35,40,45,50,36,42,48,54,60,49,56,63,70,64,72,80,81,90,100)
    end
  end

  it "should find first palindrome for 100 to 999" do
    @prb.should_receive(:multiples).with(100..999).and_return([100,200,303,400,505,600]);
    @prb.run.should == 505
  end
end

describe Integer do

  describe "single digit" do

    it "is a palindrome" do
      5.should be_palindrome
    end
  end

  describe "double digit" do

    it "is a palindrome if both digits are the same" do
      88.should be_palindrome
    end

    it "is not a palindrome if digits differ" do
      89.should_not be_palindrome
    end
  end

  describe "triple digit" do

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
end
