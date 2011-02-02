require 'prime_generator'

class Problem010

  def primes_below(n)
    Enumerator.new do |yielder|
      PrimeGenerator.new.each do |value|
        yielder << value if value < n
        break if value >= n
      end
    end
  end

  def run
    primes_below(2_000_000).inject { |sum,value| sum + value }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem010.new.run}"
end
