require 'integer'

class Problem021

  def dsum(value)
    value.divisors.inject(0) { |sum,n| sum + n }
  end

  def amicable_pair(value)
    pair = dsum(value)
    pair if dsum(pair) == value and pair != value
  end

  def find_pairs(range)
    range.select { |n| amicable_pair(n) }
  end

  def run
    find_pairs(1..10_000).reduce(0, :+)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem021.new.run}"
end
