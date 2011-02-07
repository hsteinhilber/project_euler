class Problem019

  def count_sundays(year_range)
    year_range = year_range..year_range if year_range.kind_of?(Integer)
    year_range.inject(0) do |count,year|
      count + (1..12).inject(0) do |count,month|
        count + (Time.new(year, month, 1).sunday? ? 1 : 0)
      end
    end
  end

  def run
    count_sundays(1901..2000)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem019.new.run}"
end
