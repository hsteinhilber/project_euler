require 'prime_generator'
require 'integer'

module Problem035
  class << self 
    def circular_primes_under(max)
      Enumerator.new do |yielder|
        PrimeGenerator.new.take_while { |n| n < max }.each do |n|
          yielder << n if n.rotations.all? { |p| p.prime? }
        end 
      end.to_a
    end

    def run
      circular_primes_under(1_000_000).count
    end
  end
end

if __FILE__ == $0
  puts "Result: #{Problem035.run}"
end
