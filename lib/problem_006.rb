class Problem006

  def sum_of_squares(range)
    smaller = range.first - 1
    larger = range.last
    ((2*larger+1)*(larger+1)*larger/6) - ((2*smaller+1)*(smaller+1)*smaller/6)
  end

  def square_of_sum(range)
    smaller = range.first - 1
    larger = range.last
    ((larger*(larger+1)/2) - (smaller*(smaller+1)/2)) ** 2
  end

  def run
    square_of_sum(1..100) - sum_of_squares(1..100)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem006.new.run}"
end
