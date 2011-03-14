require 'integer'

class Problem016

  def sum_digits(num)
    num.digits.reduce(:+)
  end

  def run
    sum_digits(2**1000)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem016.new.run}"
end
