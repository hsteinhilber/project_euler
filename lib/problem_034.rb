require 'integer'

class Problem034

  # precomputed factorials for 0..9
  @@factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

  def digit_fact(n)
    n.digits.map { |d| @@factorials[d] }.reduce(:+)
  end

  def sequence
    Enumerator.new do |yielder|
      (10..2540160).each do |n|
        yielder << n if n == digit_fact(n)
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
