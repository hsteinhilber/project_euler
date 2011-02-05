require_relative 'spec_helper'
require 'problem_016'

describe Problem016 do

  before(:each) do
    @prb = Problem016.new
  end

  it "calculates the digits of 0 as just 0" do
    0.digits.should == [0]
  end

  it "calculates the digits of 1024 as 1, 0, 2, and 4" do
    1024.digits.should == [1,0,2,4]
  end

  context "running the problem" do

    before(:each) do
      class Integer
        alias :orig_digits :digits
        def digits 
          self.should == 2**1000
          [1, 2, 3, 4, 5]
        end
      end
    end

    after(:each) do
      class Integer; alias :digits :orig_digits; end
    end

    it "sums the digits of 2**1000 and returns the result" do
      @prb.run.should == 15
    end
  end
end

