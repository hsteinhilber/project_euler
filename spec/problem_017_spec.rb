require_relative 'spec_helper'
require 'problem_017'

describe Problem017 do

  before(:each) do
    @prb = Problem017.new
  end

  [
    [1, 'one'.count("a-z")],
    [2, 'two'.count("a-z")],
    [3, 'three'.count("a-z")], 
    [4, 'four'.count("a-z")],
    [5, 'five'.count("a-z")],
    [6, 'six'.count("a-z")],
    [7, 'seven'.count("a-z")],
    [8, 'eight'.count("a-z")],
    [9, 'nine'.count("a-z")],
    [10, 'ten'.count("a-z")],
    [11, 'eleven'.count("a-z")],
    [12, 'twelve'.count("a-z")],
    [13, 'thirteen'.count("a-z")],
    [14, 'fourteen'.count("a-z")],
    [15, 'fifteen'.count("a-z")],
    [16, 'sixteen'.count("a-z")],
    [17, 'seventeen'.count("a-z")],
    [18, 'eighteen'.count("a-z")],
    [19, 'nineteen'.count("a-z")],
    [20, 'twenty'.count("a-z")],
    [21, 'twenty-one'.count("a-z")],
    [30, 'thirty'.count("a-z")],
    [35, 'thirty-five'.count("a-z")],
    [40, 'forty'.count("a-z")],
    [50, 'fifty'.count("a-z")],
    [60, 'sixty'.count("a-z")],
    [70, 'seventy'.count("a-z")],
    [80, 'eighty'.count("a-z")],
    [90, 'ninety'.count("a-z")],
    [100, 'one hundred'.count("a-z")],
    [300, 'three hundred'.count("a-z")],
    [103, 'one hundred and three'.count("a-z")],
    [1000, 'one thousand'.count("a-z")],
    [342, 'three hundred and forty-two'.count("a-z")],
    [115, 'one hundred and fifteen'.count("a-z")]
  ].each do |n, c|
    it "counts #{c} letters in the number #{n}" do
      @prb.letters_for(n).should == c
    end
  end

  [
    [1, 3],
    [2, 6],
    [3, 11],
    [4, 15],
    [5, 19],
    [6, 22]
  ].each do |n, c|
    it "computes #{c} letters for all the numbers up to #{n}" do
      @prb.sum_to(n).should == c
    end
  end

  it "computes the total letters for all numbers up to 1,000" do
    @prb.should_receive(:sum_to).with(1_000).and_return(999)
    @prb.run.should == 999
  end
end
