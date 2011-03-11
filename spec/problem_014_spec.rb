require_relative 'spec_helper'
require 'problem_014'

describe Problem014 do

  before(:each) do
    @prb = Problem014.new
  end

  describe "generating the sequence" do

    it "returns 40 when given 13" do
      @prb.sequence(13).should == 40 
    end

    it "returns 20 when given 40" do
      @prb.sequence(40).should == 20
    end

    it "returns 10 when given 20" do
      @prb.sequence(20).should == 10 
    end

    it "returns 5 when given 10" do
      @prb.sequence(10).should == 5 
    end

    it "returns 16 when given 5" do
      @prb.sequence(5).should == 16 
    end

    it "returns 8 when given 16" do
      @prb.sequence(16).should == 8 
    end

    it "returns 4 when given 8" do
      @prb.sequence(8).should == 4 
    end

    it "returns 2 when given 4" do
      @prb.sequence(4).should == 2 
    end

    it "returns 1 when given 2" do
      @prb.sequence(2).should == 1 
    end

    it "returns nil when given 1" do
      @prb.sequence(1).should be_nil 
    end

    it "returns 904 when given 1808" do
      @prb.sequence(1808).should == 904 
    end

    it "returns 904 when given 301" do
      @prb.sequence(301).should == 904 
    end
  end

  describe "computing chain lengths" do

    it "has 10 terms when starting with 13" do
      @prb.chain_length(13).should == 10
    end

    it "has 6 terms when starting with 5" do
      @prb.chain_length(5).should == 6
    end

    it "has 2 terms when starting with 2" do
      @prb.chain_length(2).should == 2
    end

    it "yields (2,2) (3,8) (4,3) (5,6) (6,9)" do
      @prb.chain_lengths.take(5).should == [[2,2],[3,8],[4,3],[5,6],[6,9]]
    end
  end

  it "should find the longest chain starting with a values less than one million" do
    @prb.should_receive(:chain_lengths).and_return(
      Enumerator.new do |yielder|
       yielder << [2,2]
       yielder << [3,8]
       yielder << [4,3]
       yielder << [5,6]
       yielder << [999_999,1]
      end
    )
    @prb.run.should == 3
  end
end
