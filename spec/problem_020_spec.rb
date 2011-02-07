require_relative 'spec_helper'
require 'problem_020'

describe Problem020 do

  before(:each) do
    @prb = Problem020.new
    class Integer
      alias :orig_fact :fact
      def fact
        self.should == 100
        9999
      end
    end
  end

  after(:each) do
    class Integer; alias :fact :orig_fact; end
  end

  it "calculates the sum of the digits of 100!" do
    @prb.run.should == 36
  end
end
