require_relative 'spec_helper'
require 'problem_009'

describe Problem009 do

  before(:each) do
    @prb = Problem009.new
  end

  it "finds a triplet" do
    @prb.find_triplet.length.should == 3
  end

  it "finds a pythagorean triplet" do
    ary = @prb.find_triplet
    (ary[0]**2 + ary[1]**2).should == ary[2]**2
  end

  it "finds a triplet whose sum is 1000" do
    @prb.find_triplet.inject(0) { |sum,v| sum + v }.should == 1000
  end

  it "calculates the product of the triplet" do
    @prb.should_receive(:find_triplet).and_return([2,4,5])
    @prb.run.should == 40
  end
end
