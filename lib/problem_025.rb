require 'integer' 

class Problem025

  def fibonacci
    Enumerator.new do |yielder|
      first = second = 1
      yielder << first
      yielder << second
      (first, second = second, first + second) && yielder << second while true
    end
  end

  def run
    fibonacci.find_index { |n| n.digits.length == 1000 } + 1
  end
end

if $0 == __FILE__
  puts "Result: #{Problem025.new.run}"
end
