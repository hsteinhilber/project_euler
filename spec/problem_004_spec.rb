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
