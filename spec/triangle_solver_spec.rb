require_relative 'spec_helper'
require 'triangle_solver'

#     3
#    7 4
#   2 4 6
#  8 5 9 3

describe TriangleSolver do

  before(:each) do
    @prb = Object.new.extend(TriangleSolver)
    @prb.send(:initialize)
    @triangle = [ [3], [7,4], [2,4,6], [8,5,9,3] ]
  end

  it "returns 0 for rows greater than the bottom row" do
    @prb.add_triangle(@triangle, 4, 0).should == 0
  end

  it "throws an exception for columns greater than the row" do
    lambda { @prb.add_triangle(@triangle, 2, 3) }.should raise_error
  end
    
  it "throws an exception for columns less than 0" do
    lambda { @prb.add_triangle(@triangle, 2, -1) }.should raise_error
  end

  it "throws an exception for rows less than 0" do
    lambda { @prb.add_triangle(@triangle, -1, 0) }.should raise_error
  end

  it "returns the node for values in the bottom row" do
    @prb.add_triangle(@triangle, 3, 2).should == 9
  end

  it "returns the node plus the larger subtriangle for non-bottom nodes" do
    @prb.add_triangle(@triangle, 2, 2).should == 15
  end

  it "returns the largest path from top to bottom of the triangle" do
    @prb.add_triangle(@triangle).should == 23
  end
end
