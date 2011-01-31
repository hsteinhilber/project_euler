class Problem002 
  attr_accessor :maximum
  include Enumerable

  def each
    current = 2
    last = 1
    while (current < maximum)
      yield current 
      last, current = 2*current+last, 3*current+2*last
    end
  end

  def sum 
    inject(0) { |sum,n| sum + n }
  end

  def run
    sum_to 4_000_000
  end
end

if $0 == __FILE__
  puts "Result: #{Problem002.new.run}"
end
