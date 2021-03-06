require_relative './spec_helper'
require 'stringio'

describe ProjectEuler do

  class ProjectEuler
    def metaclass; class << self; self; end; end
  end

  class ExampleProblem
    class << self
      attr_accessor :run_complete
    end

    def run
      ExampleProblem.run_complete = true
      42
    end
  end

  module ExampleModule
    class << self
      attr_accessor :run_complete

      def run
        self.run_complete = true
        99
      end
    end
  end

  before(:each) do
    @problems = {
      'ExampleProblem' => 'first problem description',
      'ExampleModule' => 'second problem description',
      'Problem003' => 'third problem description',
      'Problem004' => 'fourth problem description',
      'Problem005' => 'fifth problem description',
      'Problem006' => 'sixth problem description',
      'Problem007' => 'seventh problem description',
      'Problem008' => 'eigth problem description',
      'Problem009' => 'ninth problem description',
      'Problem010' => 'tenth problem description',
      'Problem011' => 'eleventh problem description'
    }
    ExampleProblem.run_complete = false
  end
    
  it "takes the list of completed problems" do
    pe = ProjectEuler.new(@problems)
    pe.problems.length.should == 11
  end

  it "quits when the user enters 'q'" do
    quit_called = false
    output = StringIO.new("","w")
    input = StringIO.new("q\n","r")
    pe = ProjectEuler.new(@problems)
    pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
    pe.metaclass.send(:define_method, :gets) { input.gets }
    pe.metaclass.send(:define_method, :exit) { |value| quit_called = true }

    pe.get_command
    
    quit_called.should == true
  end

  describe "displaying a problem list" do

    it "displays a page of problems at a time" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }

      pe.show_menu

      output.string.should =~ /first problem description/i
      output.string.should =~ /ninth problem description/i
      output.string.should_not =~ /tenth problem description/i
    end

    it "has an item to quit" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }

      pe.show_menu

      output.string.should =~ /quit/i
    end

    it "has an item to move to the next page" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }

      pe.show_menu

      output.string.should =~ /next page/i
    end

    it "does not have a next page link on the last page" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "n\n" }

      pe.get_command
      pe.show_menu

      output.string.should_not =~ /next page/i
    end

    it "has an item to move to the previous page" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "n\n" }

      pe.get_command
      pe.show_menu

      output.string.should =~ /previous page/i
    end

    it "does not have a previous page link on the first page" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }

      pe.show_menu

      output.string.should_not =~ /previous page/i
    end
 end

  describe "paging" do

    it "goes to the next page when the user enters 'n'" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "n\n" }

      pe.get_command
      pe.show_menu
      
      output.string.should_not =~ /first problem description/i
      output.string.should_not =~ /ninth problem description/i
      output.string.should =~ /tenth problem description/i
      output.string.should =~ /eleventh problem description/i
    end

    it "goes to the previous page when the user enters 'p'" do
      output = StringIO.new("","w")
      input = StringIO.new("n\np\n","r")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { input.gets }

      pe.get_command
      pe.get_command
      pe.show_menu
      
      output.string.should =~ /first problem description/i
      output.string.should =~ /ninth problem description/i
      output.string.should_not =~ /tenth problem description/i
      output.string.should_not =~ /eleventh problem description/i
    end
  end

  describe "running a problem class" do
    
    it "runs the requested problem when the user enters a number" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "1\n" }

      pe.get_command
      
      ExampleProblem.run_complete.should == true
    end

    it "displays the output of the specified problem" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "1\n" }

      pe.get_command
      
      output.string.should =~ /result: 42/i
    end
  end

  describe "running a problem module" do

    it "runs the requested problem when user enters a number" do
      output = StringIO.new("", "w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "2\n" }

      pe.get_command

      ExampleModule.run_complete.should == true
    end

    it "displays the output of the specified problem" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "2\n" }

      pe.get_command
      
      output.string.should =~ /result: 99/i
    end
  end

  describe "bad input" do

    it "displays an error when it is invalid text" do
      output = StringIO.new("","w")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { "garbage\n" }

      pe.get_command
      
      output.string.should =~ /invalid command or option/i
    end

    it "displays an error when it is an invalid number" do
      output = StringIO.new("","w")
      input = StringIO.new("n\n4\n","r")
      pe = ProjectEuler.new(@problems)
      pe.metaclass.send(:define_method, :puts) { |value| output.puts value }
      pe.metaclass.send(:define_method, :gets) { input.gets }

      pe.get_command
      pe.get_command
     
      output.string.should =~ /invalid command or option/i
    end
  end
end
