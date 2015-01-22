require 'integer'

class Problem034

  MAX_VAL = 7 * (9*8*7*6*5*4*3*2*1)
  
  # precomputed factorials for 0..9
  @@factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

  def digit_fact(digits)
    digits.map { |d| @@factorials[d] }.reduce(:+)
  end

  def sequence
    Enumerator.new do |yielder|
      (10..MAX_VAL).each do |n|
        digits = n.digits
        next if n.odd? and digits.count { |d| d <= 1 }.even?
        yielder << n if n == digit_fact(digits)
      end
    end
  end

  def run
    sequence.reduce(:+)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem034.new.run}"
end
