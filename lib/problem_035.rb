require 'prime_generator'
require 'integer'

module Problem035
  class << self 
    def circular?(n)
      return true if n < 10
      return false if n.digits.any? { |d| d.even? || d == 5 }
      n.rotations.all? { |p| p.prime? }
    end

    def circular_primes_under(max)
      PrimeGenerator.new.take_while { |n| n < max }.select { |n| circular?(n) }
    end

    def run
      circular_primes_under(1_000_000).count
    end
  end
end

if __FILE__ == $0
  puts "Result: #{Problem035.run}"
end
