require_relative 'spec_helper'
require 'problem_067'

describe Problem067 do

  before(:each) do
    @prb = Problem067.new
  end

  it "reads the contents of the specified file" do
    fake_file = double(File)
    File.should_receive(:open).with('example.txt').and_yield(fake_file)
    fake_file.should_receive(:readline).and_return('1', '2 3', '4 5 6', '7 8 9 10')
    fake_file.should_receive(:eof?).and_return(false,false,false,false,true)
    @prb.load_file('example.txt').should == [[1],[2,3],[4,5,6],[7,8,9,10]]
  end
  
  it "calls #load_file with 'triangle.txt'" do
    @prb.should_receive(:load_file).with('./data/triangle.txt').and_return([[1]])
    @prb.run
  end

  it "calculates the largest path for the problem triangle read" do
    @prb.should_receive(:load_file).and_return([[1],[2,3]])
    @prb.should_receive(:add_triangle).with([[1],[2,3]]).and_return(99)
    @prb.run.should == 99
  end
end
