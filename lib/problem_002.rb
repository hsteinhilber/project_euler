class Problem002 
  include Enumerable

  def each
    current = 2
    last = 1
    while (true)
      yield current 
      last, current = 2*current+last, 3*current+2*last
    end
  end

  def sum_to(maximum)
    take_while { |n| n < maximum }.inject { |sum,n| sum + n }
  end

  def run
    sum_to 4_000_000
  end
end

if $0 == __FILE__
  puts "Result: #{Problem002.new.run}"
end
