require 'integer'

class Problem030

  def digits_to_power(value,n)
    value.digits.inject(0) { |sum,d| sum + (d ** n) }
  end

  def max_range(n)
    digits = 1
    digits += 1 while digits_to_power(('9'*digits).to_i,n).digits.length >= digits
    digits_to_power(('9'*(digits-1)).to_i,n)
  end

  def run
    (2..max_range(5)).select { |n| n == digits_to_power(n,5) }.reduce(:+)
  end
end

if $0 == __FILE__
  puts "Result: #{Problem030.new.run}"
end
