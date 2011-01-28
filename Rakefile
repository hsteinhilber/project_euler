require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "project_euler"
  gem.homepage = "http://github.com/hsteinhilber/project_euler"
  gem.license = "MIT"
  gem.summary = %Q{My ruby implementations of the Project Euler problems.}
  gem.description = %Q{Project Euler is a series of challenging mathematical/computer programming problmes that will require more than jut mathematical insights to solve. This project is my attempts to solve these problems using the ruby programming language.}
  gem.email = "harry.steinhilber@gmail.com"
  gem.authors = ["Harry Steinhilber, Jr."]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'doc/api'
  rdoc.title = "project_euler #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :clean do
  Dir["./**/{.,}*{~,.swp}"].each do |file|
    puts "Deleting file #{file}"
    begin
      File.delete file
    rescue Exception => ex
      puts "cannot delete file: #{ex.message}"
    end
  end
end
