require_relative 'spec_helper'
require 'problem_022'

describe Problem022 do

  FAKE_FILE = '"Charlie","Anne","Bob","Eve"'

  before(:each) do
    @prb = Problem022.new
  end

  describe "scoring names" do
    
    it "scores an empty string as 0" do
      @prb.score('').should == 0
    end

    it "scores 'a' as 1" do
      @prb.score('a').should == 1
    end

    it "scores 'b' as 2" do
      @prb.score('b').should == 2
    end

    it "scores 'z' as 26" do
      @prb.score('z').should == 26
    end

    it "scores 'ab' as 3" do
      @prb.score('ab').should == 3
    end

    it "scores 'colin' as 53" do
      @prb.score('colin').should == 53
    end

    it "scores 'A' as 1" do
      @prb.score('A').should == 1
    end
  end

  describe "scoring lists" do

    it "scores an empty list as 0" do
      @prb.score_list([]).should == 0
    end

    it "scores ['a'] as 1" do
      @prb.score_list(['a']).should == 1
    end

    it "scores ['b', 'a'] as 4" do
      @prb.score_list(['b', 'a']).should == 4
    end

    it "scores ['def', 'abc'] as 27" do
      @prb.score_list(['def','abc']).should == 27
    end
  end

  describe "loading lists" do


    before(:each) do
      @file = double("IO")
    end

    it "reads the contents of the specified file" do
      @file.should_receive(:read).and_return(FAKE_FILE)
      @prb.load_file(@file)
    end

    it "returns the names from the file" do
      @file.stub!(:read).and_return(FAKE_FILE)
      @prb.load_file(@file).should =~ ['Charlie','Anne','Bob','Eve']
    end

    it "sorts the names alphabetically" do
      @file.stub!(:read).and_return(FAKE_FILE)
      names = @prb.load_file(@file)
      last = names.shift
      while names.length > 0
        last.should be <= names.first
        last = names.shift
      end
    end
  end

  context "running the problem" do

    before(:each) do
      class File
        class << self
          @@file = nil
          alias :orig_open :open

          def open(file_name)
            file_name.should == 'data/names.txt'
            yield @@file if block_given?
            return @@file unless block_given?
          end

          def _set_fake(file)
            @@file = file
          end
        end
      end

      file = double("IO")
      file.stub!(:read).and_return(FAKE_FILE)
      File._set_fake(file)
    end
    
    after(:each) do
      class File; class << self; alias :open :orig_open; end; end
    end
    
    it "loads 'data/names.txt' and scores the list" do
      @prb.run.should == 368
    end
  end
end

