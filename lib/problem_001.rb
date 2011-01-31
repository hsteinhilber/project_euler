class Problem001
  attr_accessor :maximum
  include Enumerable

  ADD_VALUES = [2,1,3,1,2,3,3]

  def each
    n = 3
    i = 0
    while (n < maximum) do
      yield n
      n += ADD_VALUES[i]
      i = (i + 1) % ADD_VALUES.length
    end
  end

  def sum
    inject(0) { |sum,n| sum + n }
  end

  def run
    self.maximum = 1000
    sum
  end
end

if $0 == __FILE__
  puts "Result: #{Problem001.new.run}"
end
