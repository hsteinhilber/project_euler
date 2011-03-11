require_relative 'spec_helper'
require 'problem_015'

describe Problem015 do

  before(:each) do
    @prb = Problem015.new
  end

  it "calculates the number of paths for a 1x1 grid as 2" do
    @prb.paths_for_grid(1,1).should == 2
  end

  it "calculates the number of paths for a 2x1 grid as 3" do
    @prb.paths_for_grid(2,1).should == 3
  end

  it "calculates the number of paths for a 1x2 grid as 3" do
    @prb.paths_for_grid(1,2).should == 3
  end

  it "calculates the number of paths for a 2x2 grid as 6" do
    @prb.paths_for_grid(2,2).should == 6
  end

  it "calculates the number of paths for a 3x3 grid as 20" do
    @prb.paths_for_grid(3,3).should == 20
  end

  it "calculates the number of paths on a 20x20 grid" do
    @prb.should_receive(:paths_for_grid).with(20,20).and_return(99)
    @prb.run.should == 99
  end
end
