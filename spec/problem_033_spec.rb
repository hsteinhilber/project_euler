require_relative 'spec_helper'
require 'problem_033'
require 'integer'

describe Problem033 do
  let(:prb) { Problem033.new }

  describe "generating fractions" do

    it "returns only fractions with a common digit" do
      prb.fractions.each do |n,d|
        n.digits.select { |digit| d.digits.include?(digit) }.length.should == 1
      end
    end

    it "returns only fractions less than one" do
      prb.fractions.each do |n,d|
        Rational(n,d).should < 1
      end
    end

    it "returns exactly four results" do
      prb.fractions.to_a.length.should == 4
    end

    it "returns values that can legally be reduced by removing a common digit" do
      prb.fractions.each do |n,d|
        common = n.digits.select { |digit| d.digits.include?(digit) }.first
        n1,d1 = n.digits.select { |digit| digit != common }.first, 
                d.digits.select { |digit| digit != common }.first
        Rational(n,d).should == Rational(n1,d1)
      end
    end
  end

  it "computes the denominator of the product of the fractions" do
    prb.should_receive(:fractions).and_return([[1,2],[3,4],[5,6],[7,8]])
    prb.run.should == 128
  end
end
