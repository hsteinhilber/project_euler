require_relative 'spec_helper'
require 'problem_029'

describe Problem029 do
  let(:prb) { Problem029.new }

  it "computes terms for 2<=a<=3 and 2<=b<=3 as 4,8,9,27" do
    prb.combinations(3).should =~ [4,8,9,27]
  end

  it "computes terms for 2<=a<=4 and 2<=b<=4 as 4,8,16,9,27,81,16,64,256" do
    prb.combinations(4).should =~ [4,8,16,9,27,81,16,64,256]
  end

  it "computes terms for 2<=a<=5 and 2<=b<=5 as 4,8,16,32,9,27,81,243,16,64,256,1024,25,125,625,3125" do
    prb.combinations(5).should =~ [4,8,16,32,9,27,81,243,16,64,256,1024,25,125,625,3125]
  end

  it "returns the number of unique values computed when run" do
    prb.should_receive(:combinations).with(100).and_return([4,8,16,32,16,64,256,32])
    prb.run.should == 6
  end

end
