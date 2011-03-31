require_relative 'spec_helper'
require 'problem_018'

describe Problem018 do

  before(:each) do
    @prb = Problem018.new
  end

  it "calculates the largest path for the problem triangle" do
    @prb.should_receive(:add_triangle).with(Problem018::TRIANGLE).and_return(55)
    @prb.run.should == 55
  end
end
