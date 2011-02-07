require 'integer'

class Problem015

  def run
    40.comb(20)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem015.new.run}"
end
