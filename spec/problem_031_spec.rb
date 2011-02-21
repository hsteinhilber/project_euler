require_relative 'spec_helper'
require 'problem_031'

describe Problem031 do
  let(:prb) { Problem031.new }

  describe "iterating coins" do

    it "returns 1L after 2L" do
      prb.next_coin(200).should == 100
    end

    it "returns 50p after 1L" do
      prb.next_coin(100).should == 50
    end

    it "returns 20p after 50p" do
      prb.next_coin(50).should == 20
    end

    it "returns 10p after 20p" do
      prb.next_coin(20).should == 10
    end

    it "returns 5p after 10p" do
      prb.next_coin(10).should == 5
    end

    it "returns 2p after 5p" do
      prb.next_coin(5).should == 2
    end

    it "returns 1p after 2p" do
      prb.next_coin(2).should == 1
    end
  end

  describe "counting coin combinations" do

    it "returns 1 way to get 0L using 1p pieces" do
      prb.count_coin_combinations(0,1).should == 1
    end

    it "returns 1 way to get 0L using <=2L pieces" do
      prb.count_coin_combinations(0,200).should == 1
    end

    it "returns 1 way to get 200L using 1p pieces" do
      prb.count_coin_combinations(200,1).should == 1
    end

    it "returns 1 way to get 100L using 1p pieces" do
      prb.count_coin_combinations(100,1).should == 1
    end

    it "returns 3 ways to get 5p using <=2p pieces" do
      prb.count_coin_combinations(5,2).should == 3
    end

    it "returns 4 ways to get 5p using <=5p pieces" do
      prb.count_coin_combinations(5,5).should == 4
    end
  end

  it "computes the number of combinations to get 2L using <=2L pieces" do
    prb.should_receive(:count_coin_combinations).with(200,200).and_return(50)
    prb.run.should == 50
  end
end
