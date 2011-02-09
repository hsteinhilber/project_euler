require_relative 'spec_helper'
require 'problem_025'

describe Problem025 do
  let(:prb) { Problem025.new }

  describe "fibonacci sequence" do

    it "returns an object that responds to :each" do
      prb.fibonacci.should respond_to(:each)
    end

    it "returns an object that is Enumerable" do
      prb.fibonacci.class.ancestors.should include(Enumerable)
    end

    it "returns 1 as the first term" do
      prb.fibonacci.first.should == 1
    end

    it "returns 1 as the second term" do
      first,second = prb.fibonacci.first(2)
      second.should == 1
    end

    it "returns third term that is the sum of the previous two terms" do
      first, second, third = prb.fibonacci.first(3)
      third.should == first + second 
    end  

    it "returns sixth term is the sum of the fourth and fifth terms" do
      sequence = prb.fibonacci
      fourth, fifth, sixth = prb.fibonacci.first(6).drop(3)
      sixth.should == fourth + fifth
    end
  end

  it "returns the first fibonacci term with one thousand digits" do
    prb.should_receive(:fibonacci).and_return([1,1,2,10**999,10**999+1])
    prb.run.should == 4
  end
end
