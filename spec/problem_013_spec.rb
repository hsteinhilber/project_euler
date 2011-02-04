require_relative 'spec_helper'
require 'problem_013'

describe Problem013 do

  before(:each) do
    @prb = Problem013.new
  end

  it "calculates the first 2 digits adding five 9999s together" do
    @prb.partial_sum([9999]*5, 2).should == 49
  end

  it "calculates the first 4 digits adding ten 9999999999's together" do
    @prb.partial_sum([9999999999]*10, 4).should == 9999
  end

  it "calculates the first 10 digits adding one hundred 50-digit numbers" do
    @prb.should_receive(:partial_sum).with(Problem013::NUMBERS, 10).and_return(81)
    @prb.run.should == 81
  end

end
