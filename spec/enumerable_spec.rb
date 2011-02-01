require_relative 'spec_helper'
require 'enumerable'

describe Enumerable do

  describe "skipping elements" do

    before(:each) do
      @ary = [10, 15, 20, 25, 30]
    end

    it "returns an enumerable if it is not given a block" do
      @ary.skip(2).should respond_to(:each)
    end

    it "returns an enumerable that iterates over the elements after the first n" do
      @ary.skip(2).to_a.should == [20, 25, 30]
    end

    it "yields the elements after the first n if a block is specified" do
      result = []
      @ary.skip(2) do |value|
        result << value
      end
      result.should == [20, 25, 30]
    end

    it "returns an empty enumerable if the number of elements skipped exceeds the number available" do
      @ary.skip(6).should be_none
    end
  end
end
