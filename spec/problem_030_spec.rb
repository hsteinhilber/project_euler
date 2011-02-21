require_relative 'spec_helper'
require 'problem_030'

describe Problem030 do
  let(:prb) { Problem030.new }

  describe "summing powers of digits" do

    it "returns 2 for the 1st power of 2" do
      prb.digits_to_power(2,1).should == 2
    end

    it "returns 4 for the 2nd power of 2" do
      prb.digits_to_power(2,2).should == 4
    end

    it "returns 8 for the 3rd power of 2" do
      prb.digits_to_power(2,3).should == 8
    end

    it "returns 1 for the 3st power of 10" do
      prb.digits_to_power(10,3).should == 1
    end

    it "returns 73 for the 3rd power of 1024" do
      prb.digits_to_power(1024,3).should == 73
    end

    it "returns 273 for the 4th power of 1024" do
      prb.digits_to_power(1024,4).should == 273
    end

    it "returns 1634 for the 4th power of 1634" do
      prb.digits_to_power(1634,4).should == 1634
    end

    it "returns 8208 for the 4th power of 8208" do
      prb.digits_to_power(8208,4).should == 8208
    end

    it "returns 4150 for the 5th power of 4150" do
      prb.digits_to_power(4150,5).should == 4150
    end
  end

  describe "finding upper bound" do

    it "returns 18 for summing digits to the 1st power" do
      prb.max_range(1).should == 18
    end

    it "returns 243 for summing digits to the 2nd power" do
      prb.max_range(2).should == 243
    end

    it "returns 2916 for summing digits to the 3rd power" do
      prb.max_range(3).should == 2916
    end

  end

  it "calls max range to determine range to compute" do
    prb.should_receive(:max_range).with(5).and_return(6)
    prb.run
  end

  it "selects numbers from 2 to computed maximum value" do
    prb.stub!(:max_range).and_return(6)
    (2..6).each { |n| prb.should_receive(:digits_to_power).with(n,5).and_return(0) }
    prb.run
  end

  it "sums numbers that are equal to the sum of their digits to the 5th power" do
    prb.stub!(:max_range).and_return(6)
    prb.stub!(:digits_to_power).and_return(9)
    prb.stub!(:digits_to_power).with(3,5).and_return(3)
    prb.stub!(:digits_to_power).with(5,5).and_return(5)
    prb.run.should == 8
  end

end
