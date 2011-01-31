require_relative 'spec_helper'
require 'problem_003'

describe Problem003 do

  before(:each) do
    @prb = Problem003.new
  end

  describe "prime factors" do
  
    it "generates [2, 3] for 6" do
      @prb.prime_factors(6).should == [2, 3]
    end

    it "generates [2, 2] for 4" do
      @prb.prime_factors(4).should == [2, 2]
    end

    it "generates [5, 7, 11] for 385" do
      @prb.prime_factors(385).should == [5, 7, 11]
    end

    it "generates [5, 7, 13, 29] for 13195" do
      @prb.prime_factors(13195).should == [5, 7, 13, 29]
    end
  end

  it "returns maximum result for prime factors of 600,851,475,143" do
    @prb.should_receive(:prime_factors).with(600_851_475_143).and_return([0,10,20,30])
    @prb.run.should == 30
  end
end
