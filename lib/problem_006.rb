class Problem006

  def sum_of_squares(range)
    range.inject(0) { |sum,n| sum + n ** 2 }
  end

  def square_of_sum(range)
    range.inject(0) { |sum,n| sum + n } ** 2
  end

  def run
    square_of_sum(1..100) - sum_of_squares(1..100)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem006.new.run}"
end
