require_relative 'spec_helper'
require 'problem_003'

describe Problem003 do

  before(:each) do
    @prb = Problem003.new
    class Integer
      alias :orig_prime_factors :prime_factors
      def prime_factors
        self.should == 600_851_475_143
        { 0 => 5, 10 => 1, 20 => 1, 30 => 1 }
      end
    end
  end

  after(:each) do
    class Integer; alias :prime_factors :orig_prime_factors; end
  end

  it "returns maximum result for prime factors of 600,851,475,143" do
    @prb.run.should == 30
  end
end
