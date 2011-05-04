require 'prime_generator'
require 'integer'

module Problem035
  class << self 
    def circular_primes_under(max)
      PrimeGenerator.new.take_while { |n| n < max }.select do |n| 
        n.rotations.all? { |p| p.prime? } 
      end
    end

    def run
      circular_primes_under(1_000_000).count
    end
  end
end

if __FILE__ == $0
  puts "Result: #{Problem035.run}"
end
