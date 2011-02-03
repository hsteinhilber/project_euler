class Problem001
  include Enumerable

  ADD_VALUES = [2,1,3,1,2,3,3]

  def each
    n = 3
    i = 0
    while true
      yield n
      n += ADD_VALUES[i]
      i = (i + 1) % ADD_VALUES.length
    end
  end

  def sum_to(maximum)
    take_while { |n| n < maximum }.inject { |sum,n| sum + n }
  end

  def run
    sum_to 1000
  end
end

if $0 == __FILE__
  puts "Result: #{Problem001.new.run}"
end
