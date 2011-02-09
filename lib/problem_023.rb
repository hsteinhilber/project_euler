require 'integer'

class Problem023

  def abundant_numbers
    Enumerator.new do |yielder|
      n = 12
      while true
        yielder << n if n < n.divisors.inject(0) { |sum,d| sum + d }
        n += 1
      end
    end
  end

  def sequence
    abundant = abundant_numbers.take_while { |a| a <= 28_123 }
    numbers = (0..28_123).to_a
    abundant.each do |i|
      abundant.select { |j| j >= i }.each do |j|
        numbers[i+j] = 0 if i+j <= 28_123
      end
    end
    numbers.select { |n| n > 0 }.sort
  end

  def run
    sequence.inject(0) { |sum,n| sum + n }
  end
end

if $0 == __FILE__
  puts "Result: #{Problem023.new.run}"
end
