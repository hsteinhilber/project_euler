require 'prime_generator'

class Problem007

  def nth_prime(n)
    PrimeGenerator.new.skip(n-1).first
  end

  def run
    nth_prime(10_001)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem007.new.run}"
end
