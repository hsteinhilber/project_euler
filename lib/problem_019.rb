class Problem019

  class ::Range
    def product(other)
      self.to_a.product(other.to_a)
    end
    alias :* :product
  end

  def count_sundays(year_range)
    year_range = year_range..year_range if year_range.kind_of?(Integer)
    ((1..12) * year_range).count { |month, year| Time.new(year, month, 1).sunday? }
  end

  def run
    count_sundays(1901..2000)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem019.new.run}"
end
