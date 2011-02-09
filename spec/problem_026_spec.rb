require_relative 'spec_helper'
require 'problem_026'

describe Problem026 do
  let(:prb) { Problem026.new }

  describe "recurring decimal" do

    it "is 0 for 1/2" do
      prb.recurring_decimals(2).should == "0"
    end

    it "is 3 for 1/3" do
      prb.recurring_decimals(3).should == "3"
    end

    it "is 6 for 1/6" do
      prb.recurring_decimals(6).should == "6"
    end

    it "is 142857 for 1/7" do
      prb.recurring_decimals(7).should == "142857"
    end

    it "is 1 for 1/9" do
      prb.recurring_decimals(9).should == "1"
    end
  end

  it "finds the recurring decimal only for prime numbers" do
    PrimeGenerator.new.take_while { |n| n < 1000 }.each do |n|
      prb.should_receive(:recurring_decimals).with(n).and_return("0000")
    end
    prb.run
  end

  it "returns the number with the largest number of recurring decimals" do
    prb.should_receive(:recurring_decimals).exactly(99).times.ordered.and_return("0000")
    prb.should_receive(:recurring_decimals).with(541).ordered.and_return("000000000")
    prb.should_receive(:recurring_decimals).exactly(68).times.ordered.and_return("00")
    prb.run.should == 541
  end
end
