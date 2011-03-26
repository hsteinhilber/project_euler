require_relative 'spec_helper'
require 'problem_017'

describe Problem017 do

  before(:each) do
    @prb = Problem017.new
  end

  describe "converting numbers to words" do
    [
      [1, 'one'],
      [2, 'two'],
      [3, 'three'],
      [4, 'four'],
      [5, 'five'],
      [6, 'six'],
      [7, 'seven'],
      [8, 'eight'],
      [9, 'nine'],
      [10, 'ten'],
      [11, 'eleven'],
      [12, 'twelve'],
      [13, 'thirteen'],
      [14, 'fourteen'],
      [15, 'fifteen'],
      [16, 'sixteen'],
      [17, 'seventeen'],
      [18, 'eighteen'],
      [19, 'nineteen'],
      [20, 'twenty'],
      [21, 'twenty-one'],
      [30, 'thirty'],
      [35, 'thirty-five'],
      [40, 'forty'],
      [50, 'fifty'],
      [60, 'sixty'],
      [70, 'seventy'],
      [80, 'eighty'],
      [90, 'ninety'],
      [100, 'one hundred'],
      [300, 'three hundred'],
      [103, 'one hundred and three'],
      [1000, 'one thousand'],
      [342, 'three hundred and forty-two'],
      [115, 'one hundred and fifteen']
    ].each do |n, word|
      it "converts #{n} to '#{word}'" do
        n.to_words.should == word
      end
    end
  end

  describe "computing total letters" do

    it "counts the letters in 'one' as 3" do
      @prb.count_letters('one').should == 3
    end

    it "counts the letters in 'twenty-one' as 9" do
      @prb.count_letters('twenty-one').should == 9
    end

    it "counts the letters in 'one hundred and twenty-one' as 22" do
      @prb.count_letters('one hundred and twenty-one').should == 22
    end

    it "computes 3 letters for numbers up to 1 ('one')" do
      @prb.sum_to(1).should == 3
    end
    
    it "computes 11 letters for numbers up to 3 ('one'+'two'+'three')" do
      @prb.sum_to(3).should == 11
    end

    it "computes 19 letters for numbers up to 5 ('one'+'two'+'three'+'four'+'five')" do
      @prb.sum_to(5).should == 19
    end
  end

  it "computes the total letters for all numbers up to 1,000" do
    @prb.should_receive(:sum_to).with(1_000).and_return(999)
    @prb.run.should == 999
  end
end
