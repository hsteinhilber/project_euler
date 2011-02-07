require_relative 'spec_helper'
require 'problem_019'

describe Problem019 do

  before(:each) do
    @prb = Problem019.new
  end

  it "returns one for 2010" do
    @prb.count_sundays(2010).should == 1
  end

  it "returns two for 2002" do
    @prb.count_sundays(2002).should == 2
  end

  it "returns 17 for 2001 to 2010" do
    @prb.count_sundays(2001..2010).should == 17
  end

  it "calculates the total for 1901 through 2000" do
    @prb.should_receive(:count_sundays).with(1901..2000).and_return(99)
    @prb.run.should == 99
  end
end
