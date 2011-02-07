require 'integer' 

class Problem003

  def run
    600_851_475_143.prime_factors.keys.max
  end
end

if $0 == __FILE__
  puts "Result: #{Problem003.new.run}"
end
