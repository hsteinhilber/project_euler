require_relative 'spec_helper'
require 'problem_015'

describe Problem015 do

  before(:each) do
    @prb = Problem015.new
  end

  describe "math" do

    it "computes the factorial of 1 as 1" do
      1.fact.should == 1
    end

    it "computes the factorial of 2 as 2" do
      2.fact.should == 2
    end

    it "computes the factorial of 5 as 120" do
      5.fact.should == 120
    end

    it "computes the P(1,1) as 1" do
      1.perm(1).should == 1
    end

    it "computes the P(8,1) as 8" do
      8.perm(1).should == 8
    end

    it "computes the P(8,3) as 336" do
      8.perm(3).should == 336
    end

    it "computes the C(1,1) as 1" do
      1.comb(1).should == 1
    end

    it "computes the C(8,1) as 8" do
      8.comb(1).should == 8
    end

    it "computes the C(8,3) as 56" do
      8.comb(3).should == 56
    end
  end

  context "running the problem" do

    before(:each) do
      class Integer
        alias :orig_comb :comb
        def comb(k)
          self.should == 40
          k.should == 20
          99
        end
      end
    end

    after(:each) do
      class Integer; alias :comb :orig_comb; end
    end

    it "calculates the number of paths using C(40,20)" do
      @prb.run.should == 99
    end
  end
end
