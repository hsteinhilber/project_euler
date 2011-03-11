require 'integer'

class Problem015

  def paths_for_grid(n)
    (2*n).fact / (n.fact ** 2) 
  end

  def run
    paths_for_grid(20)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem015.new.run}"
end
