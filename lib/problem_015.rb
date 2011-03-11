require 'integer'

class Problem015

  def paths_for_grid(n)
    (n+n).fact / (n.fact * n.fact) 
  end

  def run
    paths_for_grid(20)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem015.new.run}"
end
