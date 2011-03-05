require 'prime_generator'

class Problem010

  def primes_below(n)
    PrimeGenerator.new.take_while { |p| p < n }
  end

  def run
    primes_below(2_000_000).inject { |sum,value| sum + value }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem010.new.run}"
end
