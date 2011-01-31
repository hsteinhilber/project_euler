require_relative 'spec_helper'
require 'problem_004'

describe Problem004 do

  before(:each) do
    @prb = Problem004.new
  end

  describe "iteration" do

    before(:each) do
      @prb.minimum = 5
      @prb.maximum = 10
    end

    it "should give maximum value first" do
      @prb.first.should == 100
    end

    it "should give the minimum value last" do
      value = nil
      @prb.each { |n| value = n }
      value.should == 25
    end

    it "should iterate values in descending order" do
      previous = @prb.first
      @prb.each do |n| 
        n.should <= previous
        previous = n
      end
    end
  end

  it "should find first palindrome for 100 to 999" do
    @prb.should_receive(:minimum=).with(100)
    @prb.should_receive(:maximum=).with(999)
    @prb.should_receive(:find)
    @prb.run
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
