require_relative 'spec_helper'
require 'problem_036'

describe Problem036 do

  describe "adding palindromes" do

    it "return 0 if no palindromes are in the range" do
      Problem036.add_palindromes(12..19).should == 0
    end

    it "returns the number if a single palindrome is in range" do
      Problem036.add_palindromes(30..40).should == 33
    end

    it "returns the sum if more than one palindrome is in range" do
      Problem036.add_palindromes(1..100).should == (1 + 3 + 5 + 7 + 9 + 33 + 99)
    end
  end

  it "adds palindromes from 1 to 1,000,000" do
    Problem036.should_receive(:add_palindromes).with(1...1_000_000)
    Problem036.run
  end

  it "returns the sum of the specified palindromes" do
    Problem036.should_receive(:add_palindromes).with(1...1_000_000).and_return(99)
    Problem036.run.should == 99
  end
end
