require_relative 'spec_helper'
require 'problem_017'

describe Problem017 do

  before(:each) do
    @prb = Problem017.new
  end

  describe "converting numbers to words" do
    
    it "converts 1 to 'one'" do
      1.to_words.should == 'one'
    end

    it "converts 2 to 'two'" do
      2.to_words.should == 'two'
    end

    it "converts 3 to 'three'" do
      3.to_words.should == 'three'
    end

    it "converts 4 to 'four'" do
      4.to_words.should == 'four'
    end

    it "converts 5 to 'five'" do
      5.to_words.should == 'five'
    end

    it "converts 6 to 'six'" do
      6.to_words.should == 'six'
    end

    it "converts 7 to 'seven'" do
      7.to_words.should == 'seven'
    end

    it "converts 8 to 'eight'" do
      8.to_words.should == 'eight'
    end

    it "converts 9 to 'nine'" do
      9.to_words.should == 'nine'
    end

    it "converts 10 to 'ten'" do
      10.to_words.should == 'ten'
    end

    it "converts 11 to 'eleven'" do
      11.to_words.should == 'eleven'
    end

    it "converts 12 to 'twelve'" do
      12.to_words.should == 'twelve'
    end

    it "converts 13 to 'thirteen'" do
      13.to_words.should == 'thirteen'
    end
    
    it "converts 14 to 'fourteen'" do
      14.to_words.should == 'fourteen' 
    end

    it "converts 15 to 'fifteen'" do
      15.to_words.should == 'fifteen'
    end

    it "converts 16 to 'sixteen'" do
      16.to_words.should == 'sixteen'
    end

    it "converts 17 to 'seventeen'" do
      17.to_words.should == 'seventeen'
    end

    it "converts 18 to 'eighteen'" do
      18.to_words.should == 'eighteen'
    end

    it "converts 19 to 'nineteen'" do
      19.to_words.should == 'nineteen'
    end
    
    it "converts 20 to 'twenty'" do
      20.to_words.should == 'twenty'
    end

    it "converts 21 to 'twenty-one'" do
      21.to_words.should == 'twenty-one'
    end

    it "converts 30 to 'thirty'" do
      30.to_words.should == 'thirty'
    end

    it "converts 35 to 'thirty-five'" do
      35.to_words.should == 'thirty-five'
    end

    it "converts 40 to 'forty'" do
      40.to_words.should == 'forty'
    end

    it "converts 50 to 'fifty'" do 
      50.to_words.should == 'fifty'
    end

    it "convert 60 to 'sixty'" do
      60.to_words.should == 'sixty'
    end

    it "convert 70 to 'seventy'" do
      70.to_words.should == 'seventy'
    end

    it "converts 80 to 'eighty'" do
      80.to_words.should == 'eighty'
    end

    it "convert 90 to 'ninety'" do
      90.to_words.should == 'ninety'
    end

    it "converts 100 to 'one hundred'" do
      100.to_words.should == 'one hundred'
    end

    it "converts 300 to 'three hundred'" do
      300.to_words.should == 'three hundred'
    end

    it "converts 103 to 'one hundred and three'" do
      103.to_words.should == 'one hundred and three'
    end

    it "converts 1000 to 'one thousand'" do
      1000.to_words.should == 'one thousand' 
    end

    it "converts 342 to 'three hundred and forty-two'" do
      342.to_words.should == 'three hundred and forty-two'
    end

    it "converts 115 to 'one hundred and fifteen'" do
      115.to_words.should == 'one hundred and fifteen'
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
