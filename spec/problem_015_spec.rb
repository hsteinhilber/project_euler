require_relative 'spec_helper'
require 'problem_015'

describe Problem015 do

  before(:each) do
    @prb = Problem015.new
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
