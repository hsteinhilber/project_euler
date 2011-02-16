require_relative 'spec_helper'
require 'problem_027'

describe Problem027 do
  let(:prb) { Problem027.new }

  describe "counting consecutive primes" do
    it "returns 0 for a=0 and b=0" do
      prb.count_consec_primes(0,0).should == 0
    end

    it "returns 0 for a=1 and b=1" do
      prb.count_consec_primes(1,1).should == 0
    end
      

    it "returns 1 for a=1 and b=2" do
      prb.count_consec_primes(1,2).should == 1
    end

    it "returns 3 for a=7 and b=5" do
      prb.count_consec_primes(7, 5).should == 3
    end

    it "returns 40 for a=1 and b=41" do
      prb.count_consec_primes(1,41).should == 40
    end

    it "returns 80 for a=-79 and b=1601" do 
      prb.count_consec_primes(-79,1601).should == 80
    end
  end

  describe "generating sets of a,b pairs" do
    
    it "includes [-2, 2], [-1, 2], [0, 2], [1, 2], [2, 2] for values less than 3" do
      prb.pairs(3).should include([-2,2], [-1,2], [0,2], [1,2], [2,2])
    end

    describe "for values less than 6" do

      it "includes values [-5, 2] through [5,2]" do
        prb.pairs(6).should include([-5,2], [-4,2], [-3,2], [-2,2], [-1,2], [0,2], [1,2], [2,2], [3,2], [4,2], [5,2])
      end

      it "includes values [-5, 3] through [5, 3]" do
        prb.pairs(6).should include([-5,3], [-4,3], [-3,3], [-2,3], [-1,3], [0,3], [1,3], [2,3], [3,3], [4,3], [5,3]) 
      end

      it "includes values [-5, 5] through [5, 5]" do
        prb.pairs(6).should include([-5,5], [-4,5], [-3,5], [-2,5], [-1,5], [0,5], [1,5], [2,5], [3,5], [4,5], [5,5]) 
      end
    end

    describe "for values less than 1000" do

      it "includes each value for a=(-1000, 1000) one hundred sixty eight times" do
        counts = prb.pairs(1000).inject({}) { |counts,pair| counts[pair[0]] ||= 0; counts[pair[0]] += 1; counts; }
        counts.values.each { |n| n.should == 168 }
      end

      it "includes positive prime values of b less than 1000 each 1,999 times" do
        counts = prb.pairs(1000).inject({}) { |counts,pair| counts[pair[1]] ||= 0; counts[pair[1]] += 1; counts; }
        counts.values.each { |n| n.should == 1999 }
      end
    end
  end

  it "counts consecutive primes for all a,b pairs less than 1000" do
    prb.should_receive(:pairs).with(1000).and_return([[-2,2],[0,2],[2,2]])
    prb.should_receive(:count_consec_primes).with(-2,2).and_return(2)
    prb.should_receive(:count_consec_primes).with(0,2).and_return(2)
    prb.should_receive(:count_consec_primes).with(2,2).and_return(3)
    prb.run
  end

  it "finds the product a*b for the largest consecutive prime count" do
    prb.stub!(:pairs).with(1000).and_return([[-2,2],[0,2],[2,2]])
    prb.stub!(:count_consec_primes).with(-2,2).and_return(2)
    prb.stub!(:count_consec_primes).with(0,2).and_return(2)
    prb.stub!(:count_consec_primes).with(2,2).and_return(3)
    prb.run.should == 4
  end
end
