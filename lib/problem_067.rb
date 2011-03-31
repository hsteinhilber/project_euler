require 'triangle_solver'

class Problem067
  include TriangleSolver

  def load_file(file_name)
    File.open(file_name) do |file|
      file.readlines.map { |line| line.split(' ').map { |num| num.to_i } }
    end
  end

  def run
    add_triangle(load_file('./data/triangle.txt'))
  end
end

if $0 == __FILE__
  puts "Result: #{Problem018.new.run}"
end
