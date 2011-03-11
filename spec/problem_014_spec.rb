require_relative 'spec_helper'
require 'problem_014'

describe Problem014 do

  before(:each) do
    @prb = Problem014.new
  end

  describe "generating the sequence" do

    it "has the terms 13, 40, 20, 10, 5, 16, 8, 4, 2, 1 when starting with 13" do
      @prb.sequence(13).to_a.should == [13,40,20,10,5,16,8,4,2,1]
    end

    it "has the terms 5, 16, 8, 4, 2, 1 when starting with 5" do
      @prb.sequence(5).to_a.should == [5,16,8,4,2,1]
    end

    it "has the terms 2, 1 when starting with 2" do
      @prb.sequence(2).to_a.should == [2, 1]
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
