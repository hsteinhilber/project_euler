require 'integer'
require 'prime_generator'

class Problem027

  def count_consec_primes(a, b)
    n = 0
    n += 1 while (n**2 + a*n + b).prime?
    return n
  end

  def pairs(max)
    Enumerator.new do |yielder|
      PrimeGenerator.new.take_while { |p| p < max }.each do |p|
        (-max+1...max).each do |n|
          yielder << [n, p]
        end
      end
    end
  end

  def run
    a,b = pairs(1000).max_by { |a,b| count_consec_primes(a, b) }
    a * b
  end
end

if $0 == __FILE__
  puts "Result: #{Problem027.new.run}"
end
