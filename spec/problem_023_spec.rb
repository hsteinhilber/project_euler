require_relative 'spec_helper'
require 'problem_023'

describe Problem023 do

  before(:each) do
    @prb = Problem023.new
  end

  describe "abundant numbers" do

    it "starts with 12" do
      @prb.abundant_numbers.first.should == 12
    end

    it "should have more than one term" do
      @prb.abundant_numbers.take(2).should have_at_least(2).items
    end

    it "has terms less than the sum of their divisors" do
      @prb.abundant_numbers.take(10).each do |n|
        n.should be < n.divisors.inject(0) { |sum,i| sum + i }
      end
    end

    it "has terms greater than 28,123" do
      @prb.abundant_numbers.any? { |n| n > 28_123 }.should be_true
    end
  end

  describe "numbers that are not the sum of two abundant numbers" do

    it "has the numbers 1 through 23" do
      @prb.sequence.take(23).should == [ 1, 2, 3, 4, 5, 6, 7, 8, 9,10,
                                        11,12,13,14,15,16,17,18,19,20,
                                        21,22,23]
    end

    it "does not have the number 24" do
      @prb.sequence.should_not include(24)
    end

    it "has a maximum number less than 28,123" do
      @prb.sequence.max.should be < 28_123
    end
  end

  it "adds all numbers that cannot be respresented as the sum of two abundant numbers" do
    @prb.should_receive(:sequence).and_return([1,2,3,4,5])
    @prb.run.should == 15
  end
end
