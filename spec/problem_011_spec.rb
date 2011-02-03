require_relative 'spec_helper'
require 'problem_011'

describe Problem011 do

  before(:each) do
    @prb = Problem011.new
    @grid = [ 1,  2,  3,  4,  5,
              6,  7,  8,  9, 10,
             11, 12, 13, 14, 15,
             16, 17, 18, 19, 20,
             21, 22, 23, 24, 25]
  end

  it "generates all vertical lines" do
    @prb.get_lines(@grid).should include([1,6,11,16],
                                         [6,11,16,21],
                                         [2,7,12,17],
                                         [7,12,17,22],
                                         [3,8,13,18],
                                         [8,13,18,23],
                                         [4,9,14,19],
                                         [9,14,19,24],
                                         [5,10,15,20],
                                         [10,15,20,25])
  end

  it "generates all horizontal lines" do
    @prb.get_lines(@grid).should include([1,2,3,4],
                                         [2,3,4,5],
                                         [6,7,8,9],
                                         [7,8,9,10],
                                         [11,12,13,14],
                                         [12,13,14,15],
                                         [16,17,18,19],
                                         [17,18,19,20],
                                         [21,22,23,24],
                                         [22,23,24,25])
  end

  it "generates all diagonal lines" do
    @prb.get_lines(@grid).should include([1,7,13,19],
                                         [7,13,19,25],
                                         [6,12,18,24],
                                         [2,8,14,20],
                                         [4,8,12,16],
                                         [5,9,13,17],
                                         [9,13,17,21],
                                         [10,14,18,22])
  end

  it "generates a list of products of values within a line" do
    @prb.products(@grid).should include(1*6*11*16, 6*11*16*21,
      2*7*12*17, 7*12*17*22, 3*8*13*18, 8*13*18*23,
      4*9*14*19, 9*14*19*24, 5*10*15*20, 10*15*20*25,
      1*2*3*4, 2*3*4*5, 6*7*8*9, 7*8*9*10, 11*12*13*14,
      12*13*14*15, 16*17*18*19, 17*18*19*20, 21*22*23*24,
      22*23*24*25, 1*7*13*19, 7*13*19*25, 6*12*18*24,
      2*8*14*20, 4*8*12*16, 5*9*13*17, 9*13*17*21, 10*14*18*22)
  end

  it "calculates the largest product" do
    @prb.should_receive(:products).with(Problem011::GRID).and_return([1, 5, 10, 4, 7])
    @prb.run.should == 10
  end
end
