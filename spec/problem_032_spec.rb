require_relative 'spec_helper'
require 'problem_032'

describe Problem032 do
  let(:prb) { Problem032.new }

  describe "testing panditigal product identities" do

    it "recognizes 1-digit x 4-digit = 4-digit products" do
      prb.is_pandigital?(1, 2345, 6789).should be_true
    end

    it "recognizes 2-digit x 3-digit = 4-digit products" do
      prb.is_pandigital?(12, 345, 6789).should be_true
    end

    it "does not recognize products with too few digits" do
      prb.is_pandigital?(1, 234, 5678).should be_false
    end

    it "does not recognize products with the digit 0 in them" do
      prb.is_pandigital?(0, 1234, 5678).should be_false
    end

    it "does not recognize products with too many digits" do
      prb.is_pandigital?(1234, 1234, 1234).should be_false
    end

    it "does not recognize products with 9 digits but containing repeat digits" do
      prb.is_pandigital?(123, 45, 6781)
    end
  end

  describe "iterating pandigital products" do

    it "contains 39 x 186 = 7254" do
      prb.products.should include([39,186,7254])
    end

    it "contains only valid product identities" do
      prb.products.each do |m,n,p|
        p.should == (m * n)
      end
    end

    it "contains only pandigital product identities" do
      prb.products.each do |m,n,p|
        prb.is_pandigital?(m,n,p).should be_true
      end
    end
  end

  it "finds the sum of all unique products whose multiplicand/multiplier/product identity is 1-9 pandigital" do
    prb.should_receive(:products).and_return([[1,2,3], [4,5,6], [7,8,9], [3,4,3], [1,3,5]])
    prb.run.should == 23
  end
end

